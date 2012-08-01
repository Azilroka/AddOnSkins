if not IsAddOnLoaded("Tukui") then return end
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
		EmbeddingWindow:SetTemplate("Transparent")
		EmbeddingWindow:Point("CENTER", UIParent, "CENTER", 100, 100)
		EmbeddingWindow:SetFrameStrata("HIGH")
		EmbeddingWindow:Hide()
		EmbeddingWindow:Size(TukuiInfoRight:GetWidth() , (TukuiInfoRight:GetHeight() * 6) + 4)
		EmbeddingWindow:SetClampedToScreen(true)
		EmbeddingWindow:SetMovable(true)
		EmbeddingWindow.text = EmbeddingWindow:CreateFontString(nil, "OVERLAY")
		EmbeddingWindow.text:SetFont(c["media"].font, 14, "OUTLINE")
		EmbeddingWindow.text:SetPoint("CENTER")
		EmbeddingWindow.text:SetText("Embedding Window")
		EmbeddingWindow:EnableMouse(true)
		EmbeddingWindow:RegisterForDrag("LeftButton");
		EmbeddingWindow:SetScript("OnDragStart", function(self) if IsShiftKeyDown() then self:StartMoving() end end)
		EmbeddingWindow:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end);

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

