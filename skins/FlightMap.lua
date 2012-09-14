if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("FlightMap") then return end
local U = unpack(select(2,...))
local function SkinFM(self,event)
	U.SkinStatusBar(FlightMapTimesFrame)
	FlightMapTimesText:ClearAllPoints()
	FlightMapTimesText:SetPoint("CENTER", FlightMapTimesFrame, "CENTER", 0, 0)
end

U.RegisterSkin('FlightMapSkin',SkinFM)