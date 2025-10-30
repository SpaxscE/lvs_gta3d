AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")
include("sv_pds.lua")

function ENT:OnSpawn( PObj )
	self:AddExhaustByAttachment( "exh1" )
	self:AddExhaustByAttachment( "exh2" )
	self:AddExhaustByAttachment( "exh3" )
	self:AddExhaustByAttachment( "exh4" )

	self:AddEngine( Vector(78,0,58), Angle(0,0,0) )
	local att_fuel = self:GetAttachment( self:LookupAttachment( "fuel" ) )

	local att_seat1 = self:GetAttachment( self:LookupAttachment( "driver" ) )
	local att_seat2 = self:GetAttachment( self:LookupAttachment( "pass_fr" ) )

	local att_wheel_fl = self:GetAttachment( self:LookupAttachment( "w_fl" ) )
	local att_wheel_fr = self:GetAttachment( self:LookupAttachment( "w_fr" ) )
	local att_wheel_rl = self:GetAttachment( self:LookupAttachment( "w_rl" ) )
	local att_wheel_rr = self:GetAttachment( self:LookupAttachment( "w_rr" ) )

	local DriverSeat = self:AddDriverSeat( self:WorldToLocal( att_seat1.Pos ) + Vector(-12,0,-13), self:WorldToLocalAngles( att_seat1.Ang) + Angle(0,-90,-90) )
	DriverSeat:SetCameraDistance( 0.25 )
	local RFSeat = self:AddPassengerSeat( self:WorldToLocal( att_seat2.Pos ) + Vector(-2,0,-6), self:WorldToLocalAngles( att_seat2.Ang ) + Angle(0,-90,-90) )

	local pos, ang, mins, maxs = self:GetBoneInfo( "dfl" )
	local LFDoorHandler = self:AddDoorHandler( "left_door", pos, ang, mins, maxs, mins, maxs )
	LFDoorHandler:SetSoundOpen( "gta3d/doors/door_truck_open.wav" )
	LFDoorHandler:SetSoundClose( "gta3d/doors/door_truck_close.wav" )
	LFDoorHandler:LinkToSeat( DriverSeat )
	LFDoorHandler:DisableOnBodyGroup( 2, 3 )

	local pos, ang, mins, maxs = self:GetBoneInfo( "dfr" )
	local RFDoorHandler = self:AddDoorHandler( "right_door", pos, ang, mins, maxs, mins, maxs )
	RFDoorHandler:SetSoundOpen( "gta3d/doors/door_truck_open.wav" )
	RFDoorHandler:SetSoundClose( "gta3d/doors/door_truck_close.wav" )
	RFDoorHandler:LinkToSeat( RFSeat )
	RFDoorHandler:DisableOnBodyGroup( 1, 3 )

	self:AddFuelTank( self:WorldToLocal( att_fuel.Pos ), self:WorldToLocalAngles( att_fuel.Ang ) + Angle(0,0,90), 600, LVS.FUELTYPE_PETROL )

	local FrontRadius = 26
	local RearRadius = 26

	local FL, FR, RL, RR, ForwardAngle = self:AddWheelsUsingRig( FrontRadius, RearRadius, data ) -- passing data will make the wheels visible
	FL:SetWidth( 10 )
	FR:SetWidth( 10 )
	RL:SetWidth( 10 )
	RR:SetWidth( 10 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = ForwardAngle,
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 15,
			TorqueFactor = 0.4,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = {FL,FR},
		Suspension = {
		Height = -10,
		MaxTravel = 40,
		ControlArmLength = 250,
		SpringConstant = 50000,
		SpringDamping = 1800,
		SpringRelativeDamping = 1800,
		},
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = ForwardAngle,
			SteerType = LVS.WHEEL_STEER_REAR,
			SteerAngle = 15,
			TorqueFactor = 0.6,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = {RL,RR},
		Suspension = {
		Height = -10,
		MaxTravel = 40,
		ControlArmLength = 250,
		SpringConstant = 50000,
		SpringDamping = 1800,
		SpringRelativeDamping = 1800,
		},
	} )
	self:CreatePDS()
end



function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "gta3d/share/engine_start.wav" )
	end
end