AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	local Pod = self:AddDriverSeat( Vector(12,0,30), Angle(0,-90,10) )
	Pod.ExitPos = Vector(12,0,30)

	self:AddEngine( Vector(-75,0,40), Angle(0,0,0) )
end
