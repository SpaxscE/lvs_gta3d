AddCSLuaFile()

ENT.Type            = "anim"

ENT.PrintName = "Radio"
ENT.Author = "Luna"
ENT.Category = "[LVS]"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.PhysicsSounds = true

ENT.Editable = true

function ENT:SetupDataTables()
	self:NetworkVar( "Int",1, "RadioChannel", { KeyName = "radiochannel", Edit = { type = "Int", order = 1,min = 0, max = #LVSGTA3D.Channel, category = "Settings"} } )
	self:NetworkVar( "Float",1, "Volume", { KeyName = "volume", Edit = { type = "Float", order = 2,min = 0, max = 1, category = "Settings"} } )

	if SERVER then
		self:SetVolume( 1 )
	end
end

if SERVER then
	function ENT:SpawnFunction( ply, tr, ClassName )
		if not tr.Hit then return end

		local ent = ents.Create( ClassName )
		ent:SetPos( tr.HitPos + tr.HitNormal * 5 )
		ent:Spawn()
		ent:Activate()

		return ent
	end

	function ENT:Initialize()
		self:SetModel( "models/props_lab/reciever01b.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetUseType( SIMPLE_USE )

		if not WireLib then return end

		self.Inputs = WireLib.CreateInputs( self,{"Channel","Volume"} )
	end

	function ENT:TriggerInput( name, value )
		if name == "Channel" then
			self:SetRadioChannel( math.Clamp( tonumber( value ), 0, #LVSGTA3D.Channel ) )
		end
		if name == "Volume" then
			self:SetVolume( math.Clamp( tonumber( value ), 0, 1 ) )
		end
	end

	function ENT:Think()
		return false
	end

	function ENT:PhysicsCollide( data )
	end

	function ENT:OnTakeDamage( dmginfo )
	end

	function ENT:OnRemove()
	end

	function ENT:Use( ply )
		local MaxChannel = #LVSGTA3D.Channel
		local CurChannel = self:GetRadioChannel()

		local NextChannel = CurChannel + 1

		if NextChannel > MaxChannel then NextChannel = 0 end

		self:SetRadioChannel( NextChannel )
		self:EmitSound("gta3d/radio/turnoff.ogg")
	end
else
	function ENT:Initialize()
	end

	local Color1 = Color(150,150,150)
	local Color2 = Color(255,255,255)
	local Color3 = Color(0,0,0)

	function ENT:Draw( flags )
		self:DrawModel( flags )

		local channelData = LVSGTA3D:GetChannel( self:GetRadioChannel() )

		if not channelData or not channelData.icon then return end

		cam.Start3D2D( self:LocalToWorld( Vector(6.4,-3.85,0.1) ), self:LocalToWorldAngles( Angle(0,90,90) ), 0.035 )
			surface.SetDrawColor( color_white )
			surface.SetMaterial( channelData.icon )
			surface.DrawTexturedRect( -64, -64, 128, 128 )
		cam.End3D2D()
	end

	function ENT:Think()
		if IsValid( self.SoundHandler ) then
			self.SoundHandler:SetPos( self:GetPos() )

			local Volume = self:GetVolume()

			if self.SoundHandler:GetVolume() ~= Volume then
				self.SoundHandler:SetVolume( Volume )
			end
		end

		local T = CurTime()
		local ChannelIndex = self:GetRadioChannel()
		local DesiredChannel = LVSGTA3D.Channel[ ChannelIndex ].channel

		for id, channel in pairs( LVSGTA3D:ChannelGetAll() ) do
			if channel:GetFinishTime() < T then
				continue
			end

			if channel:GetName() ~= DesiredChannel then continue end

			for index, data in ipairs( channel:GetPlayList() ) do
				if data.starttime < T and data.finishtime > T then

					self.DesiredFile = data.sound
					self.DesiredFileStartTime = T - data.starttime

					break
				end
			end
		end

		if ChannelIndex == 0 then
			self.DesiredFile = 0
		end

		if self.CurFile ~= self.DesiredFile then
			self:StopPlayback()

			self.CurFile = self.DesiredFile

			if not self.CurFile then return end
	
			sound.PlayFile( self.CurFile, "noblock noplay 3d", function( station, errCode, errStr )
				if not IsValid( station ) then return end

				self.SoundHandler = station

				station:SetTime( self.DesiredFileStartTime or 0, true )
				station:SetVolume( self:GetVolume() )
				station:Play()
			end )
		end
	end

	function ENT:StopPlayback()
		if not IsValid( self.SoundHandler ) then return end

		self.SoundHandler:Stop()
		self.SoundHandler = nil
	end

	function ENT:OnRemove()
		self:StopPlayback()
	end
end
