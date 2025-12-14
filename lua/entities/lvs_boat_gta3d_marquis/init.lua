AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.SpawnNormalOffset = -50

function ENT:OnSpawn( PObj )
	local Pod = self:AddDriverSeat( Vector(-210,0,71), Angle(0,-90,15) )
	Pod:SetCameraDistance( -0.6 )
	Pod.ExitPos = Vector(-210,0,71)

	local Pod = self:AddPassengerSeat( Vector(-220,0,68), Angle(0,-90,0) )
	Pod:SetCameraDistance( -0.6 )
	Pod.ExitPos = Vector(-220,0,68)

	local Pod = self:AddPassengerSeat( Vector(-165,-50,68), Angle(0,0,0) )
	Pod:SetCameraDistance( -0.6 )
	Pod.ExitPos = Vector(-165,-50,68)

	local Pod = self:AddPassengerSeat( Vector(-165,50,68), Angle(0,180,0) )
	Pod:SetCameraDistance( -0.6 )
	Pod.ExitPos = Vector(-165,50,68)

	local Pod = self:AddPassengerSeat( Vector(-220,-20,68), Angle(0,-90,0) )
	Pod:SetCameraDistance( -0.6 )
	Pod.ExitPos = Vector(-220,-20,68)

	local Pod = self:AddPassengerSeat( Vector(-220,20,68), Angle(0,-90,0) )
	Pod:SetCameraDistance( -0.6 )
	Pod.ExitPos = Vector(-220,20,68)

	self:AddEngine( Vector(-275,0,30), Angle(0,0,0) )
end
