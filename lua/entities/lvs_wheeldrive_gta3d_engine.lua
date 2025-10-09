AddCSLuaFile()

ENT.Base = "lvs_wheeldrive_engine"
DEFINE_BASECLASS( "lvs_wheeldrive_engine" )

ENT.DoNotDuplicate = true

ENT._LVS = true

ENT.lvsEngine = true

if SERVER then return end

ENT.GearSoundTime = 0

function ENT:PlayIdleSound()
	if not self.EngineSoundsSA.idle or not self.EngineSoundsSA.idle.sound then return end

	if self.IdleSound then return self.IdleSound end

	local sound = CreateSound( self, self.EngineSoundsSA.idle.sound )
	sound:SetSoundLevel( self.EngineSoundsSA.idle.SoundLevel )
	sound:PlayEx(self:GetEngineVolume(),100)

	self.IdleSound = sound

	return sound
end

function ENT:PlayCruiseSound( vehicle )
	self:FadeOutGearSound()

	if not self.EngineSoundsSA.cruise or not self.EngineSoundsSA.cruise.sound then return end

	if self.CruiseSound then return self.CruiseSound end

	if self.PreventNextCruiseSound  then
		if self.PreventNextCruiseSound > CurTime() then
		
			return
		else
			self.PreventNextCruiseSound  = nil
		end
	end

	local sound = CreateSound( self, self.EngineSoundsSA.cruise.sound )
	sound:SetSoundLevel( self.EngineSoundsSA.cruise.SoundLevel )
	sound:PlayEx(0,100)

	self.CruiseSound = sound

	return sound
end

function ENT:PlayReverseSound( vehicle )
	if not self.EngineSoundsSA.reverse_on or not self.EngineSoundsSA.reverse_on.sound then return end

	if self.ReverseSound then return self.ReverseSound end

	local T = CurTime()

	if (self.NextReverse or 0) > T then return end

	self.NextReverse = T + 0.5

	local sound = CreateSound( self, self.EngineSoundsSA.reverse_on.sound )
	sound:SetSoundLevel( self.EngineSoundsSA.reverse_on.SoundLevel )
	sound:PlayEx(0, self.EngineSoundsSA.reverse_on.Pitch)

	self.ReverseSound = sound

	return sound
end

function ENT:PlayReverseOffSound( vehicle )
	if not self.EngineSoundsSA.reverse_off or not self.EngineSoundsSA.reverse_off.sound then return end

	if self.ReverseOffSound then return self.ReverseOffSound end

	local T = CurTime()

	if (self.NextReverseOff or 0) > T then return end

	self.NextReverseOff = T + 0.25

	local sound = CreateSound( self, self.EngineSoundsSA.reverse_off.sound )
	sound:SetSoundLevel( self.EngineSoundsSA.reverse_off.SoundLevel )
	sound:PlayEx(self:GetEngineVolume(),self.EngineSoundsSA.reverse_off.Pitch)

	self.ReversePitch = nil
	self.ReverseOffSound = sound

	return sound
end

function ENT:PlayGearSound( vehicle, speedMul, VelocityGeared )
	if not self.EngineSoundsSA.gears or not self.EngineSoundsSA.gears.sound then return end

	local T = CurTime()

	local EntTable = self:GetTable()

	local Gear = self:GetGear()
	local MaxGears = vehicle.TransGears
	local NextGear = Gear + 1

	local NextPlay = EntTable.GearSoundTime
	local LastDuration = EntTable.GearSoundDuration or 1
	local LastPitch = EntTable.GearSoundPitch or 1

	local TargetRPM = vehicle.EngineIdleRPM + (vehicle.EngineMaxRPM - vehicle.EngineIdleRPM) * (math.max( LastPitch - 1, 0 ) + math.Clamp(1 - (NextPlay - T) / LastDuration,0,1))

	self:SetRPM( self:GetRPM() + (TargetRPM - self:GetRPM()) * FrameTime() * 5 )

	if NextGear <= (MaxGears + 1) and Gear ~= 0 then
		if T < NextPlay then return end

		if EntTable.PreventNextGearSound then
			if EntTable.PreventNextGearSound > T then
				return
			else
				EntTable.PreventNextGearSound = nil
			end
		end

		self:FadeOutCruiseSound()
		self:StopGearSound()

		local speed = EntTable.EngineSoundsSA.gears.speed[ self:GetGear() ] or 1

		if not EntTable._GearSoundSaved then
			EntTable._GearSoundSaved = CreateSound( self, EntTable.EngineSoundsSA.gears.sound )
			EntTable._GearSoundSaved:SetSoundLevel( EntTable.EngineSoundsSA.gears.SoundLevel )
		end

		local sound = EntTable._GearSoundSaved
		sound:PlayEx(self:GetEngineVolume(),100 * speed )

		EntTable.GearSound = sound
		EntTable.GearSoundDuration = EntTable.EngineSoundsSA.gears.soundDuration * (1 / speed)
		EntTable.GearSoundPitch = speed
		EntTable.GearSoundTime = T + EntTable.GearSoundDuration

		local ActualGear = self:CalcGear( vehicle, VelocityGeared ) 
		local CurrentGear = self:GetGear()
		local DesiredGear = CurrentGear + 1

		if (ActualGear - DesiredGear) < -2 then
			self:SetGear( ActualGear )
		else
			self:SetGear( DesiredGear )
		end

		vehicle:OnChangeGear( CurrentGear, DesiredGear )
	else
		if T < NextPlay then return end

		local sound = self:PlayCruiseSound( vehicle )

		if not sound then return end

		sound:ChangeVolume( self:GetEngineVolume(), 0.1 )

		if Gear == 0 then
			local wheelSpinMul = 1 + math.Clamp( math.max( vehicle:GetWheelVelocity() - VelocityGeared, 0 ) / (vehicle.MaxVelocity / vehicle.TransGears), 0, 1 ) * 0.5

			sound:ChangePitch( EntTable.EngineSoundsSA.cruise.Pitch + EntTable.EngineSoundsSA.cruise.PitchMul * wheelSpinMul, 0.5 )
		else
			sound:ChangePitch( EntTable.EngineSoundsSA.cruise.Pitch + EntTable.EngineSoundsSA.cruise.PitchMul * speedMul, 0.5 )
		end
	end
end

function ENT:PlayThrottleOffSound()
	if not self.EngineSoundsSA.throttle_off or not self.EngineSoundsSA.throttle_off.sound then return end

	local T = CurTime()

	if (self.NextThrottleOff or 0) > T then return end

	self.NextThrottleOff = T + 0.5

	self:EmitSound( self.EngineSoundsSA.throttle_off.sound, self.EngineSoundsSA.throttle_off.SoundLevel, 100, self:GetEngineVolume() )
end

function ENT:FadeOutGearSound( fadetime )
	if not fadetime then fadetime = 0.49 end

	if self.IsFadingGearSound or not self.GearSound then return end

	self.IsFadingGearSound = true

	self.PreventNextGearSound = CurTime() + 0.5

	self.GearSound:ChangeVolume( 0, math.max( fadetime - 0.01, 0 ) )

	timer.Simple(fadetime, function()
		if not IsValid( self ) then return end

		self.IsFadingGearSound = nil
		self:StopGearSound()
	end )
end

function ENT:FadeOutCruiseSound()
	if self.IsFadingCruiseSound or not self.CruiseSound then return end

	self.IsFadingCruiseSound = true

	self.PreventNextCruiseSound = CurTime() + 0.5

	self.CruiseSound:ChangeVolume( 0, 0.48 )

	timer.Simple(0.49, function()
		if not IsValid( self ) then return end

		self.IsFadingCruiseSound = nil
		self:StopCruiseSound()
	end )
end

function ENT:FadeOutReverseSound()
	if self.IsFadingReverseSound or not self.ReverseSound then return end

	self.IsFadingReverseSound = true

	self.ReverseSound:ChangeVolume( 0, 0.28 )

	timer.Simple(0.29, function()
		if not IsValid( self ) then return end

		self.IsFadingReverseSound = nil
		self:StopReverseSound()
	end )
end

function ENT:FadeOutReverseOffSound()
	if self.IsFadingReverseOffSound or not self.ReverseOffSound then return end

	self.IsFadingReverseOffSound = true

	self.ReverseOffSound:ChangeVolume( 0, 0.23 )

	timer.Simple(0.24, function()
		if not IsValid( self ) then return end

		self.IsFadingReverseOffSound = nil
		self:StopReverseOffSound()
	end )
end

function ENT:StopIdleSound()
	if not self.IdleSound then return end

	self.IdleSound:Stop()
	self.IdleSound = nil
end

function ENT:StopCruiseSound()
	if not self.CruiseSound then return end

	self.CruiseSound:Stop()
	self.CruiseSound = nil
end

function ENT:StopGearSound()
	if not self.GearSound then return end

	self.GearSound:Stop()
end

function ENT:RemoveGearSound()
	if not self._GearSoundSaved then return end

	self._GearSoundSaved:Stop()
	self._GearSoundSaved = nil
end

function ENT:StopReverseSound()
	if not self.ReverseSound then return end

	self.ReverseSound:Stop()
	self.ReverseSound = nil
end

function ENT:StopReverseOffSound()
	if not self.ReverseOffSound then return end

	self.ReverseOffSound:Stop()
	self.ReverseOffSound = nil
end

function ENT:StopSounds()
	--self:StopGearSound()
	self:RemoveGearSound()
	self:StopIdleSound()
	self:StopCruiseSound()
	self:StopReverseSound()
	self:StopReverseOffSound()
end

function ENT:CalcGear( vehicle, VelocityGeared )
	local NumGears = vehicle.TransGears

	local DesiredGear = 1

	local PitchValue = vehicle.MaxVelocity / NumGears

	while (VelocityGeared > PitchValue) and DesiredGear< NumGears do
		VelocityGeared = VelocityGeared - PitchValue

		DesiredGear = DesiredGear + 1
	end

	DesiredGear = math.Clamp( DesiredGear, 1, NumGears )

	return DesiredGear
end

function ENT:HandleEngineSounds( vehicle )
	local ply = LocalPlayer()
	local pod = ply:GetVehicle()
	local Throttle = vehicle:GetThrottle()
	local ThrottleActive = Throttle > 0

	local Volume = self:SetEngineVolume( LVS.EngineVolume )

	local T = CurTime()

	local Velocity = vehicle:GetVelocity()
	local vehVel = Velocity:Length()
	local wheelVel = vehicle:GetWheelVelocity()

	local ForwardSpeed = vehVel
	local DriverSeat = vehicle:GetDriverSeat()
	if IsValid( DriverSeat ) then
		ForwardSpeed = vehicle:VectorSplitNormal( -DriverSeat:GetRight(), Velocity )
	end

	local IdleSound = self:PlayIdleSound()
	local Reverse = vehicle:GetReverse()

	if Reverse then
		self:FadeOutGearSound()
		self:FadeOutCruiseSound()

		if IdleSound then
			IdleSound:ChangePitch( self.EngineSoundsSA.idle.Pitch + self.EngineSoundsSA.idle.PitchMul * (vehVel / vehicle.MaxVelocityReverse) )
			IdleSound:ChangeVolume( Volume, 0.1 )
		end

		if self._oldThrottleActive ~= ThrottleActive then
			self._oldThrottleActive = ThrottleActive

			if ThrottleActive then
				self:FadeOutReverseOffSound()
			else
				self:FadeOutReverseSound()
			end
		end

		if ThrottleActive then
			local sound = self:PlayReverseSound( vehicle )

			if sound then
				sound:ChangeVolume( Volume * (0.5 + Throttle * 0.5) )
				sound:ChangePitch( self.EngineSoundsSA.reverse_on.Pitch + self.EngineSoundsSA.reverse_on.PitchMul * (vehVel / vehicle.MaxVelocityReverse), 2 )
			end
		else
			local sound = self:PlayReverseOffSound( vehicle )

			if sound then
				sound:ChangeVolume( math.Clamp(-ForwardSpeed / vehicle.MaxVelocityReverse,0,1) * Volume,0.25 )
				sound:ChangePitch( self.EngineSoundsSA.reverse_off.Pitch + self.EngineSoundsSA.reverse_off.PitchMul * (vehVel / vehicle.MaxVelocityReverse) )
			end
		end

		self:SetGear( 0 )
	else
		self:FadeOutReverseSound()
		self:FadeOutReverseOffSound()

		if ThrottleActive then
			local ForceCruise = vehicle:GetNWHandBrake() or vehVel / wheelVel <= 0.8

			if ForceCruise then
				self.NextForceCruise = T + 0.26
			end

			if (Reverse and ForwardSpeed > 0) or (not Reverse and ForwardSpeed < 0) then
				self:SetGear( 0 )
			else
				if vehVel < vehicle.MinVelocity or (self.NextForceCruise or 0) > T then
					self:SetGear( 0 )

					if self.GearSound then
						self:FadeOutGearSound( 0.25 )
						self.GearSoundTime = T
					end
				else
					if self:GetGear() == 0 then
						self:SetGear( 1 )
					end
				end
			end

			if self:GetGear() == 0 then
				self:PlayGearSound( vehicle, 1, vehVel )
			else
				self:PlayGearSound( vehicle, vehVel / vehicle.MaxVelocity, vehVel )
			end
		else
			self:SetGear( self:CalcGear( vehicle, vehVel ) )
			self:SetRPM( self:GetRPM() + (vehicle.EngineIdleRPM - self:GetRPM()) * FrameTime() * 5 )
		end

		if self._oldThrottleActive ~= ThrottleActive then
			self._oldThrottleActive = ThrottleActive

			if not ThrottleActive then
				self:FadeOutGearSound()
				self:FadeOutCruiseSound()
				self:PlayThrottleOffSound()

				self.GearSoundTime = T + 0.5
			end
		end

		if IdleSound then
			IdleSound:ChangePitch( self.EngineSoundsSA.idle.Pitch + self.EngineSoundsSA.idle.PitchMul * (vehVel / vehicle.MaxVelocity) )
			IdleSound:ChangeVolume( ThrottleActive and 0 or Volume, 0.1 )
		end
	end
end

function ENT:OnEngineActiveChanged( Active )
	self._oldThrottleActive = false

	if not Active then self:StopSounds() return end

	for id, data in pairs( self.EngineSoundsSA ) do
		if not isstring( data.sound ) then continue end

		self.EngineSoundsSA[ id ].UseDoppler = data.UseDoppler ~= false
		self.EngineSoundsSA[ id ].SoundLevel = data.SoundLevel or 85

		if id == "idle" or id == "cruise" or id == "reverse_on" or id == "reverse_off" then
			self.EngineSoundsSA[ id ].Pitch = data.Pitch or 100
			self.EngineSoundsSA[ id ].PitchMul = data.PitchMul or 20
		end

		if id == "gears" then
			self.EngineSoundsSA[ id ].soundDuration = data.soundDuration or 3.5
		end
	end
end

function ENT:Think()
	local vehicle = self:GetBase()

	if not IsValid( vehicle ) then return end

	self:DamageFX( vehicle )

	if not self.EngineSoundsSA then
		self.EngineSoundsSA = vehicle.EngineSoundsSA

		return
	end

	local EngineActive = vehicle:GetEngineActive()

	if self._oldEnActive ~= EngineActive then
		self._oldEnActive = EngineActive

		self:OnEngineActiveChanged( EngineActive )
	end

	if EngineActive then
		self:HandleEngineSounds( vehicle )
		self:ExhaustFX( vehicle )
	end
end