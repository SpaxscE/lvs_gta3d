include("shared.lua")
include("sh_radio.lua")

ENT.TireSoundTypes = {
	["roll"] = "lvs/vehicles/generic/wheel_roll.wav",
	["roll_dirt"] = "lvs/vehicles/generic/wheel_roll_dirt.wav",
	["roll_wet"] = "lvs/vehicles/generic/wheel_roll_wet.wav",
	["skid"] = "gta3d/share/tireskid.wav",
	["skid_dirt"] = "lvs/vehicles/generic/wheel_skid_dirt.wav",
	["skid_wet"] = "lvs/vehicles/generic/wheel_skid_wet.wav",
}

function ENT:OnFrame()
	self:DoBodyWobble()
end

function ENT:DoBodyWobble()
	local EntTable = self:GetTable()

	if not EntTable.BodyWobbleEnabled then return end

	local boneID = self:LookupBone( EntTable.BodyWobbleBone )

	if not boneID then return end

	local FT = FrameTime()
	local Yaw = self:GetAngles().y + 180
	local Delta = Yaw - (EntTable._OldBodyYaw or 0)

	if Delta > 1 or Delta < -1 then Delta = 0 end

	if self:GetReverse() then
		Delta = - Delta
	end

	EntTable._OldBodyYaw = Yaw

	if EntTable._BodyVelocity then
		EntTable._BodyVelocity:Add( Angle(-Delta * 0.005 * self:GetVelocity():Length() * FT,0,0) )
	else
		EntTable._BodyVelocity = Angle(0,0,0)
	end

	if EntTable._BodyAngles then
		EntTable._BodyAngles:Add( EntTable._BodyVelocity )
		EntTable._BodyVelocity:Add( (-EntTable._BodyAngles * EntTable.BodyWobbleConstant - EntTable._BodyVelocity * EntTable.BodyWobbleDamping) * FT )

		EntTable._BodyAngles.p = math.Clamp( EntTable._BodyAngles.p, -EntTable.BodyWobbleAngleMax, EntTable.BodyWobbleAngleMax )
	else
		EntTable._BodyAngles = Angle(0,0,0)
	end

	local WobbleP = EntTable._BodyAngles.p * EntTable.BodyWobbleAngleMulPitch
	local WobbleR = EntTable._BodyAngles.p * EntTable.BodyWobbleAngleMulRoll
	self:ManipulateBoneAngles( boneID, Angle(WobbleP,WobbleR,0) )
end