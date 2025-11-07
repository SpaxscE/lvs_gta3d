include("shared.lua")

function ENT:OnFrame()
	local Steer = self:GetSteer()

	self:ManipulateBoneAngles( 1, Angle(0,self:GetSteer() * 60,0) )
end
