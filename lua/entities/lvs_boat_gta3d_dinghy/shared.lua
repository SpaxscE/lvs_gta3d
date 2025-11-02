
ENT.Base = "lvs_boat_gta3d"

ENT.PrintName = "Dinghy"
ENT.Author = "Luna"
ENT.Category = "[LVS] GTA3D - Boats"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Boats"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/boats/dinghy.mdl"

ENT.FloatHeight = 10

ENT.EngineIdleRPM = 1500
ENT.EngineMaxRPM = 5000

ENT.EngineSplash = true
ENT.EngineSplashStartSize = 60
ENT.EngineSplashEndSize = 100
ENT.EngineSplashVelocity = 400
ENT.EngineSplashVelocityRandomAdd = 50
ENT.EngineSplashThrowAngle = -20

ENT.FloatForce = 10
ENT.FloatWaveFrequency = 4
ENT.FloatWaveIntensity = 1

ENT.FloatThrottleIntensity = 20

ENT.TurnRate = 3
ENT.TurnForceYaw = 400
ENT.TurnForceRoll = 800

ENT.MaxThrust = 400

ENT.MaxVelocity = 2000
ENT.MaxVelocityReverse = 350

ENT.MinVelocityAutoBrake = 200

ENT.ForceLinearMultiplier = 1
ENT.ForceAngleMultiplier = 1

ENT.HornSound = "gta3d/horns/horn_010HD.wav"
ENT.HornPos = Vector(70,0,20)

ENT.PlayerBoneManipulate = {
	[1] = {
		["ValveBiped.Bip01_Pelvis"] = Angle(0,0,40),
		
		["ValveBiped.Bip01_R_Thigh"] = Angle(15,75,0),
		["ValveBiped.Bip01_L_Thigh"] = Angle(-15,75,0),

		["ValveBiped.Bip01_R_Calf"] = Angle(0,-60,0),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,-60,0),
		
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
	},
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
