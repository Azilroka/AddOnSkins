if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("BuyEmAll") then return end
local name = "BuyEmAllSkin"
local function SkinBuyEmAll(self)
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	cSkinFrame(BuyEmAllFrame)
	cSkinButton(BuyEmAllStackButton)
	cSkinButton(BuyEmAllMaxButton)
	cSkinButton(BuyEmAllCancelButton)
	cSkinButton(BuyEmAllOkayButton)
end

cRegisterSkin(name,SkinBuyEmAll)