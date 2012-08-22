if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("EnergyWatch") then return end
local SkinEnergyWatch = CreateFrame("Frame")
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
	SkinEnergyWatch:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinEnergyWatch:SetScript("OnEvent", function(self)
	if (UISkinOptions.EnergyWatchSkin == "Disabled") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

	EnergyWatchBar:StripTextures(True)
	EnergyWatchStatusBar:CreateBackdrop()
	EnergyWatchStatusBar:SetStatusBarTexture(c["media"].normTex)
end)


