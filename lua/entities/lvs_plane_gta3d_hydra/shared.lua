
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
ENT.MaxPerfVelocity = 2250
ENT.MaxThrust = 1800

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 1.5

ENT.MaxSlipAnglePitch = 10
ENT.MaxSlipAngleYaw = 5

ENT.MaxHealth = 650

ENT.DisableRadio = true

ENT.FlyByAdvance = 0.75
ENT.FlyBySound = "gta3d/engines/hydra/flyby.wav" 

ENT.GravityTurnRatePitch = 1
ENT.GravityTurnRateYaw = 1

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
