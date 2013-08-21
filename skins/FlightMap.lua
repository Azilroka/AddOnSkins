local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "FlightMapSkin"
function AS:SkinFlightMap()
	AS:SkinStatusBar(FlightMapTimesFrame)
	FlightMapTimesText:ClearAllPoints()
	FlightMapTimesText:SetPoint("CENTER", FlightMapTimesFrame, "CENTER", 0, 0)
end

AS:RegisterSkin(name, AS.SkinFlightMap)