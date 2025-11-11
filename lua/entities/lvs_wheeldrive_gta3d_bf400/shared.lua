
ENT.Base = "lvs_wheeldrive_gta3d_motorbikebase"

ENT.PrintName = "BF-400"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Motorcycles/Bicycles"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Motorcycles/Bicycles"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/bikes/bf400.mdl"

ENT.AITEAM = 0

ENT.MaxHealth = 200

ENT.MaxVelocity = 2400
ENT.MaxVelocityReverse = 100

ENT.EngineCurve = 0.75
ENT.EngineCurveBoostLow = 3
ENT.EngineTorque = 175

ENT.TransGears = 5
ENT.TransGearsReverse = 1

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(14,0,25)

ENT.DriverBoneManipulateIdle = {
	["ValveBiped.Bip01_L_Thigh"] = Angle(-15,20,0),
	["ValveBiped.Bip01_L_Calf"] = Angle(0,-15,0),
	["ValveBiped.Bip01_L_Foot"] = Angle(0,-20,0),
}

ENT.DriverBoneManipulateParked = {
	["ValveBiped.Bip01_L_Thigh"] = Angle(-15,20,0),
	["ValveBiped.Bip01_L_Calf"] = Angle(0,-15,0),
	["ValveBiped.Bip01_L_Foot"] = Angle(0,-20,0),
}

ENT.PlayerBoneManipulate = {
	[1] = {
		["ValveBiped.Bip01_Pelvis"] = Angle(0,0,23),
		
		["ValveBiped.Bip01_R_Thigh"] = Angle(10,-6,-15),
		["ValveBiped.Bip01_L_Thigh"] = Angle(-10,-6,15),

		["ValveBiped.Bip01_R_Calf"] = Angle(0,60,0),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,60,0),
		
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),

		["ValveBiped.Bip01_R_UpperArm"] = Angle(25,0,0),
		["ValveBiped.Bip01_L_UpperArm"] = Angle(-18,0,0),

		["ValveBiped.Bip01_R_Forearm"] = Angle(0,-14,0),
		["ValveBiped.Bip01_L_Forearm"] = Angle(-10,0,0),

		["ValveBiped.Bip01_R_Hand"] = Angle(20,0,30),
		["ValveBiped.Bip01_L_Hand"] = Angle(-20,0,-30),
	},
}


ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/chopper/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/chopper/gear.wav",
		soundDuration = 3.15,
		speed = { 1.4, 1.3, 1.2, 1.1, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/chopper/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/chopper/throttleoff.wav",
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
		SubMaterialID = 10,
		Sprites = {
			{  pos = "m1", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "guard", active = { 0 } }, },
			{  pos = "m2", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "guard", active = { 0 } }, },
			{  pos = "m3", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "guard", active = { 1 } }, },
			{  pos = "m4", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "guard", active = { 1 } }, },
			{  pos = "m3", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "guard", active = { 2 } }, },
			{  pos = "m4", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "guard", active = { 2 } }, },
		},
	},

	{
		Trigger = "main",
		ProjectedTextures = {
			{  pos = "m1", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 0 } }, },
			{  pos = "m2", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 0 } }, },
			{  pos = "m3", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 1 } }, },
			{  pos = "m4", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 1 } }, },
			{  pos = "m3", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 2 } }, },
			{  pos = "m4", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 2 } }, },
		},
	},

	{
		Trigger = "main+brake",
		SubMaterialID = 3,
		Sprites = {
			{  pos = "r", width = 100, colorG = 0, colorB = 0, colorA = 150 },
		},
	},

	{
		Trigger = "turnright",
		SubMaterialID = 8,
		Sprites = {
			{  pos = "tr1", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "guard", active = { 0 } }, },
			{  pos = "tr2", colorG = 0, colorB = 0, colorA = 150 },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 7,
		Sprites = {
			{  pos = "tl1", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "guard", active = { 0 } }, },
			{  pos = "tl2", colorG = 0, colorB = 0, colorA = 150 },
		},
	},	
	
	{
		Trigger = "high",
		ProjectedTextures = {
			{  pos = "m1", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 0 } }, },
			{  pos = "m2", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 0 } }, },
			{  pos = "m3", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 1 } }, },
			{  pos = "m4", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 1 } }, },
			{  pos = "m3", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 2 } }, },
			{  pos = "m4", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "guard", active = { 2 } }, },
		},
	},	
}

ENT.ExhaustPositions = {
	{
		pos = Vector(-44.85,-8.86,24.2),
		ang = Angle(-30,180,0),
	},
	{
		pos = Vector(-44.85,8.86,24.2),
		ang = Angle(-30,180,0),
	},
}
