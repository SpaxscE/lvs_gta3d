AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")
include("sv_pds.lua") -- include physics damage system lua file


function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-15,20,-23), Angle(0,-90,0) )
	DriverSeat.ExitPos = Vector(-25,80,-20)

	local RFSeat = self:AddPassengerSeat( Vector(5,-20,-15), Angle(0,-90,20) )
	RFSeat.ExitPos = Vector(-25,-80,-20)


	self:AddEngine( Vector(70,0,0) )
	
	local LFDoorHandler = self:AddDoorHandler( "!door_lf", Vector(40,45,-20), Angle(0,180,0), Vector(0,0,0), Vector(70,15,40), Vector(0,-50,0), Vector(70,15,40) )
	LFDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	LFDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	LFDoorHandler:LinkToSeat( DriverSeat )
	LFDoorHandler:DisableOnBodyGroup( 4, 3 )
	
	local RFDoorHandler = self:AddDoorHandler( "!door_rf", Vector(40,-45,-20), Angle(0,180,0), Vector(0,-15,0), Vector(70,0,40), Vector(0,-15,0), Vector(70,50,40) )
	RFDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	RFDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	RFDoorHandler:LinkToSeat( RFSeat )
	RFDoorHandler:DisableOnBodyGroup( 5, 3 )
	
	local BonnetHandler = self:AddDoorHandler( "!bonnet", Vector(50,0,-3), Angle(0,0,0), Vector(0,-25,0), Vector(50,25,12), Vector(0,-25,0), Vector(50,25,45) )
	BonnetHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	BonnetHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	BonnetHandler:DisableOnBodyGroup( 1, 3 )

	self:AddFuelTank( Vector(-80,-41,4), Angle(0,0,0), 550, LVS.FUELTYPE_PETROL )


	local WheelModel = "models/diggercars/gtasa/shared/wheel_banshee.mdl"

	local WheelFrontLeft = self:AddWheel( { pos = Vector(65.1,36.29,-13.3), mdl = WheelModel, mdl_ang = Angle(0,-90,0) } )
	local WheelFrontRight = self:AddWheel( { pos = Vector(65.1,-36.29,-13.3), mdl = WheelModel, mdl_ang = Angle(0,90,0) } )

	local WheelRearLeft = self:AddWheel( { pos = Vector(-65.1,36.29,-13.3), mdl = WheelModel, mdl_ang = Angle(0,-90,0) } )
	local WheelRearRight = self:AddWheel( { pos = Vector(-65.1,-36.29,-13.3), mdl = WheelModel, mdl_ang = Angle(0,90,0) } )

	local SuspensionSettings = {
		Height = 8,
		MaxTravel = 9,
		ControlArmLength = 25,
		SpringConstant = 20000,
		SpringDamping = 1000,
		SpringRelativeDamping = 1000,
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
	
	-- call physics damage system in sv_pds.lua
	self:CreatePDS()
end


function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "gta3d/share/engine_start.wav" )
	end
end