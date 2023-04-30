local AS, L, S, R = unpack(AddOnSkins)

-- Credits: Simpy
local _G = _G
local next = next
local select = select
local unpack = unpack
local tostring = tostring
local strmatch = strmatch
local GetItemInfo = GetItemInfo
local hooksecurefunc = hooksecurefunc

local function SkinHeaders(header, x, y)
	header:SetPoint('TOPLEFT', header:GetParent(), 'TOPLEFT', x or -20, y or -3)

	local maxHeaders = header:GetNumChildren()
	for i = 1, maxHeaders do
		local section = select(i, header:GetChildren())
		if section then
			if not section.backdrop then
				section:DisableDrawLayer('BACKGROUND')
				S:CreateBackdrop(section)
				section.backdrop:SetPoint('BOTTOMRIGHT', i < maxHeaders and -5 or 0, -2)
			end
		end
	end
end

local function SkinItem(item)
	if item.Icon and not item.backdrop then
		item.Icon:SetTexCoord(unpack(AS.TexCoords))
		S:CreateBackdrop(item)
		S:StyleButton(item)
		item.backdrop:SetAllPoints()
		item.EmptySlot:Hide()
		item.IconMask:Hide()
		S:SetInside(item.Icon, item.backdrop)
	end
end

local function SetItemInfo(item, info)
	if info then
		SkinItem(item)
	end
end

local function SetOutsideText(editbox, backdrop, width, height)
	for i = 1, editbox:GetNumRegions() do
		local region = select(i, editbox:GetRegions())
		if region and region:IsObjectType('FontString') then
			backdrop:SetOutside(region, width, height) -- h a l p
			break
		end
	end
end

local function SkinMoneyInput(editbox, height)
	local backdrop = editbox.backdrop -- reference it before change, so it doesnt try to use InputBox backdrop
	if editbox.labelText == 'Quantity' then
		editbox = editbox.InputBox
		editbox:StripTextures()
	end

	editbox:SetHeight(height)
	SetOutsideText(editbox, backdrop, 6)
end

