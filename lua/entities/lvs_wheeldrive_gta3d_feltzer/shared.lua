
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Feltzer"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Coupes/Hatchbacks"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Coupes/Hatchbacks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/feltzer/feltzer.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/feltzer/bonnet_dam.mdl",
	"models/diggercars/gtasa/feltzer/boot_dam.mdl",
	"models/diggercars/gtasa/feltzer/bump_front_dam.mdl",
	"models/diggercars/gtasa/feltzer/bump_rear_dam.mdl",
	"models/diggercars/gtasa/feltzer/door_lf_dam.mdl",
	"models/diggercars/gtasa/feltzer/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2200

ENT.EngineTorque = 140
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 4

ENT.RandomColor = {
	Color(154,167,144),
	Color(96,26,35),
	Color(42,42,54),
	Color(170,157,132),
	Color(14,49,109),
	Color(40,56,60),
	Color(77,50,47),
	Color(54,65,85),
}

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(70,0,20)

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


ENT.Lights = {
	{
		Trigger = "main+high",
		SubMaterialID = 13,
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
		Trigger = "turnright",
		SubMaterialID = 14,
		Sprites = {
			{ width = 30, height = 30, pos = "a_rrt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
			{ width = 50, height = 50, pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 16,
		Sprites = {
			{ width = 30, height = 30, pos = "a_rlt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{ width = 50, height = 50, pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
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

