if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("BuyEmAll") then return end
local U = unpack(select(2,...))
local name = "BuyEmAllSkin"
local function SkinBuyEmAll(self)
	local s = U.s
	local c = U.c

	U.SkinFrame(BuyEmAllFrame)
	U.SkinButton(BuyEmAllStackButton)
	U.SkinButton(BuyEmAllMaxButton)
	U.SkinButton(BuyEmAllCancelButton)
	U.SkinButton(BuyEmAllOkayButton)
end

U.RegisterSkin(name,SkinBuyEmAll)