local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('VengeanceStatus') then return end

function AS:VengeanceStatus()
	AS:SkinStatusBar(VengeanceStatus_StatusBar)
end

AS:RegisterSkin('VengeanceStatus', AS.VengeanceStatus)