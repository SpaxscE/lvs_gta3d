AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.DriverActiveSound = "common/null.wav"
ENT.DriverInActiveSound = "common/null.wav"

function ENT:OnSpawn( PObj )
	PObj:SetInertia( Vector(5000,60000,60000) )

	local DriverSeat = self:AddDriverSeat( Vector(105,0,70), Angle(0,-90,0) )
	DriverSeat:SetCameraDistance( 0.4 )

	local DoorHandler = self:AddDoorHandler( "!cabin", Vector(105,0,70), Angle(0,0,0), Vector(-30,-30,0), Vector(50,30,40), Vector(-30,-50,0), Vector(50,80,40) )
	DoorHandler:SetSoundOpen( "vehicles/atv_ammo_open.wav" )
	DoorHandler:SetSoundClose( "vehicles/atv_ammo_close.wav"  )
	DoorHandler:LinkToSeat( DriverSeat )

	self:AddEngineSound( Vector(-65,0,110) )

	self.Rotor = self:AddRotor( Vector(0,0,150), Angle(0,0,0), 280, -4000 )
	self.Rotor:SetRotorEffects( true )
	self.Rotor:SetHP( 50 )
	function self.Rotor:OnDestroyed( base )
		base:SetBodygroup( 1, 2 )
		base:DestroyEngine()

		self:EmitSound( "physics/metal/metal_box_break2.wav" )
	end

	self.TailRotor = self:AddRotor( Vector(-347,27,155), Angle(0,0,90), 50, -6000 )
	self.TailRotor:SetHP( 10 )
	function self.TailRotor:OnDestroyed( base )
		base:SetBodygroup( 2, 2 ) 
		base:DestroySteering( 2.5 )

		self:EmitSound( "physics/metal/metal_box_break2.wav" )
	end

	self.SNDTurret = self:AddSoundEmitter( Vector(175,0,19.33), "lvs/vehicles/222/cannon_fire.wav", "lvs/vehicles/222/cannon_fire_interior.wav" )
	self.SNDTurret:SetSoundLevel( 95 )

	self:SetRadioDisable( true )
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