local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Auc-Advanced') then return end

function AS:Auctioneer(event)
	if event == 'PLAYER_ENTERING_WORLD' then return end
	if AS:CheckAddOn('Auc-Stat-Purchased') then
		local a, b, c, d, e = BrowsePrevPageButton:GetPoint()
		BrowsePrevPageButton:SetPoint(a, b, c, d + 10, 3)
		a, b, c, d, e = BrowseNextPageButton:GetPoint()
		BrowseNextPageButton:SetPoint(a, b, c, d, 3)
	end
	if AucAdvScanButton then AS:SkinButton(AucAdvScanButton) end
	if AucAdvSimpFrameCreate then AS:SkinButton(AucAdvSimpFrameCreate) end
	if AucAdvSimpFrameRemember then AS:SkinButton(AucAdvSimpFrameRemember) end

	for i = 1, _G.AuctionFrame.numTabs do
		AS:SkinTab(_G["AuctionFrameTab"..i])
	end

	AS:UnregisterSkinEvent('Auctioneer', event)
end

AS:RegisterSkin('Auctioneer', AS.Auctioneer, 'AUCTION_HOUSE_SHOW')
