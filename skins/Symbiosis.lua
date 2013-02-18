local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "SymbiosisTipSkin"
local function SkinSymbiosisTip()
	AS:SkinTooltip(SymbiosisTip)
end
AS:RegisterSkin(name, SkinSymbiosisTip)