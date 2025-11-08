include("shared.lua")

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-55,-193,-18.5), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-55,193,-18.5), 0, 20, 2, 1000, 150 )
end

function ENT:OnFrame()
	local FT = RealFrameTime()

	self:AnimControlSurfaces( FT )
	self:AnimLandingGear( FT )
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

	self:ManipulateBoneAngles( 4, Angle(-self.smRoll,0,0) )
	self:ManipulateBoneAngles( 5, Angle(-self.smRoll,0,0) )

	self:ManipulateBoneAngles( 2, Angle(self.smPitch,0,0) )
	self:ManipulateBoneAngles( 3, Angle(self.smPitch,0,0) )

	self:ManipulateBoneAngles( 1, Angle( self.smYaw,0,0 ) )
end

function ENT:AnimLandingGear( frametime )
	self._smLandingGear = self._smLandingGear and self._smLandingGear + ((1 - self:GetLandingGear()) - self._smLandingGear) * frametime * 2 or 0

	self:ManipulateBoneAngles( 6, Angle(0,0,self._smLandingGear * 80) )
	self:ManipulateBoneAngles( 7, Angle(0,0,-self._smLandingGear * 105) )
end
