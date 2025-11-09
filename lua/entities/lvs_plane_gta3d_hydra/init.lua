AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.DriverActiveSound = "common/null.wav"
ENT.DriverInActiveSound = "common/null.wav"

ENT.WheelSteerAngle = 15

function ENT:OnSpawn( PObj )
	PObj:SetMass( 1000 )
	PObj:SetInertia( Vector(9000,9000,9000) )

	local DriverSeat = self:AddDriverSeat( Vector(112,0,-8), Angle(0,-90,0) )
	DriverSeat:SetCameraDistance( 0.25 )
	DriverSeat:SetCameraHeight( -0.1 )

	self:AddEngine( Vector(-65,0,0) )
	self:AddThruster( Vector(-60,0,0) )	

	self:AddWheel( Vector(140,0,-45), 33, 15, LVS.WHEEL_STEER_FRONT )

	self:AddWheel( Vector(-51,0,-45), 25, 15 )
	self:AddWheel( Vector(-80,-97,-45), 25, 15 )
	self:AddWheel( Vector(-80,97,-45), 25, 15 )

	self:SetRadioDisable( true )
end

function ENT:OnLandingGearToggled( IsDeployed )
	self:EmitSound( "lvs/vehicles/generic/gear.wav" )
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/helicopter/start.wav" )
	else
		self:EmitSound( "lvs/vehicles/naboo_n1_starfighter/stop.wav" )
	end
end

function ENT:PhysicsSimulateOverride( ForceAngle, ForceLinear, phys, deltatime, simulate )
	if not self:GetEngineActive() then return ForceAngle, ForceLinear, simulate end

	local Vtol = self:GetVtol()
	local invVtol = 1 - Vtol

	local VelL = self:WorldToLocal( self:GetPos() + self:GetVelocity() )
	VelL.x = VelL.x * 0.1

	local Throttle = self:GetThrottle()

	ForceLinear:Mul( invVtol )
	ForceLinear:Add( Vector(0,0,-ForceLinear.z + self:GetWorldGravity() * 2 * Throttle) * Vtol - VelL * Throttle * 2 * (Vtol ^ 2) )

	if Throttle > 0 then
		ForceAngle.x = ForceAngle.x * invVtol - (self:LocalToWorldAngles( Angle(0,0,-self:GetSteer().x * 60) ).r * 5 + phys:GetAngleVelocity().x * 5) * (Vtol ^ 2)
	end

	return ForceAngle, ForceLinear, simulate
end

function ENT:CalcThrottle( ply, cmd )
	local EntTable = self:GetTable()

	local Delta = FrameTime()

	local CurThrottle = self:GetThrottle()

	local KeyThrottleUp = ply:lvsKeyDown( "+THROTTLE" )
	local KeyThrottleDown = ply:lvsKeyDown( "-THROTTLE" )

	local ThrottleUp = KeyThrottleUp and EntTable.ThrottleRateUp or 0
	local ThrottleDown = KeyThrottleDown and -EntTable.ThrottleRateDown or 0

	local Vtol = self:GetVtol()
	local InvVtol = 1 - Vtol

	local Throttle = (ThrottleUp + ThrottleDown) * Delta
	local ThrottleVtol = (0.5 + (KeyThrottleUp and 0.5 or 0) - (KeyThrottleDown and 0.2 or 0)) * Vtol

	local Target = (ThrottleVtol - CurThrottle) * Delta * 2
	if self:HitGround() and not KeyThrottleUp then
		Target = -2 * Delta
	end

	self:SetThrottle( CurThrottle + Target * Vtol + Throttle * InvVtol )

	local VtolUp = ply:lvsKeyDown( "+VTOL_Z_SF" )
	local VtolDown = ply:lvsKeyDown( "-VTOL_Z_SF" )

	if VtolUp or VtolDown then
		self:SetVtol( math.Clamp( self:GetVtol() + Delta * (VtolDown and 2 or -2), 0, 1) )
	end
end

DEFINE_BASECLASS( "lvs_plane_gta3d" )

function ENT:GetStability()
	local Stability, InvStability, ForwardVelocity = BaseClass.GetStability( self )

	if not self:GetEngineActive() or self:GetThrottle() == 0 then return Stability, InvStability, ForwardVelocity end

	Stability = math.Clamp( Stability + self:GetVtol(), 0, 1 )
	InvStability = 1 - Stability

	return Stability, InvStability, ForwardVelocity
end