local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "DKDotsSkin"
function AS:SkinDKDots()
	AS:SkinBackdropFrame(DKDotsTarget)
end

AS:RegisterSkin(name, AS.SkinDKDots)