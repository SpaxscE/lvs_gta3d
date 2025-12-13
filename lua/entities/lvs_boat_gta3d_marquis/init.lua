AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	self:AddDriverSeat( Vector(-210,0,71), Angle(0,-90,15) ):SetCameraDistance( -0.6 )

	self:AddPassengerSeat( Vector(-165,-50,68), Angle(0,0,0) ):SetCameraDistance( -0.6 )
	self:AddPassengerSeat( Vector(-165,50,68), Angle(0,180,0) ):SetCameraDistance( -0.6 )
	self:AddPassengerSeat( Vector(-220,-20,68), Angle(0,-90,0) ):SetCameraDistance( -0.6 )
	self:AddPassengerSeat( Vector(-220,20,68), Angle(0,-90,0) ):SetCameraDistance( -0.6 )
	self:AddPassengerSeat( Vector(-220,0,68), Angle(0,-90,0) ):SetCameraDistance( -0.6 )

	self:AddEngine( Vector(-275,0,30), Angle(0,0,0) )
end
