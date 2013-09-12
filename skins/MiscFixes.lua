local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'MiscFixes'
function AS:MiscFixes(event, addon)

	if addon == 'Blizzard_PetJournal' and IsAddOnLoaded('PetJournalEnhanced') then
		PetJournal:HookScript('OnShow', function() PJEUniquePetCount:StripTextures() end)
	end

	--[[if IsAddOnLoaded('acb_CastBar') then
		AS:SkinBackdropFrame(AzCastBarPluginPlayer)
		AS:SkinBackdropFrame(AzCastBarPluginTarget)
		AS:SkinBackdropFrame(AzCastBarPluginFocus)
		AS:SkinBackdropFrame(AzCastBarPluginMirror)
		AS:SkinBackdropFrame(AzCastBarPluginPet)
	end]]

	if IsAddOnLoaded('DoubleWideTradeSkills') then
		TradeSkillListScrollFrame:StripTextures()
		AS:SkinFrame(TradeSkillFrame)
		AS:SkinStatusBar(TradeSkillRankFrame)
	end

	if addon == 'Blizzard_TradeSkillUI' and IsAddOnLoaded('Auctionator') then 
		TradeSkillFrame:HookScript('OnShow', function() AS:SkinButton(Auctionator_Search, true) end)
	end

	if addon == 'Blizzard_TrainerUI' and IsAddOnLoaded('TrainAll') then
		ClassTrainerFrame:HookScript('OnShow', function()
			AS:SkinFrame(ClassTrainerTrainAllButton, 'Default')
			AS:SkinFrame(ClassTrainerTrainButton, 'Default')
		end)
	end

	if XPBarNoneXPBar then XPBarNoneXPBar:CreateBackdrop('Transparent') end

	for i = 1, 10 do
		if _G['StaticPopup'..i] then
			_G['StaticPopup'..i]:SetTemplate('Transparent')
			if _G['StaticPopup'..i..'Button1'] then AS:SkinButton(_G['StaticPopup'..i..'Button1']) end
			if _G['StaticPopup'..i..'Button2'] then AS:SkinButton(_G['StaticPopup'..i..'Button2']) end
			if _G['StaticPopup'..i..'CloseButton'] then AS:SkinCloseButton(_G['StaticPopup'..i..'CloseButton']) end
		end
	end

	if event == 'AUCTION_HOUSE_SHOW' then
		if ElvUI[1].private.skins.blizzard.enable == true and ElvUI[1].private.skins.blizzard.auctionhouse == true then
			AuctionsCancelAuctionButton:Point("RIGHT", AuctionFrameMoneyFrame, "RIGHT", 554, 0)
			AuctionsCloseButton:ClearAllPoints()
			AuctionsCloseButton:Point("RIGHT", AuctionsCancelAuctionButton, "RIGHT", 86, 0)
			BidBuyoutButton:Point("RIGHT", BidCloseButton, "LEFT", -4, 0)
			BidBidButton:Point("RIGHT", BidBuyoutButton, "LEFT", -4, 0)
			BrowseName:Point("TOPLEFT", AuctionFrameBrowse, "TOPLEFT", 22, -56)
			BrowseMinLevel:ClearAllPoints()
			BrowseMinLevel:Point("RIGHT", BrowseName, "RIGHT", 42, 0)
			BrowseMaxLevel:ClearAllPoints()
			BrowseMaxLevel:Point("RIGHT", BrowseMinLevel, "RIGHT", 36, 0)
			BrowseDropDown:ClearAllPoints()
			BrowseDropDown:Point("RIGHT", BrowseMaxLevel, "RIGHT", 150, -3)
			BrowseResetButton:ClearAllPoints()
			BrowseResetButton:Point("LEFT", BrowseName, "LEFT", -2, -26)
			BrowseSearchButton:ClearAllPoints()
			BrowseSearchButton:Point("RIGHT", BrowseResetButton, "RIGHT", 83, 0)
			BrowseNameText:Point("TOPLEFT", 20, -41)
			BrowseLevelText:Point("TOPLEFT", 184, -45)
			BrowseLevelHyphen:Point("LEFT", BrowseMinLevel, "RIGHT", 4, 0)
			AuctionFrameMoneyFrame:ClearAllPoints()
			AuctionFrameMoneyFrame:Point("TOPLEFT", AuctionFrame, "BOTTOMLEFT", 55, 24)	
			BrowseBidPrice:ClearAllPoints()
			BrowseBidPrice:Point("RIGHT", AuctionFrameMoneyFrame, "RIGHT", 340, 0)
			BrowseCloseButton:ClearAllPoints()
			BrowseCloseButton:Point("RIGHT", AuctionFrameMoneyFrame, "RIGHT", 640, 0)
			BrowseBuyoutButton:Point("RIGHT", BrowseCloseButton, "LEFT", -4, 0)
			BrowseBidButton:Point("RIGHT", BrowseBuyoutButton, "LEFT", -4, 0)
			BidBidPrice:ClearAllPoints()
			BidBidPrice:Point("RIGHT", AuctionFrameMoneyFrame, "RIGHT", 340, 0)
			BidCloseButton:ClearAllPoints()
			BidCloseButton:Point("RIGHT", AuctionFrameMoneyFrame, "RIGHT", 640, 0)
			BidBuyoutButton:Point("RIGHT", BrowseCloseButton, "LEFT", -4, 0)
			BidBidButton:Point("RIGHT", BrowseBuyoutButton, "LEFT", -4, 0)
			AuctionsQualitySort:Point("TOPLEFT", AuctionFrameAuctions, "TOPLEFT", 219, -48)
			BidQualitySort:Point("TOPLEFT", AuctionFrameBid, "TOPLEFT", 65, -50)
			AuctionFrameTab1:ClearAllPoints()
			AuctionFrameTab1:Point("TOPLEFT", AuctionFrame, "BOTTOMLEFT", -5, 2)
			BrowseNextPageButton:Size(20, 20)
			BrowsePrevPageButton:Size(20, 20)
			for i = 1, AuctionFrame.numTabs do
				AS:SkinTab(_G["AuctionFrameTab"..i])
			end
		end
		AS:UnregisterEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.MiscFixes, 'ADDON_LOADED', 'AUCTION_HOUSE_SHOW')