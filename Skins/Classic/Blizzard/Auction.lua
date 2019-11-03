if AddOnSkins.Retail then return end
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
	_G.BrowseNextPageButton:SetSize(20, 20)
	_G.BrowseBuyoutButton:SetPoint("RIGHT", _G.BrowseCloseButton, "LEFT", -1, 0)
	_G.BrowseBidButton:SetPoint("RIGHT", _G.BrowseBuyoutButton, "LEFT", -1, 0)
	_G.BidBuyoutButton:SetPoint("RIGHT", _G.BidCloseButton, "LEFT", -1, 0)
	_G.BidBidButton:SetPoint("RIGHT", _G.BidBuyoutButton, "LEFT", -1, 0)

	_G.BrowseMaxLevel:SetPoint("LEFT", _G.BrowseMinLevel, "RIGHT", 8, 0)

	AS:SkinScrollBar(_G.BidScrollFrameScrollBar)

	AS:SkinScrollBar(_G.AuctionsScrollFrameScrollBar)
	AS:SkinDropDownBox(_G.PriceDropDown)

	_G.AuctionsCloseButton:SetPoint("BOTTOMRIGHT", _G.AuctionFrameAuctions, "BOTTOMRIGHT", 66, 12)
	_G.AuctionsCancelAuctionButton:SetPoint("RIGHT", _G.AuctionsCloseButton, "LEFT", -4, 0)

	AS:SkinFrame(_G.AuctionsItemButton)
	_G.AuctionsItemButton.IconBorder:SetAlpha(0)
	hooksecurefunc(_G.AuctionsItemButton, "SetNormalTexture", function(self, texture)
		if self:GetNormalTexture() then
			AS:SetInside(self:GetNormalTexture())
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
	AS:SetInside(_G.AuctionProgressFrameCancelButton:GetNormalTexture())
	_G.AuctionProgressFrameCancelButton:GetNormalTexture():SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-LeaveItem-Transparent]])
	_G.AuctionProgressFrameCancelButton:SetSize(28, 28)
	_G.AuctionProgressFrameCancelButton:SetPoint("LEFT", _G.AuctionProgressBar, "RIGHT", 8, 0)

	AS:CreateBackdrop(_G.AuctionProgressFrame)
	AS:SetOutside(_G.AuctionProgressFrame.Backdrop, _G.AuctionProgressBarIcon)
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
			local ItemCount = _G[Frame..'Button'..i..'ItemCount']
			local Texture = _G[Frame..'Button'..i..'ItemIconTexture']
			local Name = _G[Frame..'Button'..i..'Name']

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
			AS:SetInside(Texture)

			ItemCount:SetDrawLayer("OVERLAY")
			hooksecurefunc(Name, 'SetVertexColor', function(self, r, g, b)
				if not (r == g) then
					ItemButton:SetBackdropBorderColor(r, g, b)
				else
					ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)

			hooksecurefunc(Name, 'Hide', function() ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
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

AS:RegisterSkin('Blizzard_AuctionUI', AS.Blizzard_AuctionUI, 'ADDON_LOADED')
