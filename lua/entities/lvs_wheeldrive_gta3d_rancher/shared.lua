
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Rancher"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - SUVs/Pickups"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "SUVs/Pickups"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/rancher/rancher.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/rancher/bonnet_dam.mdl",
	"models/diggercars/gtasa/rancher/boot_dam.mdl",
	"models/diggercars/gtasa/rancher/bump_front_dam.mdl",
	"models/diggercars/gtasa/rancher/bump_rear_dam.mdl",
	"models/diggercars/gtasa/rancher/door_rlf_dam.mdl",
	"models/diggercars/gtasa/rancher/door_rrf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2050
ENT.PhysicsWeightScale = 1.4
ENT.EngineTorque = 130
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	{
		Skin = 1,
		Color = Color(88,89,90),
	},
	{
		Skin = 2,
		Color = Color(214,218,214),
	},
	{
		Skin = 2,
		Color = Color(155,139,128),
	},
	{
		Skin = 3,
		Color = Color(89,110,135),
	},
	{
		Skin = 4,
		Color = Color(87,60,57),
	},
	{
		Skin = 5,
		Color = Color(164,160,150),
	},
}


ENT.HornSound = "gta3d/horns/horn_009.wav"
ENT.HornPos = Vector(70,0,20)

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


ENT.Lights = {
	{
		Trigger = "main+high",
		SubMaterialID = 18,
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
		SubMaterialID = 19,
		Sprites = {
			{  pos = "a_rl", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = 20,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt", active = { 0 } }, },
			{  pos = "a_rrt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 21,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt", active = { 0 } }, },
			{  pos = "a_rlt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
		},
	},	
	{
		Trigger = "fog",
		SubMaterialID = 15,
		Sprites = {
			{  pos = "a_flf", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 0 } }, },
			{  pos = "a_frf", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "front_bumper", active = { 0 } }, },
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

