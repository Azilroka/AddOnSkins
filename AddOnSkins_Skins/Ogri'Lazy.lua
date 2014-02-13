local AS = unpack(AddOnSkins)

if not AS:CheckAddOn("Ogri'Lazy") then return end

local name = 'OgriLazySkin'
function AS:SkinOgriLazy()
	AS:SkinFrame(Relic_View)
	AS:SkinCloseButton(Relic_ViewCloseButton)
end

AS:RegisterSkin(name, AS.SkinOgriLazy)