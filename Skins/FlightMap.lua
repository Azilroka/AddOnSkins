local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('FlightMap') then return end

function AS:FlightMap()
	AS:SkinStatusBar(FlightMapTimesFrame)
	FlightMapTimesText:ClearAllPoints()
	FlightMapTimesText:SetPoint('CENTER', FlightMapTimesFrame, 'CENTER', 0, 0)
end

AS:RegisterSkin('FlightMap', AS.FlightMap)