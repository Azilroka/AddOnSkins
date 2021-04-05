local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end

-- Cache global variables
--Lua functions
local _G = _G
local floor = floor
--WoW API / Variables
local IsAddOnLoaded = IsAddOnLoaded
local UIFrameFadeIn, UIFrameFadeOut = UIFrameFadeIn, UIFrameFadeOut
local CreateFrame = CreateFrame
-- GLOBALS:

function AS:EmbedSystemHooks()
	AS:CreateToggleButton('RightToggleButton', '►', AS.InfoRight, ASL.EmbedSystem.ToggleEmbed)
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

	AS:CreateToggleButton('LeftToggleButton', '◄', AS.InfoLeft, ASL.EmbedSystem.ToggleOptions)
	_G.LeftToggleButton:SetPoint('LEFT', AS.InfoLeft, 'LEFT', 2, 0)
	_G.LeftToggleButton:HookScript('OnClick', function(self, button)
		if button == 'RightButton' then
			if IsAddOnLoaded('Enhanced_Config') then
				_G.Enhanced_Config[1]:ToggleConfig()
			end
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

function AS:EmbedSystem_WindowResize()
	local ChatPanel = AS:CheckOption('EmbedRightChat') and AS.InfoRight or AS.InfoLeft
	local ChatTab = AS:CheckOption('EmbedRightChat') and AS.TabsRightBackground or AS.TabsLeftBackground
	if Tukui[2]['General']['Themes']['Value'] == 'Tukui 17' then
		_G.EmbedSystem_MainWindow:SetPoint('BOTTOM', ChatPanel, 'TOP', 0, 2)
		_G.EmbedSystem_MainWindow:SetSize(ChatPanel:GetWidth(), 142)
	else
		local FramePoint, OffsetY
		if AS:CheckOption('EmbedBelowTop') then
			FramePoint, OffsetY = 'BOTTOMLEFT', -2
		else
			FramePoint, OffsetY = 'TOPLEFT', 0
		end
		_G.EmbedSystem_MainWindow:SetPoint('TOPLEFT', ChatTab, FramePoint, 0, OffsetY)
		_G.EmbedSystem_MainWindow:SetPoint('BOTTOMRIGHT', ChatPanel, 'TOPRIGHT', 0, 0)
	end

	_G.EmbedSystem_LeftWindow:SetPoint('RIGHT', _G.EmbedSystem_RightWindow, 'LEFT', -2, 0)
	_G.EmbedSystem_RightWindow:SetPoint('RIGHT', _G.EmbedSystem_MainWindow, 'RIGHT', 0, 0)
	_G.EmbedSystem_LeftWindow:SetSize(AS:CheckOption('EmbedLeftWidth') - 1, _G.EmbedSystem_MainWindow:GetHeight())
	_G.EmbedSystem_RightWindow:SetSize((_G.EmbedSystem_MainWindow:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, _G.EmbedSystem_MainWindow:GetHeight())

	if _G.Enhanced_Config and _G.Enhanced_Config.Options.args.addonskins then
		_G.Enhanced_Config.Options.args.addonskins.args.embed.args.EmbedLeftWidth.min = floor(_G.EmbedSystem_MainWindow:GetWidth() * .25)
		_G.Enhanced_Config.Options.args.addonskins.args.embed.args.EmbedLeftWidth.max = floor(_G.EmbedSystem_MainWindow:GetWidth() * .75)
	end
end
