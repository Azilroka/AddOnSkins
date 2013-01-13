local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "NumerationSkin"
local function SkinNumeration()
	AS:SkinFrame(NumerationFrame)
end
AS:RegisterSkin(name, SkinNumeration)