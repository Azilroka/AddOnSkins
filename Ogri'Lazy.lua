if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Ogri'Lazy") then return end
local name = "OgriLazySkin"
local function SkinOgriLazy(self)
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	cSkinFrame(Relic_View)
	cSkinCloseButton(Relic_ViewCloseButton)
end

cRegisterSkin(name,SkinOgriLazy)
