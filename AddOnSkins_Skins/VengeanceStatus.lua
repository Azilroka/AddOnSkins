local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('VengenceStatus') then return end

local name = 'VengeanceStatusSkin'
function AS:SkinVengeanceStatus()
	AS:SkinStatusBar(VengeanceStatus_StatusBar)
end

AS:RegisterSkin(name, AS.SkinVengeanceStatus)