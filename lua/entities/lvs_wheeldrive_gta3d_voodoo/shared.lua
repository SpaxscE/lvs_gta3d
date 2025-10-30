
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Voodoo"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Lowriders"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Lowriders"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/voodoo/voodoo.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/voodoo/bonnet_dam.mdl",
	"models/diggercars/gtasa/voodoo/boot_dam.mdl",
	"models/diggercars/gtasa/voodoo/bump_front_dam.mdl",
	"models/diggercars/gtasa/voodoo/bump_rear_dam.mdl",
	"models/diggercars/gtasa/voodoo/door_lf_dam.mdl",
	"models/diggercars/gtasa/voodoo/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2000

ENT.EngineTorque = 130
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 4

ENT.RandomColor = {
	Color(94,112,114),
	Color(70,89,122),
	Color(101,106,121),
	Color(63,62,69),
	Color(99,92,90),
	Color(151,149,146),
	Color(76,41,43),
	Color(55,68,63),
}

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(70,0,20)

ENT.BodyWobbleEnabled = true
ENT.BodyWobbleBone = "axle"

ENT.BodyWobbleAngleMulPitch = 1
ENT.BodyWobbleAngleMulRoll = 1
ENT.BodyWobbleAngleMax = 0.2

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
		Trigger = "main",
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
			{  pos = "a_rl", width = 50, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 50, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
			{  pos = "a_rl2", width = 50, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl2", active = { 0 } }, },
			{  pos = "a_rr2", width = 50, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr2", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "high",
		SubMaterialID = 15,
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


