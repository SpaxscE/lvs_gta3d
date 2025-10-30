AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.WheelSteerAngle = 45
ENT.WheelAutoRetract = true

ENT.DriverActiveSound = "common/null.wav"
ENT.DriverInActiveSound = "common/null.wav"

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-40,0,-20), Angle(0,-90,0) )
	DriverSeat:SetCameraHeight( -0.12 )

	local DoorHandler = self:AddDoorHandler( "!cabin" )
	DoorHandler:SetSoundOpen( "vehicles/atv_ammo_open.wav" )
	DoorHandler:SetSoundClose( "vehicles/atv_ammo_close.wav"  )
	DoorHandler:LinkToSeat( DriverSeat )

	self:AddWheel( Vector(37,35,-52), 12, 40 )
	self:AddWheel( Vector(37,-35,-52), 12, 40 )
	self:AddWheel( Vector(-173,0,-5), 12, 40, LVS.WHEEL_STEER_REAR )

	self:AddEngine( Vector(45,0,0) )
	self:AddRotor( Vector(60,0,0) )

	if not istable( self.RandomColor ) then return end

	local data = self.RandomColor[ math.random( #self.RandomColor ) ]

	if IsColor( data ) then
		self:SetColor( data )
	else
		self:SetSkin( data.Skin or 0 )
		self:SetColor( data.Color or color_white )
	end
end

function ENT:OnEngineActiveChanged( Active )
end
