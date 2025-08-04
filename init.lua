-- GloopTest general initiation file.
-- To edit what modules will load, please edit minetest.conf file.
--
-- GloopTest random data:
--    Current module amount               : 6
--    License                             : CC-BY-SA
--    Totals: lol I don't know
-- End random data.

glooptest = {}

-- export which modules are loaded
glooptest.modules = {}

function glooptest.debug(level,message)
	print("["..level.."][GloopTest] "..message)
end

local modpath = core.get_modpath("glooptest")

-- Load the desired modules. This also defines the load order
local modules_list = { "tools", "ore", "parts", "tech", "othergen", "compat" }
local modules_loaded = {}

for _, name in ipairs(modules_list) do
	if core.settings:get_bool("glooptest.load_" .. name .. "_module", true) then
		glooptest.modules[name] = true
	end
end

for _, name in ipairs(modules_list) do
	if glooptest.modules[name] then
		dofile(modpath .. "/" .. name .. ".lua")
		--glooptest.modules[name] = true
		table.insert(modules_loaded, name)
	end
end

if #modules_loaded == 0 then
	glooptest.debug("ERROR", "It helps if you activate some of the modules.")
else
	glooptest.debug("MESSAGE", #modules_loaded .. " modules loaded successfully: "
		.. table.concat(modules_loaded, ", ") .. ".")
end
