local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local next, pairs, unpack = next, pairs, unpack
local hooksecurefunc = hooksecurefunc
local CreateFrame = CreateFrame

-- Credits: siweia (AuroraClassic)
local function SkinEditBoxes(Frame)
	S:HandleEditBox(Frame.MinLevel)
	S:HandleEditBox(Frame.MaxLevel)
end

local function SkinFilterButton(Button)
	SkinEditBoxes(Button.LevelRangeFrame)

	S:HandleCloseButton(Button.ClearFiltersButton)
	S:HandleButton(Button)
end

local function HandleSearchBarFrame(Frame)
	SkinFilterButton(Frame.FilterButton)

	S:HandleButton(Frame.SearchButton)
	S:HandleEditBox(Frame.SearchBox)
	S:HandleButton(Frame.FavoritesSearchButton)
	Frame.FavoritesSearchButton:Size(22)
end

local function HandleListIcon(frame)
	if not frame.tableBuilder then return end

	for i = 1, 22 do
		local row = frame.tableBuilder.rows[i]
		if row then
			for j = 1, 4 do
				local cell = row.cells and row.cells[j]
				if cell and cell.Icon then
					if not cell.IsSkinned then
						S:HandleIcon(cell.Icon)

						if cell.IconBorder then
							S:Kill(cell.IconBorder)
						end

						cell.IsSkinned = true
					end
				end
			end
		end
	end
end

local function HandleSummaryIcons(frame)
	for _, child in next, { frame.ScrollTarget:GetChildren() } do
		if child.Icon then
			if not child.IsSkinned then
				S:HandleIcon(child.Icon)

				if child.IconBorder then
					S:Kill(child.IconBorder)
				end

				child.IsSkinned = true
			end
		end
	end
end

local function SkinItemDisplay(frame)
	local ItemDisplay = frame.ItemDisplay
	S:HandleFrame(ItemDisplay, true, nil, 3, -3, -3)

	local ItemButton = ItemDisplay.ItemButton
	ItemButton.CircleMask:Hide()

	S:HandleIcon(ItemButton.Icon, true)
	S:HandleIconBorder(ItemButton.IconBorder, ItemButton.Icon.backdrop)
	ItemButton:GetHighlightTexture():Hide()
end

local function HandleHeaders(frame)
	local maxHeaders = frame.HeaderContainer:GetNumChildren()
	for i, header in next, { frame.HeaderContainer:GetChildren() } do
		if not header.IsSkinned then
			header:DisableDrawLayer('BACKGROUND')

			if not header.backdrop then
				S:CreateBackdrop(header)
			end

			header.IsSkinned = true
		end

		if header.backdrop then
			S:Point(header.backdrop, 'BOTTOMRIGHT', i < maxHeaders and -5 or 0, -2)
		end
	end

	HandleListIcon(frame)
end

local function HandleAuctionButtons(button)
	S:HandleButton(button)
	button:Size(22)
end

local function HandleSellFrame(frame)
	S:StripTextures(frame)

	local ItemDisplay = frame.ItemDisplay
	S:HandleFrame(ItemDisplay)

	local ItemButton = ItemDisplay.ItemButton
	if ItemButton.IconMask then ItemButton.IconMask:Hide() end

	ItemButton.EmptyBackground:Hide()
	ItemButton:SetPushedTexture(S.Media.ClearTexture)
	ItemButton.Highlight:SetColorTexture(1, 1, 1, .25)
	ItemButton.Highlight:SetAllPoints(ItemButton.Icon)

	S:HandleIcon(ItemButton.Icon, true)
	S:HandleEditBox(frame.QuantityInput.InputBox)
	S:HandleButton(frame.QuantityInput.MaxButton)
	S:HandleEditBox(frame.PriceInput.MoneyInputFrame.GoldBox)
	S:HandleEditBox(frame.PriceInput.MoneyInputFrame.SilverBox)

	if ItemButton.IconBorder then
		S:HandleIconBorder(ItemButton.IconBorder, ItemButton.Icon.backdrop)
	end

	if frame.SecondaryPriceInput then
		S:HandleEditBox(frame.SecondaryPriceInput.MoneyInputFrame.GoldBox)
		S:HandleEditBox(frame.SecondaryPriceInput.MoneyInputFrame.SilverBox)
	end

	S:HandleDropDownBox(frame.DurationDropDown.DropDown)
	S:HandleButton(frame.PostButton)

	if frame.BuyoutModeCheckButton then
		S:HandleCheckBox(frame.BuyoutModeCheckButton)
		S:Size(frame.BuyoutModeCheckButton, 20)
	end
end

local function HandleTokenSellFrame(frame)
	S:StripTextures(frame)

	local ItemDisplay = frame.ItemDisplay
	S:HandleFrame(ItemDisplay)

	local ItemButton = ItemDisplay.ItemButton
	if ItemButton.IconMask then ItemButton.IconMask:Hide() end

	ItemButton.EmptyBackground:Hide()
	ItemButton:SetPushedTexture(S.Media.ClearTexture)
	ItemButton.Highlight:SetColorTexture(1, 1, 1, .25)
	ItemButton.Highlight:SetAllPoints(ItemButton.Icon)

	S:HandleIcon(ItemButton.Icon, true)

	if ItemButton.IconBorder then
		S:HandleIconBorder(ItemButton.IconBorder, ItemButton.Icon.backdrop)
	end

	S:HandleButton(frame.PostButton)
	HandleAuctionButtons(frame.DummyRefreshButton)

	S:HandleFrame(frame.DummyItemList)
	HandleAuctionButtons(frame.DummyRefreshButton)
	S:HandleScrollBar(frame.DummyItemList.DummyScrollBar)
end

local function HandleSellList(frame, hasHeader, fitScrollBar)
	S:StripTextures(frame)

	if frame.RefreshFrame then
		HandleAuctionButtons(frame.RefreshFrame.RefreshButton)
	end

	S:HandleTrimScrollBar(frame.ScrollBar)

	if fitScrollBar then
		frame.ScrollBar:ClearAllPoints()
		S:Point(frame.ScrollBar, 'TOPRIGHT', frame, 1, -16)
		S:Point(frame.ScrollBar, 'BOTTOMRIGHT', frame, 1, 16)
	end

	if hasHeader then
		S:SetTemplate(frame.ScrollBox)

		hooksecurefunc(frame, 'RefreshScrollFrame', HandleHeaders)
	else
		hooksecurefunc(frame.ScrollBox, 'Update', HandleSummaryIcons)
	end
end

local function HandleTabs(arg1)
	local frame = _G.AuctionHouseFrame
	if not arg1 or arg1 ~= frame then return end

	local lastTab = _G.AuctionHouseFrameBuyTab
	for index, tab in next, frame.Tabs do
		S:HandleTab(tab)

		tab:ClearAllPoints()

		if index == 1 then
			S:Point(tab, 'BOTTOMLEFT', frame, 'BOTTOMLEFT', -3, -32)
		else
			S:Point(tab, 'TOPLEFT', lastTab, 'TOPRIGHT', (tab.backdrop or tab.backdrop) and -5 or 0, 0)
		end

		lastTab = tab
	end
end

function R:Blizzard_AuctionHouseUI(event)
	if not AS:IsSkinEnabled('Blizzard_AuctionHouseUI', 'auctionhouse') then return end

	--[[ Main Frame | TAB 1]]--
	local Frame = _G.AuctionHouseFrame
	S:HandlePortraitFrame(Frame)

	-- handle tab spacing
	hooksecurefunc('PanelTemplates_SetNumTabs', HandleTabs)
	HandleTabs(Frame) -- call it once to setup our tabs

	-- SearchBar Frame
	HandleSearchBarFrame(Frame.SearchBar)
	S:StripTextures(Frame.MoneyFrameBorder)
	S:StripTextures(Frame.MoneyFrameInset)

	--[[ Categorie List ]]--
	local Categories = Frame.CategoriesList
	S:StripTextures(Categories)
	S:SetTemplate(Categories.NineSlice)
	S:SetInside(Categories.NineSlice, Categories)
	S:HandleTrimScrollBar(Categories.ScrollBar)

	hooksecurefunc('AuctionHouseFilterButton_SetUp', function(button)
		local r, g, b = unpack(S.Media.valueColor)
		button.NormalTexture:SetAlpha(0)
		button.SelectedTexture:SetColorTexture(r, g, b, .25)
		button.HighlightTexture:SetColorTexture(1, 1, 1, .1)
	end)

	--[[ Browse Frame ]]--
	local Browse = Frame.BrowseResultsFrame

	local BrowseList = Browse.ItemList
	S:StripTextures(BrowseList)
	hooksecurefunc(BrowseList, 'RefreshScrollFrame', HandleHeaders)
	S:HandleTrimScrollBar(BrowseList.ScrollBar)
	S:SetTemplate(BrowseList)
	BrowseList.ScrollBar:ClearAllPoints()
	S:Point(BrowseList.ScrollBar, 'TOPRIGHT', BrowseList, 1, -16)
	S:Point(BrowseList.ScrollBar, 'BOTTOMRIGHT', BrowseList, 1, 16)

	--[[ BuyOut Frame]]
	local CommoditiesBuyFrame = Frame.CommoditiesBuyFrame
	S:StripTextures(CommoditiesBuyFrame.BuyDisplay)
	S:HandleButton(CommoditiesBuyFrame.BackButton)

	local CommoditiesBuyList = Frame.CommoditiesBuyFrame.ItemList
	S:HandleFrame(CommoditiesBuyList)
	S:HandleButton(CommoditiesBuyList.RefreshFrame.RefreshButton)
	S:HandleTrimScrollBar(CommoditiesBuyList.ScrollBar)

	local BuyDisplay = Frame.CommoditiesBuyFrame.BuyDisplay
	S:HandleEditBox(BuyDisplay.QuantityInput.InputBox)
	S:HandleButton(BuyDisplay.BuyButton)

	SkinItemDisplay(BuyDisplay)

	--[[ ItemBuyOut Frame]]
	local ItemBuyFrame = Frame.ItemBuyFrame
	S:HandleButton(ItemBuyFrame.BackButton)
	S:HandleButton(ItemBuyFrame.BuyoutFrame.BuyoutButton)

	SkinItemDisplay(ItemBuyFrame)

	local ItemBuyList = ItemBuyFrame.ItemList
	S:HandleFrame(ItemBuyList)
	S:HandleTrimScrollBar(ItemBuyList.ScrollBar)
	S:HandleButton(ItemBuyList.RefreshFrame.RefreshButton)
	hooksecurefunc(ItemBuyList, 'RefreshScrollFrame', HandleHeaders)

	local EditBoxes = {
		_G.AuctionHouseFrameGold,
		_G.AuctionHouseFrameSilver,
	}

	for _, EditBox in pairs(EditBoxes) do
		S:HandleEditBox(EditBox)
	end

	S:HandleButton(ItemBuyFrame.BidFrame.BidButton)
	ItemBuyFrame.BidFrame.BidButton:ClearAllPoints()
	S:Point(ItemBuyFrame.BidFrame.BidButton, 'LEFT', ItemBuyFrame.BidFrame.BidAmount, 'RIGHT', 2, -2)
	S:HandleButton(ItemBuyFrame.BidFrame.BidButton)

	--[[ Item Sell Frame | TAB 2 ]]--
	local SellFrame = Frame.ItemSellFrame
	HandleSellFrame(SellFrame)
	S:SetTemplate(Frame.ItemSellFrame)

	local ItemSellList = Frame.ItemSellList
	HandleSellList(ItemSellList, true, true)

	local CommoditiesSellFrame = Frame.CommoditiesSellFrame
	HandleSellFrame(CommoditiesSellFrame)

	local CommoditiesSellList = Frame.CommoditiesSellList
	HandleSellList(CommoditiesSellList, true)

	local TokenSellFrame = Frame.WoWTokenSellFrame
	HandleTokenSellFrame(TokenSellFrame)

	--[[ Auctions Frame | TAB 3 ]]--
	local AuctionsFrame = _G.AuctionHouseFrameAuctionsFrame
	S:StripTextures(AuctionsFrame)
	SkinItemDisplay(AuctionsFrame)
	S:HandleButton(AuctionsFrame.BuyoutFrame.BuyoutButton)

	local CommoditiesList = AuctionsFrame.CommoditiesList
	HandleSellList(CommoditiesList, true)
	S:HandleButton(CommoditiesList.RefreshFrame.RefreshButton)

	local AuctionsList = AuctionsFrame.ItemList
	HandleSellList(AuctionsList, true)
	S:HandleButton(AuctionsList.RefreshFrame.RefreshButton)

	local AuctionsFrameTabs = {
		_G.AuctionHouseFrameAuctionsFrameAuctionsTab,
		_G.AuctionHouseFrameAuctionsFrameBidsTab,
	}

	for _, tab in pairs(AuctionsFrameTabs) do
		if tab then
			S:HandleTab(tab)
		end
	end

	local SummaryList = AuctionsFrame.SummaryList
	HandleSellList(SummaryList)
	S:SetTemplate(SummaryList)
	S:HandleButton(AuctionsFrame.CancelAuctionButton)

	SummaryList.ScrollBar:ClearAllPoints()
	S:Point(SummaryList.ScrollBar, 'TOPRIGHT', SummaryList, -3, -20)
	S:Point(SummaryList.ScrollBar, 'BOTTOMRIGHT', SummaryList, -3, 20)

	local AllAuctionsList = AuctionsFrame.AllAuctionsList
	HandleSellList(AllAuctionsList, true, true)
	S:HandleButton(AllAuctionsList.RefreshFrame.RefreshButton)
	AllAuctionsList.ResultsText:SetParent(AllAuctionsList.ScrollFrame)

	S:Point(SummaryList, 'BOTTOM', AuctionsFrame, 0, 0) -- normally this is anchored to the cancel button.. ? lol
	AuctionsFrame.CancelAuctionButton:ClearAllPoints()
	S:Point(AuctionsFrame.CancelAuctionButton, 'TOPRIGHT', AllAuctionsList, 'BOTTOMRIGHT', -6, 1)

	local BidsList = AuctionsFrame.BidsList
	HandleSellList(BidsList, true, true)
	BidsList.ResultsText:SetParent(BidsList.ScrollFrame)
	S:HandleButton(BidsList.RefreshFrame.RefreshButton)
	S:HandleEditBox(_G.AuctionHouseFrameAuctionsFrameGold)
	S:HandleEditBox(_G.AuctionHouseFrameAuctionsFrameSilver)
	S:HandleButton(AuctionsFrame.BidFrame.BidButton)

	--[[ ProgressBars ]]--

	--[[ WoW Token Category ]]--
	local TokenFrame = Frame.WoWTokenResults
	S:StripTextures(TokenFrame)
	S:HandleButton(TokenFrame.Buyout)
	S:HandleScrollBar(TokenFrame.DummyScrollBar) --MONITOR THIS

	local Token = TokenFrame.TokenDisplay
	S:HandleFrame(Token)

	local ItemButton = Token.ItemButton
	S:HandleIcon(ItemButton.Icon, true)
	ItemButton.Icon.backdrop:SetBackdropBorderColor(0, .8, 1)
	ItemButton:GetHighlightTexture():Hide()
	ItemButton.CircleMask:Hide()
	S:Kill(ItemButton.IconBorder)

	--WoW Token Tutorial Frame
	local WowTokenGameTimeTutorial = Frame.WoWTokenResults.GameTimeTutorial
	WowTokenGameTimeTutorial.NineSlice:Hide()
	S:SetTemplate(WowTokenGameTimeTutorial)
	S:HandleCloseButton(WowTokenGameTimeTutorial.CloseButton)
	S:HandleButton(WowTokenGameTimeTutorial.RightDisplay.StoreButton)
	WowTokenGameTimeTutorial.Bg:SetAlpha(0)
	WowTokenGameTimeTutorial.LeftDisplay.Label:SetTextColor(1, 1, 1)
	WowTokenGameTimeTutorial.LeftDisplay.Tutorial1:SetTextColor(1, 0, 0)
	WowTokenGameTimeTutorial.RightDisplay.Label:SetTextColor(1, 1, 1)
	WowTokenGameTimeTutorial.RightDisplay.Tutorial1:SetTextColor(1, 0, 0)

	--[[ Dialogs ]]--
	S:HandleFrame(Frame.BuyDialog)
	S:HandleButton(Frame.BuyDialog.BuyNowButton)
	S:HandleButton(Frame.BuyDialog.CancelButton)

	--[[ Multisell ]]--
	local multisellFrame = _G.AuctionHouseMultisellProgressFrame
	S:HandleFrame(multisellFrame)

	local progressBar = multisellFrame.ProgressBar
	S:HandleStatusBar(progressBar)

	progressBar.Text:ClearAllPoints()
	progressBar.Text:Point('BOTTOM', progressBar, 'TOP', 0, 5)

	S:HandleCloseButton(multisellFrame.CancelButton)
	S:HandleIcon(progressBar.Icon, true)
end

AS:RegisterSkin('Blizzard_AuctionHouseUI', nil, 'ADDON_LOADED')
