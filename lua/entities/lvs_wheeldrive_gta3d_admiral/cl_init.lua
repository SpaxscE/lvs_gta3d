include("shared.lua")

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if pod:GetThirdPersonMode() then
		pos = self:LocalToWorld( Vector(0,0,30) )
	end

	return pos, angles, fov
end

function ENT:OnSpawn()
	self:CreateBonePoseParameter( "bonnet", 2, Angle(0,0,0), Angle(0,0,50), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "boot", 4, Angle(0,0,0), Angle(0,0,-50), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "door_lf", 10, Angle(0,0,0), Angle(0,0,75), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "door_rf", 12, Angle(0,0,0), Angle(0,0,75), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "door_lr", 14, Angle(0,0,0), Angle(0,0,75), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "door_rr", 16, Angle(0,0,0), Angle(0,0,-75), Vector(0,0,0), Vector(0,0,0) )
end
