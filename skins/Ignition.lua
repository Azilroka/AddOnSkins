local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "IgnitionSkin"
function AS:SkinIgnition()
	ignTimeBar:StripTextures(true)
	AS:SkinBackdropFrame(uiIgnitionFrame, true)
end

AS:RegisterSkin(name, AS.SkinIgnition)