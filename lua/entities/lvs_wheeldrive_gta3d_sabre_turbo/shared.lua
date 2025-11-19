
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Sabre Turbo"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sports"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sports"

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

ENT.MaxVelocity = 2300

ENT.EngineTorque = 190
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 4

ENT.RandomColor = {
	{
		Skin = 1,
		Color = Color(24,63,114),
	}
}

ENT.HornSound = "gta3d/horns/horn_003_118.wav"
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
		sound = "gta3d/engines/sabregt/idle.wav",
		Pitch = 100,
		PitchMul = 65,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/sabregt/gear.wav",
		soundDuration = 2.5,
		speed = { 1.2, 1.15, 1.075, 1 },
		SoundLevel = 80,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/sabregt/cruise.wav",
		Pitch = 70,
		PitchMul = 50,
		SoundLevel = 80,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/sabregt/throttleoff.wav",
		SoundLevel = 80,
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

