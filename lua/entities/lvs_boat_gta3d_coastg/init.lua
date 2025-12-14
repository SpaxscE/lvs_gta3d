AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	local Pod = self:AddDriverSeat( Vector(-15,8,40), Angle(0,-90,15) )
	Pod.ExitPos = Vector(-15,8,40)

	local Pod = self:AddPassengerSeat( Vector(-90,-35,30), Angle(0,0,0) )
	Pod.ExitPos = Vector(-90,-35,30)

	local Pod = self:AddPassengerSeat( Vector(-60,-35,30), Angle(0,0,0) )
	Pod.ExitPos = Vector(-60,-35,30)

	local Pod = self:AddPassengerSeat( Vector(-90,35,30), Angle(0,180,0) )
	Pod.ExitPos = Vector(-90,35,30)

	local Pod = self:AddPassengerSeat( Vector(-60,35,30), Angle(0,180,0) )
	Pod.ExitPos = Vector(-60,35,30)

	self:AddEngine( Vector(-160,0,40), Angle(0,0,0) )
end
