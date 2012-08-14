if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
		EmbeddingWindow:RegisterEvent("PLAYER_ENTERING_WORLD")
		EmbeddingWindow:SetScript("OnEvent", function(self)
		EmbeddingWindow:SetTemplate("Transparent")
		if IsAddOnLoaded("ElvUI") then EmbeddingWindow:Point("BOTTOMRIGHT", RightChatDataPanel, "BOTTOMRIGHT", 16, 23) EmbeddingWindow:Size(402,148) end
		if IsAddOnLoaded("Tukui") then EmbeddingWindow:Point("BOTTOMRIGHT", TukuiInfoRight, "BOTTOMRIGHT", 0, 24) EmbeddingWindow:Size(TukuiInfoRight:GetWidth(), (TukuiInfoRight:GetHeight() * 6) + 4) end
		EmbeddingWindow:SetFrameStrata("HIGH")
		EmbeddingWindow:Hide()
		EmbeddingWindow:SetClampedToScreen(true)
		EmbeddingWindow:SetMovable(true)
		EmbeddingWindow.text = EmbeddingWindow:CreateFontString(nil, "OVERLAY")
		if IsAddOnLoaded("ElvUI") then UIFont = [[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]] end
		if IsAddOnLoaded("Tukui") then UIFont = [[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]] end
		EmbeddingWindow.text:SetFont(UIFont, 14, "OUTLINE")
		EmbeddingWindow.text:SetPoint("CENTER")
		EmbeddingWindow.text:SetText("Embedding Window")
		EmbeddingWindow:EnableMouse(true)
		EmbeddingWindow:RegisterForDrag("LeftButton");
		EmbeddingWindow:SetScript("OnDragStart", function(self) if IsShiftKeyDown() then self:StartMoving() end end)
		EmbeddingWindow:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end);

		if IsAddOnLoaded("ElvUI") then
			local E, L, V, P, G, DF = unpack(ElvUI)
			RightChatToggleButton:SetScript("OnClick", function(self, btn)
				if btn == 'RightButton' then
				if (IsAddOnLoaded("Recount") and (UISkinOptions.EmbedRecount == "Enabled")) then
					ToggleFrame(Recount_MainWindow)
				end
				if (IsAddOnLoaded("Skada") and (UISkinOptions.EmbedSkada == "Enabled")) then
					Skada:ToggleWindow()
				end
			else
			if c.db[self.parent:GetName()..'Faded'] then
				c.db[self.parent:GetName()..'Faded'] = nil
				UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
				UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
			else
				c.db[self.parent:GetName()..'Faded'] = true
				UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
				UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
				self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
				end
			end
		end)

		RightChatToggleButton:SetScript("OnEnter", function(self, ...)
			GameTooltip:SetOwner(self, 'ANCHOR_TOPRIGHT', 0, 4)
			GameTooltip:ClearLines()
			GameTooltip:AddDoubleLine(L['Left Click:'], L['Toggle Chat Frame'], 1, 1, 1)
			GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
			GameTooltip:Show()
			end)
		end
		end)

SLASH_EMBEDDINGWINDOW1 = '/embed';
function SlashCmdList.EMBEDDINGWINDOW(msg, editbox)
	if EmbeddingWindow:IsVisible() then
		EmbeddingWindow:Hide()
		print("Embedding Window is now |cffff2020Hidden|r.");
	else
		EmbeddingWindow:Show()
		print("Embedding Window is now |cff00ff00Shown|r.");
	end
end