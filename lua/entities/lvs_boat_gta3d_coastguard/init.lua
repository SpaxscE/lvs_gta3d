AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	self:AddDriverSeat( Vector(-15,8,40), Angle(0,-90,15) )
	self:AddPassengerSeat( Vector(-90,-35,30), Angle(0,0,0) )
	self:AddPassengerSeat( Vector(-60,-35,30), Angle(0,0,0) )
	self:AddPassengerSeat( Vector(-90,35,30), Angle(0,180,0) )
	self:AddPassengerSeat( Vector(-60,35,30), Angle(0,180,0) )

	self:AddEngine( Vector(-160,0,40), Angle(0,0,0) )
end
