
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Vincent"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sedans/Wagons"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sedans/Wagons"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/vincent/vincent.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/vincent/bonnet_dam.mdl",
	"models/diggercars/gtasa/vincent/boot_dam.mdl",
	"models/diggercars/gtasa/vincent/bump_front_dam.mdl",
	"models/diggercars/gtasa/vincent/bump_rear_dam.mdl",
	"models/diggercars/gtasa/vincent/door_lf_dam.mdl",
	"models/diggercars/gtasa/vincent/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2050

ENT.EngineTorque = 130
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	Color(45,58,53),
	Color(124,28,42),
	Color(22,34,72),
	Color(102,28,38),
	Color(215,142,16),
	Color(70,89,122),
	Color(101,106,121),
	Color(156,161,163),
}

ENT.HornSound = "gta3d/horns/horn_009.wav"
ENT.HornPos = Vector(70,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/merc/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/merc/gear.wav",
		soundDuration = 3.93,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/merc/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/merc/throttleoff.wav",
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
		Trigger = "main",
		SubMaterialID = 13,
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
		SubMaterialID = 16,
		Sprites = {
			{  pos = "a_rl", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},

	{
		Trigger = "turnright",
		SubMaterialID = 15,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt", active = { 0 } }, },
			{  pos = "a_frt2", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt2", active = { 0 } }, },
			{  pos = "a_rrt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt", active = { 0 } }, },
			{  pos = "a_flt2", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt2", active = { 0 } }, },
			{  pos = "a_rlt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
		},
	},	
	
	{
		Trigger = "high",
		SubMaterialID = 18,
		Sprites = {
			{  pos = "a_flh", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_flh", active = { 0 } }, },
			{  pos = "a_frh", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_frh", active = { 0 } }, },
		},
		ProjectedTextures = {
			{  pos = "a_flh", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_flh", active = { 0 } }, },
			{  pos = "a_frh", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_frh", active = { 0 } }, },
		},
	},	
}

