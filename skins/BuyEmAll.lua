if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("BuyEmAll") then return end
local U = unpack(select(2,...))
local name = "BuyEmAllSkin"
local function SkinBuyEmAll(self)
	local s = U.s
	local c = U.c

	cSkinFrame(BuyEmAllFrame)
	cSkinButton(BuyEmAllStackButton)
	cSkinButton(BuyEmAllMaxButton)
	cSkinButton(BuyEmAllCancelButton)
	cSkinButton(BuyEmAllOkayButton)
end

cRegisterSkin(name,SkinBuyEmAll)