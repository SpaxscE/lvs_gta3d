
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Monster"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Misc"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Misc"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/monster/monster.mdl"

ENT.AITEAM = 0

ENT.MaxVelocity = 1200
ENT.PhysicsWeightScale = 1.8

ENT.EngineTorque = 180
ENT.EngineCurve = 0.1
ENT.EngineCurveBoostLow = 3

ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.WheelBrakeForce = 800

ENT.WheelBrakeLockupRPM = 18

ENT.PhysicsInertia = Vector(3000,3000,1500)

ENT.WheelPhysicsMass = 100
ENT.WheelPhysicsInertia = Vector(14,10,14)
ENT.WheelPhysicsTireHeight = 10

ENT.WheelSideForce = 800
ENT.WheelDownForce = 4000

ENT.TransGears = 5

ENT.RandomColor = {
	{
		Skin = 1,
		Color = Color(47,47,49),
	},
	{
		Skin = 1,
		Color = Color(124,28,42),
	},
	{
		Skin = 1,
		Color = Color(32,44,82),
	},
	{
		Skin = 1,
		Color = Color(62,36,40),
	},
	{
		Skin = 1,
		Color = Color(214,218,214),
	},
	{
		Skin = 2,
		Color = Color(132,148,171),
	},
}


ENT.HornSound = "gta3d/horns/horn_009.wav"
ENT.HornPos = Vector(70,0,20)

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/hotrod/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/hotrod/gear.wav",
		soundDuration = 2.8,
		speed = { 1.3, 1.2, 1.1, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/hotrod/cruise.wav",
		Pitch = 80,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/hotrod/throttleoff.wav",
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
		Trigger = "main+high",
		SubMaterialID = 13,
		Sprites = {
			{  pos = "a_fl", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
		ProjectedTextures = {
			{  pos = "a_fl", ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnleft",
		SubMaterialID = 18,
		Sprites = {
			{  pos = "a_rl", width = 80, height = 70, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnright",
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_rr", width = 80, height = 70, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = 14,
		Sprites = {
			{ width = 20, height = 20, pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 16,
		Sprites = {
			{ width = 20, height = 20, pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
		},
	},			
	{
		Trigger = "high",
		ProjectedTextures = {
			{  pos = "a_fl", ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	
}



