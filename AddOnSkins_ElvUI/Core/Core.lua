local AddOnName = select(1, ...)
local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:NewModule('AddOnSkins', 'AceTimer-3.0', 'AceEvent-3.0')
local S = E:GetModule('Skins')
local LSM, EP, ES = LibStub('LibSharedMedia-3.0'), LibStub('LibElvUIPlugin-1.0'), nil
LSM:Register('font', 'PT Sans Narrow Bold', [[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]])

local tinsert, pairs, ipairs, unpack, pcall, select, type = tinsert, pairs, ipairs, unpack, pcall, select, type
local format, gsub, strfind, strmatch, floor = format, gsub, strfind, strmatch, floor
local GetAddOnInfo = GetAddOnInfo
local FoundError = false
local Debug = false

AddOnSkins = {}
AddOnSkins[1] = AS

AS.LSM = LSM
AS.skins = {}
AS.embeds = {}
AS.events = {}
AS.register = {}
AS.FrameLocks = {}
E.private.addonskins = {}

AS.SLE = select(4, GetAddOnInfo('ElvUI_SLE'))
AS.Title = select(2, GetAddOnInfo(AddOnName))
AS.Version = GetAddOnMetadata(AddOnName, 'Version')
AS.TicketTracker = 'http://git.tukui.org/Azilroka/addonskins'
AS.TexCoords = E.TexCoords
AS.Locale = L
AS.MyClass = E.myclass
AS.MyName = E.myname
AS.MyRealm = E.myrealm
AS.Noop = function() return end
AS.Mult = E.mult

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

function AS:CheckAddOn(addon)
	return select(4, GetAddOnInfo(addon))
end

function AS:Print(string)
	print(format('%s %s', AS.Title, string))
end

function AS:PrintURL(url)
	return format('|cFF00AAFF[|Hurl:%s|h%s|h]|r', url, url)
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
	for frame, data in pairs(AS.FrameLocks) do
		if data.shown then
			_G[frame]:Show()
		end
	end
end

function AS:RemoveNonPetBattleFrames()
	for frame, data in pairs(AS.FrameLocks) do
		if _G[frame]:IsVisible() then
			data.shown = true
			_G[frame]:Hide()
		else
			data.shown = false
		end
	end
end

function AS:CheckOption(optionName, ...)
	for i = 1, select('#', ...) do
		local addon = select(i, ...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	
	return E.private.addonskins[optionName]
end

function AS:SetOption(optionName, value)
	E.private.addonskins[optionName] = value
end

function AS:ToggleOption(optionName)
	E.private.addonskins[optionName] = not E.private.addonskins[optionName]
end

function AS:DisableOption(optionName)
	AS:SetOption(optionName, false)
end

function AS:EnableOption(optionName)
	AS:SetOption(optionName, true)
end

local function GenerateEventFunction(event)
	local eventHandler = function(self, event, ...)
		for skin, funcs in pairs(self.skins) do
			if AS:CheckOption(skin) and self.events[event][skin] then
				for _, func in ipairs(funcs) do
					AS:CallSkin(skin, func, event, ...)
				end
			end
		end
	end
	return eventHandler
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
	if not self.register[skinName] then self.register[skinName] = {} end
	self.register[skinName][skinFunc] = registerMe
end

function AS:RegisteredSkin(skinName, priority, func, events)
	local events = events
	for c, _ in pairs(events) do
		if strfind(c, '%[') then
			local conflict = strmatch(c, '%[([!%w_]+)%]')
			if select(4, GetAddOnInfo(conflict)) then return end
		end
	end
	if not self.skins[skinName] then self.skins[skinName] = {} end
	self.skins[skinName][priority] = func
	for event, _ in pairs(events) do
		if not strfind(event, '%[') then
			if not self.events[event] then
				self[event] = GenerateEventFunction(event)
				self:RegisterEvent(event); 
				self.events[event] = {} 
			end
			self.events[event][skinName] = true
		end
	end
end

function AS:CallSkin(skin, func, event, ...)
	local pass, error = pcall(func, self, event, ...)
	if not pass then
		local message = '%s: |cffff0000There was an error in the|r |cff0affff%s|r |cffff0000skin|r.'
		local errormessage = '%s Error: %s'
		local skin = gsub(skin, 'Skin', '')
		AS:Print(format(message, AS.Version, skin))
		FoundError = true
		if Debug then
			AS:Print(format(errormessage, skin, error))
		end
	end
end

function AS:UnregisterSkinEvent(skinName, event)
	if not self.events[event] then return end
	if not self.events[event][skinName] then return end

	self.events[event][skinName] = nil
	local found = false
	for skin, _ in pairs(self.events[event]) do
		if skin then
			found = true
			break
		end
	end
	if not found then
		self:UnregisterEvent(event)
	end
end

function AS:UpdateMedia()
	AS.Blank = LSM:Fetch('background', 'ElvUI Blank')
	AS.Font = LSM:Fetch('font', E.db.general.font)
	AS.PixelFont = LSM:Fetch('font', 'ElvUI Pixel')
	AS.NormTex = LSM:Fetch('statusbar', E.private.general.normTex)
	AS.GlossTex = LSM:Fetch('statusbar', E.private.general.glossTex)
	AS.BackdropColor = E['media'].backdropcolor
	AS.BorderColor = E['media'].bordercolor
	AS.UIScale = UIParent:GetScale()
end

function AS:StartSkinning(event)
	if self.enteredworld then return end
	self.enteredworld = true

	E:GetModule('DataTexts'):RegisterLDB()
	E:GetModule('DataTexts'):LoadDataTexts()
	E:UpdateMedia()

	for skin, alldata in pairs(self.register) do
		for _, data in pairs(alldata) do
			self:RegisteredSkin(skin, data.priority, data.func, data.events)
		end
	end

	for skin, funcs in pairs(self.skins) do
		if self:CheckOption(skin) then
			for _, func in ipairs(funcs) do
				self:CallSkin(skin, func, event)
			end
		end
	end

	if FoundError then
		AS:Print(format('%s: ElvUI Version %s', AS.Version, GetAddOnMetadata('ElvUI', 'Version')))
		if AS.SLE then
			AS:Print(format('%s: ElvUI S&L Version %s', AS.Version, GetAddOnMetadata('ElvUI_SLE', 'Version')))
		end
		AS:Print(format('%s: Please report this to Azilroka immediately @ %s', AS.Version, AS:PrintURL(AS.TicketTracker)))
	end

	AS:EmbedInit()
	self:UnregisterEvent(event)
end

function AS:Initialize()
	if self.initialized then return end
	self.initialized = true

	hooksecurefunc(E, 'UpdateMedia', AS.UpdateMedia)
	E:UpdateMedia()

	local ElvUIVersion, MinElvUIVersion = tonumber(GetAddOnMetadata('ElvUI', 'Version')), 6.99
	if ElvUIVersion < MinElvUIVersion then
		AS:AcceptFrame(format('%s - Required ElvUI Version %s. You currently have %s.\n\n Download ElvUI @\n\n %s', AS.Title, MinElvUIVersion, ElvUIVersion, AS:PrintURL('http://www.tukui.org/dl.php')), function(self) print(AS:PrintURL('http://www.tukui.org/dl.php')) end)
		AS:Print('Loading Aborted')
		return
	end

	EP:RegisterPlugin(AddOnName, AS.GenerateOptions)
	ES = E:GetModule('EnhancedShadows', true)

	self:RegisterEvent('PET_BATTLE_CLOSE', 'AddNonPetBattleFrames')
	self:RegisterEvent('PET_BATTLE_OPENING_START', 'RemoveNonPetBattleFrames')
	self:RegisterEvent('PLAYER_ENTERING_WORLD', 'StartSkinning')
end

function AS:SkinButton(...)
	S:HandleButton(...)
end

function AS:SkinScrollBar(...)
	S:HandleScrollBar(...)
end

function AS:SkinTab(...)
	S:HandleTab(...)
end

function AS:SkinNextPrevButton(...)
	S:HandleNextPrevButton(...)
end

function AS:SkinRotateButton(...)
	S:HandleRotateButton(...)
end

function AS:SkinDropDownBox(...)
	S:HandleDropDownBox(...)
end

function AS:SkinCheckBox(...)
	S:HandleCheckBox(...)
end

function AS:SkinCloseButton(...)
	S:HandleCloseButton(...)
end

function AS:SkinSlideBar(frame, size)
	S:HandleSliderFrame(frame)
	if size then
		frame:GetThumbTexture():Size(size-2,size-2)
	end
end

function AS:SkinIconButton(...)
	S:HandleItemButton(...)
end

function AS:Delay(delay, func, ...)
	E:Delay(delay, func, ...)
end

function AS:SkinEditBox(frame, width, height)
	S:HandleEditBox(frame)
	if width then frame:Width(width) end
	if height then frame:Height(height) end
end

function AS:SkinFrame(frame, template, override, kill)
	if not template then template = 'Transparent' end
	if not override then frame:StripTextures(kill) end
	frame:SetTemplate(template, true)
	if ES then
		frame:CreateShadow()
		ES:RegisterShadow(frame.shadow)
	end
end

function AS:SkinBackdropFrame(frame, template, override, kill, setpoints)
	if not template then template = 'Transparent' end
	if not override then frame:StripTextures(kill) end
	frame:CreateBackdrop(template, true)
	if setpoints then frame.backdrop:SetAllPoints() end
end

function AS:SkinTitleBar(frame, template, override, kill)
	if not template then template = 'Transparent' end
	if not override then frame:StripTextures(kill) end
	frame:SetTemplate(template, true)
end

function AS:SkinStatusBar(bar, ClassColor)
	AS:SkinBackdropFrame(bar, ClassColor and 'ClassColor' or 'Default')
	bar:SetStatusBarTexture(AS.NormTex)
	if ClassColor then
		local color = RAID_CLASS_COLORS[AS.MyClass]
		bar:SetStatusBarColor(color.r, color.g, color.b)
	end
end

function AS:SkinTexture(frame)
	frame:SetTexCoord(unpack(AS.TexCoords))
end

function AS:SkinTooltip(tooltip)
	tooltip:HookScript('OnShow', function(self) self:SetTemplate('Transparent') end)
end

function AS:Desaturate(frame)
	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:IsObjectType('Texture') then
			local Texture = region:GetTexture()
			if type(Texture) == 'string' and strlower(Texture) == 'interface\\dialogframe\\ui-dialogbox-corner' then
				region:SetTexture(nil)
				region:Kill()
			else
				region:SetDesaturated(true)
			end
		end
	end
	frame:HookScript('OnUpdate', function(self)
		if self:GetNormalTexture() then
			self:GetNormalTexture():SetDesaturated(true)
		end
		if self:GetPushedTexture() then
			self:GetPushedTexture():SetDesaturated(true)
		end
		if self:GetHighlightTexture() then
			self:GetHighlightTexture():SetDesaturated(true)
		end
	end)
end

local AcceptFrame
function AS:AcceptFrame(MainText, Function)
	if not AcceptFrame then
		AcceptFrame = CreateFrame('Frame', nil, UIParent)
		AcceptFrame:SetTemplate('Transparent')
		AcceptFrame:SetPoint('CENTER', UIParent, 'CENTER')
		AcceptFrame:SetFrameStrata('DIALOG')
		AcceptFrame.Text = AcceptFrame:CreateFontString(nil, 'OVERLAY')
		AcceptFrame.Text:SetWordWrap(true)
		AcceptFrame.Text:SetWidth(200)
		AcceptFrame.Text:SetFont(LSM:Fetch('font', E.db.general.font), 12)
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
	AcceptFrame:SetSize(250, AcceptFrame.Text:GetStringHeight() + 60)
	AcceptFrame.Accept:SetScript('OnClick', Function)
	AcceptFrame:Show()
end

E:RegisterModule(AS:GetName())