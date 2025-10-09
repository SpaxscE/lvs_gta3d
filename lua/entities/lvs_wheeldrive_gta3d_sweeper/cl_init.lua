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
	self:SetPoseParameter( "vehicle_steer", steer )
	if self:GetSirenMode() < 0 then return end
	self:SetPoseParameter( "siren_spin", CurTime() * 800 + self:EntIndex() * 1337 )
end