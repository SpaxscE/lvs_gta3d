AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")
include("sv_pds.lua") -- include physics damage system lua file


function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-16,18,-20), Angle(0,-90,0) )
	DriverSeat.ExitPos = Vector(-5,80,-20)

	local RFSeat = self:AddPassengerSeat( Vector(4,-20,-15), Angle(0,-90,20) )
	RFSeat.ExitPos = Vector(-5,-80,-20)
	
	local LRSeat = self:AddPassengerSeat( Vector(-35,20,-15), Angle(0,-90,20) )
	LRSeat.ExitPos = Vector(-50,80,-20)
	
	local RRSeat = self:AddPassengerSeat( Vector(-35,-20,-15), Angle(0,-90,20) )
	RRSeat.ExitPos = Vector(-50,-80,-20)


	self:AddEngine( Vector(70,0,0) ) -- add a engine. This is used for sounds and effects and is required to get accurate RPM for the gauges.

	local LFDoorHandler = self:AddDoorHandler( "!door_lf", Vector(35,45,-20), Angle(0,180,0), Vector(0,0,0), Vector(50,15,50), Vector(0,-40,0), Vector(50,15,50) )
	LFDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	LFDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	LFDoorHandler:LinkToSeat( DriverSeat )
	LFDoorHandler:DisableOnBodyGroup( 6, 3 )
	
	local RFDoorHandler = self:AddDoorHandler( "!door_rf", Vector(35,-45,-20), Angle(0,180,0), Vector(0,-15,0), Vector(50,0,50), Vector(0,-15,0), Vector(50,40,50) )
	RFDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	RFDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	RFDoorHandler:LinkToSeat( RFSeat )
	RFDoorHandler:DisableOnBodyGroup( 7, 3 )
	
	local LRDoorHandler = self:AddDoorHandler( "!door_lr", Vector(-15,45,-20), Angle(0,180,0), Vector(0,0,0), Vector(45,15,50), Vector(0,-35,0), Vector(45,15,50) )
	LRDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	LRDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	LRDoorHandler:LinkToSeat( LRSeat )
	LRDoorHandler:DisableOnBodyGroup( 8, 3 )
	
	local RRDoorHandler = self:AddDoorHandler( "!door_rr", Vector(-15,-45,-20), Angle(0,180,0), Vector(0,-15,0), Vector(45,0,50), Vector(0,-15,0), Vector(45,35,50) )
	RRDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	RRDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	RRDoorHandler:LinkToSeat( RRSeat )
	RRDoorHandler:DisableOnBodyGroup( 9, 3 )
	
	local BonnetHandler = self:AddDoorHandler( "!bonnet", Vector(30,0,2), Angle(0,0,0), Vector(0,-35,0), Vector(65,35,12), Vector(0,-35,0), Vector(65,35,45) )
	BonnetHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	BonnetHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	BonnetHandler:DisableOnBodyGroup( 2, 3 )
	
	local TrunkHandler = self:AddDoorHandler( "!boot", Vector(-73,0,3), Angle(0,180,0), Vector(0,-35,0), Vector(35,35,8), Vector(0,-35,0), Vector(35,35,30) )
	TrunkHandler:SetSoundOpen( "lvs/vehicles/generic/car_trunk_open.wav" )
	TrunkHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	TrunkHandler:DisableOnBodyGroup( 3, 3 )

	self:AddFuelTank( Vector(-74,40,5), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )


	local WheelModel = "models/diggercars/gtasa/shared/wheel_admiral.mdl"

	local WheelFrontLeft = self:AddWheel( { pos = Vector(65.97,34.51,-17.48), mdl = WheelModel, mdl_ang = Angle(0,-90,0) } )
	local WheelFrontRight = self:AddWheel( { pos = Vector(65.97,-34.51,-17.48), mdl = WheelModel, mdl_ang = Angle(0,90,0) } )

	local WheelRearLeft = self:AddWheel( { pos = Vector(-66.22,34.51,-17.48), mdl = WheelModel, mdl_ang = Angle(0,-90,0) } )
	local WheelRearRight = self:AddWheel( { pos = Vector(-66.22,-34.51,-17.48), mdl = WheelModel, mdl_ang = Angle(0,90,0) } )

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
			TorqueFactor = 1,
			BrakeFactor = 1,
		},
		Wheels = { WheelFrontLeft, WheelFrontRight },
		Suspension = SuspensionSettings,
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_NONE,
			TorqueFactor = 0,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { WheelRearLeft, WheelRearRight },
		Suspension = SuspensionSettings,
	} )

	-- call physics damage system in sv_pds.lua
	self:CreatePDS()
end


function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "gta3d/share/engine_start.wav" )
	end
end