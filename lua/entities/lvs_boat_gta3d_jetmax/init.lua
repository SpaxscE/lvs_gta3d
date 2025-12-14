AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	local Pod = self:AddDriverSeat( Vector(18,27,45), Angle(0,-90,0) )
	Pod.ExitPos = Vector(30,20,40)

	local Pod = self:AddPassengerSeat( Vector(25,-27,50), Angle(0,-90,5) )
	Pod.ExitPos = Vector(30,-20,40)

	local Pod = self:AddPassengerSeat( Vector(-30,-27,50), Angle(0,-90,0) )
	Pod.ExitPos = Vector(-30,-27,58)

	local Pod = self:AddPassengerSeat( Vector(-30,0,50), Angle(0,-90,0) )
	Pod.ExitPos = Vector(-30,0,58)

	local Pod = self:AddPassengerSeat( Vector(-30,27,50), Angle(0,-90,0) )
	Pod.ExitPos = Vector(-30,27,58)

	self:AddEngine( Vector(-160,0,45), Angle(0,0,0) )
end
