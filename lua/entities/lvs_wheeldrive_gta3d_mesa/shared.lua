
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Mesa"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - SUVs/Pickups"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "SUVs/Pickups"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/mesa/mesa.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/mesa/bonnet_dam.mdl",
	"models/diggercars/gtasa/mesa/boot_dam.mdl",
	"models/diggercars/gtasa/mesa/bump_front_dam.mdl",
	"models/diggercars/gtasa/mesa/bump_rear_dam.mdl",
	"models/diggercars/gtasa/mesa/door_lf_dam.mdl",
	"models/diggercars/gtasa/mesa/door_rf_dam.mdl",
}

ENT.AITEAM = 0
ENT.MaxVelocity = 1775

ENT.EngineTorque = 135
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000
ENT.PhysicsWeightScale = 1.4

ENT.TransGears = 5

ENT.RandomColor = {
	{
		Skin = 1,
		Color = Color(42,42,54),
	},
	{
		Skin = 1,
		Color = Color(44,35,34),
	},
	{
		Skin = 2,
		Color = Color(44,35,34),
	},
	{
		Skin = 3,
		Color = Color(61,74,104),
	},
	{
		Skin = 3,
		Color = Color(73,72,79),
	},
	{
		Skin = 3,
		Color = Color(115,46,62),
	},
	{
		Skin = 3,
		Color = Color(88,89,90),
	},
	{
		Skin = 3,
		Color = Color(48,65,67),
	},
}

ENT.HornSound = "gta3d/horns/horn_003_118.wav"
ENT.HornPos = Vector(45,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/i4_3/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/i4_3/gear.wav",
		soundDuration = 3.5,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/i4_3/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/i4_3/throttleoff.wav",
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
		SubMaterialID = 14,
		Sprites = {
			{  pos = "a_fl", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	{
		Trigger = "main",
		ProjectedTextures = {
			{  pos = "a_fl", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake",
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_rl", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 100, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = 16,
		Sprites = {
			{  pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt", active = { 0 } }, },
			{  pos = "a_frt2", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt2", active = { 0 } }, },
			{  pos = "a_rrt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 18,
		Sprites = {
			{  pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt", active = { 0 } }, },
			{  pos = "a_flt2", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt2", active = { 0 } }, },
			{  pos = "a_rlt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
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

