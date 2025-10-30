
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Manana"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Coupes/Hatchbacks"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Coupes/Hatchbacks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/manana/manana.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/manana/bonnet_dam.mdl",
	"models/diggercars/gtasa/manana/boot_dam.mdl",
	"models/diggercars/gtasa/manana/bump_front_dam.mdl",
	"models/diggercars/gtasa/manana/bump_rear_dam.mdl",
	"models/diggercars/gtasa/manana/door_lf_dam.mdl",
	"models/diggercars/gtasa/manana/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 1500

ENT.EngineTorque = 100
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 4

ENT.RandomColor = {
	Color(48,65,67),
	Color(94,112,114),
	Color(70,89,122),
	Color(63,62,69),
	Color(47,47,49),
	Color(44,35,34),
	Color(103,37,42),
	Color(87,60,57),
}

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(70,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/pathfinder/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/pathfinder/gear.wav",
		soundDuration = 3.047,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/pathfinder/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/pathfinder/throttleoff.wav",
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
		SubMaterialID = 12,
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
		SubMaterialID = 15,
		Sprites = {
			{  pos = "a_rl", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
			{  pos = "a_rl2", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr2", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},

	{
		Trigger = "turnright",
		SubMaterialID = 14,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt", active = { 0 } }, },
			{  pos = "a_rrt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 16,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt", active = { 0 } }, },
			{  pos = "a_rlt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
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

