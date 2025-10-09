
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Police"
ENT.Author = "Randy"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Government"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Government"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/gta3d/simf/copcarla.mdl"
ENT.MDL_DESTROYED = "models/gta3d/gibs/copcarla/chassis.mdl"

ENT.GibModels = {
	"models/gta3d/gibs/copcarla/bonnet_dam.mdl",
	"models/gta3d/gibs/copcarla/boot_dam.mdl",
	"models/gta3d/gibs/copcarla/bump_front_dam.mdl",
	"models/gta3d/gibs/copcarla/bump_rear_dam.mdl",
	"models/gta3d/gibs/copcarla/door_lf_dam.mdl",
	"models/gta3d/gibs/copcarla/door_lr_dam.mdl",
	"models/gta3d/gibs/copcarla/door_rf_dam.mdl",
	"models/gta3d/gibs/copcarla/door_rr_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxHealth = 200

ENT.MaxVelocity = 2150

ENT.EngineTorque = 135
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.HornSound = "gta3d/horns/horn_003_105.wav"
ENT.HornPos = Vector(45,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/merc/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/merc/merc_gear.wav",
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


ENT.SirenPos = Vector(-15,0,35)
ENT.SirenSound = {
	[1] = {
		siren = "gta3d/horns/siren_wail.wav",
		horn = "gta3d/horns/siren_yelp.wav",
	},
}

ENT.Lights = {
	{
		Siren = true,
		Trigger = "10000000",
		Sprites = {
			{ pos = Vector(-14,-27,39), colorG = 0, colorB = 0, colorA = 255, width = 100, height = 60 },
		},
	},
	{
		Siren = true,
		Trigger = "01000000",
		Sprites = {
			{ pos = Vector(-14,-8,39), colorG = 0, colorB = 0, colorA = 255, width = 100, height = 60 },
		},
	},
	{
		Siren = true,
		Trigger = "00100000",
		Sprites = {
			{ pos = Vector(-14,8,39), colorG = 0, colorB = 0, colorA = 255, width = 100, height = 60 },
		},
	},
	{
		Siren = true,
		Trigger = "00010000",
		Sprites = {
			{ pos = Vector(-14,27,39), colorG = 0, colorB = 0, colorA = 255, width = 100, height = 60 },
		},
	},
	{
		Siren = true,
		Trigger = "00001000",
		Sprites = {
			{ pos = Vector(-14,-27,39), colorG = 0, colorR = 0, colorA = 255, width = 100, height = 60 },
		},
	},
	{
		Siren = true,
		Trigger = "00000100",
		Sprites = {
			{ pos = Vector(-14,-8,39), colorG = 0, colorR = 0, colorA = 255, width = 100, height = 60 },
		},
	},
	{
		Siren = true,
		Trigger = "00000010",
		Sprites = {
			{ pos = Vector(-14,8,39), colorG = 0, colorR = 0, colorA = 255, width = 100, height = 60 },
		},
	},
	{
		Siren = true,
		Trigger = "00000001",
		Sprites = {
			{ pos = Vector(-14,27,39), colorG = 0, colorR = 0, colorA = 255, width = 100, height = 60 },
		},
	},
	{
		Trigger = "main",
		SubMaterialID = 17,
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
		SubMaterialID = 21,
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
		SubMaterialID = 19,
		Sprites = {
			{ pos = Vector(87,39,-1), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_lf_ind", active = { 0 } }, },
			{ pos = Vector(-102,39,0), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_lr_ind", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "turnright",
		SubMaterialID = 20,
		Sprites = {
			{ pos = Vector(87,-39,-1), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_rf_ind", active = { 0 } }, },
			{ pos = Vector(-102,-39,0), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "light_rr_ind", active = { 0 } }, },
		},
	},
	
	--[[
	ems_sounds = {"gta3d/horns/siren_wailHD.wav","gta3d/horns/siren_yelpHD.wav"},
	ems_sprites = {
		{
			pos = Vector(-14,-27,39),
			material = "sprites/light_ignorez",
			size = 70,
			Colors = {
						Color(255,0,0,50),
						Color(255,0,0,150),
						Color(255,0,0,255),--
						Color(255,0,0,150),
						Color(255,0,0,50),
						Color(255,0,0,0),
						Color(255,0,0,0),
						Color(255,0,0,0),
						--
						Color(0,0,255,50),
						Color(0,0,255,150),
						Color(0,0,255,255),--
						Color(0,0,255,150),
						Color(0,0,255,50),
						Color(0,0,255,0),
						Color(0,0,255,0),
						Color(0,0,255,0),
					},
			Speed = 0.065
		},
		{
			pos = Vector(-14,-8,39),
			material = "sprites/light_ignorez",
			size = 70,
			Colors = {
						Color(255,0,0,0),
						Color(255,0,0,50),
						Color(255,0,0,150),
						Color(255,0,0,255),--
						Color(255,0,0,150),
						Color(255,0,0,50),
						Color(255,0,0,0),
						Color(255,0,0,0),
						--
						Color(0,0,255,0),
						Color(0,0,255,50),
						Color(0,0,255,150),
						Color(0,0,255,255),--
						Color(0,0,255,150),
						Color(0,0,255,50),
						Color(0,0,255,0),
						Color(0,0,255,0),
					},
			Speed = 0.065
		},
		{
			pos = Vector(-14,8,39),
			material = "sprites/light_ignorez",
			size = 70,
			Colors = {
						Color(255,0,0,0),
						Color(255,0,0,0),
						Color(255,0,0,50),
						Color(255,0,0,150),
						Color(255,0,0,255),--
						Color(255,0,0,150),
						Color(255,0,0,50),
						Color(255,0,0,0),
						--
						Color(0,0,255,0),
						Color(0,0,255,0),
						Color(0,0,255,50),
						Color(0,0,255,150),
						Color(0,0,255,255),--
						Color(0,0,255,150),
						Color(0,0,255,50),
						Color(0,0,255,0),
					},
			Speed = 0.065
		},
		{
			pos = Vector(-14,27,39),
			material = "sprites/light_ignorez",
			size = 70,
			Colors = {
						Color(255,0,0,0),
						Color(255,0,0,0),
						Color(255,0,0,0),
						Color(255,0,0,50),
						Color(255,0,0,150),
						Color(255,0,0,255),--
						Color(255,0,0,150),
						Color(255,0,0,50),
						--
						Color(0,0,255,0),
						Color(0,0,255,0),
						Color(0,0,255,0),
						Color(0,0,255,50),
						Color(0,0,255,150),
						Color(0,0,255,255),--
						Color(0,0,255,150),
						Color(0,0,255,50),
					},
			Speed = 0.065
		},
	},]] --OG EMS sprites from simpiss
}
