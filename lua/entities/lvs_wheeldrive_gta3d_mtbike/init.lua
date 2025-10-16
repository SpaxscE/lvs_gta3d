AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	self:AddEngine( Vector(0,0,20), Angle(0,90,0) )
	local DriverSeat = self:AddDriverSeat( Vector(-21,0,31), Angle(0,-90,-12) )

	local WheelModel = "models/diggercars/gtasa/bikes/mtbike_wh.mdl"

	local FWheel = self:AddWheel( { hide = true, pos = Vector(21.96,0,13.76), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 1 } )
	local RWheel = self:AddWheel( { hide = true, pos = Vector(-24.82,0,13.78), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 1 } )

	self:CreateRigControler( "fl", FWheel, 10.8, 16.6 )
	self:CreateRigControler( "rl", RWheel, 10.8, 16.6 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0.3,
			BrakeFactor = 1,
		},
		Wheels = { FWheel },
		Suspension = {
			Height = 5,
			MaxTravel = 20,
			ControlArmLength = 30,
			SpringConstant = 10000,
			SpringDamping = 500,
			SpringRelativeDamping = 500,
		},
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			SteerType = LVS.WHEEL_STEER_NONE,
			TorqueFactor = 0.7,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { RWheel },
		Suspension = {
			Height = 0,
			MaxTravel = 0,
			ControlArmLength = 0,
		},
	} )
end
