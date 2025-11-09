include("shared.lua")

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-55,-193,-18.5), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-55,193,-18.5), 0, 20, 2, 1000, 150 )
end

function ENT:OnFrame()
	local FT = RealFrameTime()

	self:AnimControlSurfaces( FT )
	self:AnimLandingGear( FT )
	self:AnimVtol( FT )
	self:EngineEffects()
end

function ENT:AnimVtol( frametime )
	local vtol = self:GetVtol()

	self:SetPoseParameter( "engine_spin", vtol )
	self:InvalidateBoneCache()
end


function ENT:EngineEffects()
	if not self:GetEngineActive() then return end

	local T = CurTime()

	if (self.nextEFX or 0) > T then return end

	self.nextEFX = T + 0.01

	local HP = self:GetHP()
	local MaxHP = self:GetMaxHP() 

	if HP <= 0 then return end

	local THR = self:GetThrottle()

	local emitter = self:GetParticleEmitter( self:GetPos() )

	if not IsValid( emitter ) then return end

	local data = {
		[1] = self:GetAttachment( self:LookupAttachment( "tfl" ) ),
		[2] = self:GetAttachment( self:LookupAttachment( "tfr" ) ),
		[3] = self:GetAttachment( self:LookupAttachment( "trl" ) ),
		[4] = self:GetAttachment( self:LookupAttachment( "trr" ) ),
	}

	local Throttle = self:GetThrottle()
	local Vel = self:GetVelocity()

	local Damaged = HP < MaxHP * 0.25

	if Throttle <= 0.1 then return end

	for _, att in pairs( data ) do
		if not att then continue end

		local vNormal = att.Ang:Forward()
		local vOffset = att.Pos + vNormal * 5

		if Damaged then
			local effectdata = EffectData()
				effectdata:SetOrigin( vOffset )
				effectdata:SetNormal( vNormal )
				effectdata:SetMagnitude( Throttle )
				effectdata:SetEntity( self  )
			util.Effect( "lvs_exhaust_fire", effectdata )

			continue
		end

		local particle = emitter:Add( "effects/fluttercore_gmod", vOffset )

		if not particle then continue end

		particle:SetVelocity( vNormal * math.Rand(150,250) * (Throttle ^ 2) * 2 + Vel )
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.1 )
		particle:SetStartAlpha( 100 * (Throttle ^ 2) )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( 4 + Throttle * 3 )
		particle:SetEndSize( 0 )
		particle:SetRoll( math.Rand(-1,1) * 100 )
		particle:SetColor( 200, 200, 255 )
	end
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

	self:ManipulateBonePosition( 8, Vector(0,0,(self._smLandingGear ^ 2) * 10) )
	self:ManipulateBoneAngles( 8, Angle(0,0,self._smLandingGear * 90) )
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
