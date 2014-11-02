local AS = unpack(AddOnSkins)
local AddOnName = ...
local ES
local Color = RAID_CLASS_COLORS[AS.MyClass]

AS:UpdateLocale()

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
	return AS.AddOns[addon] or false
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
	for i = 1,select('#', ...) do
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

function AS:CallSkin(skin, func, event, ...)
	local pass, errormsg = pcall(func, self, event, ...)
	if not pass then
		local message = '%s %s: |cfFFF0000There was an error in the|r |cff0AFFFF%s|r |cffFF0000skin|r.'
		local errormessage = '%s Error: %s'
		local Skin = gsub(skin, 'Skin', '')
		DEFAULT_CHAT_FRAME:AddMessage(format(message, AS.Title, AS.Version, Skin))
		FoundError = true
		if AS:CheckOption('SkinDebug') then
			if GetCVarBool('scriptErrors') then
				LoadAddOn('Blizzard_DebugTools')
				ScriptErrorsFrame_OnError(errormsg, false)
			else
				DEFAULT_CHAT_FRAME:AddMessage(format(errormessage, Skin, errormsg))
			end
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
	if AS.enteredworld then return end
	AS.enteredworld = true

	local EP = LibStub('LibElvUIPlugin-1.0', true)
	if EP then
		EP:RegisterPlugin(AddOnName, AS.GetOptions)
	else
		AS:GetOptions()
	end

	AS:UpdateMedia()

	if IsAddOnLoaded('ElvUI') then
		ES = ElvUI[1]:GetModule('EnhancedShadows', true)
	end

	for skin, alldata in pairs(AS.register) do
		for _, data in pairs(alldata) do
			if AS:CheckOption(skin) == nil then AS:EnableOption(skin) end
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
	
	if AS:CheckEmbed('Skada') then
		-- Seriously Fuck Off.
		local LibWindow = LibStub('LibWindow-1.1')
		LibWindow.SavePosition = function() return end
		LibWindow.RestorePosition = function() return end
	end

	AS:EmbedInit()

	AS:Print(format("Version: |cFF1784D1%s|r Loaded!", AS.Version))
	AS:UnregisterEvent(event)
end

function AS:Init(event, addon)
	if event == 'ADDON_LOADED' and addon == AddOnName then
		if not (AS:CheckAddOn('Tukui') or AS:CheckAddOn('ElvUI')) then return end
		AS:UpdateMedia()
		AS:InitAPI()
		if AS:CheckAddOn('ElvUI') then
			local ElvUIVersion, MinElvUIVersion = tonumber(GetAddOnMetadata('ElvUI', 'Version')), 7.32
			if ElvUIVersion < MinElvUIVersion then
				AS:AcceptFrame(format('%s - Required ElvUI Version %s. You currently have %s.\n Download ElvUI @ %s', AS.Title, MinElvUIVersion, ElvUIVersion, AS:PrintURL('http://www.tukui.org/dl.php')), function(self) print(AS:PrintURL('http://www.tukui.org/dl.php')) self:Hide() end)
				AS:Print('Loading Aborted')
				AS:UnregisterEvent(event)
				return
			end
			AS:InjectProfile()
		end
		AS:CreateDataText()
		AS:RegisterEvent('PET_BATTLE_CLOSE', 'AddNonPetBattleFrames')
		AS:RegisterEvent('PET_BATTLE_OPENING_START', 'RemoveNonPetBattleFrames')
		AS:RegisterEvent('PLAYER_ENTERING_WORLD', 'StartSkinning')
	end
end

function AS:SkinButton(frame, strip)
	frame:SkinButton(strip)
end

function AS:SkinScrollBar(frame)
	frame:SkinScrollBar()
	_G[frame:GetName().."ScrollUpButton"]:StripTextures()
	_G[frame:GetName().."ScrollUpButton"]:SetTemplate("Default", true)
	_G[frame:GetName().."ScrollDownButton"]:StripTextures()
	_G[frame:GetName().."ScrollDownButton"]:SetTemplate("Default", true)
	if not _G[frame:GetName().."ScrollUpButton"].text then
		_G[frame:GetName().."ScrollUpButton"]:FontString("text", AS.ActionBarFont, 12)
		_G[frame:GetName().."ScrollUpButton"].text:SetText("▲")
		_G[frame:GetName().."ScrollUpButton"].text:SetPoint("CENTER", 0, 0)
		_G[frame:GetName().."ScrollUpButton"]:HookScript('OnEnter', function(self) self.text:SetTextColor(Color.r, Color.g, Color.b) end)
		_G[frame:GetName().."ScrollUpButton"]:HookScript('OnLeave', function(self) self.text:SetTextColor(1, 1, 1) end)
	end	
	if not _G[frame:GetName().."ScrollDownButton"].text then
		_G[frame:GetName().."ScrollDownButton"]:FontString("text", AS.ActionBarFont, 12)
		_G[frame:GetName().."ScrollDownButton"].text:SetText("▼")
		_G[frame:GetName().."ScrollDownButton"].text:SetPoint("CENTER", 0, 0)
		_G[frame:GetName().."ScrollDownButton"]:HookScript('OnEnter', function(self) self.text:SetTextColor(Color.r, Color.g, Color.b) end)
		_G[frame:GetName().."ScrollDownButton"]:HookScript('OnLeave', function(self) self.text:SetTextColor(1, 1, 1) end)
	end
end

function AS:SkinTab(frame, strip)
	if strip then frame:StripTextures(true) end
	frame:SkinTab()
end

function AS:SkinNextPrevButton(frame, horizonal)
	frame:SkinArrowButton(not horizonal)
end

function AS:SkinRotateButton(frame)
	frame:SkinRotateButton()
end

function AS:SkinEditBox(frame, width, height)
	frame:SkinEditBox()
	if width then frame:Width(width) end
	if height then frame:Height(height) end
end

function AS:SkinDropDownBox(frame, width)
	frame:SkinDropDown(width)
end

function AS:SkinCheckBox(frame)
	frame:SkinCheckBox()
end

function AS:SkinCloseButton(frame, point)
	frame:SkinCloseButton(point)
end

function AS:SkinSlideBar(frame, height, movetext)
	frame:SkinSlideBar(height, movetext)
	if height then
		frame:GetThumbTexture():Size(height-2,height-2)
	end
end

function AS:SkinIconButton(frame, shrinkIcon)
	frame:SkinIconButton(shrinkIcon)
	local icon = frame.icon
	if frame:GetName() and _G[frame:GetName()..'IconTexture'] then
		icon = _G[frame:GetName()..'IconTexture']
	elseif frame:GetName() and _G[frame:GetName()..'Icon'] then
		icon = _G[frame:GetName()..'Icon']
	end

	if icon then
		AS:SkinTexture(icon)
	end
end

function AS:SkinFrame(frame, template, override, kill)
	if not template then template = AS:CheckOption('SkinTemplate') end
	if not override then frame:StripTextures(kill) end
	frame:SetTemplate(template)
	if ES then
		frame:CreateShadow()
		ES:RegisterShadow(frame.shadow)
	end
end

function AS:SkinBackdropFrame(frame, template, override, kill, setpoints)
	if not template then template = AS:CheckOption('SkinTemplate') end
	if not override then frame:StripTextures(kill) end
	frame:CreateBackdrop(template)
	if setpoints then
		local backdrop = frame.backdrop or frame.Backdrop
		backdrop:SetAllPoints()
	end
end

function AS:SkinTitleBar(frame, template, override, kill)
	if not template then template = AS:CheckOption('SkinTemplate') end
	if not override then frame:StripTextures(kill) end
	frame:SetTemplate(template, true)
end

function AS:SkinStatusBar(frame, ClassColor)
	AS:SkinBackdropFrame(frame)
	frame:SetStatusBarTexture(AS.NormTex)
	if ClassColor then
		local color = RAID_CLASS_COLORS[AS.MyClass]
		frame:SetStatusBarColor(color.r, color.g, color.b)
	end
end

function AS:SkinTooltip(tooltip, scale)
	tooltip:HookScript('OnShow', function(frame)
		frame:SetTemplate('Transparent')
		if scale then frame:SetScale(AS.UIScale) end
	end)
end

function AS:SkinTexture(frame)
	frame:SetTexCoord(unpack(AS.TexCoords))
end

function AS:Desaturate(frame, point)
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
		AcceptFrame:FontString('Text', AS.Font, 14)
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
	AcceptFrame:SetSize(AcceptFrame.Text:GetStringWidth() + 50, AcceptFrame.Text:GetStringHeight() + 60)
	AcceptFrame.Accept:SetScript('OnClick', Function)
	AcceptFrame:Show()
end

AS:RegisterEvent('ADDON_LOADED', 'Init')
