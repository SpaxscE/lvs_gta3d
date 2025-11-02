
function ENT:CalcMouseSteer( ply )
end

function ENT:CalcSteer( ply )
	local KeyLeft = ply:lvsKeyDown( "CAR_STEER_LEFT" )
	local KeyRight = ply:lvsKeyDown( "CAR_STEER_RIGHT" )

	local Steer = (KeyLeft and 1 or 0) - (KeyRight and 1 or 0)

	self:LerpSteer( Steer )
end

function ENT:LerpSteer( Steer )
	local VelL = self:WorldToLocal( self:GetPos() + self:GetVelocity() )

	Steer = Steer * math.min(math.abs( VelL.x ) / self.MaxVelocity + self:GetThrottle() + self:GetBrake(), 1 )

	local Rate = FrameTime() * self.TurnRate
	local Cur = self:GetSteer()
	local New = Cur + math.Clamp(Steer - Cur,-Rate,Rate)

	self:SetSteer( New )
end

function ENT:CalcThrottle( ply )
	local KeyThrottle = ply:lvsKeyDown( "CAR_THROTTLE" )
	local KeyBrake = ply:lvsKeyDown( "CAR_BRAKE" )

	if KeyBrake then
		KeyThrottle = false
	end

	local ThrottleValue = ply:lvsKeyDown( "CAR_THROTTLE_MOD" ) and self:GetMaxThrottle() or 0.5
	local Throttle = KeyThrottle and ThrottleValue or 0
	local Brake = KeyBrake and ThrottleValue or 0

	self:LerpThrottle( Throttle )
	self:LerpBrake( Brake )
end

function ENT:CalcHandbrake( ply )
end

function ENT:CalcTransmission( ply, T )
end

function ENT:OnHandbrakeActiveChanged( Active )
end

function ENT:GetThrust()
	local EntTable = self:GetTable()

	local VelL = self:WorldToLocal( self:GetPos() + self:GetVelocity() )

	local DesiredVelocity = EntTable.MaxVelocity * self:GetThrottle() - EntTable.MaxVelocityReverse * self:GetBrake()

	return ((DesiredVelocity - VelL.x) / EntTable.MaxVelocity) * EntTable.MaxThrust
end
