AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")
include("sv_pds.lua") -- include physics damage system lua file


function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-20,20,-26), Angle(0,-90,0) )
	DriverSeat.ExitPos = Vector(-15,80,-20)

	local RFSeat = self:AddPassengerSeat( Vector(-3,-20,-20), Angle(0,-90,20) )
	RFSeat.ExitPos = Vector(-15,-80,-20)


	self:AddEngine( Vector(60,0,0) ) -- add a engine. This is used for sounds and effects and is required to get accurate RPM for the gauges.
	
	local LFDoorHandler = self:AddDoorHandler( "!door_lf", Vector(30,45,-20), Angle(0,180,0), Vector(0,0,0), Vector(55,15,40), Vector(0,-50,0), Vector(55,15,40) )
	LFDoorHandler:SetSoundOpen( "gta3d/doors/door_old_open.wav" )
	LFDoorHandler:SetSoundClose( "gta3d/doors/door_old_close.wav" )
	LFDoorHandler:LinkToSeat( DriverSeat )
	LFDoorHandler:DisableOnBodyGroup( 8, 3 )
	
	local RFDoorHandler = self:AddDoorHandler( "!door_rf", Vector(30,-45,-20), Angle(0,180,0), Vector(0,-15,0), Vector(55,0,40), Vector(0,-15,0), Vector(55,50,40) )
	RFDoorHandler:SetSoundOpen( "gta3d/doors/door_old_open.wav" )
	RFDoorHandler:SetSoundClose( "gta3d/doors/door_old_close.wav" )
	RFDoorHandler:LinkToSeat( RFSeat )
	RFDoorHandler:DisableOnBodyGroup( 9, 3 )
	
	local BonnetHandler = self:AddDoorHandler( "!bonnet", Vector(30,0,2), Angle(0,0,0), Vector(0,-35,0), Vector(65,35,12), Vector(0,-35,0), Vector(65,35,45) )
	BonnetHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	BonnetHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	BonnetHandler:DisableOnBodyGroup( 4, 3 )
	
	local TrunkHandler = self:AddDoorHandler( "!boot", Vector(-80,0,-5), Angle(0,180,0), Vector(0,-35,0), Vector(40,35,16), Vector(0,-35,0), Vector(40,35,40) )
	TrunkHandler:SetSoundOpen( "lvs/vehicles/generic/car_trunk_open.wav" )
	TrunkHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	TrunkHandler:DisableOnBodyGroup( 5, 3 )

	self:AddFuelTank( Vector(-65,40,3), Angle(0,0,0), 550, LVS.FUELTYPE_PETROL )


	local WheelModel = "models/gta3d/simf/wheel_blade.mdl"

	local WheelFrontLeft = self:AddWheel( { pos = Vector(66.43,34.2,-13.3), mdl = WheelModel, mdl_ang = Angle(0,90,0) } )
	local WheelFrontRight = self:AddWheel( { pos = Vector(66.43,-34.2,-13.3), mdl = WheelModel, mdl_ang = Angle(0,-90,0) } )

	local WheelRearLeft = self:AddWheel( { pos = Vector(-65.7,34.2,-13.3), mdl = WheelModel, mdl_ang = Angle(0,90,0) } )
	local WheelRearRight = self:AddWheel( { pos = Vector(-65.7,-34.2,-13.3), mdl = WheelModel, mdl_ang = Angle(0,-90,0) } )

	local SuspensionSettings = {
		Height = 6,
		MaxTravel = 7,
		ControlArmLength = 25,
		SpringConstant = 30000,
		SpringDamping = 2000,
		SpringRelativeDamping = 2000,
	}

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0,
			BrakeFactor = 1,
		},
		Wheels = { WheelFrontLeft, WheelFrontRight },
		Suspension = SuspensionSettings,
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_NONE,
			TorqueFactor = 1,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { WheelRearLeft, WheelRearRight },
		Suspension = SuspensionSettings,
	} )
	
	if ( ProxyColor ) then
		local ProxyColorPresets = {
			{Color(94,112,114), Color(245,245,245)},
			{Color(93,126,141), Color(245,245,245)},
			{Color(165,169,167), Color(155,159,157)},
			{Color(66,31,33), Color(155,159,157)},
			{Color(132,148,171), Color(245,245,245)},
			{Color(45,58,53), Color(245,245,245)},
			{Color(156,141,113), Color(155,159,157)},
			{Color(111,130,151), Color(155,159,157)},
		}
		
		self:SetProxyColor( ProxyColorPresets[math.random(1,8)] )
		self:SetColor(Color(255,255,255)) --remove the base color since we now have proxy colors
	end
	
	-- call physics damage system in sv_pds.lua
	self:CreatePDS()
end


function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "gta3d/share/engine_start.wav" )
	end
end