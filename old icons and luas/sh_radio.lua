
ENT.useGta3dRadio = true
ENT.Gta3dRadioDefaultChannel = 0

DEFINE_BASECLASS( "lvs_base_wheeldrive" )

function ENT:SetupDataTables()
	BaseClass.SetupDataTables( self )

	self:AddDT( "Int", "RadioChannel" )

	if SERVER then
		self:SetRadioChannel( math.Clamp( self.Gta3dRadioDefaultChannel, 0, 11 ) )
	end
end

if CLIENT then
	local Frame = Material("lvs/3d2dmats/frame.png")

	function ENT:LVSHudPaint( X, Y, ply )
		if not self:LVSPreHudPaint( X, Y, ply ) then return end

		self:PaintZoom( X, Y, ply )
		self:PaintRadio( X, Y )
	end

	local Color1 = Color(150,150,150)
	local Color2 = Color(255,191,0)

	ENT._oldChannel = 0
	ENT._oldChannelVisible = false
	ENT._ChannelVisibleColor = 0
	ENT._ChannelVisible = 0

	local Circle = {}
	for i = 1, 360 do
		Circle[ i ] = {
			X = math.cos( math.rad( i ) ),
			Y = math.sin( math.rad( i ) ),
			R = 50,
		}
	end

	function ENT:PaintRadio( X, Y )
		local T = CurTime()
		local EntTable = self:GetTable()
		local Channel = self:GetRadioChannel()

		local Handler = LVSGTA3D:GetSoundHandler()

		if IsValid( Handler ) then
			local FT = FrameTime()

			local centerX = X * 0.5
			local centerY = Y * 0.5

			local A,B = Handler:GetLevel()

			local indexActive1 = math.Round( (CurTime() * 120) % 360 )
			local indexActive2 = math.Round( (CurTime() * 120 + 180) % 360 )

			local MaxR = 0
			for iCur = 1, 360 do
				local iPrev = iCur - 1
				if iPrev == 0 then iPrev = 360 end

				local cur = Circle[ iCur ]
				local prev = Circle[ iPrev ]

				local radius = 200

				if iCur == indexActive1 then
					cur.R = 5 + radius * A
				end
				if iCur == indexActive2 then
					cur.R = 5 + radius * B
				end

				cur.R = cur.R + (5 - cur.R) * FT

				if cur.R > MaxR then
					MaxR = cur.R
				end

				--local startX = centerX + prev.X * prev.R
				--local startY = centerY + prev.Y * prev.R
				--local endX = centerX + cur.X * cur.R
				--local endY = centerY + cur.Y * cur.R

				--surface.SetDrawColor( math.min( cur.R * 2, 255 ), 0, 0, 255 )
				--surface.DrawLine( startX, startY, endX, endY )
			end

			for iCur = 1, 360 do
				local iPrev = iCur - 1
				if iPrev == 0 then iPrev = 360 end

				local cur = Circle[ iCur ]
				local prev = Circle[ iPrev ]

				local startX = centerX + prev.X * (MaxR + prev.R)
				local startY = centerY + prev.Y * (MaxR + prev.R)
				local endX = centerX + cur.X * (MaxR + cur.R)
				local endY = centerY + cur.Y * (MaxR + cur.R)

				local R = math.min( MaxR * 4, 255 )
				local G = 255 - math.min( MaxR * 4, 255 )
	
				surface.SetDrawColor( R, G, 0, 255 )
				surface.DrawLine( startX, startY, endX, endY )
			end
		end

		if Channel ~= EntTable._oldChannel then
			if Channel > 0 then
				if (EntTable._ChannelVisible - 0.75) < T then
					surface.PlaySound( "SA_SWITCH_RADIO" )
				end

				EntTable._ChannelVisible = T + 1
			else
				surface.PlaySound("gta3d/radio/turnoff.ogg")

				EntTable._ChannelVisible = T + 0.1
			end

			EntTable._oldChannel = Channel
		end

		local ChannelVisible = EntTable._ChannelVisible > T

		if ChannelVisible ~= EntTable._oldChannelVisible then
			EntTable._oldChannelVisible = ChannelVisible

			if not ChannelVisible then
				EntTable._ChannelVisibleColor = T + 1
			end
		end

		local channelData = LVSGTA3D:GetChannel( Channel )

		if not channelData then return end

		if not ChannelVisible then
			if EntTable._ChannelVisibleColor < T then return end

			if channelData.icon then
				surface.SetDrawColor( color_white )
				surface.SetMaterial( channelData.icon )
				surface.DrawTexturedRect( X * 0.5 - 64, 4 + 64, 128, 128 )

				surface.SetDrawColor( Color2 )
				surface.SetMaterial( Frame )
				surface.DrawTexturedRect( X * 0.5 - 68, 64, 136, 136 )
			end

			draw.DrawText( channelData.name, "LVS_FONT_HUD_LARGE", X * 0.5, 215, Color2, TEXT_ALIGN_CENTER )

			return
		end

		if channelData.icon then
			surface.SetDrawColor( Color1 )

			surface.SetMaterial( channelData.icon )
			surface.DrawTexturedRect( X * 0.5 - 64, 4 + 64, 128, 128 )
			surface.SetMaterial( Frame )
			surface.DrawTexturedRect( X * 0.5 - 68, 64, 136, 136 )
		end

		draw.DrawText( channelData.name, "LVS_FONT_HUD_LARGE", X * 0.5, 215, Color1, TEXT_ALIGN_CENTER )
	end

	function ENT:IsRadioEnabled()
		local T = CurTime()

		return self:GetRadioChannel() ~= 0 and self._ChannelVisible < T
	end

	return
end

function ENT:OnDriverChanged( Old, New, VehicleIsActive )

	if self:GetBrake() ~= 0 then
		self:SetRadioChannel( 0 )
	end

	BaseClass.OnDriverChanged( self, Old, New, VehicleIsActive )
end

function ENT:StartCommand( ply, cmd )
	BaseClass.StartCommand( self, ply, cmd )

	local wheel = cmd:GetMouseWheel()

	if wheel == 0 then return end

	if ply:lvsKeyDown( "VIEWDIST" ) then return end

	if self.DisableRadio then return end

	local pod = ply:GetVehicle()

	if not IsValid( pod ) or pod:lvsGetPodIndex() > 2 then return end

	if wheel > 0 then
		self:PrevChannel()
	end

	if wheel < 0 then
		self:NextChannel()
	end
end

function ENT:NextChannel()
	self:SetRadioChannel( self:GetRadioChannel() + 1 )

	if self:GetRadioChannel() > #LVSGTA3D.Channel then self:SetRadioChannel( 0 ) end
end

function ENT:PrevChannel()
	self:SetRadioChannel( self:GetRadioChannel() - 1 )

	if self:GetRadioChannel() < 0 then self:SetRadioChannel( #LVSGTA3D.Channel ) end
end
