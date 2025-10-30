
ENT.Base = "lvs_base_fighterplane"

ENT.PrintName = "Stunt Plane"
ENT.Author = "Luna"
ENT.Information = "Small and Unarmed Civilian Airplane"
ENT.Category = "[LVS] GTA3D - Planes"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Planes"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/planes/stuntplane.mdl"

ENT.AITEAM = 0

ENT.MaxVelocity = 1400
ENT.MaxPerfVelocity = 600
ENT.MaxThrust = 800

ENT.TurnRatePitch = 1.5
ENT.TurnRateYaw = 2
ENT.TurnRateRoll = 0.8

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxSlipAnglePitch = 20
ENT.MaxSlipAngleYaw = 8

ENT.MaxHealth = 250

ENT.FlyByAdvance = 2.7
ENT.FlyBySound = "gta3d/engines/stuntplane/flyby.wav" 
ENT.DeathSound = "lvs/vehicles/generic/crash.wav"

ENT.EngineSounds = {
	{
		sound = "^gta3d/engines/stuntplane/rpm.wav",
		Pitch = 85,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 35,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
	},
	{
		sound = "^gta3d/engines/stuntplane/dist.wav",
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
		VolumeMax = 0.5,
		SoundLevel = 110,
	},
}

ENT.ExhaustPositions = {
	{
		pos = Vector(65.04,-14.93,19.46),
		ang = Angle(145,-90,0),
	},
}
