local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('DuffedUI') then return end

local select = select
local D, C, L

function AS:UpdateMedia()
	D, C, L = unpack(DuffedUI)
	AS.PixelPerfect = AS:CheckOption('ThinBorder')
	AS.DataTextFontSize = C['datatext'].fontsize

	AS.InfoLeft = DuffedUIInfoLeft
	AS.InfoRight = DuffedUIInfoRight
	AS.ChatBackgroundRight = DuffedUIChatBackgroundRight
	AS.ChatBackgroundLeft = DuffedUIChatBackgroundLeft
	AS.TabsRightBackground = DuffedUITabsRightBackground
	AS.TabsLeftBackground = DuffedUITabsLeftBackground
	AS.Minimap = DuffedUIMinimap
	AS.ActionBar1 = DuffedUIBar1
	AS.ActionBar2 = DuffedUIBar2
	AS.ActionBar3 = DuffedUIBar3
	AS.ActionBar4 = DuffedUIBar4

	AS.GlossTex = C['media']['normTex']
	AS.Blank = C['media']['blank']
	AS.NormTex = C['media']['normTex']
	AS.GlowTex = C['media']['glowTex']
	AS.Font = C['media']['font']
	AS.PixelFont = C['media']['pixelfont']
	AS.ActionBarFont = [[Fonts\ARIALN.TTF]]
	AS.UIScale = UIParent:GetScale()
	AS.BackdropColor = C['general']['backdropcolor']
	AS.BorderColor = C['general']['bordercolor']
end

function AS:EmbedSystemHooks()
	AS:CreateToggleButton('RightToggleButton', '►', AS.InfoRight, AS.ChatBackgroundRight, ASL.EmbedSystem.ToggleRightChat, ASL.EmbedSystem.ToggleEmbed)
	RightToggleButton:Point('RIGHT', AS.InfoRight, 'RIGHT', -2, 0)
	RightToggleButton:HookScript('OnClick', function(self, button)
		if button == 'RightButton' then
			if EmbedSystem_MainWindow:IsShown() then
				AS:SetOption('EmbedIsHidden', true)
				EmbedSystem_MainWindow:Hide()
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
	if AS.ChatBackgroundRight then
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
	if not T16 then return end
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
