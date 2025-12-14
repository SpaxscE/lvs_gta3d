
ENT.Base = "lvs_boat_gta3d"

ENT.PrintName = "Marquis"
ENT.Author = "Luna"
ENT.Category = "[LVS] GTA3D - Boats"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Boats"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/boats/marquis.mdl"

ENT.FloatHeight = 10

ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 5000

ENT.EngineSplash = true
ENT.EngineSplashStartSize = 60
ENT.EngineSplashEndSize = 250
ENT.EngineSplashVelocity = 600
ENT.EngineSplashVelocityRandomAdd = 150
ENT.EngineSplashThrowAngle = -15
ENT.EngineSplashDistance = 50

ENT.FloatForce = 10
ENT.FloatWaveFrequency = 5
ENT.FloatWaveIntensity = 0.5

ENT.FloatThrottleIntensity = 4

ENT.TurnRate = 1
ENT.TurnForceYaw = 400
ENT.TurnForceRoll = 400

ENT.MaxThrust = 400

ENT.MaxVelocity = 1000
ENT.MaxVelocityReverse = 350

ENT.MinVelocityAutoBrake = 200

ENT.ForceLinearMultiplier = 1
ENT.ForceAngleMultiplier = 1

ENT.BodyWobbleEnabled = true
ENT.BodyWobbleBone = "rm"

ENT.BodyWobbleAngleMulPitch = -10
ENT.BodyWobbleAngleMulRoll = 0
ENT.BodyWobbleAngleMax = 1

ENT.BodyWobbleConstant = 0.1
ENT.BodyWobbleDamping = 5

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

ENT.HornSound = "gta3d/horns/horn_010HD.wav"
ENT.HornPos = Vector(70,0,20)

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

ENT.RandomColor = {
	{
		BodyGroups = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
		},
	},
	{
		BodyGroups = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
		},
	},
}
