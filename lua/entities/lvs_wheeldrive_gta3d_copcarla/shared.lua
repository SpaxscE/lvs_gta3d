
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Police"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Government"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Government"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/copcapla/copcapla.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/copcapla/bonnet_dam.mdl",
	"models/diggercars/gtasa/copcapla/boot_dam.mdl",
	"models/diggercars/gtasa/copcapla/bump_front_dam.mdl",
	"models/diggercars/gtasa/copcapla/bump_rear_dam.mdl",
	"models/diggercars/gtasa/copcapla/door_lf_dam.mdl",
	"models/diggercars/gtasa/copcapla/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2350

ENT.EngineTorque = 155
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	--SAN ANDREAS
	Color(10,10,10),
}

ENT.HornSound = "gta3d/horns/horn_009.wav"
ENT.HornPos = Vector(70,0,20)

ENT.BodyWobbleEnabled = true
ENT.BodyWobbleBone = "axle"

ENT.BodyWobbleAngleMulPitch = 1
ENT.BodyWobbleAngleMulRoll = 1
ENT.BodyWobbleAngleMax = 0.3

ENT.BodyWobbleConstant = 1
ENT.BodyWobbleDamping = 4

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

ENT.SirenPos = Vector(-13,0,59)
ENT.SirenSound = {
	[1] = {
		siren = "gta3d/horns/siren_wail.wav",
		horn = "gta3d/horns/siren_yelp.wav",
	},
}

ENT.Lights = {
	{
		Siren = true,
		Trigger = "10",
		SubMaterialID = 21,
		Sprites = {
			{ pos = "s2", colorG = 0, colorB = 0, colorA = 255, width = 100, height = 60 },
		},
	},
	{
		Siren = true,
		Trigger = "01",
		SubMaterialID = 22,
		Sprites = {
			{ pos = "s1", colorG = 0, colorR = 0, colorA = 255, width = 100, height = 60 },

		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 15,
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
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_rl", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnleft",
		SubMaterialID = 20,
		Sprites = {
			{  pos = "a_rl", width = 30, height = 30, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rl2", width = 30, height = 30, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnright",
		SubMaterialID = 19,
		Sprites = {
			{  pos = "a_rr", width = 30, height = 30, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
			{  pos = "a_rr2", width = 30, height = 30, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = 16,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 18,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
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

