
ENT.Base = "lvs_boat_gta3d"

ENT.PrintName = "Jetmax"
ENT.Author = "Luna"
ENT.Category = "[LVS] GTA3D - Boats"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Boats"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/boats/jetmax.mdl"

ENT.FloatHeight = 10

ENT.EngineIdleRPM = 500
ENT.EngineMaxRPM = 5000

ENT.EngineSplash = true
ENT.EngineSplashStartSize = 80
ENT.EngineSplashEndSize = 400
ENT.EngineSplashVelocity = 800
ENT.EngineSplashVelocityRandomAdd = 200
ENT.EngineSplashThrowAngle = -45
ENT.EngineSplashDistance = 50

ENT.FloatForce = 20
ENT.FloatWaveFrequency = 5
ENT.FloatWaveIntensity = 0.25

ENT.FloatThrottleIntensity = 2

ENT.TurnRate = 4
ENT.TurnForceYaw = 400
ENT.TurnForceRoll = 400

ENT.MaxThrust = 1000

ENT.MaxVelocity = 2500
ENT.MaxVelocityReverse = 350

ENT.MinVelocityAutoBrake = 200

ENT.ForceLinearMultiplier = 1
ENT.ForceAngleMultiplier = 1

ENT.HornSound = "gta3d/horns/horn_010HD.wav"
ENT.HornPos = Vector(70,0,20)

ENT.ExhaustPositions = {
	{
		pos = Vector(-162.22,38.09,59.92),
		ang = Angle(0,180,0),
	},
	{
		pos = Vector(-162.22,-38.09,59.92),
		ang = Angle(0,180,0),
	}
}

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
		PitchMul = 40,
		FadeIn = 0.1,
		FadeOut = 1,
		FadeSpeed = 0.1,
		UseDoppler = true,
		FadeInRestart = true,
	},
}
