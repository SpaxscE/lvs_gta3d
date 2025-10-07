AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")
include("sv_pds.lua") -- include physics damage system lua file


function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-6,21,0), Angle(0,-90,0) )
	DriverSeat.ExitPos = Vector(-5,80,0)

	local RFSeat = self:AddPassengerSeat( Vector(10,-21,9), Angle(0,-90,20) )
	RFSeat.ExitPos = Vector(-5,-80,0)
	
	local LRSeat = self:AddPassengerSeat( Vector(-27,21,9), Angle(0,-90,20) )
	LRSeat.ExitPos = Vector(-50,80,0)
	
	local RRSeat = self:AddPassengerSeat( Vector(-27,-21,9), Angle(0,-90,20) )
	RRSeat.ExitPos = Vector(-50,-80,0)

	local LFDoorHandler = self:AddDoorHandler( "left_door", Vector(45,45,0), Angle(0,180,0), Vector(0,0,0), Vector(50,15,50), Vector(0,-40,0), Vector(50,15,50) )
	LFDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	LFDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	LFDoorHandler:LinkToSeat( DriverSeat )
	LFDoorHandler:DisableOnBodyGroup( 6, 3 )
	
	local RFDoorHandler = self:AddDoorHandler( "right_door", Vector(45,-45,0), Angle(0,180,0), Vector(0,-15,0), Vector(50,0,50), Vector(0,-15,0), Vector(50,40,50) )
	RFDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	RFDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	RFDoorHandler:LinkToSeat( RFSeat )
	RFDoorHandler:DisableOnBodyGroup( 5, 3 )
	
	local LRDoorHandler = self:AddDoorHandler( "rear_left_door", Vector(-5,45,0), Angle(0,180,0), Vector(0,0,0), Vector(45,15,50), Vector(0,-35,0), Vector(45,15,50) )
	LRDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	LRDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	LRDoorHandler:LinkToSeat( LRSeat )
	LRDoorHandler:DisableOnBodyGroup( 8, 3 )
	
	local RRDoorHandler = self:AddDoorHandler( "rear_right_door", Vector(-5,-45,0), Angle(0,180,0), Vector(0,-15,0), Vector(45,0,50), Vector(0,-15,0), Vector(45,35,50) )
	RRDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	RRDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	RRDoorHandler:LinkToSeat( RRSeat )
	RRDoorHandler:DisableOnBodyGroup( 7, 3 )
	
	local DoorHandler = self:AddDoorHandler( "hood", Vector(40,0,22), Angle(0,0,0), Vector(0,-35,0), Vector(65,35,12), Vector(0,-35,0), Vector(65,35,45) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:DisableOnBodyGroup( 1, 3 )
	local Engine = self:AddEngine( Vector(64.6,0,22) )
	Engine:SetDoorHandler( DoorHandler )
	
	local TrunkHandler = self:AddDoorHandler( "trunk", Vector(-83,0,25), Angle(0,180,0), Vector(0,-35,0), Vector(35,35,8), Vector(0,-35,0), Vector(35,35,30) )
	TrunkHandler:SetSoundOpen( "lvs/vehicles/generic/car_trunk_open.wav" )
	TrunkHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	TrunkHandler:DisableOnBodyGroup( 2, 3 )

	self:AddFuelTank( Vector(-74,40,5), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )


	local WheelModel = "models/diggercars/gtasa/shared/wheel_glendale.mdl"

	local WheelFrontLeft = self:AddWheel( { pos = Vector(71.68,36.45,6), mdl = WheelModel, mdl_ang = Angle(0,-90,0) } )
	local WheelFrontRight = self:AddWheel( { pos = Vector(71.68,-36.45,6), mdl = WheelModel, mdl_ang = Angle(0,90,0) } )

	local WheelRearLeft = self:AddWheel( { pos = Vector(-71.36,36.45,6), mdl = WheelModel, mdl_ang = Angle(0,-90,0) } )
	local WheelRearRight = self:AddWheel( { pos = Vector(-71.36,-36.45,6), mdl = WheelModel, mdl_ang = Angle(0,90,0) } )

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