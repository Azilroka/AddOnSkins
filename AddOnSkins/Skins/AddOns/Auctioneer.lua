local AS, L, S, R = unpack(AddOnSkins)

function R:Auctioneer(event)
	if event == 'PLAYER_ENTERING_WORLD' then return end
	if AS:CheckAddOn('Auc-Stat-Purchased') then
		local a, b, c, d, e = BrowsePrevPageButton:GetPoint()
		BrowsePrevPageButton:SetPoint(a, b, c, d + 10, 3)
		a, b, c, d, e = BrowseNextPageButton:GetPoint()
		BrowseNextPageButton:SetPoint(a, b, c, d, 3)
	end
	if AucAdvScanButton then S:HandleButton(AucAdvScanButton) end
	if AucAdvSimpFrameCreate then S:HandleButton(AucAdvSimpFrameCreate) end
	if AucAdvSimpFrameRemember then S:HandleButton(AucAdvSimpFrameRemember) end

	for i = 1, _G.AuctionFrame.numTabs do
		S:HandleTab(_G["AuctionFrameTab"..i])
	end

	AS:UnregisterSkinEvent('Auctioneer', event)
end

AS:RegisterSkin('Auctioneer', nil, 'AUCTION_HOUSE_SHOW')
