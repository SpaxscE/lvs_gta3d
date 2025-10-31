
ENT.Base = "lvs_plane_gta3d"

ENT.PrintName = "Stunt Plane"
ENT.Author = "Luna"
ENT.Information = "Small and Unarmed Civilian Airplane"
ENT.Category = "[LVS] GTA3D - Planes"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Planes"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/planes/stuntplane.mdl"

ENT.MaxVelocity = 1650
ENT.MaxPerfVelocity = 600
ENT.MaxThrust = 800

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

ENT.RandomColor = {
	{
		Skin = 1,
		Color = Color(147,163,150),
	},
	{
		Skin = 2,
		Color = Color(115,46,62),
	},
	{
		Skin = 3,
		Color = Color(115,46,62),
	},
	{
		Skin = 3,
		Color = Color(76,41,43),
	},
	{
		Skin = 3,
		Color = Color(49,57,85),
	},
	{
		Skin = 4,
		Color = Color(125,98,86),
	},
	{
		Skin = 5,
		Color = Color(152,149,134),
	},
	{
		Skin = 6,
		Color = Color(58,89,79),
	},
}
