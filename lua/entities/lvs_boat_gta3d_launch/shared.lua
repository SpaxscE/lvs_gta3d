
ENT.Base = "lvs_boat_gta3d"

ENT.PrintName = "Launch"
ENT.Author = "Luna"
ENT.Category = "[LVS] GTA3D - Boats"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Boats"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/boats/launch.mdl"

ENT.AITEAM = 2

ENT.MassCenterOverride = Vector(0,0,10)

ENT.FloatHeight = 10

ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 5000

ENT.EngineSplash = true
ENT.EngineSplashStartSize = 80
ENT.EngineSplashEndSize = 300
ENT.EngineSplashVelocity = 800
ENT.EngineSplashVelocityRandomAdd = 200
ENT.EngineSplashThrowAngle = -15
ENT.EngineSplashDistance = 50

ENT.FloatForce = 20
ENT.FloatWaveFrequency = 5
ENT.FloatWaveIntensity = 0.5

ENT.FloatThrottleIntensity = 4

ENT.TurnRate = 5
ENT.TurnForceYaw = 400
ENT.TurnForceRoll = 400

ENT.MaxThrust = 1200

ENT.MaxVelocity = 2000
ENT.MaxVelocityReverse = 350

ENT.MinVelocityAutoBrake = 200

ENT.ForceLinearMultiplier = 1
ENT.ForceAngleMultiplier = 1

ENT.HornSound = "gta3d/horns/horn_010HD.wav"
ENT.HornPos = Vector(150,0,20)

ENT.EngineSounds = {
	{
		sound = "gta3d/engines/boat_coastguard/idle.wav",
		Pitch = 100,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 100,
		FadeIn = 0,
		FadeOut = 0.1,
		FadeSpeed = 0.1,
		UseDoppler = false,
	},
	{
		sound = "gta3d/engines/boat_coastguard/cruise.wav",
		Pitch = 80,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 60,
		FadeIn = 0.1,
		FadeOut = 1,
		FadeSpeed = 0.1,
		UseDoppler = true,
		FadeInRestart = true,
	},
}

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "GunnerSeat" )
end


function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/flak_ap.png")
	weapon.Ammo = 400
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.4
	weapon.HeatRateDown = 0.6
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		local muzzle = base:GetAttachment( base:LookupAttachment( "muzzle" ) )

		if not muzzle then return end

		local bullet = {}
		bullet.Src 	= muzzle.Pos
		bullet.Dir 	= muzzle.Ang:Forward()
		bullet.Spread 	= Vector(0.02,0.02,0.02)
		bullet.TracerName = "lvs_tracer_autocannon"
		bullet.Force	= 1500
		bullet.EnableBallistics = true
		bullet.HullSize 	= 0
		bullet.Damage	= 25
		bullet.Velocity = 20000
		bullet.Attacker 	= ent:GetDriver()

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		ent:LVSFireBullet( bullet )

		ent:TakeAmmo( 1 )

		if not IsValid( base.SNDTurret ) then return end

		base.SNDTurret:PlayOnce( 140 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		local muzzle = base:GetAttachment( base:LookupAttachment( "muzzle" ) )

		if not muzzle then return end

		if not ent:GetAI() and not IsValid( ent:GetDriver() ) then
			base:SetPoseParameter("mg_pitch",  15 )
			base:SetPoseParameter("mg_yaw", 0 )

			return
		end

		local AimPos = ent:GetEyeTrace().HitPos
		local AimAng = (AimPos - muzzle.Pos):Angle()

		local Pos, Ang = WorldToLocal( AimPos, AimAng, muzzle.Pos, base:LocalToWorldAngles( Angle(0,180,0) ) )

		base:SetPoseParameter("mg_pitch",  -Ang.p * 0.6 )
		base:SetPoseParameter("mg_yaw", -Ang.y * 0.6 )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		local muzzle = base:GetAttachment( base:LookupAttachment( "muzzle" ) )

		if not muzzle then return end

		local trace = util.TraceLine( {
			start = muzzle.Pos,
			endpos = muzzle.Pos + muzzle.Ang:Forward() * 50000,
			filter = ent:GetCrosshairFilterEnts()
		} )

		local Pos2D = trace.HitPos:ToScreen()

		ent:PaintCrosshairCenter( Pos2D, color_white )
		ent:LVSPaintHitMarker( Pos2D )
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/vehicles/222/cannon_overheat.wav")
	end
	self:AddWeapon( weapon, 3 )
end

function ENT:CalcMainActivityPassenger( ply )

	if ply:GetVehicle() ~= self:GetGunnerSeat() then return end

	if ply.m_bWasNoclipping then 
		ply.m_bWasNoclipping = nil 
		ply:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM ) 
		
		if CLIENT then 
			ply:SetIK( true )
		end 
	end 

	ply.CalcIdeal = ACT_STAND
	ply.CalcSeqOverride = ply:LookupSequence( "sit_pistol" )

	return ply.CalcIdeal, ply.CalcSeqOverride
end

function ENT:UpdateAnimation( ply, velocity, maxseqgroundspeed )
	ply:SetPlaybackRate( 1 )

	if CLIENT then
		if ply == self:GetDriver() then
			ply:SetPoseParameter( "vehicle_steer", -self:GetSteer() )
			ply:InvalidateBoneCache()
		else
			if ply:GetVehicle() == self:GetGunnerSeat() then
				local Pitch = math.Remap( self:GetPoseParameter( "mg_pitch" ),0,1,-10,10)
				local Yaw = math.Remap( self:GetPoseParameter( "mg_yaw" ),0,1,-50,50) 

				ply:SetPoseParameter( "aim_pitch", Pitch * 3 )
				ply:SetPoseParameter( "aim_yaw", Yaw * 1.5 )

				ply:SetPoseParameter( "head_pitch", -Pitch * 2 )
				ply:SetPoseParameter( "head_yaw", -Yaw * 3 )

				ply:SetPoseParameter( "move_x", 0 )
				ply:SetPoseParameter( "move_y", 0 )

				ply:InvalidateBoneCache()
			end
		end

		GAMEMODE:GrabEarAnimation( ply )
		GAMEMODE:MouthMoveAnimation( ply )
	end

	return false
end
