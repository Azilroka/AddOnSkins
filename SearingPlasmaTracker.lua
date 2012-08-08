if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("SearingPlasmaTracker") then return end
local SkinSearingPlasmaTracker = CreateFrame("Frame")
	SkinSearingPlasmaTracker:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinSearingPlasmaTracker:SetScript("OnEvent", function(self)
	if (UISkinOptions.SearingPlasmaTrackerSkin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	cSkinFrame(SearingPlasmaTrackerFrame)

end)