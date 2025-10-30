
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Walton"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - SUVs/Pickups"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "SUVs/Pickups"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/walton/walton.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/walton/bonnet_dam.mdl",
	"models/diggercars/gtasa/walton/boot_dam.mdl",
	"models/diggercars/gtasa/walton/bump_front_dam.mdl",
	"models/diggercars/gtasa/walton/bump_rear_dam.mdl",
	"models/diggercars/gtasa/walton/door_lf_dam.mdl",
	"models/diggercars/gtasa/walton/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 1575

ENT.EngineTorque = 95
ENT.PhysicsWeightScale = 1.6
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
ENT.HornPos = Vector(70,0,20)

ENT.BodyWobbleEnabled = true
ENT.BodyWobbleBone = "axle"

ENT.BodyWobbleAngleMulPitch = 1
ENT.BodyWobbleAngleMulRoll = 1
ENT.BodyWobbleAngleMax = 0.5

ENT.BodyWobbleConstant = 1
ENT.BodyWobbleDamping = 4

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/tractor/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/tractor/gear.wav",
		soundDuration = 3.047,
		speed = { 1.4, 1.25, 1.1, 1.05, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/tractor/cruise.wav",
		Pitch = 90,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/tractor/throttleoff.wav",
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
		SubMaterialID = 16,
		Sprites = {
			{  pos = "a_rl", width = 80, height = 70, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+brake+turnright",
		SubMaterialID = 15,
		Sprites = {
			{  pos = "a_rr", width = 80, height = 70, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = 18,
		Sprites = {
			{ width = 20, height = 20, pos = "a_frt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_frt", active = { 0 } }, },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 19,
		Sprites = {
			{ width = 20, height = 20, pos = "a_flt", colorG = 100, colorB = 0, colorA = 150, bodygroup = { name = "l_flt", active = { 0 } }, },
		},
	},		
	{
		Trigger = "reverse",
		SubMaterialID = 17,
		Sprites = {

			{ pos = "a_r", width = 25, height = 25, colorA = 150, bodygroup = { name = "l_r", active = { 0 } }, },

		}
	},		
	{
		Trigger = "high",
		ProjectedTextures = {
			{  pos = "a_fl", ang = Angle(6,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_fr", ang = Angle(2,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},
	
}


