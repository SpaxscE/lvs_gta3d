DEFINE_BASECLASS( "lvs_wheeldrive_gta3d" )

ENT.CameraDistanceHooked = 1.4

function ENT:OnTick()
	self:UpdateHookCollider()

	if not self._smHooker then self._smHooker = 0 end

	local target = self._CurHookPos or 0
	local rate =  FrameTime()
	local delta = math.Clamp(target - self._smHooker,-rate,rate)

	self._smHooker = self._smHooker + delta

	local Moving = delta ~= 0

	if self._oldHookMoving ~= Moving then
		self._oldHookMoving = Moving

		if Moving then
			self:HookColliderStartMoving()
		else
			self:HookColliderStopMoving()
		end
	end

	if not Moving then return end

	self:SetPoseParameter( "control", self._smHooker )
end

function ENT:StartCommand( ply, cmd )
	BaseClass.StartCommand( self, ply, cmd )

	if self:GetDriver() ~= ply then return end

	local wheel = cmd:GetMouseWheel()

	if wheel == 0 then return end

	if ply:lvsKeyDown( "VIEWDIST" ) then return end

	self:MoveHook( wheel )
end

function ENT:MoveHook( wheel )
	if not self._CurHookPos then self._CurHookPos = 0 end

	local new = math.Clamp( self._CurHookPos - wheel * 0.1,0,1)
	local old = self._CurHookPos

	self._CurHookPos = new

	local delta = old - new

	if delta == 0 then return end

	if delta > 0 then
		self:OnHookMoveUp( old, new )

		return
	end

	self:OnHookMoveDown( old, new )
end

function ENT:OnHookMoveUp( old, new )
	local att = self:GetAttachment( self:LookupAttachment( "hook" ) )

	if not att then return end

	local startpos = att.Pos
	local endpos = startpos + self:GetUp() * 10

	local trace = util.TraceLine( {
		start = startpos,
		endpos = endpos,
		filter = self:GetCrosshairFilterEnts(),
	} )

	if old ~= 1 then return end

	local target = trace.Entity

	if not self:HookEntityIsValid( trace.HitPos, target ) then return end

	self:CreateHookCollider( att.Pos, att.Ang, target )
end

function ENT:OnHookMoveDown( old, new )
	if new ~= 1 then return end

	self:RemoveHookCollider()
end

function ENT:HookEntityIsValid( pos, entity )
	if not IsValid( entity ) then return false end

	local hasBone = false
	local toTargetDist = 40
	local isTargetValid = false

	for _, boneName in pairs( {"fb","rb"} ) do
		local boneIndex = entity:LookupBone( boneName )

		if not boneIndex then continue end

		hasBone = true

		local bonePos, _ = entity:GetBonePosition( boneIndex )
		local dist = (pos - bonePos):Length()

		if dist > toTargetDist then continue end

		toTargetDist = dist
		isTargetValid = true

		break
	end

	if not hasBone then return true end

	return isTargetValid
end

function ENT:CreateHookCollider( pos, ang, target )
	if not IsValid( target ) then return end

	local collider = ents.Create( "lvs_wheeldrive_gta3d_physicsshadow" )
	collider:SetPos( pos )
	collider:SetAngles( ang )
	collider:Spawn()
	collider:Activate()
	collider.Target = target
	collider:EmitSound("doors/door_metal_medium_open1.wav")

	self:DeleteOnRemove( collider )
	self:TransferCPPI( collider )

	self._HookColliderPhysObj = collider:GetPhysicsObject()
	self._HookCollider = collider

	local ballsocket = constraint.Ballsocket( target, collider, 0, 0, vector_origin )

	if not ballsocket then return end

	self:TransferCPPI( ballsocket )

	local pod = self:GetDriverSeat()

	if not IsValid( pod ) then return end

	self._OldCameraDistance = pod:GetCameraDistance()

	pod:SetCameraDistance( math.max( self._OldCameraDistance, self.CameraDistanceHooked ) )
end

function ENT:RemoveHookCollider()
	if not IsValid( self._HookCollider ) then return end

	local target = self._HookCollider.Target
	if IsValid( target ) then
		target:PhysWake()
	end

	self._HookCollider:EmitSound("ambient/machines/catapult_throw.wav")
	self._HookCollider:Remove()

	local pod = self:GetDriverSeat()

	if not IsValid( pod ) or not self._OldCameraDistance then return end

	pod:SetCameraDistance( self._OldCameraDistance )

	self._OldCameraDistance = nil
end

function ENT:UpdateHookCollider()
	local att = self:GetAttachment( self:LookupAttachment( "hook" ) )

	if not att or not IsValid( self._HookCollider ) then return end

	local PhysObj = self._HookColliderPhysObj
	if IsValid( PhysObj ) and not PhysObj:IsMotionEnabled() then
		PhysObj:EnableMotion( true )
	end

	local Pos = att.Pos
	local Ang = att.Ang

	if self.HookPos then
		Pos = self:LocalToWorld( self.HookPos )
	end
	if self.HookAng then
		Ang = self:LocalToWorldAngles( self.HookAng )
	end

	self._HookCollider:PhysicsUpdateShadow( Pos, Ang )

	local target = self._HookCollider.Target

	if not IsValid( target ) then return end

	target:PhysWake()

	if target.GetActive and target:GetActive() then return end

	if not target.ReleaseHandbrake or not target.IsHandbrakeActive then return end

	target:ReleaseHandbrake()
end

function ENT:HookColliderStartMoving()
	self:EmitSound("vehicles/tank_turret_start1.wav",75,45,0.3,CHAN_WEAPON)

	self.HookPos = nil
	self.HookAng = nil
end

function ENT:HookColliderStopMoving()
	self:EmitSound("items/ammocrate_close.wav",75,100,0.3,CHAN_WEAPON)

	local att = self:GetAttachment( self:LookupAttachment( "hook" ) )

	if not att then return end

	self.HookPos = self:WorldToLocal( att.Pos )
	self.HookAng = self:WorldToLocalAngles( att.Ang )
end
