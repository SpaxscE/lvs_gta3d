AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.Spawnable = false
ENT.AdminOnly = false

function ENT:Initialize()
	self:SetModel( "models/props_junk/PopCan01a.mdl" )
	self:SetCollisionGroup( COLLISION_GROUP_WORLD )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetNoDraw( true )
	self:DrawShadow( false )

	local PhysObj = self:GetPhysicsObject()

	if not IsValid( PhysObj ) then self:Remove() return end

	PhysObj:SetMass( 50000 )
	PhysObj:EnableMotion( true )

	self.ShadowParams = {
		secondstoarrive = FrameTime(),
		pos = self:GetPos(),
		angle = self:GetAngles(),
		maxangular = 5000,
		maxangulardamp = 10000,
		maxspeed = 1000000,
		maxspeeddamp = 10000,
		dampfactor = 0.8,
		teleportdistance = 200,
	}

	self:StartMotionController()

	PhysObj:Wake()
end

function ENT:PhysicsUpdateShadow( pos, ang )
	if not self.ShadowParams then return end

	self.ShadowParams.pos = pos
	self.ShadowParams.angle = ang
end

function ENT:PhysicsSimulate( phys, deltatime )
	phys:Wake()

	self.ShadowParams.delta = deltatime

	phys:ComputeShadowControl( self.ShadowParams )
end

if SERVER then return end

function ENT:Initialize()
end

function ENT:Draw()
end
