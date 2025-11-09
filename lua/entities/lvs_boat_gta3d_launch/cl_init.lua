include("shared.lua")

function ENT:CalcViewPassenger( ply, pos, angles, fov, pod )
	if pod == self:GetGunnerSeat() then
		local view = {}
		view.origin = pos
		view.angles = angles
		view.fov = fov
		view.drawviewer = false

		if not pod:GetThirdPersonMode() then
			view.origin = view.origin + angles:Up() * 10

			return view
		end

		local mn = self:OBBMins()
		local mx = self:OBBMaxs()
		local radius = ( mn - mx ):Length()
		local radius = radius + radius * pod:GetCameraDistance()

		local clamped_angles = pod:WorldToLocalAngles( angles )
		clamped_angles.p = math.max( clamped_angles.p, 0 )
		clamped_angles = pod:LocalToWorldAngles( clamped_angles )

		local StartPos = pos
		local EndPos = StartPos - clamped_angles:Forward() * radius + clamped_angles:Up() * (radius * pod:GetCameraHeight())

		local WallOffset = 4

		local tr = util.TraceHull( {
			start = StartPos,
			endpos = EndPos,
			filter = function( e )
				local c = e:GetClass()
				local collide = not c:StartWith( "prop_physics" ) and not c:StartWith( "prop_dynamic" ) and not c:StartWith( "prop_ragdoll" ) and not e:IsVehicle() and not c:StartWith( "gmod_" ) and not c:StartWith( "lvs_" ) and not c:StartWith( "player" ) and not e.LVS

				return collide
			end,
			mins = Vector( -WallOffset, -WallOffset, -WallOffset ),
			maxs = Vector( WallOffset, WallOffset, WallOffset ),
		} )

		view.angles = angles + Angle(5,0,0)
		view.origin = tr.HitPos + pod:GetUp() * 65
		view.drawviewer = true

		if tr.Hit and  not tr.StartSolid then
			view.origin = view.origin + tr.HitNormal * WallOffset
		end

		return view
	end

	return LVS:CalcView( self, ply, pos, angles, fov, pod )
end

function ENT:OnFrame()
	local EntTable = self:GetTable()
	local Steer = self:GetSteer()

	self:ManipulateBoneAngles( 1, Angle(0,Steer * 60,0) )

	local Engine = self:GetEngine()

	if not IsValid( Engine ) then return end

	local RPM = Engine:GetRPM()

	EntTable._rRPM = EntTable._rRPM and (EntTable._rRPM + RPM *  RealFrameTime()) or 0

	local Rot = Angle(0,EntTable._rRPM,0)
	Rot:Normalize() 

	self:ManipulateBoneAngles( 5, Rot )
	self:ManipulateBoneAngles( 6, -Rot )
end

ENT.ClearWaterMask = true
ENT.ClearWaterMaskPos = Vector(70,0,30)
ENT.ClearWaterMaskAng = Angle(0,0,-1)
ENT.ClearWaterMaskOBB = {
	xmin = -200,
	xmax = 200,
	ymin = 40,
	ymax = -80,
}

function ENT:PostDrawTranslucent( flags )
	local EntTable = self:GetTable()

	if not EntTable.ClearWaterMask then return end

	render.ClearStencil()
	render.SetStencilEnable( true )
	render.SetStencilCompareFunction( STENCIL_ALWAYS )
	render.SetStencilPassOperation( STENCIL_REPLACE )
	render.SetStencilFailOperation( STENCIL_KEEP )
	render.SetStencilZFailOperation( STENCIL_KEEP )
	render.SetStencilWriteMask( 1 )
	render.SetStencilTestMask( 1 )
	render.SetStencilReferenceValue( 1 )

	cam.Start3D2D( self:LocalToWorld( EntTable.ClearWaterMaskPos ), self:LocalToWorldAngles( EntTable.ClearWaterMaskAng ), 1 )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawRect( EntTable.ClearWaterMaskOBB.xmin, EntTable.ClearWaterMaskOBB.ymin, EntTable.ClearWaterMaskOBB.xmax, EntTable.ClearWaterMaskOBB.ymax )
	cam.End3D2D()

	render.SetStencilCompareFunction( STENCIL_EQUAL )
	render.ClearBuffersObeyStencil( 0,0,0,0, true )

	render.OverrideAlphaWriteEnable( true, 255 )

	self:DrawModel()

	for _, ply in pairs( self:GetEveryone() ) do
		ply:DrawModel()
	end

	render.OverrideAlphaWriteEnable( false, 255 )

	render.SetStencilEnable( false )

end