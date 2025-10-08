AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")
include("sv_pds.lua")

function ENT:OnSpawn( PObj )
	self:AddExhaustByAttachment( "exh" )

	local att_eng = self:GetAttachment( self:LookupAttachment( "eng" ) )
	local att_fuel = self:GetAttachment( self:LookupAttachment( "fuel" ) )

	local att_seat1 = self:GetAttachment( self:LookupAttachment( "driver" ) )
	local att_seat2 = self:GetAttachment( self:LookupAttachment( "pass_fr" ) )

	local att_wheel_fl = self:GetAttachment( self:LookupAttachment( "w_fl" ) )
	local att_wheel_fr = self:GetAttachment( self:LookupAttachment( "w_fr" ) )
	local att_wheel_rl = self:GetAttachment( self:LookupAttachment( "w_rl" ) )
	local att_wheel_rr = self:GetAttachment( self:LookupAttachment( "w_rr" ) )

	local DriverSeat = self:AddDriverSeat( self:WorldToLocal( att_seat1.Pos ) + Vector(-15,0,-13), self:WorldToLocalAngles( att_seat1.Ang) + Angle(0,-90,-90) )
	local RFSeat = self:AddPassengerSeat( self:WorldToLocal( att_seat2.Pos ) + Vector(-5,0,-6), self:WorldToLocalAngles( att_seat2.Ang ) + Angle(0,-90,-90) )

	local pos, ang, mins, maxs = self:GetBoneInfo( "dfl" )
	local LFDoorHandler = self:AddDoorHandler( "left_door", pos, ang, mins, maxs, mins, maxs )
	LFDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	LFDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	LFDoorHandler:LinkToSeat( DriverSeat )
	LFDoorHandler:DisableOnBodyGroup( 6, 3 )

	local pos, ang, mins, maxs = self:GetBoneInfo( "dfr" )
	local RFDoorHandler = self:AddDoorHandler( "right_door", pos, ang, mins, maxs, mins, maxs )
	RFDoorHandler:SetSoundOpen( "gta3d/doors/door_gen_open.wav" )
	RFDoorHandler:SetSoundClose( "gta3d/doors/door_gen_close.wav" )
	RFDoorHandler:LinkToSeat( RFSeat )
	RFDoorHandler:DisableOnBodyGroup( 5, 3 )

	local pos, ang, mins, maxs = self:GetBoneInfo( "bonnet" )
	local DoorHandler = self:AddDoorHandler( "hood", pos, ang, mins, maxs, mins, maxs )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:DisableOnBodyGroup( 1, 3 )
	local Engine = self:AddEngine( self:WorldToLocal( att_eng.Pos ) )
	Engine:SetDoorHandler( DoorHandler )

	local pos, ang, mins, maxs = self:GetBoneInfo( "boot" )
	local TrunkHandler = self:AddDoorHandler( "trunk", pos, ang, mins, maxs, mins, maxs )
	TrunkHandler:SetSoundOpen( "lvs/vehicles/generic/car_trunk_open.wav" )
	TrunkHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	TrunkHandler:DisableOnBodyGroup( 2, 3 )

	self:AddFuelTank( self:WorldToLocal( att_fuel.Pos ), self:WorldToLocalAngles( att_fuel.Ang ) + Angle(0,0,90), 600, LVS.FUELTYPE_PETROL )

	local WheelModel = "models/diggercars/gtasa/shared/wheel_picador.mdl"

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
		Wheels = {
			self:AddWheel( { pos = self:WorldToLocal( att_wheel_fl.Pos ), mdl = WheelModel, mdl_ang = self:WorldToLocalAngles( att_wheel_fl.Ang ) + Angle(90,-90,0) } ),
			self:AddWheel( { pos = self:WorldToLocal( att_wheel_fr.Pos ), mdl = WheelModel, mdl_ang = self:WorldToLocalAngles( att_wheel_fr.Ang ) + Angle(90,-90,0) } ),
		},
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
		Wheels = {
			self:AddWheel( { pos = self:WorldToLocal( att_wheel_rl.Pos ), mdl = WheelModel, mdl_ang = self:WorldToLocalAngles( att_wheel_rl.Ang ) + Angle(90,-90,0) } ),
			self:AddWheel( { pos = self:WorldToLocal( att_wheel_rr.Pos ), mdl = WheelModel, mdl_ang = self:WorldToLocalAngles( att_wheel_rr.Ang ) + Angle(90,-90,0) } ),
		},
		Suspension = SuspensionSettings,
	} )

	self:CreatePDS()
end


function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "gta3d/share/engine_start.wav" )
	end
end