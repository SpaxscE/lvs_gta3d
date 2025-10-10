
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Quadbike"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Misc"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Misc"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/quad/quad.mdl"

ENT.AITEAM = 0

ENT.MaxVelocity = 1200

ENT.EngineTorque = 100
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	--SAN ANDREAS
	Color(100,100,100),
	Color(90,87,82),
	Color(45,58,53),
	Color(109,122,136),
	Color(111,103,95),
	Color(95,10,21),
	Color(93,27,32),
	Color(122,117,96),
}

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(30,0,30)

ENT.PlayerBoneManipulate = {
	[1] = {
		["ValveBiped.Bip01_Pelvis"] = Angle(0,0,23),
		
		["ValveBiped.Bip01_R_Thigh"] = Angle(20,-10,-15),
		["ValveBiped.Bip01_L_Thigh"] = Angle(-20,-10,15),

		["ValveBiped.Bip01_R_Calf"] = Angle(0,40,0),
		["ValveBiped.Bip01_L_Calf"] = Angle(0,40,0),
		
		["ValveBiped.Bip01_R_Foot"] = Angle(0,-20,0),
		["ValveBiped.Bip01_L_Foot"] = Angle(0,-20,0),

		["ValveBiped.Bip01_R_UpperArm"] = Angle(10,25,0),
		["ValveBiped.Bip01_L_UpperArm"] = Angle(-5,25,0),

		["ValveBiped.Bip01_R_Forearm"] = Angle(0,-10,0),
		["ValveBiped.Bip01_L_Forearm"] = Angle(0,-10,0),
	},
	[2] = {
		["ValveBiped.Bip01_R_Thigh"] = Angle(14,10,0),
		["ValveBiped.Bip01_L_Thigh"] = Angle(-14,10,0),
	},
}


ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/merc/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/merc/gear.wav",
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

ENT.Lights = {



	{
		Trigger = "main+high",
		SubMaterialID = 7,
		Sprites = {
			{  pos = "lf", width = 125, colorB = 200, colorA = 150 },
			{  pos = "lf", width = 125, colorB = 200, colorA = 150 },

		},
		ProjectedTextures = {
			{  pos = "lf", colorB = 200, colorA = 150, shadows = true },
			{  pos = "lf", colorB = 200, colorA = 150, shadows = true },
		},
	},

	{
		Trigger = "main+brake",
		SubMaterialID = 4,
		Sprites = {
			{  pos = "lr", width = 40, colorG = 0, colorB = 0, colorA = 150 },
			{  pos = "lr", width = 40, colorG = 0, colorB = 0, colorA = 150 },
		},
	},
	
	{
		Trigger = "high",
		ProjectedTextures = {
			{  pos = "lf", colorB = 200, colorA = 150, shadows = true },
			{  pos = "lf", colorB = 200, colorA = 150, shadows = true },
		},
	},	

}

