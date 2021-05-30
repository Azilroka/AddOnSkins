local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AuctionLite') then return end

function AS:AuctionLite(event)
	if event == 'PLAYER_ENTERING_WORLD' then return end

	AS:SkinEditBox(BuyName)
	AS:SkinEditBox(BuyQuantity)
	AS:SkinButton(BuySearchButton)
	AS:SkinButton(BuyBidButton)
	AS:SkinButton(BuyBuyoutButton)
	AS:SkinButton(BuyCancelSearchButton)
	AS:SkinButton(BuyCancelPurchaseButton)
	AS:SkinButton(BuyCancelAuctionButton)
	AS:SkinButton(BuyScanButton)
	AS:SkinButton(BuyApproveButton)
	AS:SkinArrowButton(BuyAdvancedButton)
	AS:StripTextures(BuyScrollFrame)
	AS:SkinScrollBar(BuyScrollFrameScrollBar)

	AS:StripTextures(SellScrollFrame)
	AS:SkinScrollBar(SellScrollFrameScrollBar)
	AS:SkinArrowButton(SellRememberButton)
	AS:SkinEditBox(SellStacks)
	AS:SkinEditBox(SellSize)
	AS:SkinEditBox(SellBidPriceGold)
	AS:SkinEditBox(SellBidPriceSilver)
	AS:SkinEditBox(SellBidPriceCopper)
	AS:SkinEditBox(SellBuyoutPriceGold)
	AS:SkinEditBox(SellBuyoutPriceSilver)
	AS:SkinEditBox(SellBuyoutPriceCopper)
	AS:SkinButton(SellCreateAuctionButton)

	AS:UnregisterSkinEvent('AuctionLite', event)
end

AS:RegisterSkin('AuctionLite', AS.AuctionLite, 'AUCTION_HOUSE_SHOW')
