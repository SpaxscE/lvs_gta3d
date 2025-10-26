include("shared.lua")

ENT.TireSoundTypes = {
	["roll"] = "lvs/vehicles/generic/wheel_roll.wav",
	["roll_dirt"] = "lvs/vehicles/generic/wheel_roll_dirt.wav",
	["roll_wet"] = "lvs/vehicles/generic/wheel_roll_wet.wav",
	["skid"] = "gta3d/share/tireskid.wav",
	["skid_dirt"] = "lvs/vehicles/generic/wheel_skid_dirt.wav",
	["skid_wet"] = "lvs/vehicles/generic/wheel_skid_wet.wav",
}

function ENT:LVSHudPaint( X, Y, ply )
	if not self:LVSPreHudPaint( X, Y, ply ) then return end

	self:PaintZoom( X, Y, ply )
	self:PaintRadio( X, Y )
end

function ENT:PaintRadio( X, Y )
	local T = CurTime()
	local EntTable = self:GetTable()
	local Channel = self:GetRadioChannel()

	if Channel ~= EntTable._oldChannel then
		EntTable._oldChannel = Channel

		if (EntTable._ChannelVisible or 0) < T then
			EntTable._ChannelVisible = T + 1

			surface.PlaySound( "gta3d/radio/change"..math.random(1,12)..".ogg" )
		end
	end

	if (EntTable._ChannelVisible or 0) < T then return end

	draw.DrawText( LVSGTA3D:GetChannel( Channel ).name, "LVS_FONT_HUD_LARGE", X * 0.5, Y * 0.25, color_white, TEXT_ALIGN_CENTER )
end