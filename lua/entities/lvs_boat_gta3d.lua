
AddCSLuaFile()

include("entities/lvs_base_powerboat/shared.lua")

if SERVER then
	include("entities/lvs_base_powerboat/init.lua")
	include("entities/lvs_base_powerboat/sv_components.lua")
	include("entities/lvs_base_powerboat/sv_controls.lua")
else
	include("entities/lvs_base_powerboat/cl_init.lua")
end

ENT.Base = "lvs_wheeldrive_gta3d"

ENT.PrintName = "[LVS] San Andreas Base"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Boats"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false
