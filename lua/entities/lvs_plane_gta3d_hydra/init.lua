AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.DriverActiveSound = "common/null.wav"
ENT.DriverInActiveSound = "common/null.wav"

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-40,0,-20), Angle(0,-90,0) )

	self:AddEngine( Vector(45,0,0) )
end

function ENT:OnEngineActiveChanged( Active )
end