local function SkinMainFrames()
	local list = _G.AuctionatorShoppingFrame
	local config = _G.AuctionatorConfigFrame
	local selling = _G.AuctionatorSellingFrame
	local cancelling = _G.AuctionatorCancellingFrame

	S:StripTextures(list)
	S:SetTemplate(list)
	S:SetTemplate(list.ResultsListing.ScrollFrame)

	if AS.Retail then
		S:StripTextures(cancelling.ResultsListing)
		S:SetTemplate(cancelling.ResultsListing.ScrollFrame)
		cancelling.ResultsListing.ScrollFrame:SetPoint('TOPLEFT', cancelling.ResultsListing.HeaderContainer, 'BOTTOMLEFT', 16, -6)
		selling.CurrentPricesListing.ScrollFrame:SetPoint('TOPLEFT', selling.CurrentPricesListing.HeaderContainer, 'BOTTOMLEFT', -3, -4)
		selling.HistoricalPriceListing.ScrollFrame:SetPoint('TOPLEFT', selling.HistoricalPriceListing.HeaderContainer, 'BOTTOMLEFT', -3, -4)
		list.ResultsListing.ScrollFrame:SetPoint('TOPLEFT', list.ResultsListing.HeaderContainer, 'BOTTOMLEFT', 15, -4)
		list.ListDropdown:ClearAllPoints()
		list.ListDropdown:Point('RIGHT', list.Export, 'LEFT', -20, -2)
		list.ExportCSV:ClearAllPoints()
		list.ExportCSV:Point('TOPRIGHT', list, 'BOTTOMRIGHT', -2, -2)
	end

	S:StripTextures(list.ShoppingResultsInset)
	S:StripTextures(cancelling.HistoricalPriceInset)
	list.OneItemSearchButton:ClearAllPoints()
	list.OneItemSearchButton:Point('LEFT', list.OneItemSearchBox, 'RIGHT', 3, 0)
	list.OneItemSearchExtendedButton:ClearAllPoints()
	list.OneItemSearchExtendedButton:Point('LEFT', list.OneItemSearchButton, 'RIGHT', 2, 0)
	list.Export:ClearAllPoints()
	list.Export:Point('RIGHT', list.Import, 'LEFT', -3, 0)

	if AS.Retail then
		S:StripTextures(selling.HistoricalPriceInset)
		S:SetTemplate(selling.HistoricalPriceInset)
		selling.HistoricalPriceInset:SetPoint('TOPLEFT', selling.HistoricalPriceListing, 'TOPLEFT', -7, -25)
		selling.HistoricalPriceInset:SetPoint('BOTTOMRIGHT', selling.HistoricalPriceListing, 'BOTTOMRIGHT', -2, 0)

		S:StripTextures(selling.BagInset)
		S:StripTextures(selling.BagListing.ScrollFrame)
		S:CreateBackdrop(selling.BagListing.ScrollFrame)
		S:SetOutside(selling.BagListing.ScrollFrame, selling.BagListing)
		S:SetOutside(selling.BagListing.ScrollFrame.backdrop, selling.BagListing, 5, 5)
	end

	S:HandleButton(list.ExportCSV)

	-- handle sell item icon
	SkinItem(selling.AuctionatorSaleItem.Icon)
	selling.AuctionatorSaleItem.Icon.backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))

	-- handle bag item icons
	hooksecurefunc(_G.AuctionatorBagItemMixin, 'SetItemInfo', SetItemInfo)

	for _, button in next, {
		-- Shopping
		--_G.AuctionatorShoppingLists_AddItem,
		list.ManualSearch,
		list.ExportCSV,
		list.Rename,
		list.Export,
		list.Import,
		list.AddItem,
		list.SortItems,
		list.OneItemSearchButton,
		list.OneItemSearchExtendedButton,

		--Selling
		selling.SaleItemFrame.MaxButton,
		selling.SaleItemFrame.PostButton,
		selling.SaleItemFrame.SkipButton,

		--Auctionator
		config.OptionsButton,
		config.ScanButton
	} do
		S:HandleButton(button)
	end

	local scrollBars = {
		_G.AuctionatorSellingFrameScrollBar,
		cancelling.ResultsListing.ScrollFrame.scrollBar,
		list.ResultsListing.ScrollFrame.scrollBar,
	}
	if AS.Retail then
		tinsert(scrollBars, selling.CurrentPricesListing.ScrollFrame.scrollBar)
		tinsert(scrollBars, selling.HistoricalPriceListing.ScrollFrame.scrollBar)
		tinsert(scrollBars, selling.ResultsListing.ScrollFrame.scrollBar)
	end

	for _, scrollbar in next, scrollBars do
		S:HandleScrollBar(scrollbar)

		scrollbar:ClearAllPoints()

		if scrollbar == _G.AuctionatorSellingFrameScrollBar then
			scrollbar:Point('TOPLEFT', nil, 'TOPRIGHT', 7, -14)
			scrollbar:Point('BOTTOMLEFT', nil, 'BOTTOMRIGHT', 7, 14)
		else
			scrollbar:Point('TOPLEFT', nil, 'TOPRIGHT', 1, -16)
			scrollbar:Point('BOTTOMLEFT', nil, 'BOTTOMRIGHT', 1, 16)
		end
	end

	local tabs = {
		_G.AuctionatorTabs_Shopping,
		_G.AuctionatorTabs_Auctionator,
		_G.AuctionatorTabs_Cancelling,
		_G.AuctionatorTabs_Shopping,
		_G.AuctionatorTabs_Selling,
	}
	if AS.Retail then
		if tabs then
			tinsert(tabs, selling.PricesTabsContainer.CurrentPricesTab)
			tinsert(tabs, selling.PricesTabsContainer.RealmHistoryTab)
			tinsert(tabs, selling.PricesTabsContainer.YourHistoryTab)
		end
	end

	for _, tab in next, tabs do
		S:HandleTab(tab)
	end

	local editBoxes = {
		list.OneItemSearchBox,

		--Config
		config.DiscordLink,
		config.TechnicalRoadmap,
		config.BugReportLink,

		--Cancelling
		cancelling.SearchFilter,
	}
	if AS.Retail then
		tinsert(editBoxes, selling.SaleItemFrame.Quantity)
		tinsert(editBoxes, selling.SaleItemFrame.Price.MoneyInput.GoldBox)
		tinsert(editBoxes, selling.SaleItemFrame.Price.MoneyInput.SilverBox)
		tinsert(editBoxes, selling.SaleItemFrame.Price.MoneyInput.CopperBox)
	end

	for _, editbox in next, editBoxes do
		S:HandleEditBox(editbox)

		if editbox.iconAtlas or editbox.labelText == 'Quantity' then
			SkinMoneyInput(editbox, 28)
		elseif editbox.InputBox then
			S:StripTextures(editbox.InputBox)
			editbox.backdrop:SetAllPoints(editbox.InputBox)
		end
	end

	if AS.Retail then
		selling.SaleItemFrame.MaxButton:ClearAllPoints()
		selling.SaleItemFrame.MaxButton:SetPoint('LEFT', selling.SaleItemFrame.Quantity.backdrop, 'RIGHT', 5, 0)

		selling.SaleItemFrame.SkipButton:ClearAllPoints()
		selling.SaleItemFrame.SkipButton:SetPoint('TOPLEFT', selling.SaleItemFrame.PostButton, 'TOPRIGHT', 2, 0)
	end

	local headers = {
		{ frame = list.ResultsListing.HeaderContainer, x = -20, y = -1 },
		cancelling.ResultsListing.HeaderContainer,
	}
	if AS.Retail then
		tinsert(headers, selling.CurrentPricesListing.HeaderContainer)
		tinsert(headers, selling.HistoricalPriceListing.HeaderContainer)
		tinsert(headers, selling.ResultsListing.HeaderContainer)
	end
	for _, header in next, headers do
		if header.frame then
			SkinHeaders(header.frame, header.x, header.y)
		else
			SkinHeaders(header)
		end
	end

	-- duration radio buttons
	for _, duration in next, selling.AuctionatorSaleItem.Duration.radioButtons do
		if duration.RadioButton then
			S:HandleRadioButton(duration.RadioButton)
		end
	end

	-- undercut butttons, refresh button
	for _, child in next, {cancelling:GetChildren()} do
		if child.StartScanButton then
			S:HandleButton(child.StartScanButton)
		end
		if child.CancelNextButton then
			S:HandleButton(child.CancelNextButton)
		end
		if child.StartScanButton and child.CancelNextButton then
			child.StartScanButton:ClearAllPoints()
			child.StartScanButton:Point('RIGHT', child.CancelNextButton, 'LEFT', -3, 0)

			child.CancelNextButton:ClearAllPoints()
			child.CancelNextButton:Point('TOPRIGHT', cancelling, 'BOTTOMRIGHT', -2, -2)
		end
		if child.iconAtlas == 'UI-RefreshButton' then
			S:HandleButton(child)
			child:Size(24)
		end
	end

	for _, child in next, {selling.AuctionatorSaleItem:GetChildren()} do
		if child.iconAtlas == 'UI-RefreshButton' then
			S:HandleButton(child)
			child:Size(24)
		end
	end

	-- Classic / TBC Skin
	if not AS.Retail then
		S:HandleDropDownBox(_G.AuctionatorShoppingFrame.ListDropdown, 200)
	end
end

local function SkinOptions()
	for _, frame in next, {
		_G.AuctionatorConfigSellingAllItemsFrame,
		_G.AuctionatorConfigBasicOptionsFrame,
		_G.AuctionatorConfigQuantitiesFrame,
		_G.AuctionatorConfigTooltipsFrame,
		_G.AuctionatorConfigShoppingFrame,
		_G.AuctionatorConfigSellingFrame,
		_G.AuctionatorConfigSellingShortcutsFrame,
		_G.AuctionatorConfigLIFOFrame,		-- Selling: Items
		_G.AuctionatorConfigNotLIFOFrame,	-- Selling: Gear/Pets
		_G.AuctionatorConfigCancellingFrame,
		_G.AuctionatorConfigProfileFrame,
		_G.AuctionatorConfigAdvancedFrame
	} do
		for i = 1, frame:GetNumChildren() do
			local child = select(i, frame:GetChildren())
			if child.Button then
				S:HandleButton(child.Button)
			elseif child.CheckBox then
				S:HandleCheckBox(child.CheckBox)
			elseif child.DropDown then
				S:HandleDropDownBox(child.DropDown)
			elseif child.InputBox then
				S:HandleEditBox(child.InputBox)
				SetOutsideText(child.InputBox, child.InputBox.backdrop, 6, 6)
			elseif child.MoneyInput then
				for x = 1, child.MoneyInput:GetNumChildren() do
					local box = select(x, child.MoneyInput:GetChildren())
					if box and box.iconAtlas then
						S:HandleEditBox(box)
						SkinMoneyInput(box, 30)
					end
				end
			elseif child.radioButtons then
				for _, duration in next, child.radioButtons do
					if duration.RadioButton then
						S:HandleRadioButton(duration.RadioButton)
					end
				end
			elseif child.Middle and strmatch(child.Middle:GetTexture(), 'UI%-Panel%-Button') then
				S:HandleButton(child)
			end
		end
	end
end

local function SkinExportCheckBox(frame)
	local checkbox = frame and frame.CheckBox
	if checkbox and not frame.isSkinned then -- isSkinned is set by HandleCheckBox
		S:HandleCheckBox(checkbox)

		checkbox:SetSize(30, 30)

		if checkbox.Label then
			checkbox.Label:ClearAllPoints()
			checkbox.Label:SetPoint('LEFT', checkbox.backdrop, 'RIGHT', 8, 0)
		end
	end
end

local function SkinImportExport()
	local export = _G.AuctionatorExportListFrame
	local import = _G.AuctionatorImportListFrame
	local copy = _G.AuctionatorCopyTextFrame

	S:StripTextures(copy)
	S:StripTextures(import)
	S:StripTextures(export)

	S:SetTemplate(copy)
	S:SetTemplate(import)
	S:SetTemplate(export)

	S:HandleScrollBar(copy.ScrollFrame.ScrollBar)
	S:HandleScrollBar(import.ScrollFrame.ScrollBar)
	S:HandleScrollBar(export.ScrollFrame.ScrollBar)

	S:HandleButton(export.SelectAll)
	S:HandleButton(export.UnselectAll)
	S:HandleButton(export.Export)
	S:HandleButton(import.Import)
	S:HandleButton(copy.Close)

	S:HandleCloseButton(export.CloseDialog)
	S:HandleCloseButton(import.CloseDialog)

	hooksecurefunc(export, 'AddToPool', function(self)
		SkinExportCheckBox(self.checkBoxPool[#self.checkBoxPool])
	end)

	for _, checkbox in ipairs(export.checkBoxPool) do
		SkinExportCheckBox(checkbox)
	end
end

local function SkinTextArea(frame)
	frame.Left:Hide()
	frame.Middle:Hide()
	frame.Right:Hide()

	S:SetTemplate(frame)
end

local function SkinItemFrame(frame)
	S:StripTextures(frame)
	S:SetTemplate(frame)

	S:HandleButton(frame.Cancel)
	S:HandleButton(frame.ResetAllButton)
	S:HandleButton(frame.Finished)

	frame.ResetAllButton:SetPoint('TOPLEFT', frame.Cancel, 'TOPRIGHT', 3, 0)

	S:StripTextures(frame.FilterKeySelector)
	S:CreateBackdrop(frame.FilterKeySelector)
	S:SetOutside(frame.FilterKeySelector.backdrop, frame.FilterKeySelector.Text, 5, 5)

	S:HandleNextPrevButton(frame.FilterKeySelector.Button)
	frame.FilterKeySelector.Button:ClearAllPoints()
	frame.FilterKeySelector.Button:SetPoint('LEFT', frame.FilterKeySelector.backdrop, 'RIGHT', -1, 0)
	frame.FilterKeySelector.Button:SetSize(20, 20)

	S:HandleCheckBox(frame.SearchContainer.IsExact)
	frame.SearchContainer.IsExact:SetSize(26, 26)

	for _, textarea in next, {
		frame.LevelRange.MaxBox,
		frame.LevelRange.MinBox,
		frame.ItemLevelRange.MaxBox,
		frame.ItemLevelRange.MinBox,
		frame.PriceRange.MaxBox,
		frame.PriceRange.MinBox,
		frame.CraftedLevelRange.MaxBox,
		frame.CraftedLevelRange.MinBox,
		frame.SearchContainer.SearchString
	} do
		SkinTextArea(textarea)
	end

	for _, resetButton in next, {
		frame.LevelRange.ResetButton,
		frame.ItemLevelRange.ResetButton,
		frame.PriceRange.ResetButton,
		frame.CraftedLevelRange.ResetButton,
		frame.FilterKeySelector.ResetButton,
		frame.SearchContainer.ResetSearchStringButton
	} do
		S:HandleCloseButton(resetButton)
		resetButton:SetHitRectInsets(1, 1, 1, 1)
	end
end

local function HandleLostThings()
	S:StripTextures(_G.AuctionatorShoppingFrame.ScrollListRecents.InsetFrame)

	--S:StripTextures(_G.AuctionatorShoppingFrame.ScrollListShoppingList.InsetFrame)
	S:StripTextures(_G.AuctionatorSellingFrame.AuctionatorSaleItem.Icon.IconBorder)
	S:StripTextures(_G.AuctionatorSellingFrame.BagListing.ScrollFrame)
	S:StripTextures(_G.AuctionatorSellingFrame.BagListing)
	S:StripTextures(_G.AuctionatorSellingFrame.BagInset)
	S:StripTextures(_G.AuctionatorSellingFrame.BagInset.NineSlice)

	S:StripTextures(_G.AuctionatorSellingFrame.HistoricalPriceInset.NineSlice)
	--S:StripTextures(_G.AuctionatorSellingFrame.CurrentItemInset.NineSlice)

	--S:HandleTab(_G.AuctionatorSellingFrame.HistoryTabsContainer.RealmHistoryTab)
	--S:HandleTab(_G.AuctionatorSellingFrame.HistoryTabsContainer.YourHistoryTab)

	S:HandleEditBox(_G.AuctionatorSellingFrame.AuctionatorSaleItem.Price.MoneyInput.GoldBox)
	S:HandleEditBox(_G.AuctionatorSellingFrame.AuctionatorSaleItem.Price.MoneyInput.SilverBox)
	S:HandleEditBox(_G.AuctionatorSellingFrame.AuctionatorSaleItem.Quantity.InputBox)

	--S:HandleScrollBar(_G.AuctionatorSellingFrame.CurrentItemListing.ScrollFrame.scrollBar)
	S:HandleScrollBar(_G.AuctionatorSellingFrame.HistoricalPriceListing.ScrollFrame.scrollBar)
	S:HandleScrollBar(_G.AuctionatorSellingFrame.ResultsListing.ScrollFrame.scrollBar)
end

local function StartSkinning()
	SkinMainFrames()
	SkinImportExport()
	SkinItemFrame(_G.AuctionatorShoppingItemFrame)
	--SkinItemFrame(_G.AuctionatorAddItemFrame)
	--SkinItemFrame(_G.AuctionatorEditItemFrame)
	HandleLostThings()
end

function R:Auctionator(event)
	if event == 'PLAYER_ENTERING_WORLD' then
		SkinOptions()
	end

	if event == 'AUCTION_HOUSE_SHOW' then
		hooksecurefunc(_G.AuctionatorTabContainerMixin, 'HookTabs', StartSkinning)
		hooksecurefunc(_G.AuctionatorConfigTabMixin, 'OnLoad', StartSkinning)
	end
end

AS:RegisterSkin('Auctionator', nil, 'AUCTION_HOUSE_SHOW', 'ADDON_LOADED')
