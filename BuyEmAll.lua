if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("BuyEmAll") then return end
local SkinBuyEmAll = CreateFrame("Frame")
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	SkinBuyEmAll:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinBuyEmAll:SetScript("OnEvent", function(self)
	if (UISkinOptions.BuyEmAllSkin == "Disabled") then return end

	cSkinFrame(BuyEmAllFrame)
	cSkinButton(BuyEmAllStackButton)
	cSkinButton(BuyEmAllMaxButton)
	cSkinButton(BuyEmAllCancelButton)
	cSkinButton(BuyEmAllOkayButton)
end)