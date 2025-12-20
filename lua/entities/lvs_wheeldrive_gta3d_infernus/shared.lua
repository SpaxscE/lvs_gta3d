
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Infernus"
ENT.Author = "Randy"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sports"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sports"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/gta3d/lv3d/infernus.mdl"
ENT.MDL_DESTROYED = "models/gta3d/gibs/infernus/chassis.mdl"

ENT.GibModels = {
	"models/gta3d/gibs/infernus/bonnet_dam.mdl",
	"models/gta3d/gibs/infernus/bump_front_dam.mdl",
	"models/gta3d/gibs/infernus/bump_rear_dam.mdl",
	"models/gta3d/gibs/infernus/door_lf_dam.mdl",
	"models/gta3d/gibs/infernus/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2600

ENT.EngineTorque = 180
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	Color(93,126,141),
	Color(164,167,165),
	Color(98,68,40),
	Color(34,52,87),
	Color(89,110,135),
	Color(16,80,130),
	Color(114,42,63),
	Color(32,32,44),
}

ENT.HornSound = "gta3d/horns/horn_009_112.wav"
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

ENT.ExhaustPositions = {
	{
		pos = Vector(-97,12,-17.5),
		ang = Angle(0,180,0),
	},
	{
		pos = Vector(-97,-12,-17.5),
		ang = Angle(0,180,0),
	},
}

ENT.Lights = {
	{
		Trigger = "main",
		SubMaterialID = 17,
		Sprites = {
			{ pos = Vector(105,29,-7), width = 85, height = 35, colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(105,-29,-7), width = 85, height = 35, colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(105,29,-7), ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(105,-29,-7), ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "main+brake",
		SubMaterialID = 21,
		Sprites = {
			{ pos = Vector(-94,25,2), width = 140, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_lr", active = { 0 } }, },
			{ pos = Vector(-94,-25,2), width = 140, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_rr", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "high",
		Sprites = {
			{ pos = Vector(105,29,-7), width = 85, height = 35, colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(105,-29,-7), width = 85, height = 35, colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(105,29,-7), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(105,-29,-7), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "fog",
		SubMaterialID = 12,
		Sprites = {
			{ pos = Vector(103,24,-18), colorB = 200, colorA = 150, bodygroup = { name = "bump_front", active = { 0 } }, },
			{ pos = Vector(103,-24,-18), colorB = 200, colorA = 150, bodygroup = { name = "bump_front", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "turnleft",
		SubMaterialID = 19,
		Sprites = {
			{ pos = Vector(96,38,-7), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_lf_ind", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "turnright",
		SubMaterialID = 20,
		Sprites = {
			{ pos = Vector(96,-38,-7), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_rf_ind", active = { 0 } }, },
		},
	},
}

