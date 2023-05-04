local AS, L, S, R = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end

local ES = AS.EmbedSystem
local T, C

local _G = _G
local UIFrameFadeIn, UIFrameFadeOut = UIFrameFadeIn, UIFrameFadeOut
local CreateFrame = CreateFrame

function AS:UpdateMedia()
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	AS.HideShadows = C.General.HideShadows

	AS.DataTextFontSize = 12
	AS.DataTexts = T.DataTexts
	AS.InfoLeft = T.DataTexts.Panels.Left
	AS.InfoRight = T.DataTexts.Panels.Right
	AS.ChatBackgroundRight = T.Chat.Panels and T.Chat.Panels.RightChat
	AS.ChatBackgroundLeft = T.Chat.Panels and T.Chat.Panels.LeftChat
	AS.TabsRightBackground = T.Chat.Panels and T.Chat.Panels.RightChatTabs
	AS.TabsLeftBackground = T.Chat.Panels and T.Chat.Panels.LeftChatTabs
	AS.Minimap = T.Maps.Minimap
	AS.ActionBar1 = T.ActionBars.Bars and T.ActionBars.Bars.Bar1
	AS.ActionBar2 = T.ActionBars.Bars and T.ActionBars.Bars.Bar2
	AS.ActionBar3 = T.ActionBars.Bars and T.ActionBars.Bars.Bar3
	AS.ActionBar4 = T.ActionBars.Bars and T.ActionBars.Bars.Bar4

	AS.Blank = C.Medias.Blank
	AS.NormTex = C.Medias.Normal
	AS.Font = C.Medias.Font
	AS.BackdropColor = C.General.BackdropColor
	AS.BorderColor = C.General.BorderColor

	if AS:CheckOption('SkinTemplate') == 'Custom' then
		AS.BackdropColor = AS:CheckOption('CustomBackdropColor')
		AS.BorderColor = AS:CheckOption('CustomBorderColor')
	end
end

function ES:Hooks()
	AS:CreateToggleButton('RightToggleButton', '►', AS.InfoRight, L.EmbedSystem.ToggleEmbed)
	_G.RightToggleButton:SetPoint('RIGHT', AS.InfoRight, 'RIGHT', -2, 0)
	_G.RightToggleButton:HookScript('OnClick', function(self, button)
		if button == 'RightButton' then
			if _G.EmbedSystem_MainWindow:IsShown() then
				_G.EmbedSystem_MainWindow:Hide()
				AS:SetOption('EmbedIsHidden', true)
			else
				AS:SetOption('EmbedIsHidden', false)
				_G.EmbedSystem_MainWindow:Show()
			end
		end
	end)

	AS:CreateToggleButton('LeftToggleButton', '◄', AS.InfoLeft, L.EmbedSystem.ToggleOptions)
	_G.LeftToggleButton:SetPoint('LEFT', AS.InfoLeft, 'LEFT', 2, 0)
	_G.LeftToggleButton:HookScript('OnClick', function(self, button)
		if button == 'RightButton' then
		end
	end)
end

function AS:CreateToggleButton(Name, Text, Panel, TooltipText)
	local Frame = CreateFrame('Button', Name, UIParent)
	Frame:SetFrameStrata("DIALOG")
	Frame:SetSize(17, Panel:GetHeight() - 4)
	AS:SkinArrowButton(Frame)
	Frame:RegisterForClicks('LeftButtonDown', 'RightButtonDown')
	UIFrameFadeOut(Frame, 0.2, Frame:GetAlpha(), 0)
	Frame:SetScript('OnEnter', function(self)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
		_G.GameTooltip:SetOwner(self, Name == 'LeftToggleButton' and 'ANCHOR_TOPLEFT' or 'ANCHOR_TOPRIGHT', 0, 4)
		_G.GameTooltip:ClearLines()
		_G.GameTooltip:AddDoubleLine('Right Click:', TooltipText, 1, 1, 1)
		_G.GameTooltip:Show()
	end)
	Frame:SetScript('OnLeave', function(self)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		_G.GameTooltip:Hide()
	end)
end

function ES:Resize()
	local ChatPanel = AS:CheckOption('EmbedRightChat') and AS.InfoRight or AS.InfoLeft
	local ChatTab = AS:CheckOption('EmbedRightChat') and AS.TabsRightBackground or AS.TabsLeftBackground
	if Tukui[2]['General']['Themes']['Value'] == 'Tukui 17' then
		ES.Main:SetPoint('BOTTOM', ChatPanel, 'TOP', 0, 2)
		ES.Main:SetSize(ChatPanel:GetWidth(), 142)
	else
		local FramePoint, OffsetY
		if AS:CheckOption('EmbedBelowTop') then
			FramePoint, OffsetY = 'BOTTOMLEFT', -2
		else
			FramePoint, OffsetY = 'TOPLEFT', 0
		end
		ES.Main:SetPoint('TOPLEFT', ChatTab, FramePoint, 0, OffsetY)
		ES.Main:SetPoint('BOTTOMRIGHT', ChatPanel, 'TOPRIGHT', 0, 0)
	end

	ES.Left:SetPoint('RIGHT', ES.Right, 'LEFT', -2, 0)
	ES.Right:SetPoint('RIGHT', ES.Main, 'RIGHT', 0, 0)
	ES.Left:SetSize(AS:CheckOption('EmbedLeftWidth') - 1, ES.Main:GetHeight())
	ES.Right:SetSize((ES.Main:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, ES.Main:GetHeight())
end
