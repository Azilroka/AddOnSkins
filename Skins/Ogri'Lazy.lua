local AS = unpack(AddOnSkins)

if not AS:CheckAddOn("Ogri'Lazy") then return end

local name = 'OgriLazySkin'
function AS:SkinOgriLazy()
	AS:SkinFrame(Relic_View)
	AS:SkinCloseButton(Relic_View.close)
	for i = 1, 4 do
		AS:SkinTexture(Relic_View.set[i].tex)
	end
	for i = 1, 10 do
		AS:SkinTexture(Relic_View.replay[i].tex)
	end
end

AS:RegisterSkin(name, AS.SkinOgriLazy)