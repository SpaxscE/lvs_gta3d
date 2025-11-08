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

function ENT:LVSHudPaint( X, Y, ply )
	if not self:LVSPreHudPaint( X, Y, ply ) then return end

	if ply ~= self:GetDriver() then return end

	local HitPlane = self:GetEyeTrace( true ).HitPos:ToScreen()
	local HitPilot = self:GetEyeTrace().HitPos:ToScreen()

	local MouseAim = ply:lvsMouseAim()

	if self:IsDrawingReflectorSight() then
		self:DrawReflectorSight( HitPlane )

		if MouseAim then
			local LineVisible = false

			if not ply:lvsKeyDown( "FREELOOK" ) then
				LineVisible = self:LVSHudPaintMouseAim( HitPlane, HitPilot )
			end

			if LineVisible then
				self:PaintCrosshairOuter( HitPilot )
			end
		end

		self:LVSPaintHitMarker( HitPilot )

		return
	end

	self:PaintCrosshairCenter( HitPlane )
	self:PaintCrosshairOuter( HitPilot )

	if MouseAim and not ply:lvsKeyDown( "FREELOOK" ) then
		self:LVSHudPaintMouseAim( HitPlane, HitPilot )
	end

	self:LVSPaintHitMarker( HitPilot )
end
