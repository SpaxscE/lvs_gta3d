AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.DriverActiveSound = "common/null.wav"
ENT.DriverInActiveSound = "common/null.wav"

function ENT:OnSpawn( PObj )
	PObj:SetInertia( Vector(5000,60000,60000) )

	local DriverSeat = self:AddDriverSeat( Vector(185,26,72), Angle(0,-90,0) )
	DriverSeat:SetCameraDistance( 0.7 )
	DriverSeat.ExitPos = Vector(192.82,102.66,52.37)

	local PassengerSeat = self:AddPassengerSeat( Vector(185,-26,72), Angle(0,-90,0) )
	PassengerSeat:SetCameraDistance( -0.37 )
	PassengerSeat.ExitPos = Vector(192.82,-102.66,52.37)

	local DoorHandler = self:AddDoorHandler( "!door_left", Vector(185,40,65), Angle(0,0,0), Vector(-30,0,-30), Vector(30,30,60), Vector(-30,0,-30), Vector(30,60,60) )
	DoorHandler:SetSoundOpen( "vehicles/atv_ammo_open.wav" )
	DoorHandler:SetSoundClose( "vehicles/atv_ammo_close.wav"  )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "!door_right", Vector(185,-40,65), Angle(0,0,0), Vector(-30,-30,-30), Vector(30,0,60), Vector(-30,-60,-30), Vector(30,0,60) )
	DoorHandler:SetSoundOpen( "vehicles/atv_ammo_open.wav" )
	DoorHandler:SetSoundClose( "vehicles/atv_ammo_close.wav"  )
	DoorHandler:LinkToSeat( PassengerSeat )

	self:AddEngineSound( Vector(-70,0,155) )

	self.Rotor = self:AddRotor( Vector(0,0,187), Angle(0,0,0), 365, -4000 )
	self.Rotor:SetRotorEffects( true )
	self.Rotor:SetHP( 50 )
	function self.Rotor:OnDestroyed( base )
		base:SetBodygroup( 1, 2 )
		base:DestroyEngine()

		self:EmitSound( "physics/metal/metal_box_break2.wav" )
	end

	self.TailRotor = self:AddRotor( Vector(-438,0,126), Angle(0,0,90), 20, -6000 )
	self.TailRotor:SetHP( 10 )
	function self.TailRotor:OnDestroyed( base )
		base:SetBodygroup( 2, 2 ) 
		base:DestroySteering( 2.5 )

		self:EmitSound( "physics/metal/metal_box_break2.wav" )
	end
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/helicopter/start.wav" )
	end
end

function ENT:SetRotor( PhysRot )
	self:SetBodygroup( 1, PhysRot and 1 or 0 ) 
end

function ENT:SetTailRotor( PhysRot )
	self:SetBodygroup( 2, PhysRot and 1 or 0 ) 
end

function ENT:OnTick()
	local THR = (0.8 + (math.max( self:GetVelocity():Length() / self.MaxVelocity, 1 ) - self:GetThrustStrenght()) * 0.2) * self:GetThrottle() ^ 2

	local PhysRot = THR > 0.8

	if not self:IsSteeringDestroyed() then
		self:SetTailRotor( PhysRot )
	end

	if not self:IsEngineDestroyed() then
		self:SetRotor( PhysRot )
	end
end