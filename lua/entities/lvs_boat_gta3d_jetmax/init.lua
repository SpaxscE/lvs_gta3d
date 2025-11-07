AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	self:AddDriverSeat( Vector(18,27,40), Angle(0,-90,0) )

	self:AddEngine( Vector(-160,0,40), Angle(0,0,0) )
end
