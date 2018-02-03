-- universal load for strongpoints module
-- if you want customize it for your game, load your configs BEFORE including this file

local MODULE_NAME = "strongpoints"
Spring.Echo("-- " .. MODULE_NAME .. " LOADING --")

------------------------------------------------------

-- MANDATORY
-- check required modules
if (modules == nil) then Spring.Echo("[" .. MODULE_NAME .. "] ERROR: required madatory config [modules] listing paths for modules is missing") end
if (attach == nil) then Spring.Echo("[" .. MODULE_NAME .. "] ERROR: required madatory library [attach] for loading files and modules is missing") end
if (message == nil) then Spring.Echo("[" .. MODULE_NAME .. "] ERROR: required madatory module [message] for communication is missing") end

------------------------------------------------------

if (tableExt == nil) then
	attach.Module(modules, "tableExt") -- temporary
end

local thisModuleData = modules[MODULE_NAME]
local THIS_MODULE_DATA_PATH = thisModuleData.data.path

local strongpoints = attach.File(THIS_MODULE_DATA_PATH .. "strongpoints.lua") -- core strongpoints library with main functionality of the module

Spring.Echo("-- " .. MODULE_NAME .. " LOADING FINISHED --")

return strongpoints