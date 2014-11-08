local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('HydraUI') then return end

local select = select
local H, C

local Color = RAID_CLASS_COLORS[AS.MyClass]

function AS:UpdateMedia()
	H, C = unpack(HydraUI)
	AS.PixelPerfect = true
	AS.HideShadows = false
--[[
	AS.DataTextFontSize = 12 -- T['DataTexts']['Size']
	AS.DataTexts = T['DataTexts']
	AS.InfoLeft = T['Panels']['DataTextLeft']
	AS.InfoRight = T['Panels']['DataTextRight']
	AS.ChatBackgroundRight = T['Panels']['RightChatBG']
	AS.ChatBackgroundLeft = T['Panels']['LeftChatBG']
	AS.TabsRightBackground = T['Panels']['TabsBGRight']
	AS.TabsLeftBackground = T['Panels']['TabsBGLeft']
	AS.Minimap = T['Minimap']
	AS.ActionBar1 = T['ActionBar1']
	AS.ActionBar2 = T['ActionBar2']
	AS.ActionBar3 = T['ActionBar3']
	AS.ActionBar4 = T['ActionBar4']
]]
	AS.Blank = C['Media']['Textures']['Blank']
	AS.NormTex = C['Media']['Textures'][(C['UnitFrames']['Texture']['Value'])]
	AS.Font = C['Media']['Fonts']['Font']
	AS.PixelFont = C['Media']['Fonts']['Pixel']
	AS.ActionBarFont = [[Fonts\ARIALN.TTF]]

	AS.UIScale = C['General']['UIScale']['Value']
	AS.BackdropColor = { C['General']['BackdropColor']['Value'].r, C['General']['BackdropColor']['Value'].g, C['General']['BackdropColor']['Value'].b }
	AS.BorderColor = { C['General']['BorderColor']['Value'].r, C['General']['BorderColor']['Value'].g, C['General']['BorderColor']['Value'].b }
end

function AS:CheckOption(optionName, ...)
	for i = 1, select('#', ...) do
		local addon = select(i, ...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	return AddOnSkinsOptions[optionName]
end

function AS:SetOption(optionName, value)
	AddOnSkinsOptions[optionName] = value
end

function AS:DisableOption(optionName)
	AS:SetOption(optionName, false)
end

function AS:EnableOption(optionName)
	AS:SetOption(optionName, true)
end

function AS:ToggleOption(optionName)
	AddOnSkinsOptions[optionName] = not AddOnSkinsOptions[optionName]
end

function AS:SkinScrollBar(frame)
	frame:SkinScrollBar()
	_G[frame:GetName().."ScrollUpButton"].texture:SetTexture(nil)
	_G[frame:GetName().."ScrollDownButton"].texture:SetTexture(nil)
	if not _G[frame:GetName().."ScrollUpButton"].text then
		_G[frame:GetName().."ScrollUpButton"].text = _G[frame:GetName().."ScrollUpButton"]:CreateFontString(nil, "OVERLAY")
		_G[frame:GetName().."ScrollUpButton"].text:SetFont(AS.ActionBarFont, 12)
		_G[frame:GetName().."ScrollUpButton"].text:SetText("▲")
		_G[frame:GetName().."ScrollUpButton"].text:SetPoint("CENTER", 1, 0)
		_G[frame:GetName().."ScrollUpButton"]:HookScript('OnEnter', function(self) self.text:SetTextColor(Color.r, Color.g, Color.b) end)
		_G[frame:GetName().."ScrollUpButton"]:HookScript('OnLeave', function(self) self.text:SetTextColor(1, 1, 1) end)
	end	
	if not _G[frame:GetName().."ScrollDownButton"].text then
		_G[frame:GetName().."ScrollDownButton"].text = _G[frame:GetName().."ScrollDownButton"]:CreateFontString(nil, "OVERLAY")
		_G[frame:GetName().."ScrollDownButton"].text:SetFont(AS.ActionBarFont, 12)
		_G[frame:GetName().."ScrollDownButton"].text:SetText("▼")
		_G[frame:GetName().."ScrollDownButton"].text:SetPoint("CENTER", 1, 0)
		_G[frame:GetName().."ScrollDownButton"]:HookScript('OnEnter', function(self) self.text:SetTextColor(Color.r, Color.g, Color.b) end)
		_G[frame:GetName().."ScrollDownButton"]:HookScript('OnLeave', function(self) self.text:SetTextColor(1, 1, 1) end)
	end
end

function AS:SkinIconButton(frame, shrinkIcon)
	frame:SkinIconButton()
	local icon = frame.icon
	if frame:GetName() and _G[frame:GetName()..'IconTexture'] then
		icon = _G[frame:GetName()..'IconTexture']
	elseif frame:GetName() and _G[frame:GetName()..'Icon'] then
		icon = _G[frame:GetName()..'Icon']
	end

	if icon then
		AS:SkinTexture(icon)
		icon:SetInside()
	end
end

function AS:SkinFrame(frame, template, override, kill)
	if not template then template = AS:CheckOption('SkinTemplate') end
	if template and type(template) == string then
		template = template == 'Transparent' and .8 or 1
	end
	if not override then frame:StripTextures(kill) end
	frame:StyleFrame(template)
	if ES then
		frame:CreateShadow()
		ES:RegisterShadow(frame.shadow)
	end
end

function AS:SkinBackdropFrame(frame, template, override, kill, setpoints)
	if not template then template = AS:CheckOption('SkinTemplate') end
	if template and type(template) == string then
		template = template == 'Transparent' and .8 or 1
	end
	if not override then frame:StripTextures(kill) end
	frame:CreateBackdrop(template)
	if setpoints then
		local backdrop = frame.backdrop or frame.Backdrop
		backdrop:SetAllPoints()
	end
end

function AS:SkinTitleBar(frame, template, override, kill)
	if not template then template = AS:CheckOption('SkinTemplate') end
	if template and type(template) == string then
		template = template == 'Transparent' and .8 or 1
	end
	if not override then frame:StripTextures(kill) end
	frame:StyleFrame(template)
end

function AS:CreateEmbedSystem()
	if not AS.EmbedSystemCreated then
		local EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
		local EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
		local EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)

		AS:EmbedSystem_WindowResize()

		self:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
		self:RegisterEvent('PLAYER_REGEN_ENABLED', 'EmbedExitCombat')

		EmbedSystem_MainWindow:SetScript('OnShow', AS.Embed_Show)
		EmbedSystem_MainWindow:SetScript('OnHide', AS.Embed_Hide)

		AS:CreateToggleButton('RightToggleButton', '?', AS.InfoRight, AS.ChatBackgroundRight, ASL.EmbedSystem.ToggleRightChat, ASL.EmbedSystem.ToggleEmbed)
		RightToggleButton:Point('RIGHT', AS.InfoRight, 'RIGHT', -2, 0)
		RightToggleButton:HookScript('OnClick', function(self, button)
			if button == 'RightButton' then
				if EmbedSystem_MainWindow:IsShown() then
					EmbedSystem_MainWindow:Hide()
					AS:SetOption('EmbedIsHidden', true)
					if AS:CheckOption('HideChatFrame') ~= 'NONE' then
						_G[AS:CheckOption('HideChatFrame')]:SetAlpha(1)
					end
				else
					AS:SetOption('EmbedIsHidden', false)
					EmbedSystem_MainWindow:Show()
					if AS:CheckOption('HideChatFrame') ~= 'NONE' then
						_G[AS:CheckOption('HideChatFrame')]:SetAlpha(0)
					end
				end
			end
		end)

		AS:CreateToggleButton('LeftToggleButton', '?', AS.InfoLeft, AS.ChatBackgroundLeft, ASL.EmbedSystem.ToggleLeftChat, ASL.ToggleOptions)
		LeftToggleButton:Point('LEFT', AS.InfoLeft, 'LEFT', 2, 0)
		LeftToggleButton:HookScript('OnClick', function(self, button)
			if button == 'RightButton' then
				if IsAddOnLoaded('Enhanced_Config') then
					Enhanced_Config[1]:ToggleConfig()
				end
			end
		end)

		UIParent:HookScript('OnShow', function()
			if AS:CheckOption('EmbedIsHidden') then
				AS:Embed_Hide();
			else
				AS:Embed_Show();
			end
		end)

		if not UnitAffectingCombat('player') then
			if AS:CheckOption('EmbedIsHidden') or AS:CheckOption('EmbedOoC') then
				AS:Embed_Hide();
			else
				AS:Embed_Show();
			end
		end

		AS.EmbedSystemCreated = true
	end
end

function AS:CreateToggleButton(Name, Text, Panel1, Panel2, TooltipText1, TooltipText2)
	local Frame = CreateFrame('Button', Name, UIParent)
	Frame:SetFrameStrata("DIALOG")
	Frame:SetTemplate('Transparent')
	Frame:Size(17, Panel1:GetHeight() - 4)
	Frame:FontString('Text', AS.ActionBarFont, 12)
	Frame.Text:SetText(Text)
	Frame.Text:SetPoint('CENTER', 0, 1)
	Frame:RegisterForClicks('LeftButtonDown', 'RightButtonDown')
	UIFrameFadeOut(Frame, 0.2, Frame:GetAlpha(), 0)
	Frame:SetScript('OnEnter', function(self, ...)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
		if self.Faded then
			UIFrameFadeIn(Panel1, 0.2, Panel1:GetAlpha(), 1)
			UIFrameFadeIn(Panel2, 0.2, Panel2:GetAlpha(), 1)
			if Name == 'LeftToggleButton' then UIFrameFadeIn(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 1) end
		end
		GameTooltip:SetOwner(self, Name == 'LeftToggleButton' and 'ANCHOR_TOPLEFT' or 'ANCHOR_TOPRIGHT', 0, 4)
		GameTooltip:ClearLines()
		if IsAddOnLoaded('Tukui_ChatTweaks') and ChatTweaksOptions['ChatHider'] then
			if AS.ChatBackgroundRight then
				GameTooltip:AddDoubleLine('Left Click:', TooltipText1, 1, 1, 1)
			end
		end
		GameTooltip:AddDoubleLine('Right Click:', TooltipText2, 1, 1, 1)
		GameTooltip:Show()
	end)
	Frame:SetScript('OnLeave', function(self, ...)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		if self.Faded then
			UIFrameFadeOut(Panel1, 0.2, Panel1:GetAlpha(), 0)
			UIFrameFadeOut(Panel2, 0.2, Panel2:GetAlpha(), 0)
			if Name == 'LeftToggleButton' then UIFrameFadeOut(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 0) end
		end
		GameTooltip:Hide()
	end)
end

function AS:EmbedSystem_WindowResize()
	local ChatPanel = AS:CheckOption('EmbedRightChat') and AS.InfoRight or AS.InfoLeft
	local ChatTab = AS:CheckOption('EmbedRightChat') and AS.TabsRightBackground or AS.TabsLeftBackground
	if Tukui[2]['Chat']['Background'] then
		local FramePoint, OffsetY
		if AS:CheckOption('EmbedBelowTop') then
			FramePoint, OffsetY = 'BOTTOMLEFT', -2
		else
			FramePoint, OffsetY = 'TOPLEFT', 0
		end
		EmbedSystem_MainWindow:SetPoint('TOPLEFT', ChatTab, FramePoint, 0, OffsetY)
		EmbedSystem_MainWindow:SetPoint('BOTTOMRIGHT', ChatPanel, 'TOPRIGHT', 0, 0)
	else
		EmbedSystem_MainWindow:SetPoint('BOTTOM', ChatPanel, 'TOP', 0, 2)
		EmbedSystem_MainWindow:SetSize(ChatPanel:GetWidth(), 142)
	end
	EmbedSystem_LeftWindow:SetPoint('RIGHT', EmbedSystem_RightWindow, 'LEFT', -2, 0)
	EmbedSystem_RightWindow:SetPoint('RIGHT', EmbedSystem_MainWindow, 'RIGHT', 0, 0)
	EmbedSystem_LeftWindow:SetSize(AS:CheckOption('EmbedLeftWidth') - 1, EmbedSystem_MainWindow:GetHeight())
	EmbedSystem_RightWindow:SetSize((EmbedSystem_MainWindow:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, EmbedSystem_MainWindow:GetHeight())

	if Enhanced_Config and Enhanced_Config[1].Options.args.addonskins then
		Enhanced_Config[1].Options.args.addonskins.args.embed.args.EmbedLeftWidth.min = floor(EmbedSystem_MainWindow:GetWidth() * .25)
		Enhanced_Config[1].Options.args.addonskins.args.embed.args.EmbedLeftWidth.max = floor(EmbedSystem_MainWindow:GetWidth() * .75)
	end
end

if AS:CheckAddOn('CoolLine') then
	function AS:Embed_CoolLine()
		if not CoolLineDB.vertical then
			if DuffedUI then
				CoolLine:Point('BOTTOM', AS.ActionBar2, 'TOP', 0, 3)
				CoolLineDB.h = ActionButton1:GetHeight()
				CoolLineDB.w = AS.ActionBar2:GetWidth()
			elseif Tukui then
				local function OnShow()
					CoolLine:Point('BOTTOM', AS.ActionBar4, 'TOP', 0, 1)
					CoolLineDB.h = ActionButton1:GetHeight()
					CoolLineDB.w = AS.ActionBar4:GetWidth()
					CoolLine.updatelook()
				end

				local function OnHide()
					CoolLine:Point('BOTTOM', AS.ActionBar1, 'TOP', 0, 1)
					CoolLineDB.h = ActionButton1:GetHeight()
					CoolLineDB.w = AS.ActionBar1:GetWidth()
					CoolLine.updatelook()
				end

				if AS.ActionBar4:IsShown() then
					OnShow()
				else
					OnHide()
				end
				AS.ActionBar4:HookScript('OnShow', OnShow)
				AS.ActionBar4:HookScript('OnHide', OnHide)
			end
			CoolLine.updatelook()
		end
	end
end

function AS:CreateDataText()
	--[[local DataText = AS["DataTexts"]

	local OnClick = function(self, button)
		if EmbedSystem_MainWindow:IsShown() then
			EmbedSystem_MainWindow:Hide()
		else
			EmbedSystem_MainWindow:Show()
		end
	end

	local Update = function(self)
		self.Text:SetText(ASL.DataText.ToggleEmbed)
	end

	local OnEnter = function(self)
		local Panel, Anchor, xOff, yOff = self:GetTooltipAnchor()
		GameTooltip:SetOwner(Panel, Anchor, xOff, yOff)
		GameTooltip:ClearLines()
		GameTooltip:AddLine(ASL.DataText.LeftClick)
		GameTooltip:AddLine(ASL.DataText.RightClick)
		GameTooltip:Show()
	end

	local Enable = function(self)
		self:RegisterEvent('PLAYER_ENTERING_WORLD')
		self:SetScript('OnEvent', Update)
		self:SetScript('OnMouseDown', OnClick)
		self:SetScript('OnEnter', OnEnter)
		self:SetScript('OnLeave', GameTooltip_Hide)
		self:Update()
	end

	local Disable = function(self)
		self.Text:SetText('')
		self:SetScript('OnEvent', nil)
		self:UnregisterAllEvents()
	end

	DataText:Register('AddOnSkins', Enable, Disable, Update)]]
end

function AS:InitAPI()
	local function SetOutside(obj, anchor, xOffset, yOffset)
		xOffset = xOffset or 1
		yOffset = yOffset or 1
		anchor = anchor or obj:GetParent()

		if obj:GetPoint() then obj:ClearAllPoints() end
		
		obj:Point("TOPLEFT", anchor, "TOPLEFT", -xOffset, yOffset)
		obj:Point("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", xOffset, -yOffset)
	end

	local function SetInside(obj, anchor, xOffset, yOffset)
		xOffset = xOffset or 1
		yOffset = yOffset or 1
		anchor = anchor or obj:GetParent()

		if obj:GetPoint() then obj:ClearAllPoints() end
		
		obj:Point("TOPLEFT", anchor, "TOPLEFT", xOffset, -yOffset)
		obj:Point("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", -xOffset, yOffset)
	end

	local function SetTemplate(f, t, tex)
		AS:SkinFrame(f, t)
	end

	local function CreateShadow(f, t)
		if f.Shadow then return end
		
		local shadow = CreateFrame("Frame", nil, f)
		shadow:SetFrameLevel(1)
		shadow:SetFrameStrata(f:GetFrameStrata())
		shadow:Point("TOPLEFT", -3, 3)
		shadow:Point("BOTTOMLEFT", -3, -3)
		shadow:Point("TOPRIGHT", 3, 3)
		shadow:Point("BOTTOMRIGHT", 3, -3)
		
		if C["General"].HideShadows then
			shadow:SetBackdrop( { 
				edgeFile = nil, edgeSize = 0,
				insets = {left = 0, right = 0, top = 0, bottom = 0},
			})
		else
			shadow:SetBackdrop( { 
				edgeFile = C.Medias.Glow, edgeSize = T.Scale(3),
				insets = {left = T.Scale(5), right = T.Scale(5), top = T.Scale(5), bottom = T.Scale(5)},
			})
		end
		
		shadow:SetBackdropColor(0, 0, 0, 0)
		shadow:SetBackdropBorderColor(0, 0, 0, 0.8)
		f.Shadow = shadow
	end

	local function SkinButton(Frame, Strip)
		if Frame:GetName() then
			local Left = _G[Frame:GetName().."Left"]
			local Middle = _G[Frame:GetName().."Middle"]
			local Right = _G[Frame:GetName().."Right"]


			if Left then Left:SetAlpha(0) end
			if Middle then Middle:SetAlpha(0) end
			if Right then Right:SetAlpha(0) end
		end

		if Frame.Left then Frame.Left:SetAlpha(0) end
		if Frame.Right then Frame.Right:SetAlpha(0) end	
		if Frame.Middle then Frame.Middle:SetAlpha(0) end
		if Frame.SetNormalTexture then Frame:SetNormalTexture("") end	
		if Frame.SetHighlightTexture then Frame:SetHighlightTexture("") end
		if Frame.SetPushedTexture then Frame:SetPushedTexture("") end	
		if Frame.SetDisabledTexture then Frame:SetDisabledTexture("") end
		
		if Strip then Frame:StripTextures() end
		
		Frame:SetTemplate()
		
		Frame:HookScript("OnEnter", function(self)
			local Color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
			
			self:SetBackdropColor(Color.r * .15, Color.g * .15, Color.b * .15)
			self:SetBackdropBorderColor(Color.r, Color.g, Color.b)	
		end)
		
		Frame:HookScript("OnLeave", function(self)
			local Color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
			
			self:SetBackdropColor(AS.BackdropColor[1], AS.BackdropColor[2], AS.BackdropColor[3])
			self:SetBackdropBorderColor(AS.BorderColor[1], AS.BorderColor[2], AS.BorderColor[3])	
		end)
	end

	local function SkinCloseButton(Frame, Reposition)	
		if Reposition then
			Frame:Point("TOPRIGHT", Reposition, "TOPRIGHT", 2, 2)
		end
		
		Frame:SetNormalTexture("")
		Frame:SetPushedTexture("")
		Frame:SetHighlightTexture("")
		Frame:SetDisabledTexture("")

		Frame.Text = Frame:CreateFontString(nil, "OVERLAY")
		Frame.Text:SetFont(AS.Font, 12, "OUTLINE")
		Frame.Text:SetPoint("CENTER", 0, 1)
		Frame.Text:SetText("X")
		Frame.Text:SetTextColor(.5, .5, .5)
	end

	local function SkinEditBox(Frame)
		local Left, Middle, Right, Mid = _G[Frame:GetName().."Left"], _G[Frame:GetName().."Middle"], _G[Frame:GetName().."Right"], _G[Frame:GetName().."Mid"]
		
		if Left then Left:Kill() end
		if Middle then Middle:Kill() end
		if Right then Right:Kill() end
		if Mid then Mid:Kill() end
		
		Frame:CreateBackdrop()
		
		if Frame:GetName() and Frame:GetName():find("Silver") or Frame:GetName():find("Copper") then
			Frame.Backdrop:Point("BOTTOMRIGHT", -12, -2)
		end
	end

	local function SkinArrowButton(Button, Vertical)
		Button:SetTemplate()
		Button:Size(Button:GetWidth() - 7, Button:GetHeight() - 7)
		
		if Vertical then
			Button:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.72, 0.65, 0.29, 0.65, 0.72)

			if Button:GetPushedTexture() then
				Button:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.8, 0.65, 0.35, 0.65, 0.8)
			end

			if Button:GetDisabledTexture() then
				Button:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)
			end
		else
			Button:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.81, 0.65, 0.29, 0.65, 0.81)
			
			if Button:GetPushedTexture() then
				Button:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.81, 0.65, 0.35, 0.65, 0.81)
			end
			
			if Button:GetDisabledTexture() then
				Button:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)
			end
		end
		
		Button:GetNormalTexture():ClearAllPoints()
		Button:GetNormalTexture():SetInside()

		if Button:GetDisabledTexture() then
			Button:GetDisabledTexture():SetAllPoints(Button:GetNormalTexture())
		end
		
		if Button:GetPushedTexture() then
			Button:GetPushedTexture():SetAllPoints(Button:GetNormalTexture())
		end
		
		Button:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
		Button:GetHighlightTexture():SetAllPoints(Button:GetNormalTexture())
	end

	local function SkinDropDown(Frame, Width)
		local Button = _G[Frame:GetName().."Button"]
		local Text = _G[Frame:GetName().."Text"]

		Frame:StripTextures()
		Frame:Width(Width or 155)
		
		Text:ClearAllPoints()
		Text:Point("RIGHT", Button, "LEFT", -2, 0)
		
		Button:ClearAllPoints()
		Button:Point("RIGHT", Frame, "RIGHT", -10, 3)
		Button.SetPoint = AS.Noop
		
		Button:SkinArrowButton(true)
		
		Frame:CreateBackdrop()
		Frame.Backdrop:Point("TOPLEFT", 20, -2)
		Frame.Backdrop:Point("BOTTOMRIGHT", Button, "BOTTOMRIGHT", 2, -2)
	end

	local function SkinCheckBox(Frame)
		Frame:StripTextures()
		Frame:CreateBackdrop()
		Frame.Backdrop:SetInside(Frame, 4, 4)

		if Frame.SetCheckedTexture then
			Frame:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
		end
		
		if Frame.SetDisabledCheckedTexture then
			Frame:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
		end
		
		-- why does the disabled texture is always displayed as checked ?
		Frame:HookScript("OnDisable", function(self)
			if not self.SetDisabledTexture then return end
			
			if self:GetChecked() then
				self:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
			else
				self:SetDisabledTexture("")
			end
		end)
		
		Frame.SetNormalTexture = AS.Noop
		Frame.SetPushedTexture = AS.Noop
		Frame.SetHighlightTexture = AS.Noop
	end

	local Tabs = {
		"LeftDisabled",
		"MiddleDisabled",
		"RightDisabled",
		"Left",
		"Middle",
		"Right",
	}

	local function SkinTab(tab)
		if (not tab) then
			return
		end
		
		for _, object in pairs(Tabs) do
			local Texture = _G[tab:GetName()..object]
			if (Texture) then
				Texture:SetTexture(nil)
			end
		end

		if tab.GetHighlightTexture and tab:GetHighlightTexture() then
			tab:GetHighlightTexture():SetTexture(nil)
		else
			tab:StripTextures()
		end

		tab.Backdrop = CreateFrame("Frame", nil, tab)
		tab.Backdrop:SetTemplate()
		tab.Backdrop:SetFrameLevel(tab:GetFrameLevel() - 1)
		tab.Backdrop:Point("TOPLEFT", 10, -3)
		tab.Backdrop:Point("BOTTOMRIGHT", -10, 3)
	end

	local function SkinScrollBar(frame)
		local ScrollUpButton = _G[frame:GetName().."ScrollUpButton"]
		local ScrollDownButton = _G[frame:GetName().."ScrollDownButton"]
		if _G[frame:GetName().."BG"] then
			_G[frame:GetName().."BG"]:SetTexture(nil)
		end
		
		if _G[frame:GetName().."Track"] then
			_G[frame:GetName().."Track"]:SetTexture(nil)
		end

		if _G[frame:GetName().."Top"] then
			_G[frame:GetName().."Top"]:SetTexture(nil)
		end

		if _G[frame:GetName().."Bottom"] then
			_G[frame:GetName().."Bottom"]:SetTexture(nil)
		end

		if _G[frame:GetName().."Middle"] then
			_G[frame:GetName().."Middle"]:SetTexture(nil)
		end

		if ScrollUpButton and ScrollDownButton then
			ScrollUpButton:StripTextures()
			ScrollUpButton:SetTemplate("Default", true)
			
			if not ScrollUpButton.texture then
				ScrollUpButton.texture = ScrollUpButton:CreateTexture(nil, "OVERLAY")
				ScrollUpButton.texture:Point("TOPLEFT", 2, -2)
				ScrollUpButton.texture:Point("BOTTOMRIGHT", -2, 2)
				ScrollUpButton.texture:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\arrowup]])
				ScrollUpButton.texture:SetVertexColor(unpack(AS.BorderColor))
			end
			
			ScrollDownButton:StripTextures()
			ScrollDownButton:SetTemplate("Default", true)

			if not ScrollDownButton.texture then
				ScrollDownButton.texture = ScrollDownButton:CreateTexture(nil, "OVERLAY")
				ScrollDownButton.texture:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\arrowdown]])
				ScrollDownButton.texture:SetVertexColor(unpack(AS.BorderColor))
				ScrollDownButton.texture:Point("TOPLEFT", 2, -2)
				ScrollDownButton.texture:Point("BOTTOMRIGHT", -2, 2)
			end

			if not frame.trackbg then
				frame.trackbg = CreateFrame("Frame", nil, frame)
				frame.trackbg:Point("TOPLEFT", ScrollUpButton, "BOTTOMLEFT", 0, -1)
				frame.trackbg:Point("BOTTOMRIGHT", ScrollDownButton, "TOPRIGHT", 0, 1)
				frame.trackbg:SetTemplate("Transparent")
			end

			if frame:GetThumbTexture() then
				if not thumbTrim then
					thumbTrim = 3
				end
				
				frame:GetThumbTexture():SetTexture(nil)
				
				if not frame.thumbbg then
					frame.thumbbg = CreateFrame("Frame", nil, frame)
					frame.thumbbg:Point("TOPLEFT", frame:GetThumbTexture(), "TOPLEFT", 2, -thumbTrim)
					frame.thumbbg:Point("BOTTOMRIGHT", frame:GetThumbTexture(), "BOTTOMRIGHT", -2, thumbTrim)
					frame.thumbbg:SetTemplate("Default", true)
					
					if frame.trackbg then
						frame.thumbbg:SetFrameLevel(frame.trackbg:GetFrameLevel())
					end
				end
			end
		end
	end

	local function SkinIconButton(b, shrinkIcon)
		if b.isSkinned then return end

		b:StripTextures()
		b:CreateBackdrop("Default", true)
		local backdrop = b.backdrop or b.Backdrop
		b:StyleButton()

		local icon = b.icon
		if b:GetName() and _G[b:GetName().."IconTexture"] then
			icon = _G[b:GetName().."IconTexture"]
		elseif b:GetName() and _G[b:GetName().."Icon"] then
			icon = _G[b:GetName().."Icon"]
		end

		if icon then
			icon:SetTexCoord(.08,.88,.08,.88)

			-- create a backdrop around the icon

			if shrinkIcon then
				backdrop:SetAllPoints()
				icon:SetInside(b)
			else
				backdrop:SetOutside(icon)
			end
			icon:SetParent(backdrop)
		end
		b.isSkinned = true
	end

	local function SkinRotateButton(btn)
		btn:SetTemplate("Default")
		btn:Size(btn:GetWidth() - 14, btn:GetHeight() - 14)	

		btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)
		btn:GetPushedTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)	

		btn:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)

		btn:GetNormalTexture():ClearAllPoints()
		btn:GetNormalTexture():SetInside()
		btn:GetPushedTexture():SetAllPoints(btn:GetNormalTexture())	
		btn:GetHighlightTexture():SetAllPoints(btn:GetNormalTexture())
	end

	local function SkinSlideBar(frame, height, movetext)
		frame:SetTemplate("Default")
		frame:SetBackdropColor(0, 0, 0, .8)

		if not height then
			height = frame:GetHeight()
		end

		if movetext then
			if(_G[frame:GetName() .. "Low"]) then _G[frame:GetName() .. "Low"]:Point("BOTTOM", 0, -18) end
			if(_G[frame:GetName() .. "High"]) then _G[frame:GetName() .. "High"]:Point("BOTTOM", 0, -18) end
			if(_G[frame:GetName() .. "Text"]) then _G[frame:GetName() .. "Text"]:Point("TOP", 0, 19) end
		end

		_G[frame:GetName()]:SetThumbTexture(AS.Blank)
		_G[frame:GetName()]:GetThumbTexture():SetVertexColor(unpack(AS.BorderColor))
		if( frame:GetWidth() < frame:GetHeight() ) then
			frame:Width(height)
			_G[frame:GetName()]:GetThumbTexture():Size(frame:GetWidth(), frame:GetWidth() + 4)
		else
			frame:Height(height)
			_G[frame:GetName()]:GetThumbTexture():Size(height + 4, height)
		end
	end

	local function AddAPI(object)
		local mt = getmetatable(object).__index
		
		if not object.SetOutside then mt.SetOutside = SetOutside end
		if not object.SetInside then mt.SetInside = SetInside end
		if not object.SetTemplate then mt.SetTemplate = SetTemplate end
		if not object.CreateBackdrop then mt.CreateBackdrop = CreateBackdrop end
		if not object.CreateShadow then mt.CreateShadow = CreateShadow end
		if not object.Kill then mt.Kill = Kill end
		if not object.StyleButton then mt.StyleButton = StyleButton end
		if not object.SkinEditBox then mt.SkinEditBox = SkinEditBox end
		if not object.SkinButton then mt.SkinButton = SkinButton end
		if not object.SkinCloseButton then mt.SkinCloseButton = SkinCloseButton end
		if not object.SkinArrowButton then mt.SkinArrowButton = SkinArrowButton end
		if not object.SkinDropDown then mt.SkinDropDown = SkinDropDown end
		if not object.SkinCheckBox then mt.SkinCheckBox = SkinCheckBox end
		if not object.SkinTab then mt.SkinTab = SkinTab end
		if not object.SkinScrollBar then mt.SkinScrollBar = SkinScrollBar end
		if not object.SkinIconButton then mt.SkinIconButton = SkinIconButton end
		if not object.SkinRotateButton then mt.SkinRotateButton = SkinRotateButton end
		if not object.SkinSlideBar then mt.SkinSlideBar = SkinSlideBar end
	end

	local Handled = {["Frame"] = true}

	local Object = CreateFrame("Frame")
	AddAPI(Object)
	AddAPI(Object:CreateTexture())
	AddAPI(Object:CreateFontString())

	Object = EnumerateFrames()

	while Object do
		if (not Handled[Object:GetObjectType()]) then
			AddAPI(Object)
			Handled[Object:GetObjectType()] = true
		end

		Object = EnumerateFrames(Object)
	end
end