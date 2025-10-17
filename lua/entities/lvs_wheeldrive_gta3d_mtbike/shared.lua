
ENT.Base = "lvs_wheeldrive_gta3d_cyclebase"

ENT.PrintName = "Mountain Bike"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Motorcycles/Bicycles"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Motorcycles/Bicycles"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/bikes/mtbike.mdl"

ENT.AITEAM = 0

ENT.MaxHealth = 200

ENT.MaxVelocity = 900
ENT.MaxVelocityReverse = 50

ENT.EngineTorque = 100
ENT.EngineCurve = 1
ENT.EngineCurveBoostLow = 6

ENT.TransGears = 3
ENT.TransGearsReverse = 1
ENT.TransShiftSpeed = 0
ENT.TransWobbleTime = 0
ENT.TransWobbleFrequencyMultiplier = 0
ENT.TransShiftSound = "common/null.wav"

ENT.lvsShowInSpawner = true

ENT.KickStarter = false

ENT.HornSound = "gta3d/bicycle/bicycle_horn.wav"
ENT.HornPos = Vector(40,0,35)

ENT.EngineSounds = {
	{
		sound = "gta3d/bicycle/bicycle_revup.wav",
		Volume = 1,
		Pitch = 40,
		PitchMul = 40,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_UP,
		UseDoppler = true,
	},
	{
		sound = "gta3d/bicycle/bicycle_revdown.wav",
		Volume = 1,
		Pitch = 100,
		PitchMul = 40,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_DOWN,
		UseDoppler = true,
	},
}

ENT.DriverBoneManipulateIdle = {
	["ValveBiped.Bip01_Pelvis"] = Angle(0,0,23),
	["ValveBiped.Bip01_L_Thigh"] = Angle(-25,45,0),
	["ValveBiped.Bip01_L_Calf"] = Angle(0,-30,0),
	["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
}

ENT.DriverBoneManipulateDrive = {
	[0] = {
		["ValveBiped.Bip01_R_Thigh"] = Angle(-8,-40,-8),
		["ValveBiped.Bip01_R_Calf"] = Angle(0,68,0),
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),

		["ValveBiped.Bip01_L_Thigh"] = Angle(-2,20,18),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,10,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
	},
	[45] = {
		["ValveBiped.Bip01_R_Thigh"] = Angle(-5,-25,-9),
		["ValveBiped.Bip01_R_Calf"] = Angle(0,45,0),
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),

		["ValveBiped.Bip01_L_Thigh"] = Angle(-2,9,16),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,40,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
	},
	[90] = {
		["ValveBiped.Bip01_R_Thigh"] = Angle(0,-1,-8),
		["ValveBiped.Bip01_R_Calf"] = Angle(0,15,0),
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),

		["ValveBiped.Bip01_L_Thigh"] = Angle(5,-15,15),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,70,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
	},
	[135] = {
		["ValveBiped.Bip01_R_Thigh"] = Angle(0,15,-15),
		["ValveBiped.Bip01_R_Calf"] = Angle(0,5,0),
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),

		["ValveBiped.Bip01_L_Thigh"] = Angle(12,-32,13),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,75,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
	},
	[180] = {
		["ValveBiped.Bip01_R_Thigh"] = Angle(0,10,-15),
		["ValveBiped.Bip01_R_Calf"] = Angle(0,30,0),
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),

		["ValveBiped.Bip01_L_Thigh"] = Angle(15,-35,10),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,65,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
	},
	[225] = {
		["ValveBiped.Bip01_R_Thigh"] = Angle(0,0,-15),
		["ValveBiped.Bip01_R_Calf"] = Angle(0,55,0),
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),

		["ValveBiped.Bip01_L_Thigh"] = Angle(15,-20,15),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,40,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
	},
	[270] = {
		["ValveBiped.Bip01_R_Thigh"] = Angle(-5,-15,-15),
		["ValveBiped.Bip01_R_Calf"] = Angle(0,70,0),
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),

		["ValveBiped.Bip01_L_Thigh"] = Angle(5,0,17),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,15,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
	},
	[315] = {
		["ValveBiped.Bip01_R_Thigh"] = Angle(-10,-35,-10),
		["ValveBiped.Bip01_R_Calf"] = Angle(0,78,0),
		["ValveBiped.Bip01_R_Foot"] = Angle(0,0,0),

		["ValveBiped.Bip01_L_Thigh"] = Angle(0,10,15),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,10,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,0,0),
	},
}

ENT.PlayerBoneManipulate = {
	[1] = {
		["ValveBiped.Bip01_Pelvis"] = Angle(0,0,23),

		["ValveBiped.Bip01_R_UpperArm"] = Angle(10,5,0),
		["ValveBiped.Bip01_L_UpperArm"] = Angle(-5,5,0),

		["ValveBiped.Bip01_R_Forearm"] = Angle(0,-10,0),
		["ValveBiped.Bip01_L_Forearm"] = Angle(0,-10,0),
	}
}

