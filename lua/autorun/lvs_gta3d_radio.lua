
LVSGTA3D = LVSGTA3D or {}

local data = file.Read( "data_static/gta3d_sanandreas_radio.txt", "GAME" )

if not data then return end

if SERVER then
	util.AddNetworkString( "lvsgta3dradio" )
end

local channel = util.JSONToTable( data )

LVSGTA3D.Channel = {
	[0] = {
		name = "RADIO OFF",
		channel = "",
	},
	[1] = {
		name = "WCTR",
		channel = "wctr",
	},
	[2] = {
		name = "MASTER SOUNDS 98.3",
		channel = "master_sounds",
	},
	[3] = {
		name = "K-JAH WEST",
		channel = "k_jah",
	},
	[4] = {
		name = "CSR 103.9",
		channel = "csr",
	},
	[5] = {
		name = "RADIO X",
		channel = "radio_x",
	},
	[6] = {
		name = "RADIO LOS SANTOS",
		channel = "radio_los_santos",
	},
	[7] = {
		name = "SF-UR",
		channel = "sfur",
	},
	[8] = {
		name = "BOUNCE FM",
		channel = "bounce_fm",
	},
	[9] = {
		name = "K-DST",
		channel = "k_dst",
	},
	[10] = {
		name = "K ROSE",
		channel = "krose",
	},
	[11] = {
		name = "PLAYBACK FM",
		channel = "playback_fm",
	},
}

function LVSGTA3D:GetChannel( id )
	if not LVSGTA3D.Channel[ id ] then return LVSGTA3D.Channel[ 0 ] end

	return LVSGTA3D.Channel[ id ]
end

local ActiveChannel = {}

local CNL = {}
CNL.__index = CNL
function CNL:Initialize( name )
	self._name = name

	local T = CurTime()

	self.PlayList = {}
	self._StartTime = T
	self:SetFinishTime( T )

	self:Reset()
end
function CNL:SetFinishTime( time )
	self._FinishTime = time
end
function CNL:GetFinishTime()
	return self._FinishTime
end
function CNL:GetStartTime()
	return self._StartTime
end
function CNL:GetName()
	return self._name
end
function CNL:GetPlayList()
	return self.PlayList
end
function CNL:GetProgression()
	return (self._FinishTime - self._StartTime - (self._FinishTime - CurTime()))
end
function CNL:ClearPlayList()
	local T = CurTime()

	self._StartTime = T
	self:SetFinishTime( T )

	table.Empty( self.PlayList )
end
function CNL:Reset()
	self:ClearPlayList()

	if CLIENT then return end

	local name = self:GetName()

	timer.Simple(0, function()
		net.Start( "lvsgta3dradio" )
			net.WriteString( name )
			net.WriteBool( true )
		net.Broadcast()
	end)

	self:AddType( "dj" )
	self:AddType( "music", "intro"..math.random(1,2), "outro" )
	self:AddType( "id" )
	self:AddType( "music", "intro", "outro"..math.random(1,2) )

	local num = math.random(0,3)

	if num > 0 then
		for i = 1, num do
			self:AddType( "adverts" )
		end

		self:AddType( "id" )
	end
end
function CNL:AddFile( sound, length )
	local data = {
		sound = sound,
		starttime = self:GetFinishTime(),
		finishtime = self:GetFinishTime() + length,
	}

	table.insert( self.PlayList, data )

	self:SetFinishTime( self:GetFinishTime() + length )

	if CLIENT then return end

	local name = self:GetName()

	timer.Simple(0, function()
		net.Start( "lvsgta3dradio" )
			net.WriteString( name )
			net.WriteBool( false )
			net.WriteString( sound )
			net.WriteFloat( length )
		net.Broadcast()
	end)
end
function CNL:AddType( type, starttype, endtype )
	if type == "adverts" then
		local song = table.Random( channel[ "adverts" ] )

		self:AddFile( song.sound, song.length )

		return
	end

	if type == "dj" then
		local song = table.Random( channel[ self:GetName() ].dj )
		if not song then song = table.Random( channel[ self:GetName() ].id ) end

		self:AddFile( song.sound, song.length )

		return
	end

	if type == "id" then
		local song = table.Random( channel[ self:GetName() ].id )
		if not song then song = table.Random( channel[ self:GetName() ].dj ) end

		self:AddFile( song.sound, song.length )

		return
	end

	local song = table.Random( channel[ self:GetName() ].music )

	if song[starttype] then
		self:AddFile( song[starttype].sound, song[starttype].length )
	else
		if starttype == "intro" then
			if song["intro1"] then
				self:AddFile( song.intro1.sound, song.intro1.length )
			else
				self:AddFile( song.intro2.sound, song.intro2.length )
			end
		else
			self:AddFile( song.intro.sound, song.intro.length )
		end
	end

	self:AddFile( song.mid.sound, song.mid.length )

	if song[endtype] then
		self:AddFile( song[endtype].sound, song[endtype].length )
	else
		if endtype == "outro" then
			if song["outro1"] then
				self:AddFile( song.outro1.sound, song.outro1.length )
			else
				self:AddFile( song.outro2.sound, song.outro2.length )
			end
		else
			self:AddFile( song.outro.sound, song.outro.length )
		end
	end
end

local function ChannelGet( name )
	if not ActiveChannel[ name ] then
		return ChannelCreate( name )
	end

	return ActiveChannel[ name ]
end

local function ChannelGetAll()
	return ActiveChannel
end

local function ChannelCreate( name )
	local channel = {}

	setmetatable( channel, CNL )

	channel:Initialize( name )

	ActiveChannel[ name ] = channel

	return channel
end

for _, data in pairs( LVSGTA3D.Channel ) do
	local name = data.channel

	if name == "" then continue end

	ChannelCreate( name )
end

if SERVER then
	hook.Add( "Think", "LVSGTA3Dradio", function()
		local T = CurTime()

		for id, channel in pairs( ChannelGetAll() ) do
			if channel:GetFinishTime() < T then
				channel:Reset()
			end
		end
	end )

	return
end

net.Receive( "lvsgta3dradio", function( len, ply )
	local name = net.ReadString()
	local shouldReset = net.ReadBool()

	local channel = ChannelGet( name )

	if shouldReset then channel:Reset() return end

	local sound = net.ReadString()
	local length = net.ReadFloat()

	channel:AddFile( sound, length )
end )

local CurFile
local DesiredFile
local DesiredFileStartTime = 0

local SoundHandler

local LastVehicle

hook.Add( "Think", "LVSGTA3Dradio", function()
	local ply = LocalPlayer()

	if not IsValid( ply ) then return end

	local T = CurTime()

	local DesiredChannel = ""
	local SoundFlags = ""

	if ply:InVehicle() then
		local vehicle = ply:lvsGetVehicle()

		if IsValid( vehicle ) and vehicle.useGta3dRadio then
			if vehicle:IsRadioEnabled() then
				DesiredChannel = LVSGTA3D.Channel[ vehicle:GetRadioChannel() ].channel

				LastVehicle = vehicle
				LastChannel = DesiredChannel

			else
				DesiredFile = nil
			end
		else
			DesiredFile = nil
		end
	else
		if IsValid( LastVehicle ) and LastVehicle:IsRadioEnabled() then
			DesiredChannel = LVSGTA3D.Channel[ LastVehicle:GetRadioChannel() ].channel

			SoundFlags = "3d"

			if IsValid( SoundHandler ) then
				SoundHandler:SetPos( LastVehicle:LocalToWorld( LastVehicle:OBBCenter() ) )
			end
		else
			DesiredFile = nil
		end
	end

	if IsValid( SoundHandler ) then
		local Should3D = SoundFlags == "3d"
		local Is3D = SoundHandler:Get3DEnabled()

		if Should3D ~= Is3D then
			SoundHandler:Stop()
			soundHandler = nil
			CurFile = nil
		end
	end

	if CurFile ~= DesiredFile then
		CurFile = DesiredFile

		if IsValid( SoundHandler ) then
			SoundHandler:Stop()
			SoundHandler = nil
		end

		if CurFile then
			sound.PlayFile( CurFile, SoundFlags, function( station, errCode, errStr )
				if not IsValid( station ) then return end

				SoundHandler = station

				station:SetTime( DesiredFileStartTime )

				if SoundFlags == "3d" then
					station:SetVolume( 0.4 )
				end
			end )
		end
	end

	for id, channel in pairs( ChannelGetAll() ) do
		if channel:GetFinishTime() < T then
			continue
		end

		if channel:GetName() ~= DesiredChannel then continue end

		for index, data in ipairs( channel:GetPlayList() ) do
			if data.starttime < T and data.finishtime > T then

				DesiredFile = data.sound
				DesiredFileStartTime = T - data.starttime

				break
			end
		end
	end
end )