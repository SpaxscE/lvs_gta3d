include("shared.lua")

function ENT:UpdatePoseParameters( steer, brake )
	self:SetPoseParameter( "vehicle_steer", steer )
	self:SetPoseParameter( "brake_pedal", brake )
	self:SetPoseParameter( "vehicle_wheel_r_spin", 180 + (self._PedalAngle or 0) - self:GetBrake() * 45 )
end

function ENT:OnEngineActiveChanged( Active )
end

local angle_zero = Angle(0,0,0)

function ENT:GetPlayerBoneManipulation( ply, PodID )
	if PodID ~= 1 then return self.PlayerBoneManipulate[ PodID ] or {} end

	local Pose = table.Copy( self.PlayerBoneManipulate[ PodID ] or {} )

	local PedalAngle = self:CalcBikePedalPosition( 10 )

	local StartValue = 0
	while StartValue < PedalAngle do
		StartValue = StartValue + 45
	end

	StartValue = math.max( StartValue - 45, 0 )

	local EndValue = StartValue + 45
	if EndValue > 315 then
		EndValue = 0
	end

	local StartBoneManip = self.DriverBoneManipulateDrive[ StartValue ]
	local EndBoneManip = self.DriverBoneManipulateDrive[ EndValue ]

	local Progression = (PedalAngle % 45) / 45

	local P = math.cos( math.rad( PedalAngle ) ) * 3
	local Y = math.sin( math.rad( PedalAngle ) ) * 3

	Pose["ValveBiped.Bip01_Pelvis"] = Angle(0,Y,23 + P)
	Pose["ValveBiped.Bip01_Spine"] = Angle(-Y,-P,0)
	Pose["ValveBiped.Bip01_Spine1"] = Angle(-Y * 0.1,0,0)

	for bone, EndAngle in pairs( EndBoneManip ) do
		local StartAngle = StartBoneManip[ bone ]

		Pose[ bone ] = LerpAngle( Progression, StartAngle, EndAngle )
	end

	local TargetValue = self:ShouldPutFootDown() and 1 or 0

	local Rate = math.min( FrameTime() * 4, 1 )

	ply._smlvsBikerFoot = ply._smlvsBikerFoot and (ply._smlvsBikerFoot + (TargetValue - ply._smlvsBikerFoot) * Rate) or 0

	local CurValue = ply._smlvsBikerFoot ^ 2

	local BoneManip = self.DriverBoneManipulateIdle

	for bone, EndAngle in pairs( BoneManip or {} ) do
		local StartAngle = Pose[ bone ] or angle_zero

		Pose[ bone ] = LerpAngle( CurValue, StartAngle, EndAngle )
	end

	return Pose or {}
end