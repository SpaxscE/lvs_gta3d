include("shared.lua")

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