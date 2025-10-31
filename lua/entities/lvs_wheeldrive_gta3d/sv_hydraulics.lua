
function ENT:UpdateHydraulics( ply, cmd )
	if not self._HydraulicControlers then return end

	
	local all = ply:lvsKeyDown( "GTA3D_HYDRAULIC" )

	if self._HydToggleAll ~= all then
		self._HydToggleAll = all

		if all then
			self._HydToggleHeight = not self._HydToggleHeight
		end
	end

	local HeightAll = self._HydToggleHeight and 1 or 0
	local Invert = self._HydToggleHeight and -1 or 1

	local FRONT = ply:lvsKeyDown( "GTA3D_HYDRAULIC_FRONT" )
	local REAR = ply:lvsKeyDown( "GTA3D_HYDRAULIC_REAR" )
	local LEFT = ply:lvsKeyDown( "GTA3D_HYDRAULIC_LEFT" )
	local RIGHT = ply:lvsKeyDown( "GTA3D_HYDRAULIC_RIGHT" )

	local FL = (FRONT or LEFT) and Invert or 0
	local FR = (FRONT or RIGHT) and Invert or 0
	local RL = (REAR or LEFT) and Invert or 0
	local RR = (REAR or RIGHT) and Invert or 0

	local HeightType = {
		[""] = HeightAll,
		["fl"] = HeightAll + FL,
		["fr"] = HeightAll + FR,
		["rl"] = HeightAll + RL,
		["rr"] = HeightAll + RR,
	}

	for _, control in ipairs( self._HydraulicControlers ) do
		local curHeight = control:GetHeight()
		local desHeight = HeightType[ control:GetType() ]

		if curHeight == desHeight then continue end

		control:SetHeight( desHeight )
	end
end

local HYD = {}
HYD.__index = HYD
function HYD:Initialize()
end
function HYD:GetHeight()
	if not IsValid( self._WheelEntity ) then return 0 end

	return self._WheelEntity:GetSuspensionHeight()
end
function HYD:SetHeight( new )
	if not IsValid( self._WheelEntity ) then return end

	self._WheelEntity:SetSuspensionHeight( new )
end
function HYD:GetType()
	return self._WheelType
end

function ENT:CreateHydraulicControler( type, wheel )
	if not istable( self._HydraulicControlers ) then
		self._HydraulicControlers = {}
	end

	local controller = {}

	setmetatable( controller, HYD )

	controller._BaseEntity = self
	controller._WheelEntity = wheel
	controller._WheelType = type or ""
	controller:Initialize()

	table.insert( self._HydraulicControlers, controller )
end
