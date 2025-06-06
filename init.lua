-- GloopTest general initiation file.
-- To edit what modules will load, please edit minetest.conf file.
--
-- GloopTest random data:
--    Current module amount               : 6
--    License                             : CC-BY-SA
--    Totals: lol I don't know
-- End random data.

-- Set up some variables and crap.
local modules_loaded = 0
glooptest = {}

-- export which modules are loaded
glooptest.modules = {
	compat   = core.settings:get_bool("glooptest.load_compat_module", true),
	ore      = core.settings:get_bool("glooptest.load_ore_module", true),
	tools    = core.settings:get_bool("glooptest.load_tools_module", true),
	parts    = core.settings:get_bool("glooptest.load_parts_module", true),
	tech     = core.settings:get_bool("glooptest.load_tech_module", true),
	othergen = core.settings:get_bool("glooptest.load_othergen_module", true),
}

-- Set up some general functions for random crap.
function glooptest.debug(level,message)
	print("["..level.."][GloopTest] "..message)
end

local modpath = core.get_modpath("glooptest")

if glooptest.modules.tools then
	dofile(modpath.."/tools_module/init.lua")
	local modulecount = modules_loaded
	modules_loaded = modulecount+1
end

if glooptest.modules.ore then
	dofile(modpath.."/ore_module/init.lua")
	local modulecount = modules_loaded
	modules_loaded = modulecount+1
end

if glooptest.modules.parts then
	dofile(modpath.."/parts_module/init.lua")
	local modulecount = modules_loaded
	modules_loaded = modulecount+1
end

if glooptest.modules.tech then
	dofile(modpath.."/tech_module/init.lua")
	local modulecount = modules_loaded
	modules_loaded = modulecount+1
end

if glooptest.modules.othergen then
	dofile(modpath.."/othergen_module/init.lua")
	local modulecount = modules_loaded
	modules_loaded = modulecount+1
end

if glooptest.modules.compat then
	dofile(modpath.."/compat_module/init.lua")
	local modulecount = modules_loaded
	modules_loaded = modulecount+1
end

if modules_loaded == 0 then
	glooptest.debug("ERROR","It helps if you activate some of the modules.")
else
	glooptest.debug("MESSAGE",modules_loaded.." modules were successfully loaded!")
end
