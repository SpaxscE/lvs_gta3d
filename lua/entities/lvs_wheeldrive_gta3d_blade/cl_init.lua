include("shared.lua")

function ENT:OnSpawn()
	self:CreateBonePoseParameter( "bonnet", 4, Angle(0,0,0), Angle(0,0,50), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "boot", 6, Angle(0,0,0), Angle(0,0,-50), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "door_lf", 12, Angle(0,0,0), Angle(0,0,75), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "door_rf", 14, Angle(0,0,0), Angle(0,0,75), Vector(0,0,0), Vector(0,0,0) )
end
