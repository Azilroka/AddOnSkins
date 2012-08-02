if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("Spy") then return end
local SkinSpy = CreateFrame("Frame")
	SkinSpy:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinSpy:SetScript("OnEvent", function(self)
	if (UISkinOptions.SpySkin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	Spy_MainWindow:StripTextures(True)
	Spy_MainWindow:SetTemplate("Transparent")
	cSkinCloseButton(Spy_MainWindow.CloseButton)
	cDesaturate(Spy_MainWindow.ClearButton)
	cDesaturate(Spy_MainWindow.LeftButton)
	cDesaturate(Spy_MainWindow.RightButton)

end)