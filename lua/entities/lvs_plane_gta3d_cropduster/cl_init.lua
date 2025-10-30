include("shared.lua")

function ENT:OnSpawn()
	self:RegisterTrail( Vector(21.87,219.02,48.38), 0, 20, 2, 600, 200 )
	self:RegisterTrail( Vector(-3.56,206.39,-12.43), 0, 20, 2, 600, 200 )
	self:RegisterTrail( Vector(21.87,-219.02,48.38), 0, 20, 2, 600, 200 )
	self:RegisterTrail( Vector(-3.56,-206.39,-12.43), 0, 20, 2, 600, 200 )

	self:CreateBonePoseParameter( "cabin", 1, Angle(0,0,0), Angle(120,0,0), Vector(0,0,0), Vector(0,0,0) )
end

function ENT:OnFrame()
	local FT = RealFrameTime()

	self:AnimControlSurfaces( FT )
	self:AnimRotor( FT )
end

function ENT:AnimRotor( frametime )
	if not self.RotorRPM then return end

	local PhysRot = self.RotorRPM < 470

	self._rRPM = self._rRPM and (self._rRPM + self.RotorRPM *  frametime * (PhysRot and 4 or 1)) or 0

	local Rot = Angle(0,-self._rRPM,0)
	Rot:Normalize() 
	self:ManipulateBoneAngles( 7, Rot )

	self:SetBodygroup( 1, PhysRot and 0 or 1 ) 
end

function ENT:AnimControlSurfaces( frametime )
	local FT = frametime * 10

	local Steer = self:GetSteer()

	local Pitch = -Steer.y * 30
	local Yaw = -Steer.z * 20
	local Roll = math.Clamp(-Steer.x * 60,-30,30)

	self.smPitch = self.smPitch and self.smPitch + (Pitch - self.smPitch) * FT or 0
	self.smYaw = self.smYaw and self.smYaw + (Yaw - self.smYaw) * FT or 0
	self.smRoll = self.smRoll and self.smRoll + (Roll - self.smRoll) * FT or 0

	self:ManipulateBoneAngles( 5, Angle(-self.smRoll,0,0) )
	self:ManipulateBoneAngles( 6, Angle(-self.smRoll,0,0) )

	self:ManipulateBoneAngles( 3, Angle(self.smPitch,0,0) )
	self:ManipulateBoneAngles( 4, Angle(self.smPitch,0,0) )

	self:ManipulateBoneAngles( 2, Angle( self.smYaw,0,0 ) )
end

function ENT:OnRemoved()
end
