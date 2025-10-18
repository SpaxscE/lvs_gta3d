
ENT.Base = "lvs_bike_wheeldrive"

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

ENT.EngineCurve = 0.9
ENT.EngineTorque = 325

ENT.TransGears = 4
ENT.TransGearsReverse = 1

ENT.PhysicsInertia = Vector(500,500,350)

ENT.DriverBoneManipulateIdle = {
	["ValveBiped.Bip01_R_Thigh"] = Angle(25,25,0),
	["ValveBiped.Bip01_R_Calf"] = Angle(0,0,0),
	["ValveBiped.Bip01_R_Foot"] = Angle(0,-10,0),
}

ENT.DriverBoneManipulateParked = {
	["ValveBiped.Bip01_L_Thigh"] = Angle(-25,25,0),
	["ValveBiped.Bip01_L_Calf"] = Angle(0,0,0),
	["ValveBiped.Bip01_L_Foot"] = Angle(0,-10,0),
}

ENT.PlayerBoneManipulate = {
	[1] = {
		["ValveBiped.Bip01_Spine"] = Angle(0,20,0),

		["ValveBiped.Bip01_R_Thigh"] = Angle(10,12,50),
		["ValveBiped.Bip01_L_Thigh"] = Angle(-10,12,-50),

		["ValveBiped.Bip01_R_Calf"] = Angle(90,15,-50),
		["ValveBiped.Bip01_L_Calf"] = Angle(-90,15,50),
		
		["ValveBiped.Bip01_R_Foot"] = Angle(0,-20,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,-20,0),

		["ValveBiped.Bip01_R_UpperArm"] = Angle(25,-20,-20),
		["ValveBiped.Bip01_L_UpperArm"] = Angle(-5,-20,20),

		["ValveBiped.Bip01_R_Forearm"] = Angle(0,20,70),
		["ValveBiped.Bip01_L_Forearm"] = Angle(-15,20,-30),
	},
}

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/bmw_r75/eng_idle.wav",
		Volume = 0.7,
		Pitch = 85,
		PitchMul = 50,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/bmw_r75/eng_loop.wav",
		Volume = 1,
		Pitch = 50,
		PitchMul = 50,
		SoundLevel = 75,
		UseDoppler = true,
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
