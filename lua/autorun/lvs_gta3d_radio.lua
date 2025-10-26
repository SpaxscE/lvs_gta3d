
if SERVER then return end

local channel = {}
local _, radio = file.Find("sound/gta3d/radio/*", "GAME")
for id, radioname in ipairs( radio ) do
	if radioname == "adverts" then
		channel[ radioname ] = {}

		for songid, filename in ipairs( file.Find("sound/gta3d/radio/"..radioname.."/*.ogg", "GAME") ) do
			local filepath = "sound/gta3d/radio/"..radioname.."/"..filename

			sound.PlayFile( filepath, "noplay", function( station, errCode, errStr )
				local data = {
					sound = filepath,
					length = station:GetLength(),
				}

				table.insert( channel[ radioname ], data )
			end )
		end

		continue
	else
		channel[ radioname ] = {
			music = {},
			dj = {},
			id = {}
		}
	end

	for songid, filename in ipairs( file.Find("sound/gta3d/radio/"..radioname.."/*.ogg", "GAME") ) do

		local filepath = "sound/gta3d/radio/"..radioname.."/"..filename

		local isDJ = string.StartsWith( filename, "dj_" )
		local isID = string.StartsWith( filename, "id_" )

		if isDJ or isID then
			if isDJ then
				sound.PlayFile( filepath, "noplay", function( station, errCode, errStr )
					local data = {
						sound = filepath,
						length = station:GetLength(),
					}

					table.insert( channel[ radioname ].dj, data )
				end )
			end

			if isID then
				sound.PlayFile( filepath, "noplay", function( station, errCode, errStr )
					local data = {
						sound = filepath,
						length = station:GetLength(),
					}

					table.insert( channel[ radioname ].id, data )
				end )
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

		if not istable( channel[ radioname ].music[ index ] ) then
			channel[ radioname ].music[ index ] = {}
		end

		if isSong then
			sound.PlayFile( filepath, "noplay", function( station, errCode, errStr )
				channel[ radioname ].music[ index ].mid = {
					sound = filepath,
					length = station:GetLength(),
				}
			end )
		end

		if isIntro then
			sound.PlayFile( filepath, "noplay", function( station, errCode, errStr )
				channel[ radioname ].music[ index ].intro = {
					sound = filepath,
					length = station:GetLength(),
				}
			end )
		end

		if isIntroDJ1 then
			sound.PlayFile( filepath, "noplay", function( station, errCode, errStr )
				channel[ radioname ].music[ index ].intro1 = {
					sound = filepath,
					length = station:GetLength(),
				}
			end )
		end

		if isIntroDJ2 then
			sound.PlayFile( filepath, "noplay", function( station, errCode, errStr )
				channel[ radioname ].music[ index ].intro2 = {
					sound = filepath,
					length = station:GetLength(),
				}
			end )
		end

		if isOutro then
			sound.PlayFile( filepath, "noplay", function( station, errCode, errStr )
				channel[ radioname ].music[ index ].outro = {
					sound = filepath,
					length = station:GetLength(),
				}
			end )
		end

		if isOutroDJ1 then
			sound.PlayFile( filepath, "noplay", function( station, errCode, errStr )
				channel[ radioname ].music[ index ].outro1 = {
					sound = filepath,
					length = station:GetLength(),
				}
			end )
		end

		if isOutroDJ2 then
			sound.PlayFile( filepath, "noplay", function( station, errCode, errStr )
				channel[ radioname ].music[ index ].outro2 = {
					sound = filepath,
					length = station:GetLength(),
				}
			end )
		end
	end
end

timer.Simple(1, function()
	file.Write( "gta3d.txt", util.TableToJSON( channel, true ) )
end)
