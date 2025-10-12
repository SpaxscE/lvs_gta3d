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

	self._CurHookPos = math.Clamp( self._CurHookPos - wheel * 0.1,0,1)

	self:SetPoseParameter( "control", self._CurHookPos )
end