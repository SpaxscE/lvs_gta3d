
ENT.Base = "lvs_heli_gta3d"

ENT.PrintName = "Hunter"
ENT.Author = "Luna"
ENT.Category = "[LVS] GTA3D - Helicopters"

ENT.VehicleCategory = "GTA3D"
ENT.VehicleSubCategory = "Helicopters"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gtasa/helis/hunter.mdl"

ENT.AITEAM = 2

ENT.MaxHealth = 1600

ENT.MaxVelocity = 2150

ENT.ThrustUp = 1
ENT.ThrustDown = 0.8
ENT.ThrustRate = 1

ENT.ThrottleRateUp = 0.2
ENT.ThrottleRateDown = 0.2

ENT.TurnRatePitch = 0.5
ENT.TurnRateYaw = 1.25
ENT.TurnRateRoll = 0.7

ENT.GravityTurnRateYaw = 3

ENT.ForceLinearDampingMultiplier = 2

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.EngineSounds = {
	{
		sound = "^npc/attack_helicopter/aheli_rotor_loop1.wav",
		--sound_int = "lvs/vehicles/helicopter/loop_interior.wav",
		Pitch = 0,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 100,
		Volume = 1,
		VolumeMin = 0,
		VolumeMax = 1,
		SoundLevel = 125,
		UseDoppler = true,
	},
}

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/missile.png")
	weapon.Ammo = -1
	weapon.Delay = 0.5
	weapon.HeatRateUp = 2
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		for i = 1, 2 do
			ent.FireLeft = not ent.FireLeft

			local Driver = ent:GetDriver()

			local projectile = ents.Create( "lvs_missile" )
			projectile:SetPos( ent:LocalToWorld( Vector(70,60 * (self.FireLeft and 1 or -1),34) ) )
			projectile:SetAngles( ent:GetAngles() )
			projectile:SetParent( ent )
			projectile:Spawn()
			projectile:Activate()
			projectile:SetAttacker( IsValid( Driver ) and Driver or self )
			projectile:SetEntityFilter( ent:GetCrosshairFilterEnts() )
			projectile:SetSpeed( ent:GetVelocity():Length() + 4000 )
			projectile:SetDamage( 400 )
			projectile:SetRadius( 150 )
			projectile:Enable()
			ent:TakeAmmo()
		end
	end

	self:AddWeapon( weapon )
end
