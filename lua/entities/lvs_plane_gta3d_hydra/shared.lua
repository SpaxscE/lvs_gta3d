
ENT.Base = "lvs_plane_gta3d"

ENT.PrintName = "Hydra"
ENT.Author = "Luna"
ENT.Information = "Prototype"
ENT.Category = "[LVS] GTA3D - Planes"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Planes"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/helis/hydra.mdl"

ENT.AITEAM = 2

ENT.MaxVelocity = 2500
ENT.MaxPerfVelocity = 1800
ENT.MaxThrust = 1800

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 0.75

ENT.MaxSlipAnglePitch = 5
ENT.MaxSlipAngleYaw = 5

ENT.MaxHealth = 450

ENT.DisableRadio = true

ENT.FlyByAdvance = 0.75
ENT.FlyBySound = "gta3d/engines/hydra/flyby.wav" 
ENT.DeathSound = "npc/combine_gunship/gunship_explode2.wav"

ENT.GravityTurnRatePitch = 1
ENT.GravityTurnRateYaw = 6

ENT.StallVelocity = 150
ENT.StallForceMultiplier = 4
ENT.StallForceMax = 40

ENT.ThrottleRateUp = 0.25
ENT.ThrottleRateDown = 0.25

ENT.SpawnNormalOffset = 100

ENT.EngineSounds = {
	{
		sound = "^gta3d/engines/hydra/engine.wav",
		Pitch = 75,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 45,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
	},
	{
		sound = "^gta3d/engines/hydra/dist.wav",
		sound_int = "",
		Pitch = 80,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 40,
		FadeIn = 0.35,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
		VolumeMin = 0,
		VolumeMax = 1,
		SoundLevel = 110,
	},
}

function ENT:InitWeapons()

	self.FirePositions = {
		[1] = { pos = Vector(30.45,65.49,-23.11) },
		[2] = { pos = Vector(30.45,-65.49,-23.11) },
		[3] = { pos = Vector(11.54,118.43,-22.81) },
		[4] = { pos = Vector(11.54,-118.43,-22.81) },
	}

	if SERVER then
		for id, data in pairs( self.FirePositions ) do
			local soundemitter = self:AddSoundEmitter( data.pos, "^weapons/alyx_gun/alyx_gun_fire"..math.random(5,6)..".wav" )
			soundemitter:SetSoundLevel( 95 )
			self.FirePositions[ id ].sound = soundemitter
		end
	end

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/flak_he.png")
	weapon.Ammo = 600
	weapon.Delay = 0.03
	weapon.HeatRateUp = 0.25
	weapon.HeatRateDown = 0.5
	weapon.Attack = function( ent )
		ent.FireIndex = (ent.FireIndex or 0) + 1
		if ent.FireIndex > #ent.FirePositions then
			ent.FireIndex = 1
		end

		local data = ent.FirePositions[ ent.FireIndex ]
		local pos = data.pos
		local sound = data.sound

		if IsValid( sound ) then
			sound:PlayOnce( 80 + math.Rand(-5,5), 1 )
		end

		local bullet = {}
		bullet.Src 	= ent:LocalToWorld( pos )
		bullet.Dir 	= ent:GetForward()
		bullet.Spread 	= Vector(0.01,0.01,0.01)
		bullet.TracerName = "lvs_tracer_white"
		bullet.Force	= 3900
		bullet.HullSize 	= 1
		bullet.Damage	= 50
		bullet.EnableBallistics = true
		bullet.SplashDamage = 25
		bullet.SplashDamageRadius = 100
		bullet.SplashDamageEffect = "lvs_defence_explosion"
		bullet.SplashDamageType = DMG_SONIC
		bullet.Velocity = 25000
		bullet.Attacker 	= ent:GetDriver()

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		ent:LVSFireBullet( bullet )

		ent:TakeAmmo( 1 )
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/vehicles/222/cannon_overheat.wav")
	end
	self:AddWeapon( weapon )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/missile.png")
	weapon.Ammo = 16
	weapon.Delay = 0
	weapon.HeatRateUp = -2
	weapon.HeatRateDown = 2
	weapon.Attack = function( ent )
		local T = CurTime()

		if IsValid( ent._FiredMissile ) then
			if (ent._nextMissleTracking or 0) > T then return end

			ent._nextMissleTracking = T + 0.1

			ent._FiredMissile:FindTarget( ent:GetPos(), ent:GetForward(), 30, 7500 )

			return
		end

		local T = CurTime()

		if (ent._nextMissle or 0) > T then return end

		ent._nextMissle = T + 0.5

		ent._swapMissile = not ent._swapMissile

		local Pos = Vector( -35, (ent._swapMissile and -154 or 154), -23 )

		local Driver = self:GetDriver()

		local projectile = ents.Create( "lvs_missile" )
		projectile:SetPos( ent:LocalToWorld( Pos ) )
		projectile:SetAngles( ent:LocalToWorldAngles( Angle(0,ent._swapMissile and 1 or -1,0) ) )
		projectile:SetParent( ent )
		projectile:Spawn()
		projectile:Activate()
		projectile:SetAttacker( IsValid( Driver ) and Driver or self )
		projectile:SetEntityFilter( ent:GetCrosshairFilterEnts() )
		projectile:SetDamage( 500 )

		ent._FiredMissile = projectile

		ent:SetNextAttack( CurTime() + 0.1 ) -- wait 0.1 second before starting to track
	end
	weapon.FinishAttack = function( ent )
		if not IsValid( ent._FiredMissile ) then return end

		local projectile = ent._FiredMissile

		projectile:Enable()
		projectile:EmitSound("lvs/weapons/missile_"..math.random(1,4)..".wav")
		ent:TakeAmmo()

		ent._FiredMissile = nil

		ent:SetHeat( 1 )
		ent:SetOverheated( true )
	end
	self:AddWeapon( weapon )
end