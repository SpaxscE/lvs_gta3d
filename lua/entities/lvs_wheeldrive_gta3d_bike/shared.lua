
ENT.Base = "lvs_bike_wheeldrive"

ENT.PrintName = "Bike"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Motorcycles/Bicycles"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Motorcycles/Bicycles"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/bikes/bike.mdl"

ENT.AITEAM = 2

ENT.MaxHealth = 100

ENT.MaxVelocity = 250
ENT.MaxVelocityReverse = 50

ENT.EngineTorque = 250
ENT.EngineCurve = 0.1

ENT.TransGears = 1
ENT.TransGearsReverse = 1

ENT.WheelBrakeForce = 800

ENT.lvsShowInSpawner = true

ENT.KickStarter = false

ENT.HornSound = "lvs/vehicles/bicycle/bicycle_horn.wav"
ENT.HornPos = Vector(40,0,35)

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

