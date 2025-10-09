
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Premier"
ENT.Author = "Randy"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sedans/Wagons"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sedans/Wagons"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/gta3d/simf/premier.mdl"
ENT.MDL_DESTROYED = "models/gta3d/gibs/premier/chassis.mdl"

ENT.GibModels = {
	"models/gta3d/gibs/premier/bonnet_dam.mdl",
	"models/gta3d/gibs/premier/boot_dam.mdl",
	"models/gta3d/gibs/premier/bump_front_dam.mdl",
	"models/gta3d/gibs/premier/bump_rear_dam.mdl",
	"models/gta3d/gibs/premier/door_lf_dam.mdl",
	"models/gta3d/gibs/premier/door_lr_dam.mdl",
	"models/gta3d/gibs/premier/door_rf_dam.mdl",
	"models/gta3d/gibs/premier/door_rr_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2150

ENT.EngineTorque = 135
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	Color(45,58,53),
	Color(124,28,42),
	Color(22,34,72),
	Color(102,28,38),
	Color(76,117,183),
	Color(70,89,122),
	Color(101,106,121),
	Color(156,161,163),
}

ENT.HornSound = "gta3d/horns/horn_009.wav"
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
		SoundLevel = 65,
	},
	reverse_off = {
		sound = "gta3d/share/reverse_off.wav",
		Pitch = 80,
		PitchMul = 20,
		SoundLevel = 65,
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
			{ pos = Vector(90,29,-1), width = 100, colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(90,-29,-1), width = 100, colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(90,29,-1), ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(90,-29,-1), ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "main+brake",
		SubMaterialID = 17,
		Sprites = {
			{ pos = Vector(-104,27,0), width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_lr", active = { 0 } }, },
			{ pos = Vector(-104,-27,0), width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_rr", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "high",
		Sprites = {
			{ pos = Vector(90,29,-1), width = 100, colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(90,-29,-1), width = 100, colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(90,29,-1), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(90,-29,-1), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "turnleft",
		SubMaterialID = 15,
		Sprites = {
			{ pos = Vector(87,39,-1), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_lf_ind", active = { 0 } }, },
			{ pos = Vector(-102,39,0), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_lr_ind", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "turnright",
		SubMaterialID = 16,
		Sprites = {
			{ pos = Vector(87,-39,-1), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_rf_ind", active = { 0 } }, },
			{ pos = Vector(-102,-39,0), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_rr_ind", active = { 0 } }, },
		},
	},
}
