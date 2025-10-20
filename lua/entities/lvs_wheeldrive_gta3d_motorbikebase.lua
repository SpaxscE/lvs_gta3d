AddCSLuaFile()

ENT.Base = "lvs_bike_wheeldrive"
DEFINE_BASECLASS( "lvs_bike_wheeldrive" )

ENT.MinVelocity = 50

ENT.MaxHealth = 300
ENT.MaxHealthEngine = 25
ENT.MaxHealthFuelTank = 10

ENT.TransShiftSound = "common/null.wav"

ENT.PDSDamageVelocity = 25
ENT.PDSDamageMultiplier = 0.075

function ENT:AddExhaustByAttachment( name )
	if not istable( self.ExhaustPositions ) then self.ExhaustPositions = {} end

	local att = self:GetAttachment( self:LookupAttachment( name ) )

	if not att then return end

	local data = {
		pos = self:WorldToLocal( att.Pos ),
		ang = self:WorldToLocalAngles( att.Ang ),
	}

	table.insert( self.ExhaustPositions, data )
end

if CLIENT then
	ENT.TireSoundTypes = {
		["roll"] = "lvs/vehicles/generic/wheel_roll.wav",
		["roll_dirt"] = "lvs/vehicles/generic/wheel_roll_dirt.wav",
		["roll_wet"] = "lvs/vehicles/generic/wheel_roll_wet.wav",
		["skid"] = "gta3d/share/tireskid.wav",
		["skid_dirt"] = "lvs/vehicles/generic/wheel_skid_dirt.wav",
		["skid_wet"] = "lvs/vehicles/generic/wheel_skid_wet.wav",
	}

	return
end

function ENT:AddEngine( pos, ang, mins, maxs )
	if IsValid( self:GetEngine() ) then return end

	ang = ang or angle_zero
	mins = mins or Vector(-10,-10,-10)
	maxs = maxs or Vector(10,10,10)

	local Engine = ents.Create( "lvs_wheeldrive_gta3d_engine" )

	if not IsValid( Engine ) then
		self:Remove()

		print("LVS: Failed to create engine entity. Vehicle terminated.")

		return
	end

	Engine:SetPos( self:LocalToWorld( pos ) )
	Engine:SetAngles( self:LocalToWorldAngles( ang ) )
	Engine:Spawn()
	Engine:Activate()
	Engine:SetParent( self )
	Engine:SetBase( self )
	Engine:SetMaxHP( self.MaxHealthEngine )
	Engine:SetHP( self.MaxHealthEngine )

	self:SetEngine( Engine )

	self:DeleteOnRemove( Engine )

	self:TransferCPPI( Engine )

	debugoverlay.BoxAngles( self:LocalToWorld( pos ), mins, maxs, self:LocalToWorldAngles( ang ), 15, Color( 0, 255, 255, 255 ) )

	self:AddDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs =  maxs,
		Callback = function( tbl, ent, dmginfo )
			local Engine = self:GetEngine()

			if not IsValid( Engine ) then return end

			Engine:TakeTransmittedDamage( dmginfo )

			if not Engine:GetDestroyed() then
				dmginfo:ScaleDamage( 0.25 )
			end
		end
	} )

	return Engine
end