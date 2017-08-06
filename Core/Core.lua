local AS = unpack(AddOnSkins)
local AddOnName = ...
local ES
local FoundError

function AS:CheckOption(optionName, ...)
	for i = 1, select('#', ...) do
		local addon = select(i, ...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end

	return self.db[optionName]
end

function AS:SetOption(optionName, value)
	self.db[optionName] = value
end

function AS:DisableOption(optionName)
	AS:SetOption(optionName, false)
end

function AS:EnableOption(optionName)
	AS:SetOption(optionName, true)
end

function AS:ToggleOption(optionName)
	self.db[optionName] = not self.db[optionName]
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

function AS:Print(string)
	print(format('%s %s', AS.Title, string))
end

function AS:PrintURL(url)
	return format("|cFFFFFFFF[|Hurl:%s|h%s|h]|r", url, url)
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

function AS:RegisterSkin(skinName, skinFunc, ...)
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
	if not AS.register[skinName] then AS.register[skinName] = {} end
	AS.register[skinName][skinFunc] = registerMe
end

function AS:UnregisterSkin(skinName, skinFunc)
	if not AS.register[skinName] then return end

	if skinFunc then
		AS.register[skinName][skinFunc] = nil
	else
		AS.register[skinName] = nil
	end
end

local function GenerateEventFunction(event)
	local eventHandler = function(self, event, ...)
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

function AS:RegisteredSkin(skinName, priority, func, events)
	local events = events
	for c, _ in pairs(events) do
		if strfind(c, '%[') then
			local conflict = strmatch(c, '%[([!%w_]+)%]')
			if AS:CheckAddOn(conflict) then return end
		end
	end
	if not AS.skins[skinName] then AS.skins[skinName] = {} end
	AS.skins[skinName][priority] = func
	for event, _ in pairs(events) do
		if not strfind(event, '%[') then
			if not AS.events[event] then
				AS[event] = GenerateEventFunction(event)
				AS:RegisterEvent(event); 
				AS.events[event] = {} 
			end
			AS.events[event][skinName] = true
		end
	end
end

function AS:RegisterForPreload(skinName, skinFunc, addonName)
	AS.preload[addonName] = { func = skinFunc, addon = skinName }
end

function AS:RunPreload(addonName)
	if AS.preload[addonName] and AS:CheckOption(AS.preload[addonName].addon) then
		AS:CallSkin(AS.preload[addonName].addon, AS.preload[addonName].func, 'ADDON_LOADED', addonName)
	end
end

function AS:CallSkin(skin, func, event, ...)
	local pass, errormsg = pcall(func, self, event, ...)
	if not pass then
		local message = '%s %s: |cfFFF0000There was an error in the|r |cff0AFFFF%s|r |cffFF0000skin|r.'
		local errormessage = '%s Error: %s'
		DEFAULT_CHAT_FRAME:AddMessage(format(message, AS.Title, AS.Version, skin))
		FoundError = true
		if AS:CheckOption('SkinDebug') then
			DEFAULT_CHAT_FRAME:AddMessage(format(errormessage, skin, errormsg))
		end
	end
end

function AS:UnregisterSkinEvent(skinName, event)
	if not AS.events[event] then return end
	if not AS.events[event][skinName] then return end
	AS.events[event][skinName] = nil
	local found = false
	for skin,_ in pairs(AS.events[event]) do
		if skin then
			found = true
			break
		end
	end
	if not found then
		AS:UnregisterEvent(event)
	end
end

function AS:StartSkinning(event)
	AS:UnregisterEvent(event)

	local EP = LibStub('LibElvUIPlugin-1.0', true)
	if EP then
		EP:RegisterPlugin(AddOnName, AS.GetOptions)
	else
		AS:GetOptions()
	end

	AS:UpdateMedia()

	if AS:CheckAddOn('ElvUI') then
		ES = ElvUI[1]:GetModule('EnhancedShadows', true)
	end

	AS.Mult = 768/AS.ScreenHeight/UIParent:GetScale()
	AS.ParchmentEnabled = AS:CheckOption('Parchment')

	for skin, alldata in pairs(AS.register) do
		for _, data in pairs(alldata) do
			AS:RegisteredSkin(skin, data.priority, data.func, data.events)
		end
	end

	for skin, funcs in pairs(AS.skins) do
		if AS:CheckOption(skin) then
			for _, func in ipairs(funcs) do
				AS:CallSkin(skin, func, event)
			end
		end
	end

	if FoundError then
		AS:Print(format('%s: Please report this to Azilroka immediately @ %s', AS.Version, AS:PrintURL(AS.TicketTracker)))
	end
	
	AS:EmbedInit()

	if AS:CheckOption('LoginMsg') then 
		AS:Print(format("Version: |cFF1784D1%s|r Loaded!", AS.Version))
	end
end

function AS:UpdateMedia()
	local LSM = AS.LSM
	AS.Blank = LSM:Fetch('background', "Solid")
	AS.Font = LSM:Fetch('font', "Arial Narrow")
	AS.ActionBarFont = LSM:Fetch('font', "Arial Narrow")
	AS.PixelFont = LSM:Fetch('font', "Arial Narrow")
	AS.NormTex = LSM:Fetch('statusbar', "Blizzard Character Skills Bar")
	AS.BackdropColor = { 0, 0, 0 }
	AS.BorderColor = { 1, 1, 1 }
	AS.PixelPerfect = false
	AS.HideShadows = false
end

function AS:Init(event, addon)
	if event == 'ADDON_LOADED' and addon == AddOnName then
		AS:SetupProfile()

		for skin, alldata in pairs(AS.register) do
			if (AS:CheckOption(skin) == nil) then
				if AS:CheckAddOn('ElvUI') and strfind(skin, 'Blizzard_') then
					AS:DisableOption(skin)
				else
					AS:EnableOption(skin)
				end
			end
		end

		AS:UpdateMedia()
		AS:UpdateLocale()

		if AS:CheckAddOn('ElvUI') then
			local ElvUIVersion, MinElvUIVersion = tonumber(GetAddOnMetadata('ElvUI', 'Version')), 10.00
			if ElvUIVersion < MinElvUIVersion then
				AS:AcceptFrame(format('%s - Required ElvUI Version %s. You currently have %s.\n Download ElvUI @ %s', AS.Title, MinElvUIVersion, ElvUIVersion, AS:PrintURL('http://www.tukui.org/dl.php')), function(self) print(AS:PrintURL('http://www.tukui.org/dl.php')) self:Hide() end)
				AS:Print('Loading Aborted')
				AS:UnregisterAllEvents()
				return
			end
		end

		AS:CreateDataText()
	end
	if event == 'ADDON_LOADED' and IsAddOnLoaded(AddOnName) then
		AS:RunPreload(addon)
	end
	if event == 'PLAYER_LOGIN' then
		AS:UpdateMedia()
		AS:RegisterEvent('PET_BATTLE_CLOSE', 'AddNonPetBattleFrames')
		AS:RegisterEvent('PET_BATTLE_OPENING_START', 'RemoveNonPetBattleFrames')
		AS:RegisterEvent('PLAYER_ENTERING_WORLD', 'StartSkinning')
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
		AcceptFrame.Accept:SetFormattedText('|cFFFFFFFF%s|r', YES)
		AcceptFrame.Close = CreateFrame('Button', nil, AcceptFrame, 'OptionsButtonTemplate')
		AS:SkinButton(AcceptFrame.Close)
		AcceptFrame.Close:SetSize(70, 25)
		AcceptFrame.Close:SetPoint('LEFT', AcceptFrame, 'BOTTOM', 10, 20)
		AcceptFrame.Close:SetScript('OnClick', function(self) self:GetParent():Hide() end)
		AcceptFrame.Close:SetFormattedText('|cFFFFFFFF%s|r', NO)
	end
	AcceptFrame.Text:SetText(MainText)
	AcceptFrame:SetSize(AcceptFrame.Text:GetStringWidth() + 100, AcceptFrame.Text:GetStringHeight() + 60)
	AcceptFrame.Accept:SetScript('OnClick', Function)
	AcceptFrame:Show()
end

AS:RegisterEvent('ADDON_LOADED', 'Init')
AS:RegisterEvent('PLAYER_LOGIN', 'Init')
