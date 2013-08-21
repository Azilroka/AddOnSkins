local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "AffDotsSkin"
function AS:SkinAffDots()
	AS:SkinBackdropFrame(AffDotsTarget)
end

AS:RegisterSkin(name, AS.SkinAffDots)