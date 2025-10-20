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

function ENT:PhysicsSimulateOverride( ForceAngle, phys, deltatime, simulate )
	local EntTable = self:GetTable()

	if EntTable._IsDismounted then

		local Pod = self:GetDriverSeat()

		if IsValid( Pod ) then
			local z = math.max( self:GetUp().z, 0 )

			local Gravity = self:GetWorldUp() * self:GetWorldGravity() * phys:GetMass() * deltatime
			phys:ApplyForceCenter( Gravity * 1.5 * EntTable.TippingForceMul * z )
			phys:ApplyForceOffset( -Gravity * 3 * EntTable.TippingForceMul, Pod:GetPos() )
		end

		return vector_origin, vector_origin, SIM_NOTHING
	end

	local Steer = self:GetSteer()

	local VelL = self:WorldToLocal( self:GetPos() + phys:GetVelocity() )

	local ShouldIdle = self:ShouldPutFootDown()

	if ShouldIdle then
		Steer = self:GetEngineActive() and EntTable.LeanAngleIdle or EntTable.LeanAnglePark
		VelL.x = EntTable.MaxVelocity
	else
		ForceAngle.y = (math.Clamp( VelL.x * self:GetBrake() * EntTable.PhysicsRollMul, -EntTable.WheelBrakeForce, EntTable.WheelBrakeForce ) - self:GetThrottle() * self:GetEngineTorque() * 0.01) * EntTable.PhysicsPitchInvertForceMul
	end

	local Mul = (self:GetUp().z > 0.5 and 1 or 0) * 50 * (math.min( math.abs( VelL.x ) / EntTable.PhysicsWheelGyroSpeed, 1 ) ^ 2) * EntTable.PhysicsWheelGyroMul
	local Diff = (Steer - self:GetAngles().r)

	ForceAngle.x = (Diff * 2.5 * EntTable.PhysicsRollMul - phys:GetAngleVelocity().x * EntTable.PhysicsDampingRollMul) * Mul

	if ShouldIdle and math.abs( Diff ) > 1 then
		simulate = SIM_GLOBAL_ACCELERATION
	end

	local WheelSideForce = EntTable.WheelSideForce * EntTable.ForceLinearMultiplier * 0.5
	local ForceLinear = Vector(0,0,0)
	local SpeedMul = math.Clamp( phys:GetVelocity():Length() / EntTable.MaxVelocity, 0, 1 )

	for id, wheel in pairs( self:GetWheels() ) do
		if wheel:IsHandbrakeActive() or not wheel:PhysicsOnGround() then continue end

		local AxleAng = wheel:GetDirectionAngle()
	
		local Forward = AxleAng:Forward()
		local Right = AxleAng:Right()
		local Up = AxleAng:Up()

		local wheelPos = wheel:GetPos()
		local wheelVel = phys:GetVelocityAtPoint( wheelPos )
		local wheelRadius = wheel:GetRadius()

		local Slip = math.Clamp(1 - self:AngleBetweenNormal( Forward, wheelVel:GetNormalized() ) / 90,0,1)

		local ForwardVel = self:VectorSplitNormal( Forward, wheelVel )

		Force = -Right * self:VectorSplitNormal( Right, wheelVel ) * WheelSideForce * Slip
		local wSideForce, wAngSideForce = phys:CalculateVelocityOffset( Force, wheelPos )

		ForceAngle:Add( Vector(wAngSideForce.x * 8 * SpeedMul,0,wAngSideForce.z) )
		ForceLinear:Add( wSideForce )
	end

	return ForceAngle, ForceLinear, simulate
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