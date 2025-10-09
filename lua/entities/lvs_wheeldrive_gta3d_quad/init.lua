AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	self:AddExhaustByAttachment( "exh1" )
	self:AddExhaustByAttachment( "exh2" )

	local att_fuel = self:GetAttachment( self:LookupAttachment( "fuel" ) )

	local att_seat1 = self:GetAttachment( self:LookupAttachment( "driver" ) )
	local att_seat2 = self:GetAttachment( self:LookupAttachment( "pass_fr" ) )

	local DriverSeat = self:AddDriverSeat( self:WorldToLocal( att_seat1.Pos ) + Vector(-10,0,-13), self:WorldToLocalAngles( att_seat1.Ang) + Angle(0,-90,-90) )
	DriverSeat:SetCameraDistance( 1 )
	local RFSeat = self:AddPassengerSeat( self:WorldToLocal( att_seat2.Pos ) + Vector(0,0,-6), self:WorldToLocalAngles( att_seat2.Ang ) + Angle(0,-90,-90) )

	self:AddEngine( Vector(0,0,15) )

	self:AddFuelTank( self:WorldToLocal( att_fuel.Pos ), self:WorldToLocalAngles( att_fuel.Ang ) + Angle(0,0,90), 600, LVS.FUELTYPE_PETROL )

	local WheelModel = "models/diggercars/gtasa/shared/wheel_quad.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(24.47,16.6,5), mdl = WheelModel, mdl_ang = Angle(0,-90,0), width = 8 } )
	local FRWheel = self:AddWheel( { pos = Vector(24.47,-16.6,5), mdl = WheelModel, mdl_ang = Angle(0,90,0), width = 8 } )
	local RLWheel = self:AddWheel( { pos = Vector(-24.4,16.6,5), mdl = WheelModel, mdl_ang = Angle(0,-90,0), width = 8 } )
	local RRWheel = self:AddWheel( { pos = Vector(-24.4,-16.6,5), mdl = WheelModel, mdl_ang = Angle(0,90,0), width = 8} )

	self:CreateRigControler( "fl", FLWheel, 0, 10 )
	self:CreateRigControler( "fr", FRWheel, 0, 10 )
	self:CreateRigControler( "rl", RLWheel, 0, 10 )
	self:CreateRigControler( "rr", RRWheel, 0, 10 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0,
			BrakeFactor = 1,
		},
		Wheels = { FLWheel, FRWheel },
		Suspension = {
			Height = 10,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
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
		Suspension = {
			Height = 10,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )
end


function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "gta3d/share/engine_start.wav" )
	end
end