AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	self:AddEngine( Vector(0,0,20), Angle(0,90,0) )

	local DriverSeat = self:AddDriverSeat( Vector(-18.7,0,27.3), Angle(0,-90,-12) )

	local WheelModel = "models/diggercars/gtasa/bikes/bmx_wh.mdl"

	local FWheel = self:AddWheel( { hide = true, pos = Vector(21.9,0,10.45), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 1 } )
	local RWheel = self:AddWheel( { hide = true, pos = Vector(-21.9,0,10.45), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 1 } )

	self:CreateRigControler( "fl", FWheel, 9, 18.17 )
	self:CreateRigControler( "rl", RWheel, 9, 18.17 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0.3,
			BrakeFactor = 1,
		},
		Wheels = { FWheel },
		Suspension = {
			Height = 0,
			MaxTravel = 0,
			ControlArmLength = 0,
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
