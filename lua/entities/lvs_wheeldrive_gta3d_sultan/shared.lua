
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Sultan"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Tuners"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Tuners"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/sultan/sultan.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/sultan/bonnet_dam.mdl",
	"models/diggercars/gtasa/sultan/boot_dam.mdl",
	"models/diggercars/gtasa/sultan/bump_front_dam.mdl",
	"models/diggercars/gtasa/sultan/bump_rear_dam.mdl",
	"models/diggercars/gtasa/sultan/door_lf_dam.mdl",
	"models/diggercars/gtasa/sultan/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2150

ENT.EngineTorque = 140
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	Color(42,119,161),
	Color(94,112,114),
	Color(115,14,26),
	Color(115,46,62),
	Color(118,123,124),
	Color(45,58,53),
	Color(111,103,95),
	Color(158,164,171),
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
		Trigger = "main+high",
		SubMaterialID = 18,
		Sprites = {
			{  pos = "a_fl", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},

	{
		Trigger = "main",
		ProjectedTextures = {
			{  pos = "a_fl", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},

	{
		Trigger = "main+brake",
		SubMaterialID = 19,
		Sprites = {
			{  pos = "a_rl", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},

	{
		Trigger = "turnright",
		SubMaterialID = 13,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
			{  pos = "a_frt2", colorG = 100, colorB = 0, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 0 } }, },
			{  pos = "a_frt3", colorG = 100, colorB = 0, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 6 } }, },
			{  pos = "a_rrt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 11,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_flt2", colorG = 100, colorB = 0, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 0 } }, },
			{  pos = "a_flt3", colorG = 100, colorB = 0, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 6 } }, },
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
	{
		Trigger = "fog",
		SubMaterialID = 12,
		Sprites = {
			{  pos = Vector(103.99,29.43,12.18), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 0 } }, },
			{  pos = Vector(103.99,-29.43,12.18), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 0 } }, },
			{  pos = Vector(104.85,35.64,16.04), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 3 } }, },
			{  pos = Vector(104.85,-35.64,16.04), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 3 } }, },
			{  pos = "a_flf2", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 3 } }, },
			{  pos = "a_frf2", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 3 } }, },
			{  pos = "a_flf", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 6 } }, },
			{  pos = "a_frf", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 6 } }, },
		},
	},
	{
		Trigger = "reverse",
		SubMaterialID = 20,
		Sprites = {

			{ pos = "a_rlr", width = 25, height = 25, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{ pos = "a_rrr", width = 25, height = 25, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },

		}
	},
}

