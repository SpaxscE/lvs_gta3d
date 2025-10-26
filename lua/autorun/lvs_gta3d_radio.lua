
LVSGTA3D = LVSGTA3D or {}

local data = file.Read( "data_static/gta3d_sanandreas_radio.txt", "GAME" )

if not data then return end

local channel = util.JSONToTable( data )

LVSGTA3D.Channel = {
	[0] = { name = "RADIO OFF" },
	--[1] = { name = "USER TRACK PLAYER" },
	[1] = { name = "WCTR" },
	[2] = { name = "MASTER SOUNDS 98.3" },
	[3] = { name = "K-JAH WEST" },
	[4] = { name = "CSR 103.9" },
	[5] = { name = "RADIO X" },
	[6] = { name = "RADIO LOS SANTOS" },
	[7] = { name = "SF-UR" },
	[8] = { name = "BOUNCE FM" },
	[9] = { name = "K-DST" },
	[10] = { name = "K ROSE" },
	[11] = { name = "PLAYBACK FM" },
}

function LVSGTA3D:GetChannel( id )
	if not LVSGTA3D.Channel[ id ] then return LVSGTA3D.Channel[ 0 ] end

	return LVSGTA3D.Channel[ id ]
end
