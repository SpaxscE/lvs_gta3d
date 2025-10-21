
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

ENT.MaxHealth = 500

ENT.MaxVelocity = 2500
ENT.MaxVelocityReverse = 100

ENT.EngineCurve = 0.4
ENT.EngineTorque = 250

ENT.TransGears = 5
ENT.TransGearsReverse = 1

ENT.WheelSideForce = 400
ENT.WheelDownForce = 50

ENT.KickStarter = false

ENT.DriverBoneManipulateIdle = {
	["ValveBiped.Bip01_R_Thigh"] = Angle(0,0,0),
	["ValveBiped.Bip01_R_Calf"] = Angle(0,0,0),
	["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),
}

ENT.DriverBoneManipulateParked = {
	["ValveBiped.Bip01_L_Thigh"] = Angle(0,0,0),
	["ValveBiped.Bip01_L_Calf"] = Angle(0,0,0),
	["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
}

ENT.PlayerBoneManipulate = {
	[1] = {
		["ValveBiped.Bip01_Spine"] = Angle(0,0,0),

		["ValveBiped.Bip01_R_Thigh"] = Angle(0,0,0),
		["ValveBiped.Bip01_L_Thigh"] = Angle(0,0,0),

		["ValveBiped.Bip01_R_Calf"] = Angle(0,0,0),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,0,0),
		
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,-0,0),

		["ValveBiped.Bip01_R_UpperArm"] = Angle(0,0,0),
		["ValveBiped.Bip01_L_UpperArm"] = Angle(0,0,0),

		["ValveBiped.Bip01_R_Forearm"] = Angle(0,0,0),
		["ValveBiped.Bip01_L_Forearm"] = Angle(0,0,0),
	},
}

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/dritbike/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/dritbike/gear.wav",
		soundDuration = 1.8,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/dritbike/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/dritbike/throttleoff.wav",
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
