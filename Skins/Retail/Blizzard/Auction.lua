if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local pairs, select, unpack = pairs, select, unpack
--WoW API / Variables
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
-- GLOBALS:

function AS:Blizzard_AuctionUI(event, addon)
	if addon ~= "Blizzard_AuctionUI" then return end

	AS:SkinBackdropFrame(_G.AuctionFrame, nil, nil, true)
	AS:CreateShadow(_G.AuctionFrame.Backdrop)
	_G.AuctionFrame.Backdrop:SetPoint('TOPLEFT', 0, -10)
	_G.AuctionFrame.Backdrop:SetPoint('BOTTOMRIGHT', 0, 10)

	AS:SkinCloseButton(_G.AuctionFrameCloseButton)

	local Buttons = {
		_G.BrowseSearchButton,
		_G.BrowseResetButton,
		_G.BrowseBidButton,
		_G.BrowseBuyoutButton,
		_G.BrowseCloseButton,
		_G.BidBidButton,
		_G.BidBuyoutButton,
		_G.BidCloseButton,
		_G.AuctionsCreateAuctionButton,
		_G.AuctionsCancelAuctionButton,
		_G.AuctionsCloseButton,
		_G.AuctionsStackSizeMaxButton,
		_G.AuctionsNumStacksMaxButton,
	}

	local CheckBoxes = {
		_G.ExactMatchCheckButton,
		_G.IsUsableCheckButton,
		_G.ShowOnPlayerCheckButton,
	}

	local EditBoxes = {
		_G.BrowseName,
		_G.BrowseMinLevel,
		_G.BrowseMaxLevel,
		_G.BrowseBidPriceGold,
		_G.BrowseBidPriceSilver,
		_G.BrowseBidPriceCopper,
		_G.BidBidPriceGold,
		_G.BidBidPriceSilver,
		_G.BidBidPriceCopper,
		_G.AuctionsStackSizeEntry,
		_G.AuctionsNumStacksEntry,
		_G.StartPriceGold,
		_G.StartPriceSilver,
		_G.StartPriceCopper,
		_G.BuyoutPriceGold,
		_G.BuyoutPriceSilver,
		_G.BuyoutPriceCopper,
	}

	local SortTabs = {
		_G.BrowseQualitySort,
		_G.BrowseLevelSort,
		_G.BrowseDurationSort,
		_G.BrowseHighBidderSort,
		_G.BrowseCurrentBidSort,
		_G.BidQualitySort,
		_G.BidLevelSort,
		_G.BidDurationSort,
		_G.BidBuyoutSort,
		_G.BidStatusSort,
		_G.BidBidSort,
		_G.AuctionsQualitySort,
		_G.AuctionsDurationSort,
		_G.AuctionsHighBidderSort,
		_G.AuctionsBidSort,
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

	for i = 1, _G.AuctionFrame.numTabs do
		AS:SkinTab(_G["AuctionFrameTab"..i])
	end

	for _, Tab in pairs(SortTabs) do
		AS:SkinButton(Tab)
		Tab:SetNormalTexture([[Interface\Buttons\UI-SortArrow]])
	end

	for _, Filter in pairs(_G.AuctionFrameBrowse.FilterButtons) do
		AS:SetTemplate(Filter)
		AS:StyleButton(Filter)

		Filter = Filter:GetName()
		_G[Filter..'Lines']:SetAlpha(0)
		_G[Filter..'Lines'].SetAlpha = AS.Noop
		_G[Filter..'NormalTexture']:SetAlpha(0)
		_G[Filter..'NormalTexture'].SetAlpha = AS.Noop
	end

	AS:StripTextures(_G.AuctionsScrollFrame)

	AS:StripTextures(_G.BrowseFilterScrollFrame)
	_G.BrowseFilterScrollFrame:SetHeight(300)

	AS:StripTextures(_G.BrowseScrollFrame)
	_G.BrowseScrollFrame:SetHeight(300)

	AS:SkinScrollBar(_G.BrowseFilterScrollFrameScrollBar)
	AS:SkinScrollBar(_G.BrowseScrollFrameScrollBar)

	AS:SkinArrowButton(_G.BrowseNextPageButton)
	AS:SkinArrowButton(_G.BrowsePrevPageButton)

	AS:SkinDropDownBox(_G.BrowseDropDown, 155)
	UIDropDownMenu_SetAnchor(_G.BrowseDropDown, 0, 0, 'TOPLEFT', _G.BrowseDropDown, 'TOPLEFT')
	_G.BrowseDropDown:SetPoint('TOPLEFT', _G.BrowseMaxLevel, 'TOPRIGHT', -6, 7)
	_G.BrowseDropDown.Text:SetPoint("RIGHT", _G.BrowseDropDownRight, "RIGHT", -43, -2)
	_G.BrowseDropDownName:SetPoint('BOTTOMLEFT', _G.BrowseDropDown, 'TOPLEFT', 20, -2)
	_G.BrowseLevelHyphen:SetPoint('LEFT', _G.BrowseMinLevel, 'RIGHT', 2, 1)

	for _, Frame in pairs({ _G.AuctionFrameBrowse, _G.AuctionFrameAuctions }) do
		Frame.LeftBackground = CreateFrame("Frame", nil, Frame)
		AS:SkinFrame(Frame.LeftBackground)
		Frame.LeftBackground:SetFrameLevel(Frame:GetFrameLevel())

		Frame.RightBackground = CreateFrame("Frame", nil, Frame)
		AS:SkinFrame(Frame.RightBackground)
		Frame.RightBackground:SetFrameLevel(Frame:GetFrameLevel())
	end

	_G.AuctionFrameAuctions.LeftBackground:SetPoint("TOPLEFT", 15, -70)
	_G.AuctionFrameAuctions.LeftBackground:SetPoint("BOTTOMRIGHT", -545, 35)

	_G.AuctionFrameAuctions.RightBackground:SetPoint("TOPLEFT", _G.AuctionFrameAuctions.LeftBackground, "TOPRIGHT", 3, 0)
	_G.AuctionFrameAuctions.RightBackground:SetPoint("BOTTOMRIGHT", _G.AuctionFrame, -8, 35)

	_G.AuctionFrameBrowse.LeftBackground:SetPoint("TOPLEFT", 20, -103)
	_G.AuctionFrameBrowse.LeftBackground:SetPoint("BOTTOMRIGHT", -575, 40)

	_G.AuctionFrameBrowse.RightBackground:SetPoint("TOPLEFT", _G.AuctionFrameBrowse.LeftBackground, "TOPRIGHT", 4, 0)
	_G.AuctionFrameBrowse.RightBackground:SetPoint("BOTTOMRIGHT", _G.AuctionFrame, "BOTTOMRIGHT", -8, 40)

	_G.AuctionFrameBid.Background = CreateFrame("Frame", nil, _G.AuctionFrameBid)
	AS:SkinFrame(_G.AuctionFrameBid.Background)
	_G.AuctionFrameBid.Background:SetPoint("TOPLEFT", 22, -72)
	_G.AuctionFrameBid.Background:SetPoint("BOTTOMRIGHT", 66, 39)
	_G.BidScrollFrame:SetHeight(332)

	_G.BrowsePrevPageButton:SetSize(20, 20)
	_G.BrowsePrevPageButton:SetPoint('TOPLEFT', "$parent", "TOPLEFT", 660, -60)
	_G.BrowseNextPageButton:SetSize(20, 20)
	_G.BrowseNextPageButton:SetPoint('TOPRIGHT', "$parent", "TOPRIGHT", 67, -60)
	_G.BrowseBuyoutButton:SetPoint("RIGHT", _G.BrowseCloseButton, "LEFT", -1, 0)
	_G.BrowseBidButton:SetPoint("RIGHT", _G.BrowseBuyoutButton, "LEFT", -1, 0)
	_G.BidBuyoutButton:SetPoint("RIGHT", _G.BidCloseButton, "LEFT", -1, 0)
	_G.BidBidButton:SetPoint("RIGHT", _G.BidBuyoutButton, "LEFT", -1, 0)

	_G.BrowseMaxLevel:SetPoint("LEFT", _G.BrowseMinLevel, "RIGHT", 8, 0)

	AS:SkinScrollBar(_G.BidScrollFrameScrollBar)

	AS:SkinScrollBar(_G.AuctionsScrollFrameScrollBar)
	AS:SkinDropDownBox(_G.PriceDropDown)
	AS:SkinDropDownBox(_G.DurationDropDown)

	_G.AuctionsCloseButton:SetPoint("BOTTOMRIGHT", _G.AuctionFrameAuctions, "BOTTOMRIGHT", 66, 12)
	_G.AuctionsCancelAuctionButton:SetPoint("RIGHT", _G.AuctionsCloseButton, "LEFT", -4, 0)

	AS:SkinFrame(_G.AuctionsItemButton)
	_G.AuctionsItemButton.IconBorder:SetAlpha(0)
	hooksecurefunc(_G.AuctionsItemButton, "SetNormalTexture", function(self, texture)
		if self:GetNormalTexture() then
			self:GetNormalTexture():SetInside()
			AS:SkinTexture(self:GetNormalTexture())
		end
	end)
	hooksecurefunc(_G.AuctionsItemButton.IconBorder, 'SetVertexColor', function(self, r, g, b)
		_G.AuctionsItemButton:SetBackdropBorderColor(r, g, b)
	end)
	hooksecurefunc(_G.AuctionsItemButton.IconBorder, 'Hide', function()
		_G.AuctionsItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
	end)
	AS:StyleButton(_G.AuctionsItemButton)

	AS:SkinFrame(_G.AuctionProgressFrame)
	AS:CreateShadow(_G.AuctionProgressFrame)
	AS:StyleButton(_G.AuctionProgressFrameCancelButton)
	AS:SetTemplate(_G.AuctionProgressFrameCancelButton, 'Default')
	_G.AuctionProgressFrameCancelButton:SetHitRectInsets(0, 0, 0, 0)
	_G.AuctionProgressFrameCancelButton:GetNormalTexture():SetInside()
	_G.AuctionProgressFrameCancelButton:GetNormalTexture():SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-LeaveItem-Transparent]])
	_G.AuctionProgressFrameCancelButton:SetSize(28, 28)
	_G.AuctionProgressFrameCancelButton:SetPoint("LEFT", _G.AuctionProgressBar, "RIGHT", 8, 0)

	AS:CreateBackdrop(_G.AuctionProgressFrame)
	_G.AuctionProgressFrame.Backdrop:SetOutside(_G.AuctionProgressBarIcon)
	_G.AuctionProgressFrame.Backdrop:SetFrameLevel(_G.AuctionProgressFrame:GetFrameLevel())

	_G.AuctionProgressBar.Icon:SetSize(36, 36)
	_G.AuctionProgressBar.Icon:SetPoint("RIGHT", "$parent", "LEFT", -10, 0)
	AS:SkinTexture(_G.AuctionProgressBar.Icon, true)

	_G.AuctionProgressBar.Text:ClearAllPoints()
	_G.AuctionProgressBar.Text:SetPoint("CENTER")

	AS:SkinStatusBar(_G.AuctionProgressBar)
	_G.AuctionProgressBar:SetHeight(24)

	for Frame, NumButtons in pairs({ ['Browse'] = _G.NUM_BROWSE_TO_DISPLAY, ['Auctions'] = _G.NUM_AUCTIONS_TO_DISPLAY, ['Bid'] = _G.NUM_BIDS_TO_DISPLAY }) do
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

	AS:SkinButton(_G.BrowseWowTokenResults.Buyout)
	AS:CreateBackdrop(_G.BrowseWowTokenResultsToken)
	AS:SkinTexture(_G.BrowseWowTokenResultsTokenIconTexture, true)
	_G.BrowseWowTokenResultsTokenIconTexture.Backdrop:SetBackdropBorderColor(_G.BrowseWowTokenResultsToken.IconBorder:GetVertexColor())
	_G.BrowseWowTokenResultsToken.IconBorder:SetTexture()
	_G.BrowseWowTokenResultsToken.ItemBorder:SetTexture()

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_BlackMarketUI(event, addon)
	if addon ~= "Blizzard_BlackMarketUI" then return end

	AS:SkinFrame(_G.BlackMarketFrame)
	AS:SkinCloseButton(_G.BlackMarketFrame.CloseButton)

	AS:SkinBackdropFrame(_G.BlackMarketScrollFrame)
	_G.BlackMarketScrollFrame.Backdrop:SetPoint('TOPLEFT', -3, 0)
	_G.BlackMarketScrollFrame.Backdrop:SetPoint('BOTTOMRIGHT', -2, 2)
	AS:SkinScrollBar(_G.BlackMarketScrollFrameScrollBar)

	AS:SkinFrame(_G.BlackMarketFrame.MoneyFrameBorder)
	_G.BlackMarketFrame.MoneyFrameBorder:SetPoint('BOTTOMLEFT', _G.BlackMarketFrame, 'BOTTOMLEFT', 29, 12)
	_G.BlackMarketMoneyFrame:SetPoint("BOTTOMRIGHT", _G.BlackMarketFrame.MoneyFrameBorder, "BOTTOMRIGHT", 8, 4)

	AS:SkinEditBox(_G.BlackMarketBidPriceGold)
	_G.BlackMarketBidPriceGold.Backdrop:SetAllPoints()
	_G.BlackMarketBidPriceGold:SetHeight(16)
	_G.BlackMarketBidPriceGold:SetPoint("BOTTOMRIGHT", _G.BlackMarketFrame.BidButton, "BOTTOMLEFT", -1, 0)

	AS:SkinButton(_G.BlackMarketFrame.BidButton)
	_G.BlackMarketFrame.BidButton:SetHeight(20)
	_G.BlackMarketFrame.BidButton:SetPoint("BOTTOMRIGHT", -285, 12)

	for i = 1, _G.BlackMarketFrame:GetNumRegions() do
		local region = select(i, _G.BlackMarketFrame:GetRegions())
		if region and region:IsObjectType("FontString") and region:GetText() == _G.BLACK_MARKET_TITLE then
			region:ClearAllPoints()
			region:SetPoint("TOP", _G.BlackMarketFrame, "TOP", 0, -4)
		end
	end

	AS:StripTextures(_G.BlackMarketFrame.HotDeal)
	AS:SetTemplate(_G.BlackMarketFrame.HotDeal.Item)
	AS:StyleButton(_G.BlackMarketFrame.HotDeal.Item)
	AS:SkinTexture(_G.BlackMarketFrame.HotDeal.Item.IconTexture)
	_G.BlackMarketFrame.HotDeal.Item.IconTexture:SetInside()
	_G.BlackMarketFrame.HotDeal.Item.IconBorder:SetAlpha(0)

	hooksecurefunc(_G.BlackMarketFrame.HotDeal.Item.IconBorder, 'SetVertexColor', function(self, r, g, b) _G.BlackMarketFrame.HotDeal.Item:SetBackdropBorderColor(r, g, b) end)
	hooksecurefunc(_G.BlackMarketFrame.HotDeal.Item.IconBorder, 'Hide', function() _G.BlackMarketFrame.HotDeal.Item:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

	for _, Tab in pairs({ 'ColumnName', 'ColumnLevel', 'ColumnType', 'ColumnDuration', 'ColumnHighBidder', 'ColumnCurrentBid' }) do
		AS:SkinButton(_G.BlackMarketFrame[Tab])
	end

	hooksecurefunc("BlackMarketScrollFrame_Update", function()
		for _, Button in pairs(_G.BlackMarketScrollFrame.buttons) do
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
