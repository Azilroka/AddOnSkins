local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "CritlineSkin"
function AS:SkinCritline()
	AS:SkinBackdropFrame(Critline.display, true)
	Critline.display.backdrop:SetFrameStrata("BACKGROUND")
end
AS:RegisterSkin(name, AS.SkinCritline)