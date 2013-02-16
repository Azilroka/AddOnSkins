local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "TomTomSkin"
local function SkinTomTom()
	if TomTomBlock then AS:SkinFrame(TomTomBlock) end
end
AS:RegisterSkin(name, SkinTomTom)