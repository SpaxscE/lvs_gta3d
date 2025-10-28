
LVSGTA3D = LVSGTA3D or {}

local data = file.Read( "data_static/lvs_gta3d_radio.txt", "GAME" )

if not data then return end

if SERVER then
	util.AddNetworkString( "lvsgta3dradio" )
end

LVSGTA3D.Content = util.JSONToTable( data )

LVSGTA3D.Channel = {
	[0] = {
		name = "RADIO OFF",
		channel = "",
		icon = Material("lvs/gta3d/z_radio_off.png"),
	},
	[1] = {
		name = "WCTR",
		channel = "wctr",
		icon = Material("lvs/gta3d/wctr.png"),
	},
	[2] = {
		name = "MASTER SOUNDS 98.3",
		channel = "master_sounds",
		icon = Material("lvs/gta3d/mastersounds.png"),
	},
	[3] = {
		name = "K-JAH WEST",
		channel = "k_jah",
		icon = Material("lvs/gta3d/kjah.png"),
	},
	[4] = {
		name = "CSR 103.9",
		channel = "csr",
		icon = Material("lvs/gta3d/csr.png"),
	},
	[5] = {
		name = "RADIO X",
		channel = "radio_x",
		icon = Material("lvs/gta3d/radiox.png"),
	},
	[6] = {
		name = "RADIO LOS SANTOS",
		channel = "radio_los_santos",
		icon = Material("lvs/gta3d/radio_los_santos.png"),
	},
	[7] = {
		name = "SF-UR",
		channel = "sfur",
		icon = Material("lvs/gta3d/sfur.png"),
	},
	[8] = {
		name = "BOUNCE FM",
		channel = "bounce_fm",
		icon = Material("lvs/gta3d/bounce.png"),
	},
	[9] = {
		name = "K-DST",
		channel = "k_dst",
		icon = Material("lvs/gta3d/kdst.png"),
	},
	[10] = {
		name = "K ROSE",
		channel = "krose",
		icon = Material("lvs/gta3d/krose.png"),
	},
	[11] = {
		name = "PLAYBACK FM",
		channel = "playback_fm",
		icon = Material("lvs/gta3d/playback.png"),
	},
	[12] = {
		name = "Wildstyle",
		channel = "wildstyle",
		icon = Material("lvs/gta3d/wildstyle.png"),
		sequential = true,
	},
	[13] = {
		name = "Flash FM",
		channel = "flash",
		icon = Material("lvs/gta3d/flash.png"),
		sequential = true,
	},
	[14] = {
		name = "K-Chat",
		channel = "kchat",
		icon = Material("lvs/gta3d/kchat.png"),
		sequential = true,
	},
	[15] = {
		name = "Fever 105",
		channel = "fever",
		icon = Material("lvs/gta3d/fever.png"),
		sequential = true,
	},
	[16] = {
		name = "V-Rock",
		channel = "vrock",
		icon = Material("lvs/gta3d/vrock.png"),
		sequential = true,
	},
	[17] = {
		name = "VCPR",
		channel = "vcpr",
		icon = Material("lvs/gta3d/vcpr.png"),
		sequential = true,
	},
	[18] = {
		name = "Radio Espantoso",
		channel = "espantoso",
		icon = Material("lvs/gta3d/espantoso.png"),
		sequential = true,
	},
	[19] = {
		name = "Emotion 98.3",
		channel = "emotion",
		icon = Material("lvs/gta3d/emotion.png"),
		sequential = true,
	},
	[20] = {
		name = "Wave 103",
		channel = "wave",
		icon = Material("lvs/gta3d/wave103.png"),
		sequential = true,
	},
}

function LVSGTA3D:GetChannel( id )
	if not LVSGTA3D.Channel[ id ] then return LVSGTA3D.Channel[ 0 ] end

	return LVSGTA3D.Channel[ id ]
end

local ActiveChannel = {}
local OptionCache = {}
local function GetRandomOption( RandomOptions, seperatorID )
	if not istable( RandomOptions ) or table.Count( RandomOptions ) <= 0 then return end

	if not seperatorID then seperatorID = "" end

	local MinValue
	local TrueOptions = {}

	for index, _ in pairs( RandomOptions ) do
		local internalIndex = index..seperatorID

		if not OptionCache[ internalIndex ] then OptionCache[ internalIndex ] = 0 end

		if not MinValue or MinValue > OptionCache[ internalIndex ] then MinValue = OptionCache[ internalIndex ] end
	end

	for index, _ in pairs( RandomOptions ) do
		local internalIndex = index..seperatorID

		if OptionCache[ internalIndex ] > MinValue then continue end

		table.insert( TrueOptions, index )
	end

	local SelectedOption = TrueOptions[ math.random( 1, #TrueOptions ) ]

	local internalIndex = SelectedOption..seperatorID

	OptionCache[ internalIndex ] = OptionCache[ internalIndex ] + 1

	return RandomOptions[ SelectedOption ]
end

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
function CNL:ClearPlayList( T )
	if not T then T = CurTime() end

	self._StartTime = T
	self:SetFinishTime( T )

	table.Empty( self.PlayList )
end
function CNL:Reset( time )
	self:ClearPlayList( time )

	local name = self:GetName()

	if CLIENT then return end

	net.Start( "lvsgta3dradio" )
		net.WriteString( name )
		net.WriteBool( true )
		net.WriteFloat( self._StartTime )
	net.Broadcast()

	if self.sequential then
		for _, data in ipairs( LVSGTA3D.Content[ name ] ) do

			local offset = 0
			if not self.FirstTimeLoaded then
				offset = math.random( 0, data.length )

				self.FirstTimeLoaded = true
			end

			self:AddFile( data.sound, data.length, offset )

		end

		return
	end

	self:AddType( "dj" )
	self:AddType( "music", "intro"..math.random(1,2), "outro" )
	self:AddType( "id" )
	self:AddType( "music", "intro", "outro"..math.random(1,2) )
	self:AddType( "adverts" )
	self:AddType( "id" )
end
function CNL:AddFile( sound, length, offset )
	if not offset then offset = 0 end

	if CLIENT then
		table.insert( self.PlayList, sound )

		self:SetFinishTime( sound.finishtime )

		return
	end

	local start = self:GetFinishTime() - offset
	local finish = self:GetFinishTime() - offset + length

	local data = {
		sound = sound,
		starttime = start,
		finishtime = finish,
	}

	table.insert( self.PlayList, data )

	self:SetFinishTime( finish )

	net.Start( "lvsgta3dradio" )
		net.WriteString( self:GetName() )
		net.WriteBool( false )
		net.WriteString( sound )
		net.WriteFloat( start )
		net.WriteFloat( finish )
	net.Broadcast()
end
function CNL:AddType( type, starttype, endtype )
	local name = self:GetName()

	if type == "adverts" then
		local song = GetRandomOption( LVSGTA3D.Content[ "adverts" ], "adverts" )

		self:AddFile( song.sound, song.length )

		return
	end

	if type == "dj" then
		local song = GetRandomOption( LVSGTA3D.Content[ name ].dj, name.."dj" )
		if not song then song = GetRandomOption( LVSGTA3D.Content[ name ].id, name.."dj" ) end

		self:AddFile( song.sound, song.length )

		return
	end

	if type == "id" then
		local song = GetRandomOption( LVSGTA3D.Content[ name ].id, name.."id" )
		if not song then song = GetRandomOption( LVSGTA3D.Content[ name ].dj, name.."id" ) end

		self:AddFile( song.sound, song.length )

		return
	end

	local song = GetRandomOption( LVSGTA3D.Content[ name ].music, name.."music" )

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

local function ChannelCreate( name, sequential )
	local channel = {}

	setmetatable( channel, CNL )

	channel.sequential = sequential

	channel:Initialize( name )

	ActiveChannel[ name ] = channel

	return channel
end

for _, data in pairs( LVSGTA3D.Channel ) do
	local name = data.channel

	if name == "" then continue end

	ChannelCreate( name, data.sequential == true )
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

	net.Receive( "lvsgta3dradio", function( len, ply )
		if ply.lvsRadioAntiMinge then return end

		ply.lvsRadioAntiMinge = true

		for id, channel in pairs( ChannelGetAll() ) do
			local name = channel:GetName()

			net.Start( "lvsgta3dradio" )
				net.WriteString( name )
				net.WriteBool( true )
			net.Send( ply )

			for index, data in ipairs( channel:GetPlayList() ) do
				net.Start( "lvsgta3dradio" )
					net.WriteString( name )
					net.WriteBool( false )
					net.WriteString( data.sound )
					net.WriteFloat( data.starttime )
					net.WriteFloat( data.finishtime )
				net.Send( ply )
			end
		end
	end )

	return
end

hook.Add( "InitPostEntity", "LVSGTA3dRadioRequestSync", function()
	net.Start( "lvsgta3dradio" )
	net.SendToServer()
end )

net.Receive( "lvsgta3dradio", function( len, ply )
	local name = net.ReadString()
	local shouldReset = net.ReadBool()

	local channel = ChannelGet( name )

	if shouldReset then channel:Reset( net.ReadFloat() ) return end

	local data = {
		sound = net.ReadString(),
		starttime = net.ReadFloat(),
		finishtime = net.ReadFloat(),
	}

	channel:AddFile( data )
end )

local CurFile
local DesiredFile
local DesiredFileStartTime = 0

local SoundHandler

local LastVehicle

local cvarVolume = CreateClientConVar( "lvs_volume_radio", 0.5, true, false)
LVSGTA3D.Volume = cvarVolume and cvarVolume:GetFloat() or 0.5
cvars.AddChangeCallback( "lvs_volume_radio", function( convar, oldValue, newValue ) 

	LVSGTA3D.Volume = math.Clamp( tonumber( newValue ), 0, 1 )

	if not IsValid( SoundHandler ) or SoundHandler:Get3DEnabled() then return end

	SoundHandler:SetVolume( LVSGTA3D.Volume )
end)

function LVSGTA3D:GetSoundHandler()
	return SoundHandler
end 

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
			SoundHandler = nil
			CurFile = nil
		end
	end

	if CurFile ~= DesiredFile then
		if IsValid( SoundHandler ) then
			SoundHandler:Stop()
			SoundHandler = nil
		end

		if LVSGTA3D.Volume > 0 then
			CurFile = DesiredFile

			if CurFile then
				sound.PlayFile( CurFile, "noblock noplay "..SoundFlags, function( station, errCode, errStr )
					if not IsValid( station ) then return end

					SoundHandler = station

					station:SetTime( DesiredFileStartTime, true )

					if SoundFlags == "3d" then
						station:SetVolume( 0.25 )
					else
						station:SetVolume( LVSGTA3D.Volume )
					end

					station:Play()
				end )
			end
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