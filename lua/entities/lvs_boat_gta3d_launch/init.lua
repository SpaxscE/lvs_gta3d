AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	local Pod = self:AddDriverSeat( Vector(22,-20,10), Angle(0,-90,0) )
	Pod.ExitPos = Vector(0,-15,0)

	local Pod = self:AddPassengerSeat( Vector(33,20,16), Angle(0,-90,10) )
	Pod.ExitPos = Vector(0,15,0)

	local Pod = self:AddPassengerSeat( Vector(-175,0,30), Angle(0,90,0) ) 
	Pod.ExitPos = Vector(-175,0,40)
	self:SetGunnerSeat( Pod )

	self:AddEngine( Vector(-230,0,30), Angle(0,0,0) )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/222/cannon_fire.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )
end
