
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
		VolumeMax = 0.35,
		SoundLevel = 110,
	},
}

ENT.ExhaustPositions = {
	{
		pos = Vector(65.04,-14.93,19.46),
		ang = Angle(145,-90,0),
	},
}

ENT.RandomColor = {
	{
		Skin = 1,
		Color = Color(96,26,35),
	},
	{
		Skin = 1,
		Color = Color(62,36,40),
	},
	{
		Skin = 2,
		Color = Color(32,44,82),
	},
	{
		Skin = 3,
		Color = Color(55,68,63),
	},
	{
		Skin = 4,
		Color = Color(105,30,59),
	},
	{
		Skin = 5,
		Color = Color(59,78,120),
	},
	{
		Skin = 6,
		Color = Color(94,112,114),
	},
	{
		Skin = 7,
		Color = Color(20,20,20),
	},
}
