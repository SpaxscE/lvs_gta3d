DEFINE_BASECLASS( "lvs_wheeldrive_gta3d" )

function ENT:OnTick()

	if not self._smHooker then self._smHooker = 0 end

	local target = self._CurHookPos or 0
	local rate =  FrameTime()
	local delta = math.Clamp(target - self._smHooker,-rate,rate)

	self._smHooker = self._smHooker + delta

	local Moving = delta ~= 0

	if self._oldHookMoving ~= Moving then
		self._oldHookMoving = Moving

		if Moving then
			self:EmitSound("vehicles/tank_turret_start1.wav",75,45,0.3,CHAN_WEAPON)
		else
			self:EmitSound("items/ammocrate_close.wav",75,100,0.3,CHAN_WEAPON)
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
		self:OnHookMoveUp()

		return
	end

	self:OnHookMoveDown()
end

function ENT:OnHookMoveUp()
	local att = self:GetAttachment( self:LookupAttachment( "hook" ) )

	if not att then return end

	local startpos = att.Pos
	local endpos = startpos + self:GetUp() * 10

	local trace = util.TraceLine( {
		start = startpos,
		endpos = endpos,
		filter = self:GetCrosshairFilterEnts(),
	} )

	--fb, rb
	--Entity:LookupBone( string boneName )
	--Vector, Angle Entity:GetBonePosition( number boneIndex )
	--PrintChat("up")
end

function ENT:OnHookMoveDown()
	--PrintChat("down")
end