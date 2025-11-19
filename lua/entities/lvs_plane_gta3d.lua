
AddCSLuaFile()

ENT.Base = "lvs_base_fighterplane"
DEFINE_BASECLASS( "lvs_base_fighterplane" )

ENT.PrintName = "[LVS] San Andreas Base"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Planes"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.AITEAM = 0

ENT.TurnRatePitch = 1.5
ENT.TurnRateYaw = 2
ENT.TurnRateRoll = 0.8

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxSlipAnglePitch = 20
ENT.MaxSlipAngleYaw = 8

ENT.MaxHealth = 300

ENT.FlyByAdvance = 1.1
ENT.FlyBySound = "gta3d/engines/stuntplane/flyby.wav" 
ENT.DeathSound = "lvs/vehicles/generic/crash.wav"

ENT.GravityTurnRatePitch = 1
ENT.GravityTurnRateYaw = 5

ENT.ThrottleRateUp = 1
ENT.ThrottleRateDown = 0.6

ENT.StallVelocity = 10
ENT.StallForceMultiplier = 10
ENT.StallForceMax = 1000

ENT.useGta3dRadio = true
ENT.Gta3dRadioDefaultChannel = 0

function ENT:SetupDataTables()
	BaseClass.SetupDataTables( self )

	self:AddDT( "Bool", "RadioDisable", { KeyName = "radiodisable", Edit = { type = "Boolean", order = 5, category = "Misc"} } )
	self:AddDT( "Int", "RadioChannel" )

	if SERVER then
		self:SetRadioChannel( self.Gta3dRadioDefaultChannel )
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
	local Color2 = Color(255,255,255)
	local Color3 = Color(0,0,0)

	ENT._oldChannel = 0
	ENT._oldChannelVisible = false
	ENT._ChannelVisibleColor = 0
	ENT._ChannelVisible = 0

	function ENT:PaintRadio( X, Y )
		local T = CurTime()
		local EntTable = self:GetTable()
		local Channel = self:GetRadioChannel()

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

				surface.SetMaterial( Frame )
				surface.SetDrawColor( Color3 )
				surface.DrawTexturedRect( X * 0.5 - 69, 63, 138, 138 )
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

	if not self:GetEngineActive() then
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

	if self:GetRadioDisable() then
		if self:GetRadioChannel() ~= 0 then
			self:SetRadioChannel( 0 )
		end

		return
	end

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
