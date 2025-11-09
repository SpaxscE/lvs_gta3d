
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "ZR350"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sports"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sports"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/zr350/zr350.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/zr350/bonnet_dam.mdl",
	"models/diggercars/gtasa/zr350/bump_rear_dam.mdl",
	"models/diggercars/gtasa/zr350/door_lf_dam.mdl",
	"models/diggercars/gtasa/zr350/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2350

ENT.EngineTorque = 160
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	Color(54,65,85),
	Color(32,75,107),
	Color(31,37,59),
	Color(98,11,28),
	Color(15,15,15),
	Color(105,30,59),
	Color(37,37,39),
	Color(32,32,44),
}

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(70,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/i4_3/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 75,
	},
	gears = {
		sound = "gta3d/engines/i4_3/gear.wav",
		soundDuration = 3.5,
		speed = { 1.4, 1.3, 1.2, 1.1, 1 },
		SoundLevel = 85,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/i4_3/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 85,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/i4_3/throttleoff.wav",
		SoundLevel = 85,
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
		SubMaterialID = 15,
		Sprites = {
			{  pos = "a_fl", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },

		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 10,
		Sprites = {
			{  pos = "a_flh", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_flh", active = { 0 } }, },
			{  pos = "a_frh", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_frh", active = { 0 } }, },
		},
		ProjectedTextures = {
			{  pos = "a_flh", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_flh", active = { 0 } }, },
			{  pos = "a_frh", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_frh", active = { 0 } }, },
		},
	},

	{
		Trigger = "main+brake",
		SubMaterialID = 18,
		Sprites = {
			{  pos = "a_rl", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
			{  pos = "a_rl2", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr2", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},

	{
		Trigger = "turnright",
		SubMaterialID = 16,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
			{  pos = "a_rrt", colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_rlt", colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
		},
	},	
	
	{
		Trigger = "high",
		ProjectedTextures = {
			{  pos = "a_flh", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_flh", active = { 0 } }, },
			{  pos = "a_frh", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_frh", active = { 0 } }, },
		},
	},	
}

