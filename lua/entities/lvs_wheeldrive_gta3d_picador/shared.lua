
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Picador"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - SUVs/Pickups"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "SUVs/Pickups"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/picador/picador.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/picador/bonnet_dam.mdl",
	"models/diggercars/gtasa/picador/boot_dam.mdl",
	"models/diggercars/gtasa/picador/bump_front_dam.mdl",
	"models/diggercars/gtasa/picador/bump_rear_dam.mdl",
	"models/diggercars/gtasa/picador/door_lf_dam.mdl",
	"models/diggercars/gtasa/picador/door_rf_dam.mdl",
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
		Color = Color(123,113,94),
	},
	{
		Skin = 1,
		Color = Color(132,148,171),
	},
	{
		Skin = 1,
		Color = Color(105,20,31),
	},
	{
		Skin = 1,
		Color = Color(106,122,140),
	},
	{
		Skin = 2,
		Color = Color(101,106,121),
	},
	{
		Skin = 3,
		Color = Color(189,190,198),
	},
	{
		Skin = 4,
		Color = Color(42,119,161),
	},
	{
		Skin = 5,
		Color = Color(40,56,60),
	},
	{
		Skin = 5,
		Color = Color(82,65,51),
	},
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
		sound = "gta3d/engines/picador/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 75,
	},
	gears = {
		sound = "gta3d/engines/picador/gear.wav",
		soundDuration = 3.4,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 85,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/picador/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 85,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/picador/throttleoff.wav",
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
		Trigger = "main+high",
		SubMaterialID = 14,
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
		SubMaterialID = 16,
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


