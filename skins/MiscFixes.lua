local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'MiscFixes'
function AS:MiscFixes(event, addon)
	for i = 1, 10 do
		if _G['StaticPopup'..i] then
			_G['StaticPopup'..i]:SetTemplate('Transparent')
			if _G['StaticPopup'..i..'Button1'] then AS:SkinButton(_G['StaticPopup'..i..'Button1']) end
			if _G['StaticPopup'..i..'Button2'] then AS:SkinButton(_G['StaticPopup'..i..'Button2']) end
			if _G['StaticPopup'..i..'CloseButton'] then AS:SkinCloseButton(_G['StaticPopup'..i..'CloseButton']) end
		end
	end

	if event == 'AUCTION_HOUSE_SHOW' then
		if ElvUI[1].private.skins.blizzard.enable and ElvUI[1].private.skins.blizzard.auctionhouse and AS:CheckOption('AuctionHouse') then
			BrowseNameText:Point('TOPLEFT', 20, -39)
			BrowseName:SetHeight(17)
			BrowseName:Point('TOPLEFT', BrowseNameText, 'BOTTOMLEFT', 2, -3)
			BrowseLevelText:Point('TOPLEFT', 184, -40)
			BrowseMinLevel:SetHeight(17)
			BrowseMinLevel:Point('TOPLEFT', BrowseLevelText, 'BOTTOMLEFT', 0, -6)
			BrowseLevelHyphen:Point('LEFT', BrowseMinLevel, 'RIGHT', 4, 0)
			BrowseMaxLevel:SetHeight(17)
			BrowseMaxLevel:Point('LEFT', BrowseMinLevel, 'RIGHT', 12, 0)
			BrowseDropDown:Point('TOPLEFT', BrowseLevelText, 'BOTTOMRIGHT', -5, -2)
			BrowseResetButton:Point('TOPLEFT', AuctionFrameBrowse, 'TOPLEFT', 20, -78)
			BrowseSearchButton:ClearAllPoints()
			BrowseSearchButton:Point('LEFT', BrowsePrevPageButton, 'RIGHT', 24, 0)
			BrowseCloseButton:Point('BOTTOMRIGHT', AuctionFrameBrowse, 'BOTTOMRIGHT', 66, 6)
			AuctionFrameMoneyFrame:Point('BOTTOMRIGHT', AuctionFrame, 'BOTTOMLEFT', 181, 10)
			BrowseBidPrice:Point('BOTTOM', AuctionFrameBrowse, 'BOTTOM', 25, 10)
			BidBidPrice:Point('BOTTOM', AuctionFrameBid, 'BOTTOM', 25, 10)
			BidCloseButton:Point('BOTTOMRIGHT', AuctionFrameBid, 'BOTTOMRIGHT', 66, 6)
			AuctionsCloseButton:Point('BOTTOMRIGHT', AuctionFrameAuctions, 'BOTTOMRIGHT', 66, 6)
			AuctionFrameTab1:Point('TOPLEFT', AuctionFrame, 'BOTTOMLEFT', -5, 2)
			BrowseNextPageButton:Size(20)
			BrowsePrevPageButton:Size(20)
			for i = 1, AuctionFrame.numTabs do
				AS:SkinTab(_G['AuctionFrameTab'..i])
			end
		end
		AS:UnregisterEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.MiscFixes, 'ADDON_LOADED', 'AUCTION_HOUSE_SHOW')