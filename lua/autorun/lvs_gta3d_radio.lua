print("hi")

if SERVER then return end

sound.PlayFile( "gta3d/radio/bounce_fm/between_the_sheets_(mid).ogg", "", function( station, errCode, errStr )
	if not IsValid( station ) then return end

	PrintChat( station:GetLength() )
end )
