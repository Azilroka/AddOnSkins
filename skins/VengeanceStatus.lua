local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "VengeanceStatusSkin"
function AS:SkinVengeanceStatus()
	AS:SkinStatusBar(VengeanceStatus_StatusBar)
end

AS:RegisterSkin(name, AS.SkinVengeanceStatus)