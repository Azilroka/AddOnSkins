AddOnSkins[2] = AddOnSkins[1].Libs.ACL:GetLocale('AddOnSkins', GetLocale()) -- Locale doesn't exist yet, make it exist.

local AS, L, S, R = unpack(AddOnSkins)
local AddOnName = ...

local ES = AS.EmbedSystem

local _G = _G
local pairs, ipairs, type, pcall = pairs, ipairs, type, pcall
local floor, print, format, strlower, strmatch, strlen = floor, print, format, strlower, strmatch, strlen
local sort, tinsert = sort, tinsert

local IsAddOnLoaded, C_Timer = IsAddOnLoaded, C_Timer

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
	RegisterStateDriver(frame, 'visibility', '[petbattle] hide; show')
end

function AS:SkinEvent(event, ...)
	if event == 'ADDON_LOADED' then
		local addon = ...
		if AS.skins[addon] and AS:CheckOption(addon) then
			for _, func in ipairs(AS.skins[addon]) do
				AS:CallSkin(addon, func, event, ...)
			end
			if strmatch(addon, '^Blizzard_') then
				AS:UnregisterSkinEvent(addon, event)
			end
		end
	else
		for skin, funcs in pairs(AS.skins) do
			if AS.events[event][skin] and AS:CheckOption(skin) and (skin == 'Libraries' or skin == 'Ace3' or strmatch(skin, '^Blizzard_') or AS:CheckAddOn(skin)) then
				for _, func in ipairs(funcs) do
					AS:CallSkin(skin, func, event, ...)
				end
			end
		end
	end
end

local alwaysValid = { PLAYER_ENTERING_WORLD = true, ADDON_LOADED = true }

function AS:RegisterSkin(addonName, skinFunc, ...)
	local priority = 1
	for _, event in next, {... or 'PLAYER_ENTERING_WORLD'} do
		if not event then break end
		local conflict = strmatch(event, '%[([!%w_]+)%]')
		if conflict and AS:CheckAddOn(conflict) then
			return
		elseif type(event) == 'number' then
			priority = event
		elseif alwaysValid[event] or pcall(Validator.RegisterEvent, Validator, event) then
			Validator:UnregisterEvent(event)
			if not AS.events[event] then AS.events[event] = {} end
			AS.events[event][addonName] = true
		end
	end

	if not AS.skins[addonName] then AS.skins[addonName] = {} end
	AS.skins[addonName][priority] = skinFunc or R[addonName]
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
			_G.AddOnSkinsDS[AS.Version] = _G.AddOnSkinsDS[AS.Version] or {}
			_G.AddOnSkinsDS[AS.Version][addonName] = true
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

function AS:StartUp(event, ...)
	AS:UnregisterEvent('PLAYER_ENTERING_WORLD')

	AS.Color = AS:CheckOption('ClassColor') and AS.ClassColor or { 0, 0.44, .87, 1 }
	AS.ParchmentEnabled = AS:CheckOption('Parchment')

	AS:UpdateMedia()

	if AS:CheckAddOn('ElvUI') then
		AS:SecureHook(_G.ElvUI[1], 'UpdateMedia')
	end

	if not AS:CheckOption('SkinDebug') then
		for Version, SkinTable in pairs(_G.AddOnSkinsDS) do
			if Version == AS.Version or Version < AS.Version then
				if Version < AS.Version then
					_G.AddOnSkinsDS[Version] = nil
				end
				for addonName, _ in pairs(SkinTable) do
					AS:SetOption(addonName, ((Version == AS.Version) and false or (Version < AS.Version) and true))
				end
			end
		end
	end

	-- Check Blizzard for already loaded
	for addonName, funcs in next, AS.skins do
		if strmatch(addonName, '^Blizzard_') and AS:CheckOption(addonName) then
			for _, func in ipairs(funcs) do
				if IsAddOnLoaded(addonName) then
					AS:CallSkin(addonName, func, 'ADDON_LOADED', addonName)
				end
			end
		end
	end

	AS:SkinEvent(event, ...)

	if AS:CheckOption('LoginMsg') then
		AS:Print(format("Version: |cFF1784D1%s|r Loaded!", AS.Version))
	end

	if not AS:CheckOption('SkinDebug') and AS.FoundError then
		AS:Print(format('%s: There was an error in the following skin(s): %s', AS.Version, table.concat(AS.SkinErrors, ", ")))
		AS:Print(format('Please report this to Azilroka immediately @ %s', AS:PrintURL(AS.TicketTracker)))
	end

	ES:Initialize()

	AS.RunOnce = true
end

function AS:Init(event, addon)
	if event == 'ADDON_LOADED' and (AS.Initialized or IsAddOnLoaded(AddOnName)) then
		if addon == AddOnName then
			AS.Initialized = true
			AS:BuildProfile()
			AS:UpdateMedia()
		end

		AS:RunPreload(addon)
	end

	if event == 'PLAYER_LOGIN' then
		AS:BuildOptions()

		for addOnEvent in pairs(AS.events) do
			AS:RegisterEvent(addOnEvent, 'SkinEvent')
		end

		AS:RegisterEvent('PLAYER_ENTERING_WORLD', 'StartUp')
	end
end

AS:RegisterEvent('ADDON_LOADED', 'Init')
AS:RegisterEvent('PLAYER_LOGIN', 'Init')
