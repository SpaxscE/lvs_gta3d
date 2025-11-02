include("shared.lua")

function ENT:OnFrame()
	local EntTable = self:GetTable()
	local Steer = self:GetSteer()

	self:ManipulateBoneAngles( 1, Angle(0,Steer * 60,0) )

	self:ManipulateBoneAngles( 2, Angle(-Steer * 20,0,0) )
	self:ManipulateBoneAngles( 3, Angle(-Steer * 20,0,0) )

	local Engine = self:GetEngine()

	if not IsValid( Engine ) then return end

	local RPM = Engine:GetRPM()

	EntTable._rRPM = EntTable._rRPM and (EntTable._rRPM + RPM *  RealFrameTime()) or 0

	local Rot = Angle(0,EntTable._rRPM,0)
	Rot:Normalize() 

	self:ManipulateBoneAngles( 4, Rot )
	self:ManipulateBoneAngles( 5, -Rot )
end
