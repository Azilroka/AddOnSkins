local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end

local select = select
local T, C

function AS:UpdateMedia()
	T, C = Tukui:unpack()
	AS.PixelPerfect = AS:CheckOption('ThinBorder')
	AS.HideShadows = C['General']['HideShadows']

	AS.DataTextFontSize = 12 -- T['DataTexts']['Size']
	AS.DataTexts = T['DataTexts']
	AS.InfoLeft = T['Panels']['DataTextLeft']
	AS.InfoRight = T['Panels']['DataTextRight']
	AS.ChatBackgroundRight = T['Panels']['RightChatBG']
	AS.ChatBackgroundLeft = T['Panels']['LeftChatBG']
	AS.TabsRightBackground = T['Panels']['TabsBGRight']
	AS.TabsLeftBackground = T['Panels']['TabsBGLeft']
	AS.Minimap = T['Maps']['Minimap']
	AS.ActionBar1 = T['Panels']['ActionBar1']
	AS.ActionBar2 = T['Panels']['ActionBar2']
	AS.ActionBar3 = T['Panels']['ActionBar3']
	AS.ActionBar4 = T['Panels']['ActionBar4']

	AS.Blank = C['Medias']['Blank']
	AS.NormTex = C['Medias']['Normal']
	AS.Font = C['Medias']['Font']
	AS.PixelFont = C['Medias']['PixelFont']
	AS.ActionBarFont = C['Medias']['ActionBarFont']
	AS.BackdropColor = C['General']['BackdropColor']
	AS.BorderColor = C['General']['BorderColor']
end

function AS:EmbedSystemHooks()
	AS:CreateToggleButton('RightToggleButton', '►', AS.InfoRight, AS.ChatBackgroundRight, ASL.EmbedSystem.ToggleRightChat, ASL.EmbedSystem.ToggleEmbed)
	RightToggleButton:Point('RIGHT', AS.InfoRight, 'RIGHT', -2, 0)
	RightToggleButton:HookScript('OnClick', function(self, button)
		if button == 'RightButton' then
			if EmbedSystem_MainWindow:IsShown() then
				EmbedSystem_MainWindow:Hide()
				AS:SetOption('EmbedIsHidden', true)
			else
				AS:SetOption('EmbedIsHidden', false)
				EmbedSystem_MainWindow:Show()
			end
		end
	end)

	AS:CreateToggleButton('LeftToggleButton', '◄', AS.InfoLeft, AS.ChatBackgroundLeft, ASL.EmbedSystem.ToggleLeftChat, ASL.EmbedSystem.ToggleOptions)
	LeftToggleButton:Point('LEFT', AS.InfoLeft, 'LEFT', 2, 0)
	LeftToggleButton:HookScript('OnClick', function(self, button)
		if button == 'RightButton' then
			if IsAddOnLoaded('Enhanced_Config') then
				Enhanced_Config[1]:ToggleConfig()
			end
		end
	end)
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
		GameTooltip:SetOwner(self, Name == 'LeftToggleButton' and 'ANCHOR_TOPLEFT' or 'ANCHOR_TOPRIGHT', 0, 4)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine('Right Click:', TooltipText2, 1, 1, 1)
		GameTooltip:Show()
	end)
	Frame:SetScript('OnLeave', function(self, ...)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
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
			CoolLine.updatelook()
		end
	end
end

function AS:CreateDataText()
	local DataText = AS["DataTexts"]

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

	DataText:Register('AddOnSkins', Enable, Disable, Update)
end