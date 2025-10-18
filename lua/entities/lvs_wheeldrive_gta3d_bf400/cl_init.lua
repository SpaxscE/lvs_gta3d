include("shared.lua")

DEFINE_BASECLASS( "lvs_bike_wheeldrive" )

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
	self:SetPoseParameter( "vehicle_steer", steer )
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/bmw_r75/eng_start.wav", 75, 100,  LVS.EngineVolume )

		return
	end

	self:EmitSound( "lvs/vehicles/bmw_r75/eng_stop.wav", 75, 100,  LVS.EngineVolume )
end

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	local pos, angles, fov = BaseClass.CalcViewOverride( self, ply, pos, angles, fov, pod )

	if ply == self:GetDriver() and not pod:GetThirdPersonMode() then
		pos = pos + pod:GetUp() * -6.5 + pod:GetRight() * 12
	end

	return pos, angles, fov
end