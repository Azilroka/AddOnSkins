local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Auc-Advanced') then return end

function AS:Auctioneer(event)
	if event == 'PLAYER_ENTERING_WORLD' then return end
	if IsAddOnLoaded('Auc-Stat-Purchased') then
		BrowsePrevPageButton:Point('BOTTOMRIGHT', BrowseScrollFrame, 'BOTTOMRIGHT', -160, 0)
		local a, b, c, d, e = BrowseNextPageButton:GetPoint()
		BrowseNextPageButton:SetPoint(a, b, c, d, 3)
	end
	if AucAdvScanButton then AS:SkinButton(AucAdvScanButton) end
	if AucAdvSimpFrameCreate then AS:SkinButton(AucAdvSimpFrameCreate) end
	if AucAdvSimpFrameRemember then AS:SkinButton(AucAdvSimpFrameRemember) end
	AS:UnregisterSkinEvent(name, event)
end

AS:RegisterSkin('Auctioneer', AS.Auctioneer, 'AUCTION_HOUSE_SHOW')