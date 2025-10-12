DEFINE_BASECLASS( "lvs_wheeldrive_gta3d" )

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

	self:SetPoseParameter( "control", self._CurHookPos )

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