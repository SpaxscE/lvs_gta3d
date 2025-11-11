
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Glendale"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sedans/Wagons"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sedans/Wagons"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/glendale/glendale.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/glendale/bonnet_dam.mdl",
	"models/diggercars/gtasa/glendale/boot_dam.mdl",
	"models/diggercars/gtasa/glendale/bump_front_dam.mdl",
	"models/diggercars/gtasa/glendale/bump_rear_dam.mdl",
	"models/diggercars/gtasa/glendale/door_lf_dam.mdl",
	"models/diggercars/gtasa/glendale/door_lr_dam.mdl",
	"models/diggercars/gtasa/glendale/door_rf_dam.mdl",
	"models/diggercars/gtasa/glendale/door_rr_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 1775

ENT.EngineTorque = 115
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 4

ENT.RandomColor = {
	{
		Skin = 1,
		Color = Color(106,122,140),
	},
	{
		Skin = 1,
		Color = Color(170,173,142),
	},
	{
		Skin = 1,
		Color = Color(120,34,43),
	},
	{
		Skin = 1,
		Color = Color(42,119,161),
	},
	{
		Skin = 1,
		Color = Color(51,95,63),
	},
	{
		Skin = 1,
		Color = Color(133,20,52),
	},
	{
		Skin = 1,
		Color = Color(73,72,79),
	},
	{
		Skin = 2,
		Color = Color(103,37,42),
	},
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
		sound = "gta3d/engines/glen/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/glen/gear.wav",
		soundDuration = 3.2,
		speed = { 1.4, 1.25, 1.1, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/glen/cruise.wav",
		Pitch = 80,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/glen/throttleoff.wav",
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
		pos = Vector(-115,-17.46,0),
		ang = Angle(0,180,0),
	},
}


ENT.Lights = {
	{
		Trigger = "main+high",
		SubMaterialID = 13,
		Sprites = {
			{  pos = "a_fl", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "main",
		ProjectedTextures = {
			{  pos = "a_fl", ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},

	{
		Trigger = "main+brake",
		SubMaterialID = 15,
		Sprites = {
			{  pos = "a_rl", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "high",
		ProjectedTextures = {
			{  pos = "a_fl", ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	
}

