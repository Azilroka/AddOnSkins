if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("FlightMap") then return end
local SkinFM = CreateFrame("Frame")
	SkinFM:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinFM:SetScript("OnEvent", function(self)
	if (UISkinOptions.FlightMapSkin ~= "Enabled") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	cSkinStatusBar(FlightMapTimesFrame)
	FlightMapTimesText:ClearAllPoints()
	FlightMapTimesText:SetPoint("CENTER", FlightMapTimesFrame, "CENTER", 0, 0)
end)