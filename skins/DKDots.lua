local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "DKDotsSkin"
function AS:SkinDKDots()
	AS:SkinBackdropFrame(DKDotsTarget)
end
AS:RegisterSkin(name, AS.SkinDKDots)