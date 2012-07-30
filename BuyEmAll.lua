if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("BuyEmAll") then return end
local SkinBuyEmAll = CreateFrame("Frame")
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	SkinBuyEmAll:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinBuyEmAll:SetScript( "OnEvent", function(self)
	if (UISkinOptions.BuyEmAllSkin == "Disabled") then return end

	BuyEmAllFrame:StripTextures()
	BuyEmAllFrame:SetTemplate("Transparent")
	cSkinButton(BuyEmAllStackButton)
	cSkinButton(BuyEmAllMaxButton)
	cSkinButton(BuyEmAllCancelButton)
	cSkinButton(BuyEmAllOkayButton)

end)