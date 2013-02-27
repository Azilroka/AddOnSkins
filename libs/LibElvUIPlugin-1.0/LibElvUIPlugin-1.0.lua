if not ElvUI then return end

local MAJOR, MINOR = "LibElvUIPlugin-1.0", 6
local lib, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

if not lib then return end
lib.plugins = {}
lib.index = 0
--
-- GLOBALS:
--

local E = ElvUI[1]
local _

--
-- Plugin table format:
--   { name (string) - The name of the plugin,
--     version (string) - The version of the plugin,
--     optionCallback (string) - The callback to call when ElvUI_Config is loaded
--   }
--

--
-- RegisterPlugin(name,callback)
--   Registers a module with the given name and option callback, pulls version info from metadata
--

function lib:RegisterPlugin(name,callback)
	local plugin = {}
	plugin.name = name
	plugin.version = name == MAJOR and MINOR or GetAddOnMetadata(name, "Version")
	plugin.callback = callback
	lib.plugins[name] = plugin
	local enabled, loadable = select(4,GetAddOnInfo("ElvUI_Config"))
	if enabled and loadable then
		if not lib.ConfigFrame then
			local configFrame = CreateFrame("Frame")
			configFrame:RegisterEvent("ADDON_LOADED")
			configFrame:SetScript("OnEvent", function(self,event,addon)
				if addon == "ElvUI_Config" then
					for _, plugin in pairs(lib.plugins) do
						if(plugin.callback) then
							plugin.callback()
						end
					end
				end
			end)
			lib.ConfigFrame = configFrame
		end
	else
		-- Need to update plugins list
		if name ~= MAJOR then
			E.Options.args.plugins.args.plugins.name = lib:GeneratePluginList()
		end
		callback()
	end

	lib:SetupVersionCheck(plugin)
	lib.index = lib.index + 1
	
	return plugin
end

function lib:SetupVersionCheck(plugin)
	local prefix = "EPVC"..lib.index
	E["Send"..plugin.name.."VersionCheck"] = function()
		local _, instanceType = IsInInstance()
		if IsInRaid() then
			SendAddonMessage(prefix, plugin.version, (not IsInRaid(LE_PARTY_CATEGORY_HOME) and IsInRaid(LE_PARTY_CATEGORY_INSTANCE)) and "INSTANCE_CHAT" or "RAID")
		elseif IsInGroup() then
			SendAddonMessage(prefix, plugin.version, (not IsInGroup(LE_PARTY_CATEGORY_HOME) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) and "INSTANCE_CHAT" or "PARTY")
		end
		
		if E["Send"..plugin.name.."MSGTimer"] then
			E:CancelTimer(E["Send"..plugin.name.."MSGTimer"])
			E["Send"..plugin.name.."MSGTimer"] = nil
		end
	end
	RegisterAddonMessagePrefix(prefix)
	local function SendRecieve(self, event, mprefix, message, channel, sender)
		if event == "CHAT_MSG_ADDON" then
			if sender == E.myname or not sender or mprefix ~= prefix then return end
			
			if not E[plugin.name.."recievedOutOfDateMessage"] then
				if plugin.version ~= 'BETA' and tonumber(message) ~= nil and tonumber(message) > tonumber(plugin.version) then
					E:Print("Your version of " .. plugin.name .. " is out of date. You can download the latest version from http://www.tukui.org")
					E[plugin.name.."recievedOutOfDateMessage"] = true
				end
			end
		else
			E["Send"..plugin.name.."MSGTimer"] = E:ScheduleTimer("Send"..plugin.name.."VersionCheck", 12)
		end
	end

	local f = CreateFrame('Frame')
	f:RegisterEvent("GROUP_ROSTER_UPDATE")
	f:RegisterEvent("CHAT_MSG_ADDON")
	f:SetScript('OnEvent', SendRecieve)
end

function lib:GetPluginOptions()
	E.Options.args.plugins = {
        order = 10000,
        type = "group",
        name = "Plugins",
        guiInline = false,
        args = {
            pluginheader = {
                order = 1,
                type = "header",
                name = "Plugins Loaded",
            },
            plugins = {
                order = 2,
                type = "description",
                name = lib:GeneratePluginList(),
            },
        }
    }
end


function lib:GeneratePluginList()
	list = ""
	for _, plugin in pairs(lib.plugins) do
		local author = GetAddOnMetadata(plugin.name, "Author")
		if(author) then
			list = list .. plugin.name .. " Version " .. plugin.version .. " by " .. author .. "\n"
		else
			list = list .. plugin.name .. " Version " .. plugin.version .. "\n"
		end
	end
	return list
end

lib:RegisterPlugin(MAJOR, lib.GetPluginOptions)