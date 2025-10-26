
local data = file.Read( "data_static/gta3d_sanandreas_radio.txt", "GAME" )

if not data then return end

local channel = util.JSONToTable( data )

