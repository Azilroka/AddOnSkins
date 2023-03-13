local AS, L, S, R = unpack(AddOnSkins)

function R:AuctionLite(event)
	if event == 'PLAYER_ENTERING_WORLD' then return end

	S:HandleEditBox(BuyName)
	S:HandleEditBox(BuyQuantity)
	S:HandleButton(BuySearchButton)
	S:HandleButton(BuyBidButton)
	S:HandleButton(BuyBuyoutButton)
	S:HandleButton(BuyCancelSearchButton)
	S:HandleButton(BuyCancelPurchaseButton)
	S:HandleButton(BuyCancelAuctionButton)
	S:HandleButton(BuyScanButton)
	S:HandleButton(BuyApproveButton)
	S:HandleNextPrevButton(BuyAdvancedButton)
	S:StripTextures(BuyScrollFrame)
	S:HandleScrollBar(BuyScrollFrameScrollBar)

	S:StripTextures(SellScrollFrame)
	S:HandleScrollBar(SellScrollFrameScrollBar)
	S:HandleNextPrevButton(SellRememberButton)
	S:HandleEditBox(SellStacks)
	S:HandleEditBox(SellSize)
	S:HandleEditBox(SellBidPriceGold)
	S:HandleEditBox(SellBidPriceSilver)
	S:HandleEditBox(SellBidPriceCopper)
	S:HandleEditBox(SellBuyoutPriceGold)
	S:HandleEditBox(SellBuyoutPriceSilver)
	S:HandleEditBox(SellBuyoutPriceCopper)
	S:HandleButton(SellCreateAuctionButton)

	AS:UnregisterSkinEvent('AuctionLite', event)
end

AS:RegisterSkin('AuctionLite', nil, 'AUCTION_HOUSE_SHOW')
