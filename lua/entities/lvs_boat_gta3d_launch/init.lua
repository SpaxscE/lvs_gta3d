AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	self:AddDriverSeat( Vector(22,-20,10), Angle(0,-90,0) )
	self:AddPassengerSeat( Vector(33,20,16), Angle(0,-90,10) )

	self:AddEngine( Vector(-230,0,30), Angle(0,0,0) )
end
