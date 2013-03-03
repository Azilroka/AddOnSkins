local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "CritlineSkin"
local function SkinCritline()
	AS:SkinBackdropFrame(Critline.display, true)
	Critline.display.backdrop:SetFrameStrata("BACKGROUND")
end
AS:RegisterSkin(name, SkinCritline)