
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Deluxo"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sports"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sports"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/vc/deluxo/deluxo.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/vc/deluxo/bonnet_dam.mdl",
	"models/diggercars/gtasa/vc/deluxo/bump_front_dam.mdl",
	"models/diggercars/gtasa/vc/deluxo/bump_rear_dam.mdl",
	"models/diggercars/gtasa/vc/deluxo/door_lf_dam.mdl",
	"models/diggercars/gtasa/vc/deluxo/door_rf_dam.mdl",
	"models/diggercars/gtasa/vc/deluxo/l_rr_dam.mdl",
	"models/diggercars/gtasa/vc/deluxo/l_rl_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2250

ENT.EngineTorque = 150
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	-- VICE CITY
	Color(245,245,245),
	Color(132,4,16),
	Color(255,182,16),
	Color(45,104,62),
}

ENT.HornSound = "gta3d/horns/horn_003_105.wav"
ENT.HornPos = Vector(45,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/cobra/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/cobra/gear.wav",
		soundDuration = 3.51,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/cobra/cruise.wav",
		Pitch = 80,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/cobra/throttleoff.wav",
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
		SubMaterialID = 16,
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
		SubMaterialID = 5,
		Sprites = {
			{  pos = "a_rl", width = 100, colorG = 0, colorB = 0, colorA = 100 },
			{  pos = "a_rr", width = 100, colorG = 0, colorB = 0, colorA = 100 },
		},
	},

	{
		Trigger = "turnright",
		SubMaterialID = 6,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "front_bumper", active = { 0 } }, },
			{  pos = "a_rrt", colorG = 100, colorB = 0, colorA = 150 },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 4,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "front_bumper", active = { 0 } }, },
			{  pos = "a_rlt", colorG = 100, colorB = 0, colorA = 150 },
		},
	},	
	{
		Trigger = "reverse",
		SubMaterialID = 7,
		Sprites = {

			{ pos = "a_rrr", width = 25, height = 25, colorA = 150 },
			{ pos = "a_rlr", width = 25, height = 25, colorA = 150 },

		}
	},		
	{
		Trigger = "high",
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_flh", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_frh", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
		ProjectedTextures = {
			{  pos = "a_flh", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_frh", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
}

