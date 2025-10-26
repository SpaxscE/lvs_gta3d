
if SERVER then return end
if true then return end

local channel = {}
local _, radio = file.Find("sound/gta3d/radio/*", "GAME")
for id, radioname in ipairs( radio ) do
	channel[ radioname ] = {
		music = {},
		dj = {},
		id = {}
	}

	for songid, filename in ipairs( file.Find("sound/gta3d/radio/"..radioname.."/*.ogg", "GAME") ) do

		local filepath = "sound/gta3d/radio/"..radioname.."/"..filename

		local isDJ = string.StartsWith( filename, "dj_" )
		local isID = string.StartsWith( filename, "id_" )

		if isDJ or isID then
			if isDJ then
				table.insert( channel[ radioname ].dj, filepath )
			end

			if isID then
				table.insert( channel[ radioname ].id, filepath )
			end

			continue
		end

		local isSong = string.EndsWith( filename, "_mid.ogg" )
		local isIntro = string.EndsWith( filename, "_intro.ogg" )
		local isIntroDJ1 = string.EndsWith( filename, "_intro_dj_1.ogg" )
		local isIntroDJ2 = string.EndsWith( filename, "_intro_dj_2.ogg" )
		local isOutro = string.EndsWith( filename, "_outro.ogg" )
		local isOutroDJ1 = string.EndsWith( filename, "_outro_dj_1.ogg" )
		local isOutroDJ2 = string.EndsWith( filename, "_outro_dj_2.ogg" )

		local index = filename
		index = string.Replace(index, "_mid.ogg", "")
		index = string.Replace(index, "_intro.ogg", "")
		index = string.Replace(index, "_intro_dj_1.ogg", "")
		index = string.Replace(index, "_intro_dj_2.ogg", "")
		index = string.Replace(index, "_outro.ogg", "")
		index = string.Replace(index, "_outro_dj_1.ogg", "")
		index = string.Replace(index, "_outro_dj_2.ogg", "")

		local validsong = isSong or isIntro or isIntroDJ1 or isIntroDJ2 or isOutro or isOutroDJ1 or isOutroDJ2

		if not validsong then continue end

		if not istable( channel[ radioname ].music[ index ] ) then channel[ radioname ].music[ index ] = {} end
		if isSong then channel[ radioname ].music[ index ].mid = filepath end

		if isIntro then channel[ radioname ].music[ index ].intro = filepath end
		if isIntroDJ1 then channel[ radioname ].music[ index ].intro1 = filepath end
		if isIntroDJ2 then channel[ radioname ].music[ index ].intro2 = filepath end

		if isOutro then channel[ radioname ].music[ index ].outro = filepath end
		if isOutroDJ1 then channel[ radioname ].music[ index ].outro1 = filepath end
		if isOutroDJ2 then channel[ radioname ].music[ index ].outro2 = filepath end
	end
end

local Block = {}
local BlockIndex = 0

local function CreateBlock( channelname )
	table.Empty( Block )
	BlockIndex = 0

	Block[1] = table.Random(  channel[ channelname ].dj )

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
		LastSong:SetVolume( ply:InVehicle() and 0.5 or 0 )
	end

	local T = CurTime()

	if NextRun > T then return end

	if BlockIndex == 0 or #Block == 0 or BlockIndex >= #Block then
		CreateBlock( "k_dst" )
	end

	BlockIndex = BlockIndex + 1

	NextRun = T + 1

	local file = Block[ BlockIndex ]

	sound.PlayFile( file, "", function( station, errCode, errStr )
		if IsValid( LastSong ) then LastSong:Stop() end

		LastSong = station

		NextRun = T + station:GetLength()
	end )
end )