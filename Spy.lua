if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Spy") then return end
local SkinSpy = CreateFrame("Frame")
	SkinSpy:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinSpy:SetScript("OnEvent", function(self)
	if (UISkinOptions.SpySkin ~= "Enabled") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	cSkinFrame(Spy_MainWindow)
	cSkinCloseButton(Spy_MainWindow.CloseButton)
	cDesaturate(Spy_MainWindow.ClearButton)
	cDesaturate(Spy_MainWindow.LeftButton)
	cDesaturate(Spy_MainWindow.RightButton)

end)