include("shared.lua")

function ENT:OnSpawn()
	self:AddExhaustByAttachment( "exh" )
end

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if pod:GetThirdPersonMode() then

		local att = self:GetAttachment( self:LookupAttachment( "cam" ) )

		if att then pos = att.Pos end
	end

	return pos, angles, fov
end

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
	steer = math.Clamp( steer, -1, 1 )

	self:SetPoseParameter( "vehicle_steer", steer )

	local boneID = self:LookupBone( "axle" )

	if not boneID then return end

	local FT = FrameTime()

	if not self._JiggleVel then self._JiggleVel = 0 end
	if not self._oldJiggleVel then self._oldJiggleVel = 0 end
	if not self._smOldJiggle then self._smOldJiggle = 0 end
	if not self._smJiggle then self._smJiggle = 0 end

	local SideForce = speed_kmh * steer

	local JiggleVel = self._JiggleVel + (SideForce - self._JiggleVel) * FT * 10

	self._JiggleVel = JiggleVel

	local JiggleAdd = math.abs( self._JiggleVel - self._oldJiggleVel )

	self._oldJiggleVel = self._JiggleVel

	self._smOldJiggle = self._smOldJiggle + math.Clamp(JiggleAdd - self._smOldJiggle,-FT * 1.5, FT * 10)

	local Jiggle = math.Clamp( self._JiggleVel / 10,-0.2,0.2) + math.Clamp( math.cos( CurTime() * 10 + self:EntIndex() * 1.337 ) * self._smOldJiggle * 10, -0.3, 0.3 )

	self._smJiggle = self._smJiggle + (Jiggle - self._smJiggle) * FT * 5
	
	self:ManipulateBoneAngles( boneID, Angle(self._smJiggle,0,0) )
end