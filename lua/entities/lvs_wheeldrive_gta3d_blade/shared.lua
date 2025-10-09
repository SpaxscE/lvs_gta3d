
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Blade"
ENT.Author = "Randy"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Lowriders/Tuners"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Lowriders/Tuners"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/gta3d/simf/blade.mdl"
ENT.MDL_DESTROYED = "models/gta3d/gibs/blade/chassis.mdl"

ENT.GibModels = {
	"models/gta3d/gibs/blade/bonnet_dam.mdl",
	"models/gta3d/gibs/blade/boot_dam.mdl",
	"models/gta3d/gibs/blade/bump_front_dam.mdl",
	"models/gta3d/gibs/blade/bump_rear_dam.mdl",
	"models/gta3d/gibs/blade/door_lf_dam.mdl",
	"models/gta3d/gibs/blade/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 1775

ENT.EngineTorque = 125
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 4

ENT.RandomColor = {
	Color(94,112,114),
	Color(93,126,141),
	Color(165,169,167),
	Color(66,31,33),
	Color(132,148,171),
	Color(45,58,53),
	Color(156,141,113),
	Color(111,130,151),
}

ENT.HornSound = "gta3d/horns/horn_003_118.wav"
ENT.HornPos = Vector(45,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/cutlass/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/cutlass/gear.wav",
		soundDuration = 3.2,
		speed = { 1.4, 1.25, 1.1, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/cutlass/cruise.wav",
		Pitch = 80,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/cutlass/throttleoff.wav",
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
		pos = Vector(-113,19,-20.5),
		ang = Angle(0,180,0),
	},
	{
		pos = Vector(-113,-19,-20.5),
		ang = Angle(0,180,0),
	},
}

ENT.Lights = {
	{
		Trigger = "main",
		SubMaterialID = 15,
		Sprites = {
			{ pos = Vector(92,33,-5), colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(93,27,-5), colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(92,-33,-5), colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
			{ pos = Vector(93,-27,-5), colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
			
			{ pos = Vector(-118,33,-3), colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_lr", active = { 0 } }, },
			{ pos = Vector(-118,-33,-3), colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_rr", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(92,33,-5), ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(92,-33,-5), ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "brake",
		SubMaterialID = 9,
		Sprites = {
			{ pos = Vector(-118.5,28.5,-3), colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "boot", active = { 0 } }, },
			{ pos = Vector(-118.5,-28.5,-3), colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "boot", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "high",
		SubMaterialID = 16,
		Sprites = {
			{ pos = Vector(94,20,-5), colorB = 200, colorA = 150, bodygroup = { name = "light_lf_hi", active = { 0 } }, },
			{ pos = Vector(94,-20,-5), colorB = 200, colorA = 150, bodygroup = { name = "light_rf_hi", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(94,20,-5), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf_hi", active = { 0 } }, },
			{ pos = Vector(94,-20,-5), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf_hi", active = { 0 } }, },
		},
	},
}

