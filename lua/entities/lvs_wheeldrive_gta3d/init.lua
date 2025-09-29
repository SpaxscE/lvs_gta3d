AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:AddEngine( pos, ang )
	if IsValid( self:GetEngine() ) then return end

	local Engine = ents.Create( "lvs_wheeldrive_gta3d_engine" )

	if not IsValid( Engine ) then
		self:Remove()

		print("LVS: Failed to create engine entity. Vehicle terminated.")

		return
	end

	Engine:SetPos( self:LocalToWorld( pos ) )
	Engine:SetAngles( self:LocalToWorldAngles( ang or angle_zero ) )
	Engine:Spawn()
	Engine:Activate()
	Engine:SetParent( self )
	Engine:SetBase( self )

	self:SetEngine( Engine )

	self:DeleteOnRemove( Engine )

	self:TransferCPPI( Engine )

	return Engine
end