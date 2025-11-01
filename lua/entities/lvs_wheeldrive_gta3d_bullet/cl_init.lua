include("shared.lua")

function ENT:OnSpawn()
	self:AddExhaustByAttachment( "exh1" )
	self:AddExhaustByAttachment( "exh2" )
	self:AddExhaustByAttachment( "exh3" )
	self:AddExhaustByAttachment( "exh4" )
end

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if pod:GetThirdPersonMode() then

		local att = self:GetAttachment( self:LookupAttachment( "cam" ) )

		if att then pos = att.Pos end
	end

	return pos, angles, fov
end
