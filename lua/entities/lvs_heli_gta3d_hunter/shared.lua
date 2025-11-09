
ENT.Base = "lvs_heli_gta3d"

ENT.PrintName = "Hunter"
ENT.Author = "Luna"
ENT.Category = "[LVS] GTA3D - Helicopters"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Helicopters"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/helis/hunter.mdl"

ENT.AITEAM = 2

ENT.MaxHealth = 1000

ENT.MaxVelocity = 2150

ENT.ThrustUp = 1
ENT.ThrustDown = 0.8
ENT.ThrustRate = 1

ENT.ThrottleRateUp = 0.2
ENT.ThrottleRateDown = 0.2

ENT.TurnRatePitch = 0.5
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 0.7

ENT.GravityTurnRateYaw = 3

ENT.ForceLinearDampingMultiplier = 2

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.EngineSounds = {
	{
		sound = "^gta3d/engines/hunter/loop_near.wav",
		sound_int = "lvs/vehicles/helicopter/loop_interior.wav",
		Pitch = 0,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 110,
		Volume = 1,
		VolumeMin = 0,
		VolumeMax = 1,
		SoundLevel = 125,
		UseDoppler = true,
	},
	{
		sound = "^lvs/vehicles/helicopter/loop_dist.wav",
		sound_int = "",
		Pitch = 0,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 100,
		Volume = 1,
		VolumeMin = 0,
		VolumeMax = 1,
		SoundLevel = 125,
		UseDoppler = true,
	},
}

function ENT:TurretInRange()
	local Pos = self:LocalToWorld( Vector(175,0,19.33) )

	local Dir1 = self:GetForward()
	local Dir2 = (self:GetEyeTrace().HitPos - Pos):GetNormalized()

	return self:AngleBetweenNormal( Dir1, Dir2 ) < 30
end

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/flak_he.png")
	weapon.Ammo = 600
	weapon.Delay = 0.12
	weapon.HeatRateUp = 2
	weapon.HeatRateDown = 2
	weapon.Attack = function( ent )
		if not ent:TurretInRange() then
			return true
		end

		local bullet = {}
		bullet.Src 	= ent:LocalToWorld( Vector(175,0,19.33) )
		bullet.Dir 	= (ent:GetEyeTrace().HitPos - bullet.Src):GetNormalized()
		bullet.Spread 	= Vector(0.01,0.01,0.01)
		bullet.TracerName = "lvs_tracer_autocannon"
		bullet.Force	= 3900
		bullet.HullSize 	= 25
		bullet.Damage	= 40
		bullet.EnableBallistics = true
		bullet.SplashDamage = 20
		bullet.SplashDamageRadius = 100
		bullet.SplashDamageEffect = "lvs_defence_explosion"
		bullet.SplashDamageType = DMG_SONIC
		bullet.Velocity = 30000
		bullet.Attacker 	= ent:GetDriver()

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		ent:LVSFireBullet( bullet )

		ent:TakeAmmo( 1 )

		if not IsValid( ent.SNDTurret ) then return end

		ent.SNDTurret:PlayOnce( 140 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()

		local Col =  ent:TurretInRange() and Color(255,255,255,255) or Color(255,0,0,255)

		ent:PaintCrosshairCenter( Pos2D, Col )
		ent:PaintCrosshairSquare( Pos2D, Col )
		ent:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/missile.png")
	weapon.Ammo = 60
	weapon.Delay = 0.25
	weapon.HeatRateUp = 0.25
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		if not ent:TurretInRange() then
			return true
		end

		ent.FireLeft = not ent.FireLeft

		local Driver = ent:GetDriver()
		local Target = ent:GetEyeTrace().HitPos

		local projectile = ents.Create( "lvs_missile" )
		projectile:SetPos( ent:LocalToWorld( Vector(70,60 * (self.FireLeft and 1 or -1),34) ) )
		projectile:SetAngles( ent:GetAngles() )
		projectile:SetParent( ent )
		projectile:Spawn()
		projectile:Activate()
		projectile.GetTarget = function( missile ) return missile end
		projectile.GetTargetPos = function( missile )
			if missile.HasReachedTarget then
				return missile:LocalToWorld( Vector(100,0,0) )
			end

			if (missile:GetPos() - Target):Length() < 100 then
				missile.HasReachedTarget = true
			end
			return Target
		end
		projectile:SetAttacker( IsValid( Driver ) and Driver or self )
		projectile:SetEntityFilter( ent:GetCrosshairFilterEnts() )
		projectile:SetSpeed( ent:GetVelocity():Length() + 4000 )
		projectile:SetDamage( 400 )
		projectile:SetRadius( 150 )
		projectile:Enable()
		projectile:EmitSound("npc/waste_scanner/grenade_fire.wav")

		ent:TakeAmmo()
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()

		local Col =  ent:TurretInRange() and Color(255,255,255,255) or Color(255,0,0,255)

		ent:PaintCrosshairSquare( Pos2D, Col )
		ent:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon )
end