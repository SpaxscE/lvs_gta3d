
ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "[LVS] San Andreas Base"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Boats"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.FloatHeight = 0
ENT.FloatForce = 20
ENT.FloatWaveFrequency = 5

ENT.TurnRate = 5
ENT.TurnForceYaw = 600
ENT.TurnForceRoll = 400

ENT.MaxThrust = 1000

ENT.MaxVelocity = 1000
ENT.MaxVelocityReverse = 350

ENT.ForceLinearMultiplier = 1
ENT.ForceAngleMultiplier = 1

function ENT:GetVehicleType()
	return "boat"
end

function ENT:UpdateAnimation( ply, velocity, maxseqgroundspeed )
	ply:SetPlaybackRate( 1 )

	if CLIENT then
		if ply == self:GetDriver() then
			ply:SetPoseParameter( "vehicle_steer", -self:GetSteer() )
			ply:InvalidateBoneCache()
		end

		GAMEMODE:GrabEarAnimation( ply )
		GAMEMODE:MouthMoveAnimation( ply )
	end

	return false
end
