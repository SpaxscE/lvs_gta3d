
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Stinger"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sports"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sports"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/vc/stinger/stinger.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/vc/stinger/bonnet_dam.mdl",
	"models/diggercars/gtasa/vc/stinger/boot_dam.mdl",
	"models/diggercars/gtasa/vc/stinger/bump_front_dam.mdl",
	"models/diggercars/gtasa/vc/stinger/bump_rear_dam.mdl",
	"models/diggercars/gtasa/vc/stinger/door_lf_dam.mdl",
	"models/diggercars/gtasa/vc/stinger/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2300

ENT.EngineTorque = 145
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.PhysicsInertia = Vector(1500,1500,1000)

ENT.RandomColor = {
	-- VICE CITY
	Color(134,68,110),
	Color(255,182,16),
	Color(49,0,0),
	Color(255,156,16),
	Color(145,138,61),
	Color(189,190,198),
	Color(42,119,161),
	Color(132,4,16),
}

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(70,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/i4_1/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/i4_1/gear.wav",
		soundDuration = 3.6,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/i4_1/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/i4_1/throttleoff.wav",
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
		SubMaterialID = 14,
		Sprites = {
			{  pos = "a_rl", width = 30, height = 30, colorG = 0, colorB = 0, colorA = 50, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 30, height = 30, colorG = 0, colorB = 0, colorA = 50, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnleft",
		SubMaterialID = 18,
		Sprites = {
			{  pos = "a_rlt", width = 30, height = 30, colorG = 0, colorB = 0, colorA = 50, bodygroup = { name = "l_rlt", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnright",
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_rrt", width = 30, height = 30, colorG = 0, colorB = 0, colorA = 50, bodygroup = { name = "l_rrt", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = 15,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 16,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt", active = { 0 } }, },
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

