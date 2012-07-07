	if not IsAddOnLoaded("BuyEmAll") then return end

	BuyEmAllFrame:StripTextures()
	BuyEmAllFrame:SetTemplate("Transparent")
	cSkinButton(BuyEmAllStackButton)
	cSkinButton(BuyEmAllMaxButton)
	cSkinButton(BuyEmAllCancelButton)
	cSkinButton(BuyEmAllOkayButton)
