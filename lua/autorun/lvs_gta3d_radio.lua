
local data = file.Read( "data_static/gta3d_sanandreas_radio.txt", "GAME" )

if not data then return end

local channel = util.JSONToTable( data )

if SERVER then return end
if true then return end

local Block = {}
local BlockIndex = 0

local function CreateBlock( channelname )
	table.Empty( Block )
	BlockIndex = 0

	Block[1] = table.Random( channel[ channelname ].dj )

	local Song = table.Random( channel[ channelname ].music )
	Block[2] = (math.random(1,2) == 1 and Song.intro1 or Song.intro2) or Song.intro
	Block[3] = Song.mid
	Block[4] = Song.outro

	Song = table.Random( channel[ channelname ].music )
	Block[5] = Song.intro
	Block[6] = Song.mid
	Block[7] = Song.outro

	Song = table.Random( channel[ channelname ].music )
	Block[8] = Song.intro
	Block[9] = Song.mid
	Block[10] = (math.random(1,2) == 1 and Song.outro1 or Song.outro2) or Song.outro

	Block[11] = table.Random( channel[ channelname ].dj )
	Block[12] = table.Random(  channel[ channelname ].id )

	return Block
end

local LastSong
local NextRun = 0

hook.Add( "Think", "LVSgta3dRadio", function()
	if IsValid( LastSong ) then
		local ply = LocalPlayer()

		--LastSong:SetPos( ply:GetShootPos() )
		LastSong:SetVolume( ply:InVehicle() and 1 or 0 )
	end

	local T = CurTime()

	if NextRun > T then return end

	if BlockIndex == 0 or #Block == 0 or BlockIndex >= #Block then
		CreateBlock( "k_dst" )
	end

	BlockIndex = BlockIndex + 1

	local file = Block[ BlockIndex ].sound

	NextRun = T + Block[ BlockIndex ].length

	sound.PlayFile( file, "", function( station, errCode, errStr )
		if IsValid( LastSong ) then LastSong:Stop() end
		LastSong = station
	end )
end )