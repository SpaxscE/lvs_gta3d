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

ENT.Hud = true
ENT.HudThirdPerson = false
ENT.HudGradient = Material("gui/center_gradient")
ENT.HudColor = Color(0,255,0)

function ENT:PaintHeliFlightInfo( X, Y, ply, Pos2D )
	local Roll = self:GetAngles().r

	surface.SetDrawColor(0,0,0,40)
	surface.SetMaterial( self.HudGradient )
	surface.DrawTexturedRect( Pos2D.x - 270, Pos2D.y - 10, 140, 20 )
	surface.DrawTexturedRect( Pos2D.x + 130, Pos2D.y - 10, 140, 20 )

	local X = math.cos( math.rad( Roll ) )
	local Y = math.sin( math.rad( Roll ) )

	surface.SetDrawColor( self.HudColor.r, self.HudColor.g, self.HudColor.b, 255 )
	surface.DrawLine( Pos2D.x + X * 50, Pos2D.y + Y * 50, Pos2D.x + X * 125, Pos2D.y + Y * 125 ) 
	surface.DrawLine( Pos2D.x - X * 50, Pos2D.y - Y * 50, Pos2D.x - X * 125, Pos2D.y - Y * 125 ) 

	surface.DrawLine( Pos2D.x + 125, Pos2D.y, Pos2D.x + 130, Pos2D.y + 5 ) 
	surface.DrawLine( Pos2D.x + 125, Pos2D.y, Pos2D.x + 130, Pos2D.y - 5 ) 
	surface.DrawLine( Pos2D.x - 125, Pos2D.y, Pos2D.x - 130, Pos2D.y + 5 ) 
	surface.DrawLine( Pos2D.x - 125, Pos2D.y, Pos2D.x - 130, Pos2D.y - 5 ) 
	
	surface.SetDrawColor( 0, 0, 0, 80 )
	surface.DrawLine( Pos2D.x + X * 50 + 1, Pos2D.y + Y * 50 + 1, Pos2D.x + X * 125 + 1, Pos2D.y + Y * 125 + 1 ) 
	surface.DrawLine( Pos2D.x - X * 50 + 1, Pos2D.y - Y * 50 + 1, Pos2D.x - X * 125 + 1, Pos2D.y - Y * 125 + 1 ) 
	
	surface.DrawLine( Pos2D.x + 126, Pos2D.y + 1, Pos2D.x + 131, Pos2D.y + 6 ) 
	surface.DrawLine( Pos2D.x + 126, Pos2D.y + 1, Pos2D.x + 131, Pos2D.y - 4 ) 
	surface.DrawLine( Pos2D.x - 126, Pos2D.y + 1, Pos2D.x - 129, Pos2D.y + 6 ) 
	surface.DrawLine( Pos2D.x - 126, Pos2D.y + 1, Pos2D.x - 129, Pos2D.y - 4 )

	local Ang = self:GetLandingGear() * 45

	local X = math.cos( math.rad( Roll + 25 + Ang ) )
	local Y = math.sin( math.rad( Roll + 25 + Ang ) )
	surface.DrawLine( Pos2D.x + X * 30 - 1, Pos2D.y + Y * 30 + 1, Pos2D.x + X * 60 - 1, Pos2D.y + Y * 60 + 1 ) 
	local X = math.cos( math.rad( Roll + 155 - Ang ) )
	local Y = math.sin( math.rad( Roll + 155 - Ang ) )
	surface.DrawLine( Pos2D.x + X * 30 + 1, Pos2D.y + Y * 30 + 1, Pos2D.x + X * 60 + 1, Pos2D.y + Y * 60 + 1 ) 

	surface.SetDrawColor( self.HudColor.r, self.HudColor.g, self.HudColor.b, 255 )
	local X = math.cos( math.rad( Roll + 25 + Ang ) )
	local Y = math.sin( math.rad( Roll + 25 + Ang ) )
	surface.DrawLine( Pos2D.x + X * 30, Pos2D.y + Y * 30, Pos2D.x + X * 60, Pos2D.y + Y * 60 ) 
	local X = math.cos( math.rad( Roll + 155 - Ang ) )
	local Y = math.sin( math.rad( Roll + 155 - Ang ) )
	surface.DrawLine( Pos2D.x + X * 30, Pos2D.y + Y * 30, Pos2D.x + X * 60, Pos2D.y + Y * 60 )

	local Pitch = -self:GetAngles().p

	surface.DrawLine( Pos2D.x - 220, Pos2D.y, Pos2D.x - 180, Pos2D.y )
	surface.DrawLine( Pos2D.x + 220, Pos2D.y, Pos2D.x + 180, Pos2D.y )
	surface.SetDrawColor( 0, 0, 0, 80 )
	surface.DrawLine( Pos2D.x - 220, Pos2D.y + 1, Pos2D.x - 180, Pos2D.y + 1 )
	surface.DrawLine( Pos2D.x + 220, Pos2D.y + 1, Pos2D.x + 180, Pos2D.y + 1 )

	draw.DrawText( math.Round( Pitch, 2 ), "LVS_FONT_PANEL", Pos2D.x - 175, Pos2D.y - 7, Color( self.HudColor.r, self.HudColor.g, self.HudColor.b, 255 ), TEXT_ALIGN_LEFT )
	draw.DrawText( math.Round( Pitch, 2 ), "LVS_FONT_PANEL", Pos2D.x + 175, Pos2D.y - 7, Color( self.HudColor.r, self.HudColor.g, self.HudColor.b, 255 ), TEXT_ALIGN_RIGHT )

	for i = -180, 180 do
		local Y = -i * 10 + Pitch * 10

		local absN = math.abs( i ) 

		local IsTen = absN == math.Round( absN / 10, 0 ) * 10

		local SizeX = IsTen and 20 or 10

		local Alpha = 255 - (math.min( math.abs( Y ) / 200,1) ^ 2) * 255

		if Alpha <= 0 then continue end

		surface.SetDrawColor( self.HudColor.r, self.HudColor.g, self.HudColor.b, Alpha * 0.75 )
		surface.DrawLine(Pos2D.x - 200 - SizeX, Pos2D.y + Y, Pos2D.x - 200, Pos2D.y + Y ) 
		surface.DrawLine(Pos2D.x + 200 + SizeX, Pos2D.y + Y, Pos2D.x + 200, Pos2D.y + Y ) 
		surface.SetDrawColor( 0, 0, 0, Alpha * 0.25 )
		surface.DrawLine(Pos2D.x - 200 - SizeX, Pos2D.y + Y + 1, Pos2D.x - 200, Pos2D.y + Y + 1 ) 
		surface.DrawLine(Pos2D.x + 200 + SizeX, Pos2D.y + Y + 1, Pos2D.x + 200, Pos2D.y + Y + 1) 

		if not IsTen then continue end

		draw.DrawText( i, "LVS_FONT_HUD", Pos2D.x - 225, Pos2D.y + Y - 10, Color( self.HudColor.r, self.HudColor.g, self.HudColor.b, Alpha * 0.5 ), TEXT_ALIGN_RIGHT )
		draw.DrawText( i, "LVS_FONT_HUD", Pos2D.x + 225, Pos2D.y + Y - 10, Color( self.HudColor.r, self.HudColor.g, self.HudColor.b, Alpha * 0.5 ), TEXT_ALIGN_LEFT )
	end
end

function ENT:LVSHudPaint( X, Y, ply )
	if not self:LVSPreHudPaint( X, Y, ply ) then return end

	if ply ~= self:GetDriver() then return end

	local HitPlane = self:GetEyeTrace( true ).HitPos:ToScreen()
	local HitPilot = self:GetEyeTrace().HitPos:ToScreen()

	local pod = ply:GetVehicle()

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

	if pod:GetThirdPersonMode() then
		self:PaintCrosshairCenter( HitPlane )
		self:PaintCrosshairOuter( HitPilot )
	else
		self:PaintHeliFlightInfo( X, Y, ply, HitPlane )
		self:PaintCrosshairCenter( HitPlane, self.HudColor )
		self:PaintCrosshairOuter( HitPilot, self.HudColor )
	end

	if MouseAim and not ply:lvsKeyDown( "FREELOOK" ) then
		self:LVSHudPaintMouseAim( HitPlane, HitPilot )
	end

	self:LVSPaintHitMarker( HitPilot )

	self:PaintZoom( X, Y, ply )
	self:PaintRadio( X, Y )
end
