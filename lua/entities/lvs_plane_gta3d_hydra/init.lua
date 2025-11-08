AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.DriverActiveSound = "common/null.wav"
ENT.DriverInActiveSound = "common/null.wav"

ENT.WheelSteerAngle = 15
ENT.WheelAutoRetract = true

function ENT:OnSpawn( PObj )
	PObj:SetMass( 1000 )
	PObj:SetInertia( Vector(9000,9000,9000) )

	local DriverSeat = self:AddDriverSeat( Vector(112,0,-8), Angle(0,-90,0) )
	DriverSeat:SetCameraDistance( 0.25 )
	DriverSeat:SetCameraHeight( -0.1 )

	self:AddEngine( Vector(-65,0,0) )

	self:AddWheel( Vector(140,0,-45), 33, 15, LVS.WHEEL_STEER_FRONT )

	self:AddWheel( Vector(-51,0,-45), 25, 15 )
	self:AddWheel( Vector(-80,-97,-45), 25, 15 )
	self:AddWheel( Vector(-80,97,-45), 25, 15 )
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/helicopter/start.wav" )
	end
end
