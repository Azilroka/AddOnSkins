local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('Critline') then return end

local name = "CritlineSkin"
function AS:SkinCritline()
	AS:SkinBackdropFrame(Critline.display)
	Critline.display.backdrop:SetFrameStrata("BACKGROUND")
end

AS:RegisterSkin(name, AS.SkinCritline)