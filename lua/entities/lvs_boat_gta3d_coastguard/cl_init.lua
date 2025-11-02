include("shared.lua")

function ENT:OnFrame()
	local Steer = self:GetSteer()

	self:ManipulateBoneAngles( 1, Angle(0,Steer * 60,0) )

	self:ManipulateBoneAngles( 2, Angle(-Steer * 20,0,0) )
	self:ManipulateBoneAngles( 3, Angle(-Steer * 20,0,0) )

	local Engine = self:GetEngine()

	if not IsValid( Engine ) then return end

	self._rRPM = self._rRPM and (self._rRPM + Engine:GetRPM() *  RealFrameTime()) or 0

	local Rot = Angle(0,self._rRPM,0)
	Rot:Normalize() 

	self:ManipulateBoneAngles( 4, Rot )
	self:ManipulateBoneAngles( 5, -Rot )
end
