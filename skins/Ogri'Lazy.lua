if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Ogri'Lazy") then return end
local U = unpack(select(2,...))
local name = "OgriLazySkin"
local function SkinOgriLazy(self)
	local s = U.s
	local c = U.c

	cSkinFrame(Relic_View)
	cSkinCloseButton(Relic_ViewCloseButton)
end

cRegisterSkin(name,SkinOgriLazy)
