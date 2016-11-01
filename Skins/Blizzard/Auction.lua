local AS = unpack(AddOnSkins)

function AS:Blizzard_AuctionHouse(event, addon)
	if addon ~= "Blizzard_AuctionUI" then return end

	AS:SkinFrame(AuctionFrame, nil, nil, true)
	AS:SkinCloseButton(AuctionFrameCloseButton)
	AuctionFrameCloseButton:SetPoint('TOPRIGHT', '$parent', 'TOPRIGHT', 2, 2)
	AS:CreateShadow(AuctionFrame)

	AS:SkinCheckBox(ExactMatchCheckButton)
	AS:SkinCheckBox(IsUsableCheckButton)
	AS:SkinCheckBox(ShowOnPlayerCheckButton)
	AS:SkinButton(BrowseSearchButton, true)
	AS:SkinButton(BrowseResetButton, true)
	AS:SkinButton(BrowseBidButton, true)
	AS:SkinButton(BrowseBuyoutButton, true)
	AS:SkinButton(BrowseCloseButton, true)
	AS:StripTextures(BrowseFilterScrollFrame)
	AS:StripTextures(BrowseScrollFrame)
	AS:SkinScrollBar(BrowseFilterScrollFrameScrollBar)
	AS:SkinScrollBar(BrowseScrollFrameScrollBar)
	AS:SkinNextPrevButton(BrowseNextPageButton)
	AS:SkinNextPrevButton(BrowsePrevPageButton)
	AS:SkinDropDownBox(BrowseDropDown)
	BrowsePrevPageButton:SetSize(20, 20)
	BrowsePrevPageButton:SetPoint('TOPLEFT', "$parent", "TOPLEFT", 660, -60)
	BrowseNextPageButton:SetSize(20, 20)
	BrowseNextPageButton:SetPoint('TOPRIGHT', "$parent", "TOPRIGHT", 67, -60)
	BrowseBuyoutButton:SetPoint("RIGHT", BrowseCloseButton, "LEFT", -4, 0)
	BrowseBidButton:SetPoint("RIGHT", BrowseBuyoutButton, "LEFT", -4, 0)		
	AS:SkinEditBox(BrowseName)
	AS:SkinEditBox(BrowseMinLevel)
	AS:SkinEditBox(BrowseMaxLevel)
	AS:SkinEditBox(BrowseBidPriceGold)
	AS:SkinEditBox(BrowseBidPriceSilver)
	AS:SkinEditBox(BrowseBidPriceCopper)

	BrowseMaxLevel:SetPoint("LEFT", BrowseMinLevel, "RIGHT", 8, 0)

	AuctionFrameBrowse.LeftBackground = CreateFrame("Frame", nil, AuctionFrameBrowse)
	AS:SkinFrame(AuctionFrameBrowse.LeftBackground)
	AuctionFrameBrowse.LeftBackground:SetFrameLevel(AuctionFrameBrowse:GetFrameLevel())
	AuctionFrameBrowse.LeftBackground:SetPoint("TOPLEFT", 20, -103)
	AuctionFrameBrowse.LeftBackground:SetPoint("BOTTOMRIGHT", -575, 40)
	BrowseFilterScrollFrame:SetHeight(300)

	AuctionFrameBrowse.RightBackground = CreateFrame("Frame", nil, AuctionFrameBrowse)
	AS:SkinFrame(AuctionFrameBrowse.RightBackground)
	AuctionFrameBrowse.RightBackground:SetFrameLevel(AuctionFrameBrowse:GetFrameLevel())
	AuctionFrameBrowse.RightBackground:SetPoint("TOPLEFT", AuctionFrameBrowse.LeftBackground, "TOPRIGHT", 4, 0)
	AuctionFrameBrowse.RightBackground:SetPoint("BOTTOMRIGHT", AuctionFrame, "BOTTOMRIGHT", -8, 40)
	BrowseScrollFrame:SetHeight(300)

	AS:SkinButton(BidBidButton, true)
	AS:SkinButton(BidBuyoutButton, true)
	AS:SkinButton(BidCloseButton, true)
	AS:SkinEditBox(BidBidPriceGold)
	AS:SkinEditBox(BidBidPriceSilver)
	AS:SkinEditBox(BidBidPriceCopper)
	AS:SkinScrollBar(BidScrollFrameScrollBar)
	BidBuyoutButton:SetPoint("RIGHT", BidCloseButton, "LEFT", -4, 0)
	BidBidButton:SetPoint("RIGHT", BidBuyoutButton, "LEFT", -4, 0)

	AuctionFrameBid.Background = CreateFrame("Frame", nil, AuctionFrameBid)
	AS:SkinFrame(AuctionFrameBid.Background)
	AuctionFrameBid.Background:SetPoint("TOPLEFT", 22, -72)
	AuctionFrameBid.Background:SetPoint("BOTTOMRIGHT", 66, 39)
	BidScrollFrame:SetHeight(332)

	AS:StripTextures(AuctionsScrollFrame)
	AS:SkinScrollBar(AuctionsScrollFrameScrollBar)
	AS:SkinDropDownBox(PriceDropDown)
	AS:SkinDropDownBox(DurationDropDown)
	AS:SkinButton(AuctionsCreateAuctionButton)
	AS:SkinButton(AuctionsCancelAuctionButton)
	AS:SkinButton(AuctionsCloseButton)
	AS:SkinButton(AuctionsStackSizeMaxButton)
	AS:SkinButton(AuctionsNumStacksMaxButton)
	AS:SkinEditBox(AuctionsStackSizeEntry)
	AS:SkinEditBox(AuctionsNumStacksEntry)
	AS:SkinEditBox(StartPriceGold)
	AS:SkinEditBox(StartPriceSilver)
	AS:SkinEditBox(StartPriceCopper)
	AS:SkinEditBox(BuyoutPriceGold)
	AS:SkinEditBox(BuyoutPriceSilver)
	AS:SkinEditBox(BuyoutPriceCopper)
	AuctionsCloseButton:SetPoint("BOTTOMRIGHT", AuctionFrameAuctions, "BOTTOMRIGHT", 66, 10)
	AuctionsCancelAuctionButton:SetPoint("RIGHT", AuctionsCloseButton, "LEFT", -4, 0)

	AS:SkinFrame(AuctionsItemButton)
	AS:StyleButton(AuctionsItemButton)

	AuctionsItemButton:HookScript('OnEvent', function(self, event, ...)
		self:SetBackdropBorderColor(unpack(AS.BorderColor))
		if event == 'NEW_AUCTION_UPDATE' and self:GetNormalTexture() then
			local Quality = select(4, GetAuctionSellItemInfo())
			AS:SkinTexture(self:GetNormalTexture())
			self:GetNormalTexture():SetInside()
			if Quality and Quality > 1 and BAG_ITEM_QUALITY_COLORS[Quality] then
				self:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
			end
		end
	end)

	AuctionFrameAuctions.LeftBackground = CreateFrame("Frame", nil, AuctionFrameAuctions)
	AS:SkinFrame(AuctionFrameAuctions.LeftBackground)
	AuctionFrameAuctions.LeftBackground:SetPoint("TOPLEFT", 15, -70)
	AuctionFrameAuctions.LeftBackground:SetPoint("BOTTOMRIGHT", -545, 35)
	AuctionFrameAuctions.LeftBackground:SetFrameLevel(AuctionFrameAuctions:GetFrameLevel())

	AuctionFrameAuctions.RightBackground = CreateFrame("Frame", nil, AuctionFrameAuctions)
	AS:SkinFrame(AuctionFrameAuctions.RightBackground)
	AuctionFrameAuctions.RightBackground:SetPoint("TOPLEFT", AuctionFrameAuctions.LeftBackground, "TOPRIGHT", 3, 0)
	AuctionFrameAuctions.RightBackground:SetPoint("BOTTOMRIGHT", AuctionFrame, -8, 35)
	AuctionFrameAuctions.RightBackground:SetFrameLevel(AuctionFrameAuctions:GetFrameLevel())
	AuctionsScrollFrame:SetHeight(336)

	AS:SkinFrame(SideDressUpFrame, nil, nil, true)
	AuctionFrame:HookScript('OnShow', function(self)
		SideDressUpFrame:SetPoint("TOPLEFT", self, "TOPRIGHT", 2, -28)
	end)
	AS:SkinButton(SideDressUpModelResetButton)
	AS:SkinCloseButton(SideDressUpModelCloseButton)

	AS:SkinFrame(AuctionProgressFrame)
	AS:CreateShadow(AuctionProgressFrame)
	AS:StyleButton(AuctionProgressFrameCancelButton)
	AS:SetTemplate(AuctionProgressFrameCancelButton, 'Default')
	AuctionProgressFrameCancelButton:SetHitRectInsets(0, 0, 0, 0)
	AuctionProgressFrameCancelButton:GetNormalTexture():SetInside()
	AuctionProgressFrameCancelButton:GetNormalTexture():SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-LeaveItem-Transparent]])
	AuctionProgressFrameCancelButton:SetSize(28, 28)
	AuctionProgressFrameCancelButton:SetPoint("LEFT", AuctionProgressBar, "RIGHT", 8, 0)

	AS:CreateBackdrop(AuctionProgressFrame)
	AuctionProgressFrame.Backdrop:SetOutside(AuctionProgressBarIcon)
	AuctionProgressFrame.Backdrop:SetFrameLevel(AuctionProgressFrame:GetFrameLevel())
--[[
	AuctionProgressBarIcon:SetSize(24, 24)
	AuctionProgressBarIcon:SetPoint("RIGHT", "$parent", "LEFT", -10, 0)
	AS:SkinTexture(AuctionProgressBarIcon)

	AuctionProgressBarText:ClearAllPoints()
	AuctionProgressBarText:SetPoint("CENTER")
]]
	AS:SkinStatusBar(AuctionProgressBar, true)
	AuctionProgressBar:SetHeight(24)

	local SortTabs = {
		"BrowseQualitySort",
		"BrowseLevelSort",
		"BrowseDurationSort",
		"BrowseHighBidderSort",
		"BrowseCurrentBidSort",
		"BidQualitySort",
		"BidLevelSort",
		"BidDurationSort",
		"BidBuyoutSort",
		"BidStatusSort",
		"BidBidSort",
		"AuctionsQualitySort",
		"AuctionsDurationSort",
		"AuctionsHighBidderSort",
		"AuctionsBidSort",
	}

	for _, Tab in pairs(SortTabs) do
		_G[Tab.."Left"]:Kill()
		_G[Tab.."Middle"]:Kill()
		_G[Tab.."Right"]:Kill()
	end

	AuctionFrameTab1:SetPoint("TOPLEFT", AuctionFrame, "BOTTOMLEFT", -5, 2)
	
	for i = 1, AuctionFrame.numTabs do
		AS:SkinTab(_G["AuctionFrameTab"..i])
	end

	for i = 1, NUM_FILTERS_TO_DISPLAY do
		local Tab = _G["AuctionFilterButton"..i]
		AS:StripTextures(Tab, true)
		AS:StyleButton(Tab)
		_G["AuctionFilterButton"..i..'NormalTexture']:SetAlpha(0)
		_G["AuctionFilterButton"..i..'NormalTexture'].SetAlpha = AS.Noop
	end

	AuctionsStackSizeEntry.Backdrop:SetAllPoints()
	AuctionsNumStacksEntry.Backdrop:SetAllPoints()

	for i = 1, NUM_BROWSE_TO_DISPLAY do
		local Button = _G["BrowseButton"..i]
		local Icon = _G["BrowseButton"..i.."Item"]

		AS:StyleButton(Icon)
		Icon:GetNormalTexture():SetTexture('')
		AS:SkinFrame(Icon, nil, true)

		AS:SkinTexture(_G["BrowseButton"..i.."ItemIconTexture"])
		_G["BrowseButton"..i.."ItemIconTexture"]:SetInside()
		Icon.IconBorder:SetAlpha(0)
		hooksecurefunc(Icon.IconBorder, 'SetVertexColor', function(self, r, g, b)
			Icon:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(Icon.IconBorder, 'Hide', function(self, r, g, b)
			Icon:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)

		AS:StripTextures(Button)
		AS:StyleButton(Button)
		_G["BrowseButton"..i.."Highlight"] = Button:GetHighlightTexture()
		Button:GetHighlightTexture():ClearAllPoints()
		Button:GetHighlightTexture():Point("TOPLEFT", Icon, "TOPRIGHT", 2, 0)
		Button:GetHighlightTexture():SetPoint("BOTTOMRIGHT", Button, "BOTTOMRIGHT", -2, 5)
		Button:GetPushedTexture():SetAllPoints(Button:GetHighlightTexture())
	end
	
	for i = 1, NUM_AUCTIONS_TO_DISPLAY do
		local Button = _G["AuctionsButton"..i]
		local Icon = _G["AuctionsButton"..i.."Item"]

		AS:SkinTexture(_G["AuctionsButton"..i.."ItemIconTexture"])
		_G["AuctionsButton"..i.."ItemIconTexture"]:SetInside()

		AS:StyleButton(Icon)
		Icon:GetNormalTexture():SetTexture('')
		Icon.IconBorder:SetAlpha(0)
		hooksecurefunc(Icon.IconBorder, 'SetVertexColor', function(self, r, g, b)
			Icon:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(Icon.IconBorder, 'Hide', function(self, r, g, b)
			Icon:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)

		AS:SkinFrame(Icon, nil, true)

		AS:StripTextures(Button)
		AS:StyleButton(Button)
		_G["AuctionsButton"..i.."Highlight"] = Button:GetHighlightTexture()
		Button:GetHighlightTexture():ClearAllPoints()
		Button:GetHighlightTexture():Point("TOPLEFT", Icon, "TOPRIGHT", 2, 0)
		Button:GetHighlightTexture():SetPoint("BOTTOMRIGHT", Button, "BOTTOMRIGHT", -2, 5)
		Button:GetPushedTexture():SetAllPoints(Button:GetHighlightTexture())
	end
	
	for i = 1, NUM_BIDS_TO_DISPLAY do
		local Button = _G["BidButton"..i]
		local Icon = _G["BidButton"..i.."Item"]

		AS:SkinTexture(_G["BidButton"..i.."ItemIconTexture"])
		_G["BidButton"..i.."ItemIconTexture"]:SetInside()

		AS:StyleButton(Icon)
		Icon:GetNormalTexture():SetTexture('')
		Icon.IconBorder:SetAlpha(0)
		hooksecurefunc(Icon.IconBorder, 'SetVertexColor', function(self, r, g, b)
			Icon:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(Icon.IconBorder, 'Hide', function(self, r, g, b)
			Icon:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)

		AS:SkinFrame(Icon, nil, true)

		AS:StripTextures(Button)
		AS:StyleButton(Button)
		_G["BidButton"..i.."Highlight"] = Button:GetHighlightTexture()
		Button:GetHighlightTexture():ClearAllPoints()
		Button:GetHighlightTexture():Point("TOPLEFT", Icon, "TOPRIGHT", 2, 0)
		Button:GetHighlightTexture():SetPoint("BOTTOMRIGHT", Button, "BOTTOMRIGHT", -2, 5)
		Button:GetPushedTexture():SetAllPoints(Button:GetHighlightTexture())
	end

	AS:SkinButton(BrowseWowTokenResults.Buyout)
	AS:CreateBackdrop(BrowseWowTokenResultsToken)
	AS:SkinTexture(BrowseWowTokenResultsTokenIconTexture)
	BrowseWowTokenResultsToken.Backdrop:SetOutside(BrowseWowTokenResultsTokenIconTexture)
	BrowseWowTokenResultsToken.Backdrop:SetBackdropBorderColor(BrowseWowTokenResultsToken.IconBorder:GetVertexColor())
	BrowseWowTokenResultsToken.Backdrop:SetFrameLevel(BrowseWowTokenResultsToken:GetFrameLevel())
	BrowseWowTokenResultsToken.IconBorder:SetTexture(nil)
	BrowseWowTokenResultsToken.ItemBorder:SetTexture(nil)
end

AS:RegisterSkin('Blizzard_AuctionHouse', AS.Blizzard_AuctionHouse, 'ADDON_LOADED')

function AS:Blizzard_BlackMarket(event, addon)
	if addon ~= "Blizzard_BlackMarketUI" then return end
	AS:SkinFrame(BlackMarketFrame)
	AS:StripTextures(BlackMarketFrame.Inset)
	AS:SkinScrollBar(BlackMarketScrollFrameScrollBar)
	AS:StripTextures(BlackMarketFrame.MoneyFrameBorder)
	BlackMarketMoneyFrame:SetPoint("BOTTOMRIGHT", BlackMarketFrame.MoneyFrameBorder, "BOTTOMRIGHT", 8, 12)
	AS:SkinEditBox(BlackMarketBidPriceGold)
	BlackMarketBidPriceGold.Backdrop:SetAllPoints()
	BlackMarketBidPriceGold:SetHeight(16)
	BlackMarketBidPriceGold:SetPoint("BOTTOMRIGHT", BlackMarketFrame.BidButton, "BOTTOMLEFT", -3, 0)

	AS:SkinButton(BlackMarketFrame.BidButton)
	BlackMarketFrame.BidButton:SetHeight(20)
	BlackMarketFrame.BidButton:SetPoint("BOTTOMRIGHT", -285, 12)

	AS:SkinCloseButton(BlackMarketFrame.CloseButton)
	AS:SkinBackdropFrame(BlackMarketScrollFrame)
	BlackMarketScrollFrame.Backdrop:SetPoint('TOPLEFT', -3, 0)
	BlackMarketScrollFrame.Backdrop:SetPoint('BOTTOMRIGHT', -2, 2)

	for i = 1, BlackMarketFrame:GetNumRegions() do
		local region = select(i, BlackMarketFrame:GetRegions())
		if region and region:IsObjectType("FontString") and region:GetText() == BLACK_MARKET_TITLE then
			region:ClearAllPoints()
			region:SetPoint("TOP", BlackMarketFrame, "TOP", 0, -4)
		end
	end

	AS:StripTextures(BlackMarketFrame.HotDeal)
	AS:SetTemplate(BlackMarketFrame.HotDeal.Item)
	AS:StyleButton(BlackMarketFrame.HotDeal.Item)
	AS:SkinTexture(BlackMarketFrame.HotDeal.Item.IconTexture)
	BlackMarketFrame.HotDeal.Item.IconTexture:SetInside()

	local Tabs = {
		"ColumnName",
		"ColumnLevel",
		"ColumnType",
		"ColumnDuration",
		"ColumnHighBidder",
		"ColumnCurrentBid"
	}

	for _, Tab in pairs(Tabs) do
		AS:SkinTab(BlackMarketFrame[Tab])
		BlackMarketFrame[Tab].Backdrop:SetPoint("TOPLEFT", BlackMarketFrame[Tab], 3, 0)
		BlackMarketFrame[Tab].Backdrop:SetPoint("BOTTOMRIGHT", BlackMarketFrame[Tab], -3, 0)	
	end

	hooksecurefunc("BlackMarketScrollFrame_Update", function()
		local buttons = BlackMarketScrollFrame.buttons
		local numButtons = #buttons
		local offset = HybridScrollFrame_GetOffset(BlackMarketScrollFrame)
		local numItems = C_BlackMarket.GetNumItems()

		local hotlink = select(15, C_BlackMarket.GetHotItem())
		BlackMarketFrame.HotDeal.Item:SetBackdropBorderColor(unpack(AS.BorderColor))
		if hotlink then
			local Quality = select(3, GetItemInfo(hotlink))
			if Quality and Quality > 1 and BAG_ITEM_QUALITY_COLORS[Quality] then
				BlackMarketFrame.HotDeal.Item:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
			end
		end

		for i = 1, numButtons do
			local button = buttons[i]
			local index = offset + i

			if not button.skinned then
				AS:StripTextures(button.Item)
				AS:SetTemplate(button.Item)
				button.Item.IconTexture:SetInside()
				AS:SkinTexture(button.Item.IconTexture)
				AS:StyleButton(button.Item)
				AS:StripTextures(button)
				button.skinned = true
			end

			if ( index <= numItems ) then
				local name, texture, _, _, _, _, _, _, _, _, _, _, _, _, link, _ = C_BlackMarket.GetItemInfoByIndex(index)
				if ( name ) then
					button.Item.IconTexture:SetTexture(texture)
				end
				button.Item:SetBackdropBorderColor(unpack(AS.BorderColor))
				if link then
					local Quality = select(3, GetItemInfo(link))
					if Quality and Quality > 1 and BAG_ITEM_QUALITY_COLORS[Quality] then
						button.Item:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
					end
				end
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_BlackMarket', AS.Blizzard_BlackMarket, 'ADDON_LOADED')
