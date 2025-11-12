
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "Bullet"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] GTA3D - Sports"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Sports"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40

ENT.MDL = "models/diggercars/gtasa/bullet/bullet.mdl"

ENT.GibModels = {
	"models/diggercars/gtasa/bullet/boot_dam.mdl",
	"models/diggercars/gtasa/bullet/bump_front_dam.mdl",
	"models/diggercars/gtasa/bullet/bump_rear_dam.mdl",
	"models/diggercars/gtasa/bullet/door_lf_dam.mdl",
	"models/diggercars/gtasa/bullet/door_rf_dam.mdl",
}

ENT.AITEAM = 0

ENT.MaxVelocity = 2600

ENT.EngineTorque = 160
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.TransGears = 5

ENT.RandomColor = {
	{
		Skin = 1,
		Color = Color(58,89,79),
	},
	{
		Skin = 2,
		Color = Color(109,24,34),
	},
	{
		Skin = 1,
		Color = Color(156,156,152),
	},
	{
		Skin = 2,
		Color = Color(170,173,142),
	},
	{
		Skin = 1,
		Color = Color(42,119,161),
	},
	{
		Skin = 2,
		Color = Color(88,89,90),
	},
	{
		Skin = 1,
		Color = Color(105,30,59),
	},
	{
		Skin = 2,
		Color = Color(47,47,49),
	},
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
		Trigger = "main",
		SubMaterialID = 13,
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
		SubMaterialID = 16,
		Sprites = {
			{  pos = "a_rl", colorG = 0, colorB = 0, colorA = 50, bodygroup = { name = "l_rl", active = { 0 } }, },
			{  pos = "a_rr", colorG = 0, colorB = 0, colorA = 50, bodygroup = { name = "l_rr", active = { 0 } }, },
		},
	},
	
	{
		Trigger = "fog",
		SubMaterialID = 17,
		Sprites = {
			{  pos = "a_flf", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_flt", active = { 0 } }, },
			{  pos = "a_frf", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_frf", active = { 0 } }, },
		},
	},

	{
		Trigger = "high",
		SubMaterialID = 14,
		Sprites = {
			{  pos = "a_flh", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_frh", width = 125, colorB = 200, colorA = 150, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
		ProjectedTextures = {
			{  pos = "a_flh", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fl", active = { 0 } }, },
			{  pos = "a_frh", colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "l_fr", active = { 0 } }, },
		},
	},		
}

function ENT:CalcMainActivityPassenger( ply )
	local pod = ply:GetVehicle()

	if not IsValid( pod ) or pod:GetNWInt( "pPodIndex", 0 ) ~= 2 then return end

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


ENT.PlayerBoneManipulate = {
	[1] = {
		["ValveBiped.Bip01_R_Thigh"] = Angle(0,-20,0),
		["ValveBiped.Bip01_L_Thigh"] = Angle(0,-20,0),
	},
}