local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('ElvUI') then return end
local E, L
-- Cache global variables
--Lua functions
local _G = _G
local floor = floor
--WoW API / Variables
local hooksecurefunc = hooksecurefunc
local UIFrameFadeIn, UIFrameFadeOut = UIFrameFadeIn, UIFrameFadeOut
local IsAddOnLoaded = IsAddOnLoaded
local UnitAffectingCombat = UnitAffectingCombat
local RightChatToggleButton, LeftChatToggleButton, RightChatPanel, LeftChatPanel, RightChatTab, LeftChatTab, RightChatDataPanel
local EmbedSystem_MainWindow, EmbedSystem_LeftWindow, EmbedSystem_RightWindow
-- GLOBALS:

function AS:EmbedSystemHooks()
	if not E then
		E, L = unpack(ElvUI)
	end

	RightChatToggleButton, LeftChatToggleButton, RightChatPanel, LeftChatPanel, RightChatTab, LeftChatTab, RightChatDataPanel = _G.RightChatToggleButton, _G.LeftChatToggleButton, _G.RightChatPanel, _G.LeftChatPanel, _G.RightChatTab, _G.LeftChatTab, _G.RightChatDataPanel
	EmbedSystem_MainWindow, EmbedSystem_LeftWindow, EmbedSystem_RightWindow = _G.EmbedSystem_MainWindow, _G.EmbedSystem_LeftWindow, _G.EmbedSystem_RightWindow

	hooksecurefunc(E:GetModule('Chat'), 'PositionChat', function(self, override)
		if override then
			AS:Embed_Check()
		end
	end)
	hooksecurefunc(E:GetModule('Layout'), 'ToggleChatPanels', function() AS:Embed_Check() end)

	if RightChatToggleButton then
		RightChatToggleButton:RegisterForClicks('AnyDown')
		RightChatToggleButton:SetScript('OnClick', function(self, btn)
			if btn == 'RightButton' then
				if EmbedSystem_MainWindow:IsShown() then
					AS:SetOption('EmbedIsHidden', true)
				else
					AS:SetOption('EmbedIsHidden', false)
				end

				EmbedSystem_MainWindow:SetShown(not AS:CheckOption('EmbedIsHidden'))
			else
				if E.db[self.parent:GetName()..'Faded'] then
					E.db[self.parent:GetName()..'Faded'] = nil
					UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
					UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
					if not AS:CheckOption('EmbedIsHidden') then
						EmbedSystem_MainWindow:Show()
					end
				else
					E.db[self.parent:GetName()..'Faded'] = true
					UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
					UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
					self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
				end
			end
		end)

		RightChatToggleButton:SetScript('OnEnter', function(self)
			if E.db[self.parent:GetName()..'Faded'] then
				self.parent:Show()
				UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
				UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
				if not AS:CheckOption('EmbedIsHidden') then
					EmbedSystem_MainWindow:Show()
				end
			end

			if not self.parent.editboxforced then
				_G.GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT', 0, 4)
				_G.GameTooltip:ClearLines()
				_G.GameTooltip:AddDoubleLine(L["Left Click:"], L["Toggle Chat Frame"], 1, 1, 1)
				_G.GameTooltip:AddLine('')
				_G.GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
				_G.GameTooltip:Show()
			end
		end)
	end
end

function AS:EmbedSystem_WindowResize()
	if UnitAffectingCombat('player') or not AS.EmbedSystemCreated then return end
	local ChatPanel = AS:CheckOption('EmbedRightChat') and RightChatPanel or LeftChatPanel
	local ChatTab = AS:CheckOption('EmbedRightChat') and RightChatTab or LeftChatTab

	EmbedSystem_MainWindow:SetParent(ChatPanel)
	EmbedSystem_MainWindow:ClearAllPoints()
	EmbedSystem_MainWindow:SetPoint('TOPRIGHT', ChatTab, AS:CheckOption('EmbedBelowTop') and 'BOTTOMRIGHT' or 'TOPRIGHT', 0, AS:CheckOption('EmbedBelowTop') and -1 or 0)
	EmbedSystem_MainWindow:SetPoint('BOTTOMLEFT', ChatPanel, 'BOTTOMLEFT', 0, (E.PixelMode and 0 or -1))

	EmbedSystem_LeftWindow:SetSize(AS:CheckOption('EmbedLeftWidth'), EmbedSystem_MainWindow:GetHeight())
	EmbedSystem_RightWindow:SetSize((EmbedSystem_MainWindow:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, EmbedSystem_MainWindow:GetHeight())

	EmbedSystem_LeftWindow:SetPoint('LEFT', EmbedSystem_MainWindow, 'LEFT', 0, 0)
	EmbedSystem_RightWindow:SetPoint('RIGHT', EmbedSystem_MainWindow, 'RIGHT', 0, 0)

	-- Dynamic Range
	if IsAddOnLoaded('ElvUI_Config') then
		E.Options.args.addonskins.args.embed.args.EmbedLeftWidth.min = floor(EmbedSystem_MainWindow:GetWidth() * .25)
		E.Options.args.addonskins.args.embed.args.EmbedLeftWidth.max = floor(EmbedSystem_MainWindow:GetWidth() * .75)
	end
end
