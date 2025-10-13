
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Tractor"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Industrial"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Industrial"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/tractor/tractor.mdl"

ENT.RandomColor = {
	--SAN ANDREAS
	Color(100,100,100),
	Color(90,87,82),
	Color(45,58,53),
	Color(109,122,136),
	Color(111,103,95),
	Color(95,10,21),
	Color(93,27,32),
	Color(122,117,96),
}

ENT.AITEAM = 0

ENT.MaxVelocity = 500

ENT.EngineTorque = 100
ENT.EngineCurve = 1
ENT.EngineCurveBoostLow = 3
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.PhysicsWeightScale = 2

ENT.TransGears = 3

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(30,0,30)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/tractor/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/tractor/gear.wav",
		soundDuration = 2.9,
		speed = { 1.3, 1.15, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/tractor/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/tractor/throttleoff.wav",
		SoundLevel = 75,
	},
	reverse_on = {
		sound = "gta3d/share/reverse_on.wav",
		Pitch = 90,
		PitchMul = 20,
		SoundLevel = 65,
	},
	reverse_off = {
		sound = "gta3d/share/reverse_off.wav",
		Pitch = 80,
		PitchMul = 20,
		SoundLevel = 65,
	},
}

ENT.Lights = {


	{
		Trigger = "main+high",
		SubMaterialID = 2,
		Sprites = {
			{  pos = "a_fl", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },

		},
		ProjectedTextures = {
			{  pos = "a_fl", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},

	{
		Trigger = "main+brake",
		SubMaterialID = 4,
		Sprites = {
			{  pos = "a_r", width = 40, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_r", active = { 0 } }, },
		},
	},

	
	{
		Trigger = "high",
		ProjectedTextures = {
			{  pos = "a_fl", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},

}

