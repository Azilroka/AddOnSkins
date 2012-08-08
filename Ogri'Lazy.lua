if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Ogri'Lazy") then return end
local SkinOgriLazy = CreateFrame("Frame")
	SkinOgriLazy:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinOgriLazy:SetScript("OnEvent", function(self)
	if (UISkinOptions.OgriLazySkin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	cSkinFrame(Relic_View)
	cSkinCloseButton(Relic_ViewCloseButton)

end)


