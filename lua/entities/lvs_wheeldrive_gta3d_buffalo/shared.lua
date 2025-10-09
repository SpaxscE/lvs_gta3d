
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Buffalo"
ENT.Author = "Randy"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sports"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sports"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/gta3d/simf/buffalo.mdl"
ENT.MDL_DESTROYED = "models/gta3d/gibs/buffalo/chassis.mdl"

ENT.GibModels = {
	"models/gta3d/gibs/buffalo/bonnet_dam.mdl",
	"models/gta3d/gibs/buffalo/boot_dam.mdl",
	"models/gta3d/gibs/buffalo/bump_front_dam.mdl",
	"models/gta3d/gibs/buffalo/bump_rear_dam.mdl",
	"models/gta3d/gibs/buffalo/door_lf_dam.mdl",
	"models/gta3d/gibs/buffalo/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2150

ENT.EngineTorque = 150
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	Color(70,89,122),
	Color(88,89,90),
	Color(105,30,59),
	Color(66,31,33),
	Color(109,122,136),
	Color(175,177,177),
	Color(77,93,96),
	Color(127,105,86),
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

ENT.ExhaustPositions = {
	{
		pos = Vector(-99,19,-19.5),
		ang = Angle(0,180,0),
	},
	{
		pos = Vector(-99,-19,-19.5),
		ang = Angle(0,180,0),
	},
}

ENT.Lights = {
	{
		Trigger = "main",
		SubMaterialID = 13,
		Sprites = {
			{ pos = Vector(96,32,-2), colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(96,-32,-2), colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(96,32,-2), ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(96,-32,-2), ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "main+brake",
		SubMaterialID = 16,
		Sprites = {
			{ pos = Vector(-99,26,2), width = 125, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_lr", active = { 0 } }, },
			{ pos = Vector(-99,-26,2), width = 125, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_rr", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "high",
		SubMaterialID = 14,
		Sprites = {
			{ pos = Vector(98,25,-2), colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(98,-25,-2), colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(98,25,-2), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(98,-25,-2), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
}

