
ENT.Base = "lvs_heli_gta3d"

ENT.PrintName = "Cargobob"
ENT.Author = "Luna"
ENT.Category = "[LVS] GTA3D - Helicopters"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Helicopters"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/helis/cargobob.mdl"

ENT.AITEAM = 2

ENT.MaxHealth = 3000

ENT.MaxVelocity = 2000

ENT.ThrustUp = 1
ENT.ThrustDown = 0.8
ENT.ThrustRate = 0.75

ENT.ThrottleRateUp = 0.1
ENT.ThrottleRateDown = 0.2

ENT.TurnRatePitch = 0.5
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 0.5

ENT.GravityTurnRateYaw = 2

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
