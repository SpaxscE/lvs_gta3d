include("shared.lua")

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if pod:GetThirdPersonMode() then
		pos = self:LocalToWorld( Vector(-30,0,40) )
	end

	return pos, angles, fov
end

function ENT:OnSpawn()
	self:CreateBonePoseParameter( "bonnet", 3, Angle(0,0,0), Angle(0,0,50), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "boot", 5, Angle(0,0,0), Angle(0,0,-85), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "door_lf", 11, Angle(0,0,0), Angle(0,0,75), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "door_rf", 13, Angle(0,0,0), Angle(0,0,75), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "door_lr", 15, Angle(0,0,0), Angle(0,0,75), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "door_rr", 17, Angle(0,0,0), Angle(0,0,-75), Vector(0,0,0), Vector(0,0,0) )
end
