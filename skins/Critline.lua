local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "CritlineSkin"
function AS:SkinCritline()
	AS:SkinBackdropFrame(Critline.display)
	Critline.display.backdrop:SetFrameStrata("BACKGROUND")
end

AS:RegisterSkin(name, AS.SkinCritline)