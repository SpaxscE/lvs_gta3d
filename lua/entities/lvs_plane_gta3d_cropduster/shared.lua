
ENT.Base = "lvs_plane_gta3d"

ENT.PrintName = "Crop Duster"
ENT.Author = "Luna"
ENT.Information = "Small and Unarmed Civilian Airplane"
ENT.Category = "[LVS] GTA3D - Planes"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Planes"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/planes/cropduster.mdl"

ENT.MaxVelocity = 1300
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
		Color = Color(115,14,26),
	},
	{
		Skin = 2,
		Color = Color(156,161,163),
	},
	{
		Skin = 3,
		Color = Color(132,148,171),
	},
	{
		Skin = 4,
		Color = Color(93,27,32),
	},
	{
		Skin = 5,
		Color = Color(77,98,104),
	},
	{
		Skin = 6,
		Color = Color(156,141,113),
	},
	{
		Skin = 7,
		Color = Color(145,115,71),
	},
	{
		Skin = 7,
		Color = Color(155,159,157),
	},
}
