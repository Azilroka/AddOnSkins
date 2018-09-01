local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('ElvUI') then return end

local E, L = unpack(ElvUI)
local _G = _G
local floor = floor
local hooksecurefunc = hooksecurefunc
local UIFrameFadeIn, UIFrameFadeOut = UIFrameFadeIn, UIFrameFadeOut
local IsAddOnLoaded = IsAddOnLoaded
local UnitAffectingCombat = UnitAffectingCombat
local RightChatToggleButton, LeftChatToggleButton, RightChatPanel, LeftChatPanel, RightChatTab, LeftChatTab, RightChatDataPanel
local EmbedSystem_MainWindow, EmbedSystem_LeftWindow, EmbedSystem_RightWindow

function AS:EmbedSystemHooks()
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
					EmbedSystem_MainWindow:Hide()
				else
					AS:SetOption('EmbedIsHidden', false)
					EmbedSystem_MainWindow:Show()
				end
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
			end

			if not self.parent.editboxforced then
				GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT', 0, 4)
				GameTooltip:ClearLines()
				GameTooltip:AddDoubleLine(L["Left Click:"], L["Toggle Chat Frame"], 1, 1, 1)
				GameTooltip:AddLine('')
				GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
				GameTooltip:Show()
			end
		end)

		function HideRightChat()
			RightChatToggleButton:Click()
		end

		function HideBothChat()
			LeftChatToggleButton:Click()
			RightChatToggleButton:Click()
		end
	end
end

function AS:EmbedSystem_WindowResize()
	if UnitAffectingCombat('player') or not AS.EmbedSystemCreated then return end
	local ChatPanel = AS:CheckOption('EmbedRightChat') and RightChatPanel or LeftChatPanel
	local ChatTab = AS:CheckOption('EmbedRightChat') and RightChatTab or LeftChatTab
	local ChatData = AS:CheckOption('EmbedRightChat') and RightChatDataPanel or LeftChatToggleButton
	local TopRight = ChatData == RightChatDataPanel and (E.db.datatexts.rightChatPanel and 'TOPLEFT' or 'BOTTOMLEFT') or ChatData == LeftChatToggleButton and (E.db.datatexts.leftChatPanel and 'TOPLEFT' or 'BOTTOMLEFT')
	local yOffset = (ChatData == RightChatDataPanel and E.db.datatexts.rightChatPanel and (E.PixelMode and 1 or 0)) or (ChatData == LeftChatToggleButton and E.db.datatexts.leftChatPanel and (E.PixelMode and 1 or 0)) or (E.PixelMode and 0 or -1)

	EmbedSystem_MainWindow:SetParent(ChatPanel)
	EmbedSystem_MainWindow:ClearAllPoints()
	EmbedSystem_MainWindow:SetPoint('BOTTOMLEFT', ChatData, TopRight, 0, yOffset)
	EmbedSystem_MainWindow:SetPoint('TOPRIGHT', ChatTab, AS:CheckOption('EmbedBelowTop') and 'BOTTOMRIGHT' or 'TOPRIGHT', 0, AS:CheckOption('EmbedBelowTop') and -1 or 0)

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
