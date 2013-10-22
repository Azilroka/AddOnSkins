local AddOnName = select(1, ...)
local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:NewModule('AddOnSkins', 'AceTimer-3.0', 'AceEvent-3.0')
local S = E:GetModule('Skins')
local LSM, EP = LibStub('LibSharedMedia-3.0'), LibStub('LibElvUIPlugin-1.0')

local tinsert, pairs, ipairs, unpack, pcall, select = tinsert, pairs, ipairs, unpack, pcall, select
local format, gsub, strfind, strmatch = format, gsub, strfind, strmatch

E.AddOnSkins = AS

AS.LSM = LSM
AS.skins = {}
AS.embeds = {}
AS.events = {}
AS.register = {}
AS.addOnWatch = {}
AS.FrameLocks = {}
E.private.addonskins = {}

AS.SLE = IsAddOnLoaded('ElvUI_SLE')
AS.Title = select(2, GetAddOnInfo(AddOnName))
AS.Version = GetAddOnMetadata(AddOnName, 'Version')
AS.TicketTracker = 'http://www.tukui.org/tickets/elvuiskins/'
AS.TexCoords = E.TexCoords
AS.Locale = L
AS.MyClass = E.myclass
AS.MyName = E.myname
AS.MyRealm = E.myrealm
AS.Noop = function() return end

local function pack(...)
	-- pack args
	local args = {}
	for i = 1,select('#',...) do
		local arg = select(i,...)
		if not arg then break end
		tinsert(args,arg)
	end
	return args
end

local function GenerateEventFunction(event)
	local eventHandler = function(self, event, ...)
		for skin, funcs in pairs(self.skins) do
			if AS:CheckOption(skin) and self.events[event][skin] then
				local args = pack(...)
				for _,func in ipairs(funcs) do
					AS:CallSkin(skin, func, event, unpack(args))
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
			if IsAddOnLoaded(conflict) then return end
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
		local message = '%s: |cffff0000There was an error in the|r |cff0affff%s|r |cffff0000skin|r.  Please report this to Azilroka immediately @ %s'
		local errormessage = '%s Error: %s'
		AS:Print(format(message, AS.Version, gsub(skin, 'Skin', ''), AS:PrintURL(AS.TicketTracker)))
		AS:Print(format(errormessage, gsub(skin, 'Skin', ''), error))
	end
end

function AS:UpdateMedia()
	AS.Blank = LSM:Fetch('background', 'ElvUI Blank')
	AS.Font = LSM:Fetch("font", E.db.general.font)
	AS.PixelFont = LSM:Fetch('font', 'ElvUI Pixel')
	AS.NormTex = LSM:Fetch('statusbar', E.private.general.normTex)
	AS.GlossTex = LSM:Fetch("statusbar", E.private.general.glossTex)
	AS.BackdropColor = E['media'].backdropcolor
	AS.BorderColor = E['media'].bordercolor
	AS.UIScale = UIParent:GetScale()
end

function AS:Initialize()
	if self.initialized then return end
	self.initialized = true

	hooksecurefunc(E, 'UpdateMedia', AS.UpdateMedia)
	E:UpdateMedia()

	local ElvUIVersion, MinElvUIVersion = tonumber(GetAddOnMetadata('ElvUI', 'Version')), 6.54
	if ElvUIVersion < MinElvUIVersion then
		local UpdateElvUIFrame = CreateFrame('Button', nil, UIParent)
		UpdateElvUIFrame:SetPoint('CENTER', UIParent, 'CENTER')
		UpdateElvUIFrame:SetFrameStrata('DIALOG')
		UpdateElvUIFrame.Text = UpdateElvUIFrame:CreateFontString(nil, "OVERLAY")
		UpdateElvUIFrame.Text:SetFont(AS.Font, 18, 'OUTLINE')
		UpdateElvUIFrame.Text:SetPoint('TOP', UpdateElvUIFrame, 'TOP', 0, -10)
		UpdateElvUIFrame.Text:SetText(format('%s - Required ElvUI Version is %s. You currently have %s. Download ElvUI @ %s.', AS.Title, MinElvUIVersion, ElvUIVersion, AS:PrintURL('http://www.tukui.org/dl.php')))
		UpdateElvUIFrame:SetScript('OnClick', function() print(AS:PrintURL('http://www.tukui.org/dl.php')) end)
		UpdateElvUIFrame:SetSize(UpdateElvUIFrame.Text:GetWidth(), 70)
		return
	end

	EP:RegisterPlugin(AddOnName, AS.GenerateOptions)
	self:CheckConflicts()

	E.private.addonskins['MiscFixes'] = true

	self:RegisterEvent('PET_BATTLE_CLOSE', 'AddNonPetBattleFrames')
	self:RegisterEvent('PET_BATTLE_OPENING_START', 'RemoveNonPetBattleFrames')
	self:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
	self:RegisterEvent('PLAYER_REGEN_ENABLED', 'EmbedExitCombat')

	-- Register Only Skins that AddOn's are loaded for.
	for skin, alldata in pairs(self.register) do
		for _, data in pairs(alldata) do
			local addon
			local sdata = self.Skins[skin]
			if sdata and sdata.addon then
				addon = sdata.addon
			else
				addon = gsub(skin, 'Skin', '')
			end
			if skin == 'MiscFixes' or IsAddOnLoaded(addon) then
				self:RegisteredSkin(skin, data.priority, data.func, data.events)
			end
		end
	end

	-- Need to check PLAYER_LOGIN - If it works it will speed it up and will prevent double calling.
	for skin, funcs in pairs(AS.skins) do
		if AS:CheckOption(skin) then
			for _, func in ipairs(funcs) do
				AS:CallSkin(skin, func, 'PLAYER_ENTERING_WORLD')
			end
		end
	end

	self:EmbedInit()
end

function AS:UnregisterEvent(skinName, event)
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

function AS:Print(string)
	print(format('%s %s', AS.Title, string))
end

function AS:PrintURL(url)
	return format("|cFF00AAFF[|Hurl:%s|h%s|h]|r", url, url)
end

function AS:Round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
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
		if region:GetObjectType() == 'Texture' then
			region:SetDesaturated(true)

			if region:GetTexture() == 'Interface\\DialogFrame\\UI-DialogBox-Corner' then
				region:SetTexture(nil)
				region:Kill()
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
		AcceptFrame:SetSize(250, 70)
		AcceptFrame:SetPoint('CENTER', UIParent, 'CENTER')
		AcceptFrame:SetFrameStrata('DIALOG')
		AcceptFrame.Text = AcceptFrame:CreateFontString(nil, "OVERLAY")
		AcceptFrame.Text:SetFont(AS.Font, 12)
		AcceptFrame.Text:SetPoint('TOP', AcceptFrame, 'TOP', 0, -10)
		AcceptFrame.Accept = CreateFrame('Button', nil, AcceptFrame)
		AS:SkinButton(AcceptFrame.Accept)
		AcceptFrame.Accept:SetSize(70, 25)
		AcceptFrame.Accept:SetPoint('RIGHT', AcceptFrame, 'BOTTOM', -10, 20)
		AcceptFrame.Accept.Text = AcceptFrame.Accept:CreateFontString(nil, "OVERLAY")
		AcceptFrame.Accept.Text:SetFont(AS.Font, 10)
		AcceptFrame.Accept.Text:SetPoint('CENTER')
		AcceptFrame.Accept.Text:SetText(YES)
		AcceptFrame.Close = CreateFrame('Button', nil, AcceptFrame)
		AS:SkinButton(AcceptFrame.Close)
		AcceptFrame.Close:SetSize(70, 25)
		AcceptFrame.Close:SetPoint('LEFT', AcceptFrame, 'BOTTOM', 10, 20)
		AcceptFrame.Close:SetScript('OnClick', function(self) self:GetParent():Hide() end)
		AcceptFrame.Close.Text = AcceptFrame.Close:CreateFontString(nil, "OVERLAY")
		AcceptFrame.Close.Text:SetFont(AS.Font, 10)
		AcceptFrame.Close.Text:SetPoint('CENTER')
		AcceptFrame.Close.Text:SetText(NO)
	end
	AcceptFrame.Text:SetText(MainText)
	AcceptFrame.Accept:SetScript('OnClick', Function)
	AcceptFrame:Show()
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

E:RegisterModule(AS:GetName())