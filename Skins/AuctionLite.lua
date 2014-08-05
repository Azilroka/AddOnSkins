local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AuctionLite') then return end

local name = 'AuctionLiteSkin'
function AS:SkinAuctionLite(event)
	if event == 'PLAYER_ENTERING_WORLD' then return end
	AS:SkinTab(AuctionFrameTab4)
	AS:SkinTab(AuctionFrameTab5)
	AS:SkinEditBox(BuyName)
	AS:SkinEditBox(BuyQuantity)
	AS:SkinButton(BuySearchButton)
	AS:SkinButton(BuyBidButton)
	AS:SkinButton(BuyBuyoutButton)
	AS:SkinButton(BuyCancelSearchButton)
	AS:SkinButton(BuyCancelAuctionButton)
	AS:SkinButton(BuyScanButton)
	AS:SkinNextPrevButton(BuyAdvancedButton)
	AS:SkinNextPrevButton(SellRememberButton)
	AS:SkinEditBox(SellStacks)
	AS:SkinEditBox(SellSize)
	AS:SkinEditBox(SellBidPriceGold)
	AS:SkinEditBox(SellBidPriceSilver)
	AS:SkinEditBox(SellBidPriceCopper)
	AS:SkinEditBox(SellBuyoutPriceGold)
	AS:SkinEditBox(SellBuyoutPriceSilver)
	AS:SkinEditBox(SellBuyoutPriceCopper)
	AS:SkinButton(SellCreateAuctionButton)
	AS:UnregisterSkinEvent(name, event)
end

AS:RegisterSkin(name, AS.SkinAuctionLite, 'AUCTION_HOUSE_SHOW')