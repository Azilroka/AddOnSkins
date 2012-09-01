if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("PowerAuras") then return end
local SkinPowerAuras = CreateFrame("Frame")
	SkinPowerAuras:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinPowerAuras:SetScript("OnEvent", function(self)
	if (UISkinOptions.PowerAurasSkin ~= "Enabled") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	LoadAddOn("PowerAurasOptions")
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	cSkinFrame(PowerAurasGUIBrowser)
	cSkinFrame(PowerAurasEditor)
	cSkinCloseButton(PowerAurasGUIBrowser.CloseButton)
	cSkinCloseButton(PowerAurasEditor.CloseButton)

end)