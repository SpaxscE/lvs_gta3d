
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Stalion"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Coupes/Hatchbacks"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Coupes/Hatchbacks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/stallion/stallion.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/stallion/bonnet_dam.mdl",
	"models/diggercars/gtasa/stallion/boot_dam.mdl",
	"models/diggercars/gtasa/stallion/bump_front_dam.mdl",
	"models/diggercars/gtasa/stallion/bump_rear_dam.mdl",
	"models/diggercars/gtasa/stallion/door_lf_dam.mdl",
	"models/diggercars/gtasa/stallion/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2200

ENT.EngineTorque = 140
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 4

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

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(70,0,20)

ENT.BodyWobbleEnabled = true
ENT.BodyWobbleBone = "axle"

ENT.BodyWobbleAngleMulPitch = 1
ENT.BodyWobbleAngleMulRoll = 1
ENT.BodyWobbleAngleMax = 0.5

ENT.BodyWobbleConstant = 1
ENT.BodyWobbleDamping = 4

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/cutlass/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/cutlass/gear.wav",
		soundDuration = 3.2,
		speed = { 1.4, 1.25, 1.1, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/cutlass/cruise.wav",
		Pitch = 80,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/cutlass/throttleoff.wav",
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


ENT.Lights = {
	{
		Trigger = "main+high",
		SubMaterialID = 17,
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
			{ width = 50, height = 50, pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "front_bumper", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 10,
		Sprites = {
			{ width = 50, height = 50, pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "front_bumper", active = { 0 } }, },
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

