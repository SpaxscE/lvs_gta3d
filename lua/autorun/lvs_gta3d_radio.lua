
if SERVER then return end

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

--PrintChat( channel[ "bounce_fm" ].music )

--[[
	sound.PlayFile( file, "noplay", function( station, errCode, errStr )
		local data = {
			path = file,
			duration = station:GetLength(),
		}

		adverts[ index ] = data

		station:Stop()
	end )
]]