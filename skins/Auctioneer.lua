local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'AuctioneerSkin'
function AS:SkinAuctioneer(event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	if IsAddOnLoaded("Auc-Stat-Purchased") then
		BrowsePrevPageButton:Point("BOTTOMRIGHT", BrowseScrollFrame, "BOTTOMRIGHT", -160, 0)
	end
	if AucAdvScanButton then AS:SkinButton(AucAdvScanButton) end
	if AucAdvSimpFrameCreate then AS:SkinButton(AucAdvSimpFrameCreate) end
	if AucAdvSimpFrameRemember then AS:SkinButton(AucAdvSimpFrameRemember) end
	AS:UnregisterEvent(name, event)
end

AS:RegisterSkin(name, AS.SkinAuctioneer, 'AUCTION_HOUSE_SHOW')