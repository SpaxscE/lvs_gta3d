
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Clover"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Coupes/Hatchbacks"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Coupes/Hatchbacks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/clover/clover.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/clover/bonnet_dam.mdl",
	"models/diggercars/gtasa/clover/boot_dam.mdl",
	"models/diggercars/gtasa/clover/bump_front_dam.mdl",
	"models/diggercars/gtasa/clover/bump_rear_dam.mdl",
	"models/diggercars/gtasa/clover/door_lf_dam.mdl",
	"models/diggercars/gtasa/clover/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 1700

ENT.EngineTorque = 120
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 4

ENT.RandomColor = {
	{
		Skin = 1,
		Color = Color(88,89,90),
	},
	{
		Skin = 1,
		Color = Color(81,84,89),
	},
	{
		Skin = 2,
		Color = Color(105,49,53),
	},
	{
		Skin = 3,
		Color = Color(132,148,171),
	},
	{
		Skin = 3,
		Color = Color(103,37,42),
	},
	{
		Skin = 4,
		Color = Color(105,88,83),
	},
	{
		Skin = 4,
		Color = Color(91,93,94),
	},
}


ENT.HornSound = "gta3d/horns/horn_003_118.wav"
ENT.HornPos = Vector(45,0,20)

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
		Trigger = "main",
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
		Trigger = "main+brake+turnleft",
		SubMaterialID = 18,
		Sprites = {
			{  pos = "a_rl", width = 40, height = 40, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rl2", width = 40, height = 40, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnright",
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_rr", width = 40, height = 40, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
			{  pos = "a_rr2", width = 40, height = 40, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = 20,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 21,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt", active = { 0 } }, },
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

