AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")
include("sv_controls.lua")


function ENT:SpawnFunction( ply, tr, ClassName )

	local startpos = ply:GetShootPos()
	local endpos = startpos + ply:GetAimVector() * 10000

	local waterTrace = util.TraceLine( {
		start = startpos,
		endpos = endpos,
		mask = MASK_WATER,
		filter = ply
	} )

	if waterTrace.Hit then
		tr = waterTrace
	end

	if not tr.Hit then return end

	local ent = ents.Create( ClassName )
	ent:StoreCPPI( ply )
	ent:SetPos( tr.HitPos + tr.HitNormal * ent.SpawnNormalOffset )
	ent:SetAngles( Angle(0, ply:EyeAngles().y, 0 ) )
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:RunAI()
end

local up = Vector(0,0,1)
local down = Vector(0,0,-1)
function ENT:PhysicsSimulate( phys, deltatime )

	if self:GetEngineActive() then phys:Wake() end

	local pos = phys:LocalToWorld( phys:GetMassCenter() )

	local traceSky = util.TraceLine( {
		start = pos,
		endpos = pos + up * 50000,
		filter = self:GetCrosshairFilterEnts()
	} )

	local traceData = {
		start = traceSky.HitPos,
		endpos = pos + down * 50000,
		filter = self:GetCrosshairFilterEnts()
	}

	local traceSoil = util.TraceLine( traceData )
	traceData.mask = MASK_WATER
	local traceWater = util.TraceLine( traceData )

	local BuoyancyForce = math.min( math.max( traceWater.HitPos.z - pos.z + self.FloatHeight, 0 ), 10 )

	if not traceWater.Hit or BuoyancyForce == 0 then return vector_origin, vector_origin, SIM_NOTHING end

	local Grav = physenv.GetGravity()
	local Vel = phys:GetVelocity()
	local AngVel = phys:GetAngleVelocity()

	local mul = BuoyancyForce / 10
	local invmul = math.Clamp( 1 - mul, 0, 1 )

	local Force = (-Grav + Vector(0,0,-Vel.z * invmul * self.FloatForce)) * mul
	local ForcePos = pos + self:GetUp() * BuoyancyForce

	local ForceLinear, ForceAngle = phys:CalculateForceOffset( Force, ForcePos )

	ForceAngle = (ForceAngle - AngVel * invmul * 2) * 15 * self.ForceAngleMultiplier

	local Driver = self:GetDriver()

	if IsValid( Driver ) then
		local Thrust = self:GetThrust()
		local Steer = self:GetSteer()

		local VelL = self:WorldToLocal( self:GetPos() + Vel )

		local Pitch = -(math.max( math.cos( CurTime() * self.FloatWaveFrequency + self:EntIndex() * 1337 ), 0 ) * VelL.x * 0.25 + Thrust * 0.25 * math.Clamp( VelL.x / self.MaxVelocity,0,1))
		local Yaw = - AngVel.z + Steer * self.TurnForceYaw
		local Roll = - AngVel.x * 5 - Steer * self.TurnForceRoll

		ForceLinear:Add( self:GetForward() * Thrust + self:GetRight() * VelL.y * 0.5 )
		ForceAngle:Add( Vector(Roll,Pitch,Yaw) )
	end

	return ForceAngle, ForceLinear, SIM_GLOBAL_ACCELERATION
end
