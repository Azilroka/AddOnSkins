local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "VengeanceStatusSkin"
local function SkinVengeanceStatus()
	AS:SkinStatusBar(VengeanceStatus_StatusBar)
end
AS:RegisterSkin(name, SkinVengeanceStatus)