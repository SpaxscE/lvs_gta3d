DEFINE_BASECLASS( "lvs_wheeldrive_gta3d" )

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

	if not self:HookEntityIsValid( trace.Entity ) then return end

	local collider = self:CreateHookCollider( startpos )

	--constraint.Ballsocket( Entity ent1, Entity ent2, number bone1, number bone2, Vector localPos, number forcelimit = 0, number torquelimit = 0, number nocollide = 0 )
end

function ENT:OnHookMoveDown( old, new )
	if new ~= 1 then return end

	self:RemoveHookCollider()
end

function ENT:HookEntityIsValid( entity )
	if not IsValid( entity ) then return false end

	local HasBone = false
	for _, boneName in pairs( {"fb","rb"} ) do
		local boneIndex = entity:LookupBone( boneName )

		if not boneIndex then continue end

		HasBone = true

		break
	end

	return HasBone
end

function ENT:CreateHookCollider( pos )
	local collider = ents.Create( "prop_physics" )
	collider:SetModel( "models/props_junk/PopCan01a.mdl" )
	collider:SetPos( pos )
	collider:Spawn()
	collider:SetCollisionGroup( COLLISION_GROUP_WORLD )
	self:DeleteOnRemove( collider )

	self._HookColliderPhysObj = collider:GetPhysicsObject()
	self._HookCollider = collider
end

function ENT:RemoveHookCollider()
	if not IsValid( self._HookCollider ) then return end

	self._HookCollider:Remove()
end

function ENT:UpdateHookCollider()
	local att = self:GetAttachment( self:LookupAttachment( "hook" ) )

	if not att or not IsValid( self._HookCollider ) then return end

	local PhysObj = self._HookColliderPhysObj
	if IsValid( PhysObj ) and PhysObj:IsMotionEnabled() then
		PhysObj:EnableMotion( false )
	end

	self._HookCollider:SetPos( att.Pos )
end

function ENT:HookColliderStartMoving()
	self:EmitSound("vehicles/tank_turret_start1.wav",75,45,0.3,CHAN_WEAPON)
end

function ENT:HookColliderStopMoving()
	self:EmitSound("items/ammocrate_close.wav",75,100,0.3,CHAN_WEAPON)
end
