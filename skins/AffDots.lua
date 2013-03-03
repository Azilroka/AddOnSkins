local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "AffDotsSkin"
local function SkinAffDots()
	AS:SkinBackdropFrame(AffDotsTarget)
end
AS:RegisterSkin(name, SkinAffDots)