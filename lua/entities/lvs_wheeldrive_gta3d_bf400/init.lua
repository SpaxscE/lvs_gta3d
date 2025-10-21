AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.LeanAngleIdle = -10
ENT.LeanAnglePark = -10

function ENT:OnSpawn( PObj )
	self:AddDriverSeat( Vector(-20,0,32), Angle(0,-90,-25) )
	self:AddPassengerSeat( Vector(-25,0,24), Angle(0,-90,-5) )

	self:AddRacingTires()
	self:AddEngine( Vector(14,0,10) )
	self:AddFuelTank( Vector(13.84,0,26.21), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL, Vector(-10,-5,-4),Vector(8,5,4) )

	local WheelModel = "models/diggercars/gtasa/bikes/bf400_wh.mdl"

	local FWheel = self:AddWheel( { hide = true, pos = Vector(30.45,0,13.7), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2 } )
	local RWheel = self:AddWheel( { hide = true, pos = Vector(-32.78,0,13.7), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2 } )

	self:CreateRigControler( "fl", FWheel, 8.5, 18.72 )
	self:CreateRigControler( "rl", RWheel, 8.5, 18.72 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0,
			BrakeFactor = 1,
		},
		Wheels = { FWheel },
		Suspension = {
			Height = 6,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 10000,
			SpringDamping = 800,
			SpringRelativeDamping = 800,
		},
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			SteerType = LVS.WHEEL_STEER_NONE,
			TorqueFactor = 1,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { RWheel },
		Suspension = {
			Height = 2,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 10000,
			SpringDamping = 800,
			SpringRelativeDamping = 800,
		},
	} )
end

function ENT:OnCollision( data, physobj )
	if self:WorldToLocal( data.HitPos ).z < 6 then return true end -- dont detect collision  when the lower part of the model touches the ground

	return false
end