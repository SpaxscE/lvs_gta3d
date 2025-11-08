AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.DriverActiveSound = "common/null.wav"
ENT.DriverInActiveSound = "common/null.wav"

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(112,0,0), Angle(0,-90,0) )
	DriverSeat:SetCameraDistance( 0.25 )
	DriverSeat:SetCameraHeight( -0.1 )

	self:AddEngine( Vector(-65,0,0) )
end

function ENT:OnEngineActiveChanged( Active )
end
