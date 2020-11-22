local AS, ASL = unpack(AddOnSkins)
local AddOnName = ...

-- Cache global variables
--Lua functions
local _G = _G
local select, pairs, ipairs, type, pcall = select, pairs, ipairs, type, pcall
local floor, print, format, strlower, strfind, strmatch = floor, print, format, strlower, strfind, strmatch
local sort, tinsert = sort, tinsert
--WoW API / Variables
local IsAddOnLoaded, C_Timer = IsAddOnLoaded, C_Timer
-- GLOBALS:

AS.SkinErrors = {}

local AcceptFrame
local Validator = CreateFrame('Frame')

function AS:CheckOption(optionName, ...)
	for i = 1, select('#', ...) do
		local addon = select(i, ...)
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

function AS:Scale(Number)
	return AS.Mult * floor(Number/AS.Mult + .5)
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

function AS:RegisterSkin(addonName, skinFunc, ...)
	local events = {}
	local priority = 1
	for i = 1, select('#', ...) do
		local event = select(i, ...)
		if not event then break end
		if type(event) == 'number' then
			priority = event
		else
			events[event] = true
		end
	end
	local registerMe = { func = skinFunc, events = events, priority = priority }
	if not AS.register[addonName] then AS.register[addonName] = {} end
	AS.register[addonName][skinFunc] = registerMe
end

function AS:UnregisterSkin(addonName, skinFunc)
	if (not AS.register[addonName] or not AS.preload[addonName]) then return end

	if skinFunc then
		AS.register[addonName][skinFunc] = nil
	else
		AS.register[addonName] = nil
	end
	if AS.preload[addonName] then
		AS.preload[addonName] = nil
	end
end

local function GenerateEventFunction()
	local eventHandler = function(_, event, ...)
		for skin, funcs in pairs(AS.skins) do
			if AS:CheckOption(skin) and AS.events[event][skin] then
				for _, func in ipairs(funcs) do
					AS:CallSkin(skin, func, event, ...)
				end
			end
		end
	end
	return eventHandler
end

function AS:RegisteredSkin(addonName, priority, func, events)
	for c, _ in pairs(events) do
		if strfind(c, '%[') then
			local conflict = strmatch(c, '%[([!%w_]+)%]')
			if AS:CheckAddOn(conflict) then return end
		end
	end
	if not AS.skins[addonName] then AS.skins[addonName] = {} end
	AS.skins[addonName][priority] = func
	for event, _ in pairs(events) do
		if not strfind(event, '%[') then
			if pcall(Validator.RegisterEvent, Validator, event) then
				Validator:UnregisterEvent(event)
				if not AS.events[event] then
					AS[event] = GenerateEventFunction()
					AS:RegisterEvent(event)
					AS.events[event] = {}
				end
				AS.events[event][addonName] = true
			end
		end
	end
end

function AS:RegisterSkinForPreload(addonName, skinFunc, addon1)
	AS.preload[addonName] = { func = skinFunc, addon = addon1 }
end

function AS:RunPreload(addonName)
	local preloadData = AS.preload[addonName]
	if preloadData and AS:CheckOption(preloadData.addon or addonName) then
		pcall(preloadData.func, self, 'ADDON_LOADED', addonName)
	end
end

local function errorhandler(err)
	return geterrorhandler()(err)
end

function AS:CallSkin(addonName, func, event, ...)
	if (AS:CheckOption('SkinDebug')) then
		local args = {...}
		xpcall(function() func(self, event, unpack(args)) end, errorhandler)
	else
		local pass, error = pcall(func, self, event, ...)
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
	AS.Blank = AS.LSM:Fetch('background', 'Solid')
	AS.Font = AS.LSM:Fetch('font', "Friz Quadrata TT")
	AS.PixelFont = AS.LSM:Fetch('font', "Arial Narrow")
	AS.NormTex = AS.LSM:Fetch('statusbar', "Blizzard")
	AS.BackdropColor = { .2, .2, .2, .8 }
	AS.BorderColor = { 0, 0, 0 }
	AS.Color = AS.ClassColor
	AS.HideShadows = false
end

function AS:GetPixelScale()
	AS.mult = max(0.4, min(1.15, 768 / AS.ScreenHeight))
end

function AS:StartSkinning()
	AS:UnregisterEvent('PLAYER_ENTERING_WORLD')
	AS:GetPixelScale()

	AS.Color = AS:CheckOption('ClassColor') and AS.ClassColor or { 0, 0.44, .87, 1 }
	AS.ParchmentEnabled = AS:CheckOption('Parchment')

	AS:UpdateMedia()

	for addonName, alldata in pairs(AS.register) do
		for _, data in pairs(alldata) do
			AS:RegisteredSkin(addonName, data.priority, data.func, data.events)
		end
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
		if AS:CheckOption(addonName) and strfind(addonName, 'Blizzard_') then
			for _, func in ipairs(funcs) do
				if IsAddOnLoaded(addonName) then
					AS:CallSkin(addonName, func, 'ADDON_LOADED', addonName)
				end

				AS:CallSkin(addonName, func, 'PLAYER_ENTERING_WORLD')
			end
		end

		if AS:CheckOption(addonName) and (AS:CheckAddOn(addonName) or addonName == 'Libraries' or addonName == 'Ace3') then
			for _, func in ipairs(funcs) do
				AS:CallSkin(addonName, func, 'PLAYER_ENTERING_WORLD')
			end
		end
	end

	if AS:CheckOption('LoginMsg') then
		AS:Print(format("Version: |cFF1784D1%s|r Loaded!", AS.Version))
	end

	if AS:CheckAddOn('AddonLoader') then
		AS:AcceptFrame('AddOnSkins is not compatible with AddonLoader.\nPlease remove it if you would like all the skins to function.')
	end

	if not AS:CheckOption('SkinDebug') and AS.FoundError then
		AS:Print(format('%s: There was an error in the following skin(s): %s', AS.Version, table.concat(AS.SkinErrors, ", ")))
		AS:Print(format('Please report this to Azilroka immediately @ %s', AS:PrintURL(AS.TicketTracker)))
	end

	AS:EmbedInit()

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

		if _G.EnhancedShadows then
			AS.ES = _G.EnhancedShadows
		end

		AS.EP = LibStub('LibElvUIPlugin-1.0', true)
		if AS.EP then
			AS.EP:RegisterPlugin(AddOnName, AS.GetOptions)
		else
			AS:GetOptions()
		end

		AS:RegisterEvent('PLAYER_ENTERING_WORLD', 'StartSkinning')

		if AS.LSM then
			AS.LSM:Register('statusbar', 'Solid', [[Interface\Buttons\WHITE8X8]])
		end

		if AS.Retail then
			AS:RegisterEvent('PET_BATTLE_CLOSE', 'AddNonPetBattleFrames')
			AS:RegisterEvent('PET_BATTLE_OPENING_START', 'RemoveNonPetBattleFrames')
		end
	end
end

function AS:AcceptFrame(MainText, Function)
	if not AcceptFrame then
		AcceptFrame = CreateFrame('Frame', 'AcceptFrame', UIParent)
		AS:SkinFrame(AcceptFrame)
		AcceptFrame:SetPoint('CENTER', UIParent, 'CENTER')
		AcceptFrame:SetFrameStrata('DIALOG')
		AcceptFrame.Text = AcceptFrame:CreateFontString(nil, "OVERLAY")
		AcceptFrame.Text:SetFont(AS.Font, 14)
		AcceptFrame.Text:SetPoint('TOP', AcceptFrame, 'TOP', 0, -10)
		AcceptFrame.Accept = CreateFrame('Button', nil, AcceptFrame, 'OptionsButtonTemplate')
		AS:SkinButton(AcceptFrame.Accept)
		AcceptFrame.Accept:SetSize(70, 25)
		AcceptFrame.Accept:SetPoint('RIGHT', AcceptFrame, 'BOTTOM', -10, 20)
		AcceptFrame.Accept:SetFormattedText('|cFFFFFFFF%s|r', OKAY)
		AcceptFrame.Close = CreateFrame('Button', nil, AcceptFrame, 'OptionsButtonTemplate')
		AS:SkinButton(AcceptFrame.Close)
		AcceptFrame.Close:SetSize(70, 25)
		AcceptFrame.Close:SetPoint('LEFT', AcceptFrame, 'BOTTOM', 10, 20)
		AcceptFrame.Close:SetScript('OnClick', function(self) self:GetParent():Hide() end)
		AcceptFrame.Close:SetFormattedText('|cFFFFFFFF%s|r', CLOSE)
	end
	AcceptFrame.Text:SetText(MainText)
	AcceptFrame:SetSize(AcceptFrame.Text:GetStringWidth() + 100, AcceptFrame.Text:GetStringHeight() + 60)
	AcceptFrame.Accept:SetScript('OnClick', Function or function(self) AcceptFrame:Hide() end)
	AcceptFrame:Show()
end

AS:RegisterEvent('ADDON_LOADED', 'Init')
AS:RegisterEvent('PLAYER_LOGIN', 'Init')
