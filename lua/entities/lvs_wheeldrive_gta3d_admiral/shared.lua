
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Admiral"
ENT.Author = "Randy"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sedans/Wagons"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sedans/Wagons"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/gta3d/simf/admiral.mdl"
ENT.MDL_DESTROYED = "models/gta3d/gibs/admiral/chassis.mdl"

ENT.GibModels = {
	"models/gta3d/gibs/admiral/bonnet_dam.mdl",
	"models/gta3d/gibs/admiral/boot_dam.mdl",
	"models/gta3d/gibs/admiral/bump_front_dam.mdl",
	"models/gta3d/gibs/admiral/bump_rear_dam.mdl",
	"models/gta3d/gibs/admiral/door_lf_dam.mdl",
	"models/gta3d/gibs/admiral/door_lr_dam.mdl",
	"models/gta3d/gibs/admiral/door_rf_dam.mdl",
	"models/gta3d/gibs/admiral/door_rr_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 1775

ENT.EngineTorque = 115
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	--SAN ANDREAS
	Color(100,100,100),
	Color(90,87,82),
	Color(45,58,53),
	Color(109,122,136),
	Color(111,103,95),
	Color(95,10,21),
	Color(93,27,32),
	Color(122,117,96),
	-- VICE CITY
--	Color(201,189,125),
--	Color(29,55,63),
--	Color(28,55,111),
--	Color(52,57,65),
--	Color(76,117,183),
--	Color(49,0,0),
--	Color(90,33,36),
--	Color(138,58,66),
}

ENT.HornSound = "gta3d/horns/horn_004HD.wav"
ENT.HornPos = Vector(45,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/merc/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/merc/gear.wav",
		soundDuration = 3.93,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/merc/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/merc/throttleoff.wav",
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
		pos = Vector(-103.22,-18.38,-20.18),
		ang = Angle(0,180,0),
	},
}


ENT.Lights = {
	{
		Trigger = "main",
		SubMaterialID = 13,
		Sprites = {
			{ pos = Vector(93,24,-2), width = 125, colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(93,-24,-2), width = 125, colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(93,24,-2), ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(93,-24,-2), ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "main+brake",
		SubMaterialID = 17,
		Sprites = {
			{ pos = Vector(-108,24,-2), width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_lr", active = { 0 } }, },
			{ pos = Vector(-108,-24,-2), width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_rr", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "high",
		Sprites = {
			{ pos = Vector(93,24,-2), width = 125, colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(93,-24,-2), width = 125, colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(93,24,-2), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(93,-24,-2), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "turnleft",
		SubMaterialID = 15,
		Sprites = {
			{ pos = Vector(90,35,-2), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_lf_ind", active = { 0 } }, },
			{ pos = Vector(-107,38,-2), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_lr_ind", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "turnright",
		SubMaterialID = 16,
		Sprites = {
			{ pos = Vector(90,-35,-2), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_rf_ind", active = { 0 } }, },
			{ pos = Vector(-107,-38,-2), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_rr_ind", active = { 0 } }, },
		},
	},
}

