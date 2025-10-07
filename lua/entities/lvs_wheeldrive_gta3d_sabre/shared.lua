
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Sabre"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Lowriders/Tuners"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Lowriders/Tuners"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/sabre/sabre.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/sabre/bonnet_dam.mdl",
	"models/diggercars/gtasa/sabre/boot_dam.mdl",
	"models/diggercars/gtasa/sabre/bump_front_dam.mdl",
	"models/diggercars/gtasa/sabre/bump_rear_dam.mdl",
	"models/diggercars/gtasa/sabre/door_lf_dam.mdl",
	"models/diggercars/gtasa/sabre/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxHealth = 175

ENT.MaxVelocity = 1775

ENT.EngineTorque = 115
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

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

ENT.HornSound = "gta3d/horns/horn_003_118.wav"
ENT.HornPos = Vector(70,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/glen_idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/glen_gear.wav",
		soundDuration = 3.2,
		speed = { 1.4, 1.25, 1.1, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/glen_cruise.wav",
		Pitch = 80,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/glen_throttleoff.wav",
		SoundLevel = 75,
	},
	reverse_on = {
		sound = "gta3d/share/reverse_on.wav",
		Pitch = 90,
		PitchMul = 20,
		SoundLevel = 75,
	},
	reverse_off = {
		sound = "gta3d/share/reverse_off.wav",
		Pitch = 80,
		PitchMul = 20,
		SoundLevel = 75,
	},
}

ENT.ExhaustPositions = {
	{
		pos = Vector(-103,-19.38,0.18),
		ang = Angle(0,180,0),
	},
}


ENT.Lights = {
	{
		Trigger = "main",
		SubMaterialID = 18,
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
		Trigger = "main+brake+turnleft",
		SubMaterialID = 14,
		Sprites = {
			{  pos = "a_rl", width = 80, height = 70, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "rear_bumper", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnright",
		SubMaterialID = 15,
		Sprites = {
			{  pos = "a_rr", width = 80, height = 70, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "rear_bumper", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = 11,
		Sprites = {
			{ width = 20, height = 20, pos = Vector(97.4,-35.07,6.46), colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "front_bumper", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 10,
		Sprites = {
			{ width = 20, height = 20, pos = Vector(97.4,35.07,6.46), colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "front_bumper", active = { 0 } }, },
		},
	},	
	
	{
		Trigger = "high",
		SubMaterialID = 19,
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

