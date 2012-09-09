if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("FlightMap") then return end
local function SkinFM(self,event)
	cSkinStatusBar(FlightMapTimesFrame)
	FlightMapTimesText:ClearAllPoints()
	FlightMapTimesText:SetPoint("CENTER", FlightMapTimesFrame, "CENTER", 0, 0)
end

cRegisterSkin('FlightMapSkin',SkinFM)