
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Tornado"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Lowriders"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Lowriders"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/tornado/tornado.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/tornado/bonnet_dam.mdl",
	"models/diggercars/gtasa/tornado/boot_dam.mdl",
	"models/diggercars/gtasa/tornado/bump_front_dam.mdl",
	"models/diggercars/gtasa/tornado/bump_rear_dam.mdl",
	"models/diggercars/gtasa/tornado/door_lf_dam.mdl",
	"models/diggercars/gtasa/tornado/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2000

ENT.EngineTorque = 130
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 4

ENT.RandomColor = {
	Color(106,122,140),
	Color(170,173,142),
	Color(88,88,83),
	Color(106,36,45),
	Color(42,42,54),
	Color(164,160,150),
	Color(24,59,119),
	Color(87,60,57),
}

ENT.HornSound = "gta3d/horns/horn_006_112.wav"
ENT.HornPos = Vector(70,0,20)

ENT.BodyWobbleEnabled = true
ENT.BodyWobbleBone = "axle"

ENT.BodyWobbleAngleMulPitch = 1
ENT.BodyWobbleAngleMulRoll = 1
ENT.BodyWobbleAngleMax = 0.2

ENT.BodyWobbleConstant = 1
ENT.BodyWobbleDamping = 4

ENT.EngineSoundsSA = {
	idle = {
		sound = "gta3d/engines/glen/idle.wav",
		Pitch = 100,
		PitchMul = 60,
		SoundLevel = 65,
	},
	gears = {
		sound = "gta3d/engines/glen/gear.wav",
		soundDuration = 3.2,
		speed = { 1.4, 1.25, 1.1, 1 },
		SoundLevel = 75,
		UseDoppler = true,
	},
	cruise = {
		sound = "gta3d/engines/glen/cruise.wav",
		Pitch = 80,
		PitchMul = 40,
		SoundLevel = 75,
		UseDoppler = true,
	},
	throttle_off = {
		sound = "gta3d/engines/glen/throttleoff.wav",
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
		SubMaterialID = 11,
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
		SubMaterialID = 13,
		Sprites = {
			{  pos = "a_rl", width = 50, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", width = 50, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr", active = { 0 } }, },
			{  pos = "a_rl2", width = 50, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rl2", active = { 0 } }, },
			{  pos = "a_rr2", width = 50, colorG = 0, colorB = 0, colorA = 150, bodygroup = { name = "l_rr2", active = { 0 } }, },
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

function ENT:CalcMainActivityPassenger( ply )
	local pod = ply:GetVehicle()

	if not IsValid( pod ) or pod:GetNWInt( "pPodIndex", 0 ) <= 2 then return end

	if ply.m_bWasNoclipping then 
		ply.m_bWasNoclipping = nil 
		ply:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM ) 
		
		if CLIENT then 
			ply:SetIK( true )
		end 
	end 

	ply.CalcIdeal = ACT_STAND
	ply.CalcSeqOverride = ply:LookupSequence( "sit_zen" )

	return ply.CalcIdeal, ply.CalcSeqOverride
end

