
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Towtruck"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Public Service"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Public Service"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/towtruck/towtruck.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/towtruck/bonnet_dam.mdl",
	"models/diggercars/gtasa/towtruck/boot_dam.mdl",
	"models/diggercars/gtasa/towtruck/bump_front_dam.mdl",
	"models/diggercars/gtasa/towtruck/bump_rear_dam.mdl",
	"models/diggercars/gtasa/towtruck/door_lf_dam.mdl",
	"models/diggercars/gtasa/towtruck/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2200

ENT.EngineTorque = 140
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 4

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(70,0,20)

ENT.SirenPos = Vector(30,0,30)
ENT.SirenSound = {
	[1] = {
		siren = "common/null.wav",
	},
}

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
		Siren = true,
		Trigger = "10",
		SubMaterialID = 12,
		Sprites = {
			{ pos = "s1", colorG = 0, colorB = 0, colorA = 255, width = 100, height = 60 },
		},
	},
	{
		Siren = true,
		Trigger = "01",
		SubMaterialID = 13,
		Sprites = {
			{ pos = "s2", colorG = 0, colorB = 0, colorA = 255, width = 100, height = 60 },

		},
	},

	{
		Siren = true,
		Trigger = "1",
		SubMaterialID = 14,
		Sprites = {
			{ pos = "b1", colorG = 100, colorB = 0, colorA = 150, width = 50, height = 50 },
			{ pos = "b2", colorG = 100, colorB = 0, colorA = 150, width = 50, height = 50 },
			{ pos = "b3", colorG = 100, colorB = 0, colorA = 150, width = 50, height = 50 },
			{ pos = "b4", colorG = 0, colorB = 0, colorA = 255, width = 50, height = 50 },
			{ pos = "b5", colorG = 0, colorB = 0, colorA = 255, width = 50, height = 50 },
		},
	},

	{
		Trigger = "main+high",
		SubMaterialID = 20,
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
		SubMaterialID = 24,
		Sprites = {
			{  pos = "a_rl", width = 80, height = 70, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnright",
		SubMaterialID = 23,
		Sprites = {
			{  pos = "a_rr", width = 80, height = 70, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = 19,
		Sprites = {
			{ width = 50, height = 50, pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 22,
		Sprites = {
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

