
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Intruder"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sedans/Wagons"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sedans/Wagons"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/intruder/intruder.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/intruder/bonnet_dam.mdl",
	"models/diggercars/gtasa/intruder/boot_dam.mdl",
	"models/diggercars/gtasa/intruder/bump_front_dam.mdl",
	"models/diggercars/gtasa/intruder/bump_rear_dam.mdl",
	"models/diggercars/gtasa/intruder/door_lf_dam.mdl",
	"models/diggercars/gtasa/intruder/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2050

ENT.EngineTorque = 130
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	Color(102,28,38),
	Color(120,34,43),
	Color(42,119,161),
	Color(132,4,16),
	Color(71,53,50),
	Color(105,88,83),
	Color(76,117,183),
}

ENT.HornSound = "gta3d/horns/horn_009.wav"
ENT.HornPos = Vector(70,0,20)

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
		ProjectedTextures = {
			{  pos = "a_fl", ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},

	{
		Trigger = "main+brake",
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_rl", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
			{  pos = "a_rl2", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr2", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},

	{
		Trigger = "turnright",
		SubMaterialID = 13,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
			{  pos = "a_frt2", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt", active = { 0 } }, },
			{  pos = "a_rrt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 16,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_flt2", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt", active = { 0 } }, },
			{  pos = "a_rlt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
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

