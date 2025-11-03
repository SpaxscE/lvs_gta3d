include("shared.lua")

function ENT:OnSpawn()
	self:CreateBonePoseParameter( "cabin", 1, Angle(0,0,0), Angle(0,120,0), Vector(0,0,0), Vector(0,0,0) )
end

function ENT:OnFrame()
	self:AnimRotor()
end

function ENT:AnimRotor()
	local THR = (0.8 + (math.max( self:GetVelocity():Length() / self.MaxVelocity, 1 ) - self:GetThrustStrenght()) * 0.2) * self:GetThrottle() ^ 2

	local PhysRot = THR > 0.8
	local RPM = (PhysRot and 1000 or 2500) * THR

	self.RPM = self.RPM and (self.RPM + RPM * RealFrameTime()) or 0

	local Rot1 = Angle(-self.RPM,0,0)
	Rot1:Normalize() 
	
	local Rot2 = Angle(0,0,-self.RPM * 2)
	Rot2:Normalize() 

	self:ManipulateBoneAngles( 4, Rot1 )
	self:ManipulateBoneAngles( 5, Rot2 )
end