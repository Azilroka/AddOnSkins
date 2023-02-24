AddOnSkins[2] = AddOnSkins[1].Libs.ACL:GetLocale('AddOnSkins', GetLocale()) -- Locale doesn't exist yet, make it exist.

local AS, L = unpack(AddOnSkins)
local AddOnName = ...

local ES = AS.EmbedSystem

-- Cache global variables
--Lua functions
local _G = _G
local pairs, ipairs, type, pcall = pairs, ipairs, type, pcall
local floor, print, format, strlower, strfind, strmatch = floor, print, format, strlower, strfind, strmatch
local sort, tinsert = sort, tinsert
--WoW API / Variables
local IsAddOnLoaded, C_Timer = IsAddOnLoaded, C_Timer
-- GLOBALS:

AS.SkinErrors = {}

local Validator = CreateFrame('Frame')

function AS:CheckOption(optionName, ...)
	for _, addon in next, {...} do
		if not addon then break end
		if not AS:CheckAddOn(addon) then return false end
	end

	return AS.db[optionName]
end

function AS:SetOption(optionName, value)
	AS.db[optionName] = value

	if AddOnSkinsDS[AS.Version] and AddOnSkinsDS[AS.Version][optionName] == true then
		AddOnSkinsDS[AS.Version][optionName] = nil
	end
end

function AS:IsSkinEnabled(name, elvName)
	if elvName and _G.ElvUI and _G.ElvUI[1].private.skins.blizzard.enable and _G.ElvUI[1].private.skins.blizzard[elvName] then
		return false
	end
	return name and AS:CheckOption(name)
end

function AS:GetColor(name)
	local color = '|cff1784d1%s|r'
	return (color):format(name)
end

function AS:RGBToHex(r, g, b, header)
	r = r <= 1 and r >= 0 and r or 1
	g = g <= 1 and g >= 0 and g or 1
	b = b <= 1 and b >= 0 and b or 1
	return format('%s%02x%02x%02x', header or '|cff', r * 255, g * 255, b * 255)
end

function AS:GetClassColor(class)
	local color = (_G.CUSTOM_CLASS_COLORS and _G.CUSTOM_CLASS_COLORS[class]) or _G.RAID_CLASS_COLORS[class or 'PRIEST']
	if type(color) ~= 'table' then return end

	if not color.colorStr then
		color.colorStr = AS:RGBToHex(color.r, color.g, color.b, 'ff')
	elseif strlen(color.colorStr) == 6 then
		color.colorStr = 'ff'..color.colorStr
	end

	return color
end

function AS:OrderedPairs(t, f)
	local a = {}
	for n in pairs(t) do tinsert(a, n) end
	sort(a, f)
	local i = 0
	local iter = function()
		i = i + 1
		if a[i] == nil then return nil
			else return a[i], t[a[i]]
		end
	end
	return iter
end

function AS:Delay(delay, func)
	C_Timer.After(delay, func)
end

function AS:CheckAddOn(addon)
	return AS.AddOns[strlower(addon)] or false
end

function AS:GetAddOnVersion(addon)
	return AS.AddOnVersion[strlower(addon)] or nil
end

function AS:Print(string)
	print(format('%s %s', AS.Title, string))
end

function AS:PrintURL(url)
	return format("|cFFC495DD[|Hurl:%s|h%s|h]|r", url, url)
end

function AS:Round(num, idp)
	local mult = 10^(idp or 0)
	return floor(num * mult + 0.5) / mult
end

function AS:RegisterForPetBattleHide(frame)
	if frame.IsVisible and frame:GetName() then
		AS.FrameLocks[frame:GetName()] = { shown = false }
	end
end

function AS:AddNonPetBattleFrames()
	for frame,data in pairs(AS.FrameLocks) do
		if data.shown then
			_G[frame]:Show()
		end
	end
end

function AS:RemoveNonPetBattleFrames()
	for frame,data in pairs(AS.FrameLocks) do
		if _G[frame]:IsVisible() then
			data.shown = true
			_G[frame]:Hide()
		else
			data.shown = false
		end
	end
end

function AS:SkinEvent(event, ...)
	for skin, funcs in pairs(AS.skins) do
		if AS.events[event][skin] and AS:CheckOption(skin) then
			for _, func in ipairs(funcs) do
				AS:CallSkin(skin, func, event, ...)
			end
		end
	end
end

function AS:RegisterSkin(addonName, skinFunc, ...)
	local priority = 1
	for _, event in next, {...} do
		if not event then break end
		local conflict = strmatch(event, '%[([!%w_]+)%]')
		if conflict and AS:CheckAddOn(conflict) then
			return
		elseif type(event) == 'number' then
			priority = event
		elseif pcall(Validator.RegisterEvent, Validator, event) then
			Validator:UnregisterEvent(event)
			AS.events[event] = {}
			AS.events[event][addonName] = true
		end
	end

	if not AS.skins[addonName] then AS.skins[addonName] = {} end
	AS.skins[addonName][priority] = skinFunc
end

function AS:UnregisterSkin(addonName)
	if (not AS.skins[addonName] or not AS.preload[addonName]) then return end

	AS.skins[addonName] = nil
	if AS.preload[addonName] then
		AS.preload[addonName] = nil
	end
end

function AS:RegisterSkinForPreload(addonName, skinFunc, addon)
	AS.preload[addonName] = { func = skinFunc, addon = addon }
end

function AS:RunPreload(addonName)
	local preloadData = AS.preload[addonName]
	if preloadData and AS:CheckOption(preloadData.addon or addonName) then
		pcall(preloadData.func, self, 'ADDON_LOADED', addonName)
	end
end

function AS:CallSkin(addonName, func, event, ...)
	if (AS:CheckOption('SkinDebug')) then
		local args = {...}
		securecallfunction(function() func(self, event, unpack(args)) end)
	else
		local pass = pcall(func, self, event, ...)
		if not pass then
			AS.FoundError = true
			AddOnSkinsDS[AS.Version] = AddOnSkinsDS[AS.Version] or {}
			AddOnSkinsDS[AS.Version][addonName] = true
			AS:SetOption(addonName, false)
			local Name = AS:CheckAddOn(addonName) and format('%s %s', addonName, AS:GetAddOnVersion(addonName) or 'UNKNOWN') or addonName

			tinsert(AS.SkinErrors, Name)

			if AS.RunOnce then
				AS:Print(format('%s: There was an error in the following skin: %s', AS.Version, Name))
			end
		end
	end
end

function AS:UnregisterSkinEvent(addonName, event)
	if not AS.events[event] then return end
	if not AS.events[event][addonName] then return end

	AS.events[event][addonName] = nil

	for addon, _ in pairs(AS.events[event]) do
		if addon then
			return
		end
	end

	AS:UnregisterEvent(event)
end

function AS:UpdateMedia()
	AS.Blank = AS.Libs.LSM:Fetch('background', 'Solid')
	AS.Font = AS.Libs.LSM:Fetch('font', "Friz Quadrata TT")
	AS.PixelFont = AS.Libs.LSM:Fetch('font', "Arial Narrow")
	AS.NormTex = AS.Libs.LSM:Fetch('statusbar', "Blizzard")
	AS.BackdropColor = { .2, .2, .2, .8 }
	AS.BorderColor = { 0, 0, 0 }
	AS.Color = AS.ClassColor
	AS.HideShadows = false
end

function AS:StartSkinning()
	AS:UnregisterEvent('PLAYER_ENTERING_WORLD')

	for event in pairs(AS.events) do
		AS:RegisterEvent(event, 'SkinEvent')
	end

	AS.Color = AS:CheckOption('ClassColor') and AS.ClassColor or { 0, 0.44, .87, 1 }
	AS.ParchmentEnabled = AS:CheckOption('Parchment')

	AS:UpdateMedia()

	if AS:CheckAddOn('ElvUI') then
		AS:SecureHook(ElvUI[1], 'UpdateMedia')
	end

	if not AS:CheckOption('SkinDebug') then
		for Version, SkinTable in pairs(AddOnSkinsDS) do
			if Version == AS.Version or Version < AS.Version then
				for addonName, _ in pairs(SkinTable) do
					AS:SetOption(addonName, ((Version == AS.Version) and false or (Version < AS.Version) and true))
				end
				if Version < AS.Version then
					AddOnSkinsDS[Version] = nil
				end
			end
		end
	end

	for addonName, funcs in AS:OrderedPairs(AS.skins) do
		-- Check Blizzard
		if strfind(addonName, 'Blizzard_') and AS:CheckOption(addonName) then
			for _, func in ipairs(funcs) do
				if IsAddOnLoaded(addonName) then
					AS:CallSkin(addonName, func, 'ADDON_LOADED', addonName)
				end

				AS:CallSkin(addonName, func, 'PLAYER_ENTERING_WORLD')
			end
		end

		if AS:CheckOption(addonName) and (addonName == 'Libraries' or addonName == 'Ace3' or AS:CheckAddOn(addonName)) then
			for _, func in ipairs(funcs) do
				AS:CallSkin(addonName, func, 'PLAYER_ENTERING_WORLD')
			end
		end
	end

	if AS:CheckOption('LoginMsg') then
		AS:Print(format("Version: |cFF1784D1%s|r Loaded!", AS.Version))
	end

	if AS:CheckAddOn('AddonLoader') then
		AS:Print('AddOnSkins is not compatible with AddonLoader.\nPlease remove it if you would like all the skins to function.')
	end

	if not AS:CheckOption('SkinDebug') and AS.FoundError then
		AS:Print(format('%s: There was an error in the following skin(s): %s', AS.Version, table.concat(AS.SkinErrors, ", ")))
		AS:Print(format('Please report this to Azilroka immediately @ %s', AS:PrintURL(AS.TicketTracker)))
	end

	ES:Initialize()

	AS.RunOnce = true
end

function AS:Init(event, addon)
	if event == 'ADDON_LOADED' and IsAddOnLoaded(AddOnName) then
		AS:BuildProfile()

		AS:UpdateMedia()

		AS:RunPreload(addon)
	end

	if event == 'PLAYER_LOGIN' then
		AS:BuildOptions()

		AS:RegisterEvent('PLAYER_ENTERING_WORLD', 'StartSkinning')

		if AS.Retail then
			AS:RegisterEvent('PET_BATTLE_CLOSE', 'AddNonPetBattleFrames')
			AS:RegisterEvent('PET_BATTLE_OPENING_START', 'RemoveNonPetBattleFrames')
		end
	end
end

AS:RegisterEvent('ADDON_LOADED', 'Init')
AS:RegisterEvent('PLAYER_LOGIN', 'Init')
