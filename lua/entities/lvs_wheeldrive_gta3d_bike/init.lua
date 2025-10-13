AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")
include("sv_no_comic_explosion.lua")

ENT.LeanAngleIdle = -10
ENT.LeanAnglePark = -10


-- autostart
function ENT:HandleStart()
	local Active = self:GetEngineActive()
	local ShouldBeActive = self:GetActive()

	if Active == ShouldBeActive then return end

	if Active then
		self:StopEngine()

		return
	end

	self:StartEngine()
end
function ENT:IsEngineStartAllowed()
	return true
end


function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-25,0,27.3), Angle(0,-90,-2) )

	local WheelModel = "models/diggercars/gtasa/bikes/bike_whf.mdl"
	local WheelModelr = "models/diggercars/gtasa/bikes/bike_whr.mdl"

	local FWheel = self:AddWheel( { hide = true, pos = Vector(25.65,0,10.52), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 1 } )
	local RWheel = self:AddWheel( { hide = true, pos = Vector(-23.49,0,12.23), mdl = WheelModelr, mdl_ang = Angle(0,0,0), width = 1 } )

	self:CreateRigControler( "fl", FWheel, 9, 18.17 )
	self:CreateRigControler( "rl", RWheel, 9, 18.17 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0,
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
			TorqueFactor = 1,
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
