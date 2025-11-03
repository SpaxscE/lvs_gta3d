
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Virgo"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Coupes/Hatchbacks"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Coupes/Hatchbacks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/virgo/virgo.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/virgo/bonnet_dam.mdl",
	"models/diggercars/gtasa/virgo/boot_dam.mdl",
	"models/diggercars/gtasa/virgo/bump_front_dam.mdl",
	"models/diggercars/gtasa/virgo/bump_rear_dam.mdl",
	"models/diggercars/gtasa/virgo/door_lf_dam.mdl",
	"models/diggercars/gtasa/virgo/door_rf_dam.mdl",
}

ENT.AITEAM = 0
ENT.MaxVelocity = 1775

ENT.EngineTorque = 135
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	{
		Skin = 1,
		Color = Color(44,35,34),
	},
	{
		Skin = 2,
		Color = Color(111,130,151),
	},
	{
		Skin = 3,
		Color = Color(77,98,104),
	},
	{
		Skin = 2,
		Color = Color(164,167,165),
	},
	{
		Skin = 2,
		Color = Color(76,41,43),
	},
	{
		Skin = 2,
		Color = Color(156,156,152),
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
		sound = "gta3d/engines/pathfinder/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/pathfinder/gear.wav",
		soundDuration = 3.047,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/pathfinder/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/pathfinder/throttleoff.wav",
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
		Trigger = "main",
		SubMaterialID = 14,
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
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_rl", width = 40, height = 40, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnright",
		SubMaterialID = 16,
		Sprites = {
			{  pos = "a_rr", width = 40, height = 40, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = 19,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 20,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt", active = { 0 } }, },
		},
	},	
	{
		Trigger = "high",
		SubMaterialID = 18,
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

