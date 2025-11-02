
ENT.Base = "lvs_boat_gta3d"

ENT.PrintName = "Coast Guard"
ENT.Author = "Luna"
ENT.Category = "[LVS] GTA3D - Boats"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Boats"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/boats/coastg.mdl"

ENT.FloatHeight = 10

ENT.FloatForce = 20
ENT.FloatWaveFrequency = 5

ENT.TurnRate = 5
ENT.TurnForceYaw = 600
ENT.TurnForceRoll = 400

ENT.MaxThrust = 1000

ENT.MaxVelocity = 1000
ENT.MaxVelocityReverse = 350

ENT.MinVelocityAutoBrake = 400

ENT.ForceLinearMultiplier = 1
ENT.ForceAngleMultiplier = 1

ENT.EngineSounds = {
	{
		sound = "gta3d/engines/boat_coastguard/idle.wav",
		Pitch = 100,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 10,
		FadeIn = 0,
		FadeOut = 0.1,
		FadeSpeed = 1,
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
		FadeSpeed = 1,
		UseDoppler = true,
	},
}