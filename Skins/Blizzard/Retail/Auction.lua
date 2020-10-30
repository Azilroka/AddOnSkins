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

function AS:Blizzard_AuctionHouseUI(event, addon)
	if addon ~= "Blizzard_AuctionHouseUI" then return end

	local function HandleAuctionButtons(button)
		AS:SkinButton(button)
		button:SetSize(22, 22)
	end

	local function HandleHeaders(frame)
		local maxHeaders = frame.HeaderContainer:GetNumChildren()
		for i = 1, maxHeaders do
			local header = select(i, frame.HeaderContainer:GetChildren())
			if header and not header.IsSkinned then
				header:DisableDrawLayer("BACKGROUND")
				if not header.backdrop then
					AS:CreateBackdrop(header)
				end

				header.IsSkinned = true
			end

			if header.Backdrop then
				header.Backdrop:SetPoint("BOTTOMRIGHT", i < maxHeaders and -5 or 0, -2)
			end
		end
	end

	local function HandleSummaryIcons(frame)
		for i = 1, 23 do
			local child = select(i, frame.ScrollFrame.scrollChild:GetChildren())

			if child and child.Icon then
				if not child.IsSkinned then
					AS:SkinTexture(child.Icon)

					if child.IconBorder then
						child.IconBorder:SetAlpha(0)
					end

					child.IsSkinned = true
				end
			end
		end
	end

	local function SkinItemDisplay(frame)
		local ItemDisplay = frame.ItemDisplay
		AS:StripTextures(ItemDisplay)

		local ItemButton = ItemDisplay.ItemButton
		ItemButton.CircleMask:Hide()

		-- We skin the new IconBorder from the AH, it looks really cool tbh.
		ItemButton.Icon:SetTexCoord(.08, .92, .08, .92)
		ItemButton.Icon:SetSize(44, 44)
		ItemButton.IconBorder:SetTexCoord(.08, .92, .08, .92)
	end

	local function HandleSellFrame(frame)
		AS:StripTextures(frame)

		local ItemDisplay = frame.ItemDisplay
		AS:StripTextures(ItemDisplay)

		local ItemButton = ItemDisplay.ItemButton
		if ItemButton.IconMask then ItemButton.IconMask:Hide() end
		if ItemButton.IconBorder then ItemButton.IconBorder:SetAlpha(0) end

		ItemButton.EmptyBackground:Hide()
		ItemButton:SetPushedTexture("")
		ItemButton.Highlight:SetColorTexture(1, 1, 1, .25)
		ItemButton.Highlight:SetAllPoints(ItemButton.Icon)

		AS:SkinTexture(ItemButton.Icon, true)
		hooksecurefunc(ItemButton.IconBorder, "SetVertexColor", function(_, r, g, b) ItemButton.Icon.Backdrop:SetBackdropBorderColor(r, g, b) end)
		hooksecurefunc(ItemButton.IconBorder, "Hide", function() ItemButton.Icon.Backdrop:SetBackdropBorderColor(0, 0, 0) end)

		AS:SkinEditBox(frame.QuantityInput.InputBox)
		AS:SkinButton(frame.QuantityInput.MaxButton)
		AS:SkinEditBox(frame.PriceInput.MoneyInputFrame.GoldBox)
		AS:SkinEditBox(frame.PriceInput.MoneyInputFrame.SilverBox)

		if frame.SecondaryPriceInput then
			AS:SkinEditBox(frame.SecondaryPriceInput.MoneyInputFrame.GoldBox)
			AS:SkinEditBox(frame.SecondaryPriceInput.MoneyInputFrame.SilverBox)
		end

		AS:SkinDropDownBox(frame.DurationDropDown.DropDown)
		AS:SkinButton(frame.PostButton)

		if frame.BuyoutModeCheckButton then
			AS:SkinCheckBox(frame.BuyoutModeCheckButton)
			frame.BuyoutModeCheckButton:SetSize(20, 20)
		end
	end

	local function HandleTokenSellFrame(frame)
		frame:StripTextures()

		local ItemDisplay = frame.ItemDisplay
		ItemDisplay:StripTextures()
		ItemDisplay:CreateBackdrop("Transparent")

		local ItemButton = ItemDisplay.ItemButton
		if ItemButton.IconMask then ItemButton.IconMask:Hide() end
		if ItemButton.IconBorder then ItemButton.IconBorder:SetAlpha(0) end

		ItemButton.EmptyBackground:Hide()
		ItemButton:SetPushedTexture("")
		ItemButton.Highlight:SetColorTexture(1, 1, 1, .25)
		ItemButton.Highlight:SetAllPoints(ItemButton.Icon)

		AS:SkinTexture(ItemButton.Icon, true)
		hooksecurefunc(ItemButton.IconBorder, "SetVertexColor", function(_, r, g, b) ItemButton.Icon.Backdrop:SetBackdropBorderColor(r, g, b) end)
		hooksecurefunc(ItemButton.IconBorder, "Hide", function() ItemButton.Icon.Backdrop:SetBackdropBorderColor(0, 0, 0) end)

		AS:SkinButton(frame.PostButton)
		HandleAuctionButtons(frame.DummyRefreshButton)

		AS:SkinBackdropFrame(frame.DummyItemList)
		HandleAuctionButtons(frame.DummyRefreshButton)
		AS:SkinScrollBar(frame.DummyItemList.DummyScrollBar)
	end

	local function HandleSellList(frame, hasHeader)
		AS:StripTextures(frame)

		if frame.RefreshFrame then
			HandleAuctionButtons(frame.RefreshFrame.RefreshButton)
		end

		AS:SkinScrollBar(frame.ScrollFrame.scrollBar)

		if hasHeader then
			AS:CreateBackdrop(frame.ScrollFrame)
			hooksecurefunc(frame, "RefreshScrollFrame", HandleHeaders)
		else
			hooksecurefunc(frame, "RefreshListDisplay", HandleSummaryIcons)
		end
	end

	AS:SkinBackdropFrame(_G.AuctionHouseFrame, nil, nil, true)
	AS:CreateShadow(_G.AuctionHouseFrame.Backdrop)

	AS:SkinCloseButton(_G.AuctionHouseFrameCloseButton)

	for _, tab in ipairs(_G.AuctionHouseFrame.Tabs) do
		AS:SkinTab(tab)
	end

	AS:StripTextures(_G.AuctionHouseFrame.CategoriesList, true)
	AS:StripTextures(_G.AuctionHouseFrame.MoneyFrameBorder, true)
	AS:StripTextures(_G.AuctionHouseFrame.MoneyFrameInset, true)

	AS:SkinButton(_G.AuctionHouseFrame.SearchBar.SearchButton)
	AS:SkinEditBox(_G.AuctionHouseFrame.SearchBar.SearchBox)
	AS:SkinButton(_G.AuctionHouseFrame.SearchBar.FavoritesSearchButton)
	AS:SkinButton(_G.AuctionHouseFrame.SearchBar.FilterButton)
	_G.AuctionHouseFrame.SearchBar.FavoritesSearchButton:SetSize(22, 22)

	for _, Filter in ipairs(_G.AuctionHouseFrame.CategoriesList.FilterButtons) do
		AS:SkinBackdropFrame(Filter, nil, nil, true)

		Filter.Backdrop:SetAllPoints(Filter.SelectedTexture)

		Filter.HighlightTexture:SetAtlas(nil)
		Filter.HighlightTexture.SetAtlas = AS.Noop
		Filter.HighlightTexture:SetColorTexture(unpack(AS:CheckOption('HighlightColor')))
		Filter.HighlightTexture:SetAlpha(.4)
		Filter.HighlightTexture.Show = nil

		Filter.SelectedTexture:SetAtlas(nil)
		Filter.SelectedTexture.SetAtlas = AS.Noop
		Filter.SelectedTexture:SetColorTexture(unpack(AS:CheckOption('SelectedColor')))
		Filter.SelectedTexture:SetAlpha(.4)
	end

	AS:StripTextures(_G.AuctionHouseFrame.CategoriesList.ScrollFrame)
	AS:SkinScrollBar(_G.AuctionHouseFrame.CategoriesList.ScrollFrame.ScrollBar)

	AS:StripTextures(_G.AuctionHouseFrame.WoWTokenResults)
	AS:SkinButton(_G.AuctionHouseFrame.WoWTokenResults.Buyout)
	AS:SkinScrollBar(_G.AuctionHouseFrame.WoWTokenResults.DummyScrollBar)

	AS:SkinFrame(_G.AuctionHouseFrame.WoWTokenResults.TokenDisplay)

	AS:SkinTexture(_G.AuctionHouseFrame.WoWTokenResults.TokenDisplay.ItemButton.Icon, true)
	_G.AuctionHouseFrame.WoWTokenResults.TokenDisplay.ItemButton.Icon.Backdrop:SetBackdropBorderColor(0, .8, 1)
	_G.AuctionHouseFrame.WoWTokenResults.TokenDisplay.ItemButton.IconBorder:SetAlpha(0)

	AS:Delay(.1, function()
		for _, Button in pairs(_G.AuctionHouseFrame.BrowseResultsFrame.ItemList.ScrollFrame.buttons) do
			for _, Cell in pairs(Button.cells) do
				if Cell.Icon then
					AS:SkinTexture(Cell.Icon)
				end
			end
		end
	end)

	--[[ Browse Frame ]]--
	local Browse = _G.AuctionHouseFrame.BrowseResultsFrame

	local ItemList = Browse.ItemList
	AS:SkinBackdropFrame(ItemList)
	hooksecurefunc(ItemList, "RefreshScrollFrame", HandleHeaders)

	AS:SkinScrollBar(ItemList.ScrollFrame.scrollBar)

	--[[ BuyOut Frame]]
	local CommoditiesBuyFrame = _G.AuctionHouseFrame.CommoditiesBuyFrame
	CommoditiesBuyFrame.BuyDisplay:StripTextures()
	AS:SkinButton(CommoditiesBuyFrame.BackButton)

	ItemList = _G.AuctionHouseFrame.CommoditiesBuyFrame.ItemList
	ItemList:StripTextures()
	ItemList:CreateBackdrop("Transparent")
	AS:SkinButton(ItemList.RefreshFrame.RefreshButton)
	AS:SkinScrollBar(ItemList.ScrollFrame.scrollBar)

	local BuyDisplay = _G.AuctionHouseFrame.CommoditiesBuyFrame.BuyDisplay
	AS:SkinEditBox(BuyDisplay.QuantityInput.InputBox)
	AS:SkinButton(BuyDisplay.BuyButton)
	SkinItemDisplay(BuyDisplay)

	--[[ ItemBuyOut Frame]]
	local ItemBuyFrame = _G.AuctionHouseFrame.ItemBuyFrame
	AS:SkinButton(ItemBuyFrame.BackButton)
	AS:SkinButton(ItemBuyFrame.BuyoutFrame.BuyoutButton)

	SkinItemDisplay(ItemBuyFrame)

	ItemList = ItemBuyFrame.ItemList
	ItemList:StripTextures()
	ItemList:CreateBackdrop("Transparent")
	AS:SkinScrollBar(ItemList.ScrollFrame.scrollBar)
	AS:SkinButton(ItemList.RefreshFrame.RefreshButton)
	hooksecurefunc(ItemList, "RefreshScrollFrame", HandleHeaders)

	local EditBoxes = {
		_G.AuctionHouseFrameGold,
		_G.AuctionHouseFrameSilver,
	}

	for _, EditBox in pairs(EditBoxes) do
		AS:SkinEditBox(EditBox)
		EditBox:SetTextInsets(1, 1, -1, 1)
	end

	AS:SkinButton(ItemBuyFrame.BidFrame.BidButton)
	ItemBuyFrame.BidFrame.BidButton:ClearAllPoints()
	ItemBuyFrame.BidFrame.BidButton:SetPoint("LEFT", ItemBuyFrame.BidFrame.BidAmount, "RIGHT", 2, -2)
	AS:SkinButton(ItemBuyFrame.BidFrame.BidButton)

	--[[ Item Sell Frame | TAB 2 ]]--
	local SellFrame = _G.AuctionHouseFrame.ItemSellFrame
	local ItemSellList = _G.AuctionHouseFrame.ItemSellList
	local CommoditiesSellFrame = _G.AuctionHouseFrame.CommoditiesSellFrame
	local CommoditiesSellList = _G.AuctionHouseFrame.CommoditiesSellList
	local TokenSellFrame = _G.AuctionHouseFrame.WoWTokenSellFrame

	HandleSellFrame(SellFrame)
	HandleSellList(ItemSellList, true)
	HandleSellFrame(CommoditiesSellFrame)
	HandleSellList(CommoditiesSellList, true)
	HandleTokenSellFrame(TokenSellFrame)

	--[[ Auctions Frame | TAB 3 ]]--
	local AuctionsFrame = _G.AuctionHouseFrameAuctionsFrame
	AS:StripTextures(AuctionsFrame)

	SkinItemDisplay(AuctionsFrame)

	local CommoditiesList = AuctionsFrame.CommoditiesList
	HandleSellList(CommoditiesList, true)
	AS:SkinButton(CommoditiesList.RefreshFrame.RefreshButton)

	local ItemList = AuctionsFrame.ItemList
	HandleSellList(ItemList, true)
	AS:SkinButton(ItemList.RefreshFrame.RefreshButton)

	local Tabs = {
		_G.AuctionHouseFrameAuctionsFrameAuctionsTab,
		_G.AuctionHouseFrameAuctionsFrameBidsTab,
	}

	for _, tab in pairs(Tabs) do
		if tab then
			AS:SkinTab(tab)
		end
	end

	local SummaryList = AuctionsFrame.SummaryList
	HandleSellList(SummaryList)
	AS:SkinButton(AuctionsFrame.CancelAuctionButton)

	local AllAuctionsList = AuctionsFrame.AllAuctionsList
	HandleSellList(AllAuctionsList, true)
	AS:SkinButton(AllAuctionsList.RefreshFrame.RefreshButton)

	local BidsList = AuctionsFrame.BidsList
	HandleSellList(BidsList, true)
	AS:SkinButton(BidsList.RefreshFrame.RefreshButton)
	AS:SkinEditBox(_G.AuctionHouseFrameAuctionsFrameGold)
	AS:SkinEditBox(_G.AuctionHouseFrameAuctionsFrameSilver)
	AS:SkinButton(AuctionsFrame.BidFrame.BidButton)

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
	AS:SetInside(_G.BlackMarketFrame.HotDeal.Item.IconTexture)
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

				AS:SetInside(Button.Item.IconTexture)
				Button.Item.IconBorder:SetAlpha(0)
				hooksecurefunc(Button.Item.IconBorder, 'SetVertexColor', function(self, r, g, b) Button.Item:SetBackdropBorderColor(r, g, b) end)
				hooksecurefunc(Button.Item.IconBorder, 'Hide', function() Button.Item:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

				Button.skinned = true
			end
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_AuctionHouseUI', AS.Blizzard_AuctionHouseUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_BlackMarketUI', AS.Blizzard_BlackMarketUI, 'ADDON_LOADED')
