
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "[LVS] San Andreas Base"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.MinVelocity = 50

ENT.MaxHealth = 300
ENT.MaxHealthEngine = 25
ENT.MaxHealthFuelTank = 10

ENT.TransShiftSound = "common/null.wav"

ENT.PDSDamageVelocity = 25
ENT.PDSDamageMultiplier = 0.075

ENT.MaxVelocityReverse = 350

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

function ENT:OnSetupDataTables()
	self:AddDT( "Int", "RadioChannel" )
end