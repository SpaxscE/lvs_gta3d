
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Landstalker"
ENT.Author = "Randy"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - SUVs/Pickups"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "SUVs/Pickups"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/gta3d/lv3d/landstal.mdl"
ENT.MDL_DESTROYED = "models/gta3d/gibs/landstal/chassis.mdl"

ENT.GibModels = {
	"models/gta3d/gibs/landstal/bonnet_dam.mdl",
	"models/gta3d/gibs/landstal/boot_dam.mdl",
	"models/gta3d/gibs/landstal/bump_front_dam.mdl",
	"models/gta3d/gibs/landstal/bump_rear_dam.mdl",
	"models/gta3d/gibs/landstal/door_lf_dam.mdl",
	"models/gta3d/gibs/landstal/door_lr_dam.mdl",
	"models/gta3d/gibs/landstal/door_rf_dam.mdl",
	"models/gta3d/gibs/landstal/door_rr_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxHealth = 200

ENT.MaxVelocity = 1775

ENT.EngineTorque = 60
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	Color(38,55,57),
	Color(98,68,40),
	Color(71,53,50),
	Color(31,37,59),
	Color(32,32,44),
	Color(102,28,38),
	Color(34,25,24),
	Color(37,37,39),
}

ENT.HornSound = "gta3d/horns/horn_009.wav"
ENT.HornPos = Vector(45,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/pathfinder/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/pathfinder/gear.wav",
		soundDuration = 3.047,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/pathfinder/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/pathfinder/throttleoff.wav",
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
		pos = Vector(-88,-14,-25),
		ang = Angle(0,180,0),
	},
}


ENT.Lights = {
	{
		Trigger = "main",
		SubMaterialID = 19,
		Sprites = {
			{ pos = Vector(78,24,-3), width = 100, colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(78,-24,-3), width = 100, colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(78,24,-3), ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(78,-24,-3), ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "main+brake",
		SubMaterialID = 20,
		Sprites = {
			{ pos = Vector(-86,37,-3), width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_lr", active = { 0 } }, },
			{ pos = Vector(-86,-37,-3), width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "light_rr", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "high",
		Sprites = {
			{ pos = Vector(78,24,-3), width = 100, colorB = 200, colorA = 150, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(78,-24,-3), width = 100, colorB = 200, colorA = 150, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(78,24,-3), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_lf", active = { 0 } }, },
			{ pos = Vector(78,-24,-3), ang = Angle(0,0,0), fov = 50, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "light_rf", active = { 0 } }, },
		},
	},
	
	{
        Trigger = "fog",
        SubMaterialID = 17,
        Sprites = {
            { pos = Vector(84.5,25,-13), colorB = 200, colorA = 150, bodygroup = { name = "bump_front", active = { 3 } }, },
            { pos = Vector(84.5,-25,-13), colorB = 200, colorA = 150, bodygroup = { name = "bump_front", active = { 3 } }, },
			
			{ pos = Vector(84.5,25,-13), width = 100, height = 100, colorB = 200, colorA = 150, bodygroup = { name = "bump_front", active = { 6 } }, },
            { pos = Vector(84.5,-25,-13), width = 100, height = 100, colorB = 200, colorA = 150, bodygroup = { name = "bump_front", active = { 6 } }, },
        },
		ProjectedTextures = {
			{ pos = Vector(84.5,0,-13), ang = Angle(0,0,0), fov = 70, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "bump_front", active = { 3 } }, },
			{ pos = Vector(84.5,0,-13), ang = Angle(0,0,0), fov = 70, colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "bump_front", active = { 6 } }, },
		},
    },
	
	{
		Trigger = "turnleft",
		SubMaterialID = 12,
		Sprites = {
			{ pos = Vector(77,36,-3), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_lf_ind", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "turnright",
		SubMaterialID = 13,
		Sprites = {
			{ pos = Vector(77,-36,-3), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_rf_ind", active = { 0 } }, },
		},
	},
}
