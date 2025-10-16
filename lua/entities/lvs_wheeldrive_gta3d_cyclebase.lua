AddCSLuaFile()

ENT.Base = "lvs_bike_wheeldrive"
DEFINE_BASECLASS( "lvs_bike_wheeldrive" )

if SERVER then
	ENT.LeanAngleIdle = -10
	ENT.LeanAnglePark = -10

	-- autostart
	function ENT:HandleStart()
		local Active = self:GetEngineActive()
		local ShouldBeActive = self:GetActive()

		if Active == ShouldBeActive then return end

		if Active then
			self:StopEngine()

			return
		end

		self:StartEngine()
	end

	function ENT:IsEngineStartAllowed()
		return true
	end

	function ENT:OnStartExplosion()
	end

	function ENT:OnFinishExplosion()
		local effectdata = EffectData()
			effectdata:SetOrigin( self:LocalToWorld( self:OBBCenter() ) )
		util.Effect( "lvs_trailer_explosion", effectdata, true, true )

		self:EmitSound("physics/metal/metal_box_break"..math.random(1,2)..".wav",75,100,1)

		self:SpawnGibs()
	end

	local gibs = {
		"models/gibs/manhack_gib01.mdl",
		"models/gibs/manhack_gib02.mdl",
		"models/gibs/manhack_gib03.mdl",
		"models/gibs/manhack_gib04.mdl",
		"models/props_c17/canisterchunk01a.mdl",
		"models/props_c17/canisterchunk01d.mdl",
		"models/props_c17/oildrumchunk01a.mdl",
		"models/props_c17/oildrumchunk01b.mdl",
		"models/props_c17/oildrumchunk01c.mdl",
		"models/props_c17/oildrumchunk01d.mdl",
		"models/props_c17/oildrumchunk01e.mdl",
	}

	function ENT:SpawnGibs()
		local pos = self:LocalToWorld( self:OBBCenter() )
		local ang = self:GetAngles()

		self.GibModels = istable( self.GibModels ) and self.GibModels or gibs

		for _, v in pairs( self.GibModels ) do
			local ent = ents.Create( "prop_physics" )

			if not IsValid( ent ) then continue end

			ent:SetPos( pos )
			ent:SetAngles( ang )
			ent:SetModel( v )
			ent:Spawn()
			ent:Activate()
			ent:SetRenderMode( RENDERMODE_TRANSALPHA )
			ent:SetCollisionGroup( COLLISION_GROUP_WORLD )

			local PhysObj = ent:GetPhysicsObject()

			if IsValid( PhysObj ) then
				PhysObj:SetVelocityInstantaneous( Vector( math.Rand(-1,1), math.Rand(-1,1), 1.5 ):GetNormalized() * math.random(250,400)  )
				PhysObj:AddAngleVelocity( VectorRand() * 500 ) 
				PhysObj:EnableDrag( false ) 
			end

			timer.Simple( 4.5, function()
				if not IsValid( ent ) then return end

				ent:SetRenderFX( kRenderFxFadeFast  ) 
			end)

			timer.Simple( 5, function()
				if not IsValid( ent ) then return end

				ent:Remove()
			end)
		end
	end

	function ENT:OnStartFireTrail( PhysObj, ExplodeTime )
	end

	function ENT:OnExploded()
		local PhysObj = self:GetPhysicsObject()

		if not IsValid( PhysObj ) then return end

		PhysObj:SetVelocity( self:GetVelocity() + Vector(math.random(-5,5),math.random(-5,5),math.random(150,250)) )
	end

	return
end

ENT.TireSoundTypes = {
	["roll"] = "lvs/vehicles/bicycle/bicycle_tire_loop.wav",
	["roll_racing"] = "lvs/vehicles/bicycle/bicycle_tire_loop.wav",
}

function ENT:TireSoundThink()
	for snd, _ in pairs( self.TireSoundTypes ) do
		local T = self:GetTireSoundTime( snd )

		if T > 0 then
			local speed = self:GetVelocity():Length()
			local sound = self:StartTireSound( snd )
			local volume = math.min(speed / 200,1) ^ 2 * T
			local pitch = 70 + (speed / self.MaxVelocity) * 60

			sound:ChangeVolume( volume, 0 )
			sound:ChangePitch( pitch, 0.5 ) 
		else
			self:StopTireSound( snd )
		end
	end
end