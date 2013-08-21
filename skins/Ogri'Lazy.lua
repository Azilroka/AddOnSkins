local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "OgriLazySkin"
function AS:SkinOgriLazy()
	AS:SkinFrame(Relic_View)
	AS:SkinCloseButton(Relic_ViewCloseButton)
end

AS:RegisterSkin(name, AS.SkinOgriLazy)