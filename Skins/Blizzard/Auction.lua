local AS = unpack(AddOnSkins)

function AS:Blizzard_AuctionUI(event, addon)
	if addon ~= "Blizzard_AuctionUI" then return end

	AS:SkinBackdropFrame(AuctionFrame, nil, nil, true)
	AS:CreateShadow(AuctionFrame.Backdrop)
	AuctionFrame.Backdrop:SetPoint('TOPLEFT', 0, -10)
	AuctionFrame.Backdrop:SetPoint('BOTTOMRIGHT', 0, 10)

	AS:SkinCloseButton(AuctionFrameCloseButton)

	for i = 1, AuctionFrame.numTabs do
		AS:SkinTab(_G["AuctionFrameTab"..i])
	end

	local Buttons = {
		BrowseSearchButton,
		BrowseResetButton,
		BrowseBidButton,
		BrowseBuyoutButton,
		BrowseCloseButton,
		BidBidButton,
		BidBuyoutButton,
		BidCloseButton,
		AuctionsCreateAuctionButton,
		AuctionsCancelAuctionButton,
		AuctionsCloseButton,
		AuctionsStackSizeMaxButton,
		AuctionsNumStacksMaxButton,
	}

	local CheckBoxes = {
		ExactMatchCheckButton,
		IsUsableCheckButton,
		ShowOnPlayerCheckButton,
	}

	local EditBoxes = {
		BrowseName,
		BrowseMinLevel,
		BrowseMaxLevel,
		BrowseBidPriceGold,
		BrowseBidPriceSilver,
		BrowseBidPriceCopper,
		BidBidPriceGold,
		BidBidPriceSilver,
		BidBidPriceCopper,
		AuctionsStackSizeEntry,
		AuctionsNumStacksEntry,
		StartPriceGold,
		StartPriceSilver,
		StartPriceCopper,
		BuyoutPriceGold,
		BuyoutPriceSilver,
		BuyoutPriceCopper,
	}

	local SortTabs = {
		BrowseQualitySort,
		BrowseLevelSort,
		BrowseDurationSort,
		BrowseHighBidderSort,
		BrowseCurrentBidSort,
		BidQualitySort,
		BidLevelSort,
		BidDurationSort,
		BidBuyoutSort,
		BidStatusSort,
		BidBidSort,
		AuctionsQualitySort,
		AuctionsDurationSort,
		AuctionsHighBidderSort,
		AuctionsBidSort,
	}

	for _, Button in pairs(Buttons) do
		AS:SkinButton(Button, true)
	end

	for _, CheckBox in pairs(CheckBoxes) do
		AS:SkinCheckBox(CheckBox)
	end

	for _, EditBox in pairs(EditBoxes) do
		AS:SkinEditBox(EditBox)
	end

	for _, Tab in pairs(SortTabs) do
		AS:SkinButton(Tab)
		Tab:SetNormalTexture([[Interface\Buttons\UI-SortArrow]])
	end

	for _, Filter in pairs(AuctionFrameBrowse.FilterButtons) do
		AS:SetTemplate(Filter)
		AS:StyleButton(Filter)

		Filter = Filter:GetName()
		_G[Filter..'Lines']:SetAlpha(0)
		_G[Filter..'Lines'].SetAlpha = AS.Noop
		_G[Filter..'NormalTexture']:SetAlpha(0)
		_G[Filter..'NormalTexture'].SetAlpha = AS.Noop
	end

	AS:StripTextures(AuctionsScrollFrame)

	AS:StripTextures(BrowseFilterScrollFrame)
	BrowseFilterScrollFrame:SetHeight(300)

	AS:StripTextures(BrowseScrollFrame)
	BrowseScrollFrame:SetHeight(300)

	AS:SkinScrollBar(BrowseFilterScrollFrameScrollBar)
	AS:SkinScrollBar(BrowseScrollFrameScrollBar)

	AS:SkinArrowButton(BrowseNextPageButton)
	AS:SkinArrowButton(BrowsePrevPageButton)

	AS:SkinDropDownBox(BrowseDropDown, 155)
	BrowseDropDown:SetPoint('TOPLEFT', BrowseMaxLevel, 'TOPRIGHT', -6, 7)
	BrowseDropDown.Text:SetPoint("RIGHT", BrowseDropDownRight, "RIGHT", -43, -2)
	BrowseDropDownName:SetPoint('BOTTOMLEFT', BrowseDropDown, 'TOPLEFT', 20, -2)
	BrowseLevelHyphen:SetPoint('LEFT', BrowseMinLevel, 'RIGHT', 2, 1)

	for _, Frame in pairs({ AuctionFrameBrowse, AuctionFrameAuctions }) do
		Frame.LeftBackground = CreateFrame("Frame", nil, Frame)
		AS:SkinFrame(Frame.LeftBackground)
		Frame.LeftBackground:SetFrameLevel(Frame:GetFrameLevel())

		Frame.RightBackground = CreateFrame("Frame", nil, Frame)
		AS:SkinFrame(Frame.RightBackground)
		Frame.RightBackground:SetFrameLevel(Frame:GetFrameLevel())
	end

	AuctionFrameAuctions.LeftBackground:SetPoint("TOPLEFT", 15, -70)
	AuctionFrameAuctions.LeftBackground:SetPoint("BOTTOMRIGHT", -545, 35)

	AuctionFrameAuctions.RightBackground:SetPoint("TOPLEFT", AuctionFrameAuctions.LeftBackground, "TOPRIGHT", 3, 0)
	AuctionFrameAuctions.RightBackground:SetPoint("BOTTOMRIGHT", AuctionFrame, -8, 35)

	AuctionFrameBrowse.LeftBackground:SetPoint("TOPLEFT", 20, -103)
	AuctionFrameBrowse.LeftBackground:SetPoint("BOTTOMRIGHT", -575, 40)

	AuctionFrameBrowse.RightBackground:SetPoint("TOPLEFT", AuctionFrameBrowse.LeftBackground, "TOPRIGHT", 4, 0)
	AuctionFrameBrowse.RightBackground:SetPoint("BOTTOMRIGHT", AuctionFrame, "BOTTOMRIGHT", -8, 40)

	AuctionFrameBid.Background = CreateFrame("Frame", nil, AuctionFrameBid)
	AS:SkinFrame(AuctionFrameBid.Background)
	AuctionFrameBid.Background:SetPoint("TOPLEFT", 22, -72)
	AuctionFrameBid.Background:SetPoint("BOTTOMRIGHT", 66, 39)
	BidScrollFrame:SetHeight(332)

	BrowsePrevPageButton:SetSize(20, 20)
	BrowsePrevPageButton:SetPoint('TOPLEFT', "$parent", "TOPLEFT", 660, -60)
	BrowseNextPageButton:SetSize(20, 20)
	BrowseNextPageButton:SetPoint('TOPRIGHT', "$parent", "TOPRIGHT", 67, -60)
	BrowseBuyoutButton:SetPoint("RIGHT", BrowseCloseButton, "LEFT", -1, 0)
	BrowseBidButton:SetPoint("RIGHT", BrowseBuyoutButton, "LEFT", -1, 0)
	BidBuyoutButton:SetPoint("RIGHT", BidCloseButton, "LEFT", -1, 0)
	BidBidButton:SetPoint("RIGHT", BidBuyoutButton, "LEFT", -1, 0)

	BrowseMaxLevel:SetPoint("LEFT", BrowseMinLevel, "RIGHT", 8, 0)

	AS:SkinScrollBar(BidScrollFrameScrollBar)

	AS:SkinScrollBar(AuctionsScrollFrameScrollBar)
	AS:SkinDropDownBox(PriceDropDown)
	AS:SkinDropDownBox(DurationDropDown)

	AuctionsCloseButton:SetPoint("BOTTOMRIGHT", AuctionFrameAuctions, "BOTTOMRIGHT", 66, 12)
	AuctionsCancelAuctionButton:SetPoint("RIGHT", AuctionsCloseButton, "LEFT", -4, 0)

	AS:SkinFrame(AuctionsItemButton)
	AuctionsItemButton.IconBorder:SetAlpha(0)
	hooksecurefunc(AuctionsItemButton, "SetNormalTexture", function(self, texture)
		if self:GetNormalTexture() then
			self:GetNormalTexture():SetInside()
			AS:SkinTexture(self:GetNormalTexture())
		end
	end)
	hooksecurefunc(AuctionsItemButton.IconBorder, 'SetVertexColor', function(self, r, g, b)
		AuctionsItemButton:SetBackdropBorderColor(r, g, b)
	end)
	hooksecurefunc(AuctionsItemButton.IconBorder, 'Hide', function()
		AuctionsItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
	end)
	AS:StyleButton(AuctionsItemButton)

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

	AuctionProgressBar.Icon:SetSize(36, 36)
	AuctionProgressBar.Icon:SetPoint("RIGHT", "$parent", "LEFT", -10, 0)
	AS:SkinTexture(AuctionProgressBar.Icon, true)

	AuctionProgressBar.Text:ClearAllPoints()
	AuctionProgressBar.Text:SetPoint("CENTER")

	AS:SkinStatusBar(AuctionProgressBar, true)
	AuctionProgressBar:SetHeight(24)

	for Frame, NumButtons in pairs({ ['Browse'] = NUM_BROWSE_TO_DISPLAY, ['Auctions'] = NUM_AUCTIONS_TO_DISPLAY, ['Bid'] = NUM_BIDS_TO_DISPLAY }) do
		for i = 1, NumButtons do
			local Button = _G[Frame..'Button'..i]
			local ItemButton = _G[Frame..'Button'..i..'Item']
			local Texture = _G[Frame..'Button'..i..'ItemIconTexture']

			AS:SkinFrame(ItemButton, nil, true)
			ItemButton.IconBorder:SetAlpha(0)

			AS:StripTextures(Button)
			AS:StyleButton(Button)

			ItemButton:GetNormalTexture():SetTexture('')
			Button:GetHighlightTexture():SetPoint("TOPLEFT", ItemButton, "TOPRIGHT", 2, 0)
			Button:GetHighlightTexture():SetPoint("BOTTOMRIGHT", Button, "BOTTOMRIGHT", -2, 5)
			Button:GetPushedTexture():SetAllPoints(Button:GetHighlightTexture())

			AS:StyleButton(ItemButton)

			AS:SkinTexture(Texture)
			Texture:SetInside()

			hooksecurefunc(ItemButton.IconBorder, 'SetVertexColor', function(self, r, g, b) ItemButton:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(ItemButton.IconBorder, 'Hide', function() ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end
	end

	AS:SkinButton(BrowseWowTokenResults.Buyout)
	AS:CreateBackdrop(BrowseWowTokenResultsToken)
	AS:SkinTexture(BrowseWowTokenResultsTokenIconTexture, true)
	BrowseWowTokenResultsTokenIconTexture.Backdrop:SetBackdropBorderColor(BrowseWowTokenResultsToken.IconBorder:GetVertexColor())
	BrowseWowTokenResultsToken.IconBorder:SetTexture(nil)
	BrowseWowTokenResultsToken.ItemBorder:SetTexture(nil)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_BlackMarketUI(event, addon)
	if addon ~= "Blizzard_BlackMarketUI" then return end

	AS:SkinFrame(BlackMarketFrame)
	AS:SkinCloseButton(BlackMarketFrame.CloseButton)

	AS:SkinBackdropFrame(BlackMarketScrollFrame)
	BlackMarketScrollFrame.Backdrop:SetPoint('TOPLEFT', -3, 0)
	BlackMarketScrollFrame.Backdrop:SetPoint('BOTTOMRIGHT', -2, 2)
	AS:SkinScrollBar(BlackMarketScrollFrameScrollBar)

	AS:SkinFrame(BlackMarketFrame.MoneyFrameBorder)
	BlackMarketFrame.MoneyFrameBorder:SetPoint('BOTTOMLEFT', BlackMarketFrame, 'BOTTOMLEFT', 29, 12)
	BlackMarketMoneyFrame:SetPoint("BOTTOMRIGHT", BlackMarketFrame.MoneyFrameBorder, "BOTTOMRIGHT", 8, 4)

	AS:SkinEditBox(BlackMarketBidPriceGold)
	BlackMarketBidPriceGold.Backdrop:SetAllPoints()
	BlackMarketBidPriceGold:SetHeight(16)
	BlackMarketBidPriceGold:SetPoint("BOTTOMRIGHT", BlackMarketFrame.BidButton, "BOTTOMLEFT", -1, 0)

	AS:SkinButton(BlackMarketFrame.BidButton)
	BlackMarketFrame.BidButton:SetHeight(20)
	BlackMarketFrame.BidButton:SetPoint("BOTTOMRIGHT", -285, 12)

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
	BlackMarketFrame.HotDeal.Item.IconBorder:SetAlpha(0)

	hooksecurefunc(BlackMarketFrame.HotDeal.Item.IconBorder, 'SetVertexColor', function(self, r, g, b) BlackMarketFrame.HotDeal.Item:SetBackdropBorderColor(r, g, b) end)
	hooksecurefunc(BlackMarketFrame.HotDeal.Item.IconBorder, 'Hide', function() BlackMarketFrame.HotDeal.Item:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

	for _, Tab in pairs({ 'ColumnName', 'ColumnLevel', 'ColumnType', 'ColumnDuration', 'ColumnHighBidder', 'ColumnCurrentBid' }) do
		AS:SkinButton(BlackMarketFrame[Tab])
	end

	hooksecurefunc("BlackMarketScrollFrame_Update", function()
		for _, Button in pairs(BlackMarketScrollFrame.buttons) do
			if not Button.skinned then
				AS:StripTextures(Button)
				AS:StyleButton(Button)
				Button:GetHighlightTexture():SetAllPoints(Button.Selection)
				Button:GetPushedTexture():SetAllPoints(Button.Selection)
				Button.Selection:SetColorTexture(1, 1, 1, .3)
				AS:SkinFrame(Button.Item)
				AS:StyleButton(Button.Item)

				AS:SkinTexture(Button.Item.IconTexture)

				Button.Item.IconTexture:SetInside()
				Button.Item.IconBorder:SetAlpha(0)
				hooksecurefunc(Button.Item.IconBorder, 'SetVertexColor', function(self, r, g, b) Button.Item:SetBackdropBorderColor(r, g, b) end)
				hooksecurefunc(Button.Item.IconBorder, 'Hide', function() Button.Item:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

				Button.skinned = true
			end
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_AuctionUI', AS.Blizzard_AuctionUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_BlackMarketUI', AS.Blizzard_BlackMarketUI, 'ADDON_LOADED')