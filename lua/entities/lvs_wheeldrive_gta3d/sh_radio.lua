
ENT.useGta3dRadio = true

function ENT:OnSetupDataTables()
	self:AddDT( "Int", "RadioChannel" )
end

if CLIENT then
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

	function ENT:PaintRadio( X, Y )
		local T = CurTime()
		local EntTable = self:GetTable()
		local Channel = self:GetRadioChannel()

		if Channel ~= EntTable._oldChannel then
			if EntTable._ChannelVisible < T then
				surface.PlaySound( "SA_SWITCH_RADIO" )
			end

			EntTable._ChannelVisible = T + 0.5
			EntTable._oldChannel = Channel
		end

		local ChannelVisible = EntTable._ChannelVisible > T

		if ChannelVisible ~= EntTable._oldChannelVisible then
			EntTable._oldChannelVisible = ChannelVisible

			if not ChannelVisible then
				EntTable._ChannelVisibleColor = T + 1
			end
		end

		if not ChannelVisible then
			if EntTable._ChannelVisibleColor < T then return end

			draw.DrawText( LVSGTA3D:GetChannel( Channel ).name, "LVS_FONT_HUD_LARGE", X * 0.5, Y * 0.15, Color2, TEXT_ALIGN_CENTER )

			return
		end

		draw.DrawText( LVSGTA3D:GetChannel( Channel ).name, "LVS_FONT_HUD_LARGE", X * 0.5, Y * 0.15, Color1, TEXT_ALIGN_CENTER )
	end

	function ENT:IsRadioEnabled()
		local T = CurTime()

		return self:GetRadioChannel() ~= 0 and self._ChannelVisibleColor < T and self._ChannelVisible < T
	end

	return
end

DEFINE_BASECLASS( "lvs_base_wheeldrive" )

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

	if self:GetRadioChannel() > 11 then self:SetRadioChannel( 0 ) end
end

function ENT:PrevChannel()
	self:SetRadioChannel( self:GetRadioChannel() - 1 )

	if self:GetRadioChannel() < 0 then self:SetRadioChannel( 11 ) end
end
