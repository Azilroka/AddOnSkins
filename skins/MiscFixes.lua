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
			BrowseSearchButton:Point('LEFT', BrowseResetButton, 'RIGHT', 3, 0)
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