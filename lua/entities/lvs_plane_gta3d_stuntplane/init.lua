AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.WheelSteerAngle = 45
ENT.WheelAutoRetract = true

function ENT:OnSpawn( PObj )
	local pod = self:AddDriverSeat( Vector(-40,0,-20), Angle(0,-90,0) )
	pod:SetCameraHeight( -0.12 )

	self:AddWheel( Vector(37,35,-52), 12, 40 )
	self:AddWheel( Vector(37,-35,-52), 12, 40 )
	self:AddWheel( Vector(-173,0,-5), 12, 40, LVS.WHEEL_STEER_REAR )

	self:AddEngine( Vector(45,0,0) )
	self:AddRotor( Vector(60,0,0) )

end

function ENT:OnEngineActiveChanged( Active )
end
