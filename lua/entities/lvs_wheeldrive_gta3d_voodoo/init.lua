AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")
include("sv_pds.lua")

function ENT:OnSpawn( PObj )
	self:AddExhaustByAttachment( "exh" )

	local att_eng = self:GetAttachment( self:LookupAttachment( "eng" ) )
	local att_fuel = self:GetAttachment( self:LookupAttachment( "fuel" ) )

	local att_seat1 = self:GetAttachment( self:LookupAttachment( "driver" ) )
	local att_seat2 = self:GetAttachment( self:LookupAttachment( "pass_fr" ) )
	local att_seat3 = self:GetAttachment( self:LookupAttachment( "pass_rl" ) )
	local att_seat4 = self:GetAttachment( self:LookupAttachment( "pass_rr" ) )

	local att_wheel_fl = self:GetAttachment( self:LookupAttachment( "w_fl" ) )
	local att_wheel_fr = self:GetAttachment( self:LookupAttachment( "w_fr" ) )
	local att_wheel_rl = self:GetAttachment( self:LookupAttachment( "w_rl" ) )
	local att_wheel_rr = self:GetAttachment( self:LookupAttachment( "w_rr" ) )

	local DriverSeat = self:AddDriverSeat( self:WorldToLocal( att_seat1.Pos ) + Vector(-8,0,-13), self:WorldToLocalAngles( att_seat1.Ang) + Angle(0,-90,-85) )
	local RFSeat = self:AddPassengerSeat( self:WorldToLocal( att_seat2.Pos ) + Vector(2,0,-6), self:WorldToLocalAngles( att_seat2.Ang ) + Angle(0,-90,-75) )
	local RRSeat = self:AddPassengerSeat( self:WorldToLocal( att_seat3.Pos ) + Vector(2,0,-6), self:WorldToLocalAngles( att_seat3.Ang ) + Angle(0,-90,-77) )
	local LRSeat = self:AddPassengerSeat( self:WorldToLocal( att_seat4.Pos ) + Vector(2,0,-6), self:WorldToLocalAngles( att_seat4.Ang ) + Angle(0,-90,-77) )


	local pos, ang, mins, maxs = self:GetBoneInfo( "dfl" )
	local LFDoorHandler = self:AddDoorHandler( "left_door", pos, ang, mins, maxs, mins, maxs )
	LFDoorHandler:SetSoundOpen( "gta3d/doors/door_old_open.wav" )
	LFDoorHandler:SetSoundClose( "gta3d/doors/door_old_close.wav" )
	LFDoorHandler:LinkToSeat( DriverSeat )
	LFDoorHandler:DisableOnBodyGroup( 6, 3 )

	local pos, ang, mins, maxs = self:GetBoneInfo( "dfr" )
	local RFDoorHandler = self:AddDoorHandler( "right_door", pos, ang, mins, maxs, mins, maxs )
	RFDoorHandler:SetSoundOpen( "gta3d/doors/door_old_open.wav" )
	RFDoorHandler:SetSoundClose( "gta3d/doors/door_old_close.wav" )
	RFDoorHandler:LinkToSeat( RFSeat )
	RFDoorHandler:DisableOnBodyGroup( 5, 3 )

	local pos, ang, mins, maxs = self:GetBoneInfo( "bonnet" )
	local DoorHandler = self:AddDoorHandler( "hood", pos, ang, mins, maxs, mins, maxs )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:DisableOnBodyGroup( 1, 3 )
	local Engine = self:AddEngine( self:WorldToLocal( att_eng.Pos ) )
	Engine:SetDoorHandler( DoorHandler )

	local pos, ang, mins, maxs = self:GetBoneInfo( "boot" )
	local TrunkHandler = self:AddDoorHandler( "trunk", pos, ang, mins, maxs, mins, maxs )
	TrunkHandler:SetSoundOpen( "lvs/vehicles/generic/car_trunk_open.wav" )
	TrunkHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	TrunkHandler:DisableOnBodyGroup( 2, 3 )

	self:AddFuelTank( self:WorldToLocal( att_fuel.Pos ), self:WorldToLocalAngles( att_fuel.Ang ) + Angle(0,0,90), 600, LVS.FUELTYPE_PETROL )

	local WheelModel = "models/diggercars/gtasa/shared/wheel_voodoo.mdl"

	local FLWheel = self:AddWheel( { pos = self:WorldToLocal( att_wheel_fl.Pos ), mdl = WheelModel, mdl_ang = self:WorldToLocalAngles( att_wheel_fl.Ang ) + Angle(90,-90,0), width = 8 } )
	local FRWheel = self:AddWheel( { pos = self:WorldToLocal( att_wheel_fr.Pos ), mdl = WheelModel, mdl_ang = self:WorldToLocalAngles( att_wheel_fr.Ang ) + Angle(90,-90,0), width = 8 } )
	local RLWheel = self:AddWheel( { pos = self:WorldToLocal( att_wheel_rl.Pos ), mdl = WheelModel, mdl_ang = self:WorldToLocalAngles( att_wheel_rl.Ang ) + Angle(90,-90,0), width = 8 } )
	local RRWheel = self:AddWheel( { pos = self:WorldToLocal( att_wheel_rr.Pos ), mdl = WheelModel, mdl_ang = self:WorldToLocalAngles( att_wheel_rr.Ang ) + Angle(90,-90,0), width = 8 } )

	self:CreateRigControler( "fl", FLWheel, -14, 6 )
	self:CreateRigControler( "fr", FRWheel, -14, 6 )
	self:CreateRigControler( "rl", RLWheel, -14, 6 )
	self:CreateRigControler( "rr", RRWheel, -14, 6 )

	self:CreateHydraulicControler( "fl", FLWheel )
	self:CreateHydraulicControler( "fr", FRWheel )
	self:CreateHydraulicControler( "rl", RLWheel )
	self:CreateHydraulicControler( "rr", RRWheel )

	local SuspensionSettings = {
		Height = 8,
		MaxTravel = 15,
		ControlArmLength = 250,
		SpringConstant = 30000,
		SpringDamping = 2000,
		SpringRelativeDamping = 2000,
	}

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0,
			BrakeFactor = 1,
		},
		Wheels = { FLWheel, FRWheel },
		Suspension = SuspensionSettings,
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_NONE,
			TorqueFactor = 1,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { RLWheel, RRWheel },
		Suspension = SuspensionSettings,
	} )
	self:CreatePDS()
end


function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "gta3d/share/engine_start.wav" )
	end
end