local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Auctionator') then return end

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
			if not section.Backdrop then
				section:DisableDrawLayer('BACKGROUND')
				AS:CreateBackdrop(section, 'Transparent')
				section.Backdrop:SetPoint('BOTTOMRIGHT', i < maxHeaders and -5 or 0, -2)
			end
		end
	end
end

local function SkinItem(item)
	if item.Icon and not item.Backdrop then
		item.Icon:SetTexCoord(unpack(AS.TexCoords))
		AS:CreateBackdrop(item)
		AS:StyleButton(item)
		item.Backdrop:SetAllPoints()
		item.EmptySlot:Hide()
		item.IconMask:Hide()
		AS:SetInside(item.Icon, item.Backdrop)
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
	local backdrop = editbox.Backdrop -- reference it before change, so it doesnt try to use InputBox backdrop
	if editbox.labelText == 'Quantity' then
		editbox = editbox.InputBox
		editbox:StripTextures()
	end

	editbox:SetHeight(height)
	SetOutsideText(editbox, backdrop, 6)
end

local function SkinMainFrames()
	local list = _G.AuctionatorShoppingListFrame
	local config = _G.AuctionatorConfigFrame
	local selling = _G.AuctionatorSellingFrame
	local cancelling = _G.AuctionatorCancellingFrame
	local recentList = list.ScrollListRecents
	local shoppingList = list.ScrollListShoppingList
	local shopTabs = list.RecentsTabsContainer

	AS:StripTextures(list)
	AS:SetTemplate(list)
	AS:SetTemplate(list.ResultsListing.ScrollFrame, 'Transparent')

	AS:StripTextures(config)
	AS:SetTemplate(config, 'Transparent')

	if AS.Retail then
		AS:StripTextures(cancelling.ResultsListing)
		AS:SetTemplate(cancelling.ResultsListing.ScrollFrame, 'Transparent')
		cancelling.ResultsListing.ScrollFrame:SetPoint('TOPLEFT', cancelling.ResultsListing.HeaderContainer, 'BOTTOMLEFT', 16, -6)
		--selling.CurrentItemListing.ScrollFrame:SetPoint('TOPLEFT', selling.CurrentItemListing.HeaderContainer, 'BOTTOMLEFT', -3, -4)
		selling.HistoricalPriceListing.ScrollFrame:SetPoint('TOPLEFT', selling.HistoricalPriceListing.HeaderContainer, 'BOTTOMLEFT', -3, -4)
		list.ResultsListing.ScrollFrame:SetPoint('TOPLEFT', list.ResultsListing.HeaderContainer, 'BOTTOMLEFT', 15, -4)
		list.ListDropdown:ClearAllPoints()
		list.ListDropdown:Point('RIGHT', list.Export, 'LEFT', -20, -2)
		list.ExportCSV:ClearAllPoints()
		list.ExportCSV:Point('TOPRIGHT', list, 'BOTTOMRIGHT', -2, -2)
	end

	AS:StripTextures(list.ShoppingResultsInset)
	AS:StripTextures(cancelling.HistoricalPriceInset)
	list.OneItemSearchButton:ClearAllPoints()
	list.OneItemSearchButton:Point('LEFT', list.OneItemSearchBox, 'RIGHT', 3, 0)
	list.OneItemSearchExtendedButton:ClearAllPoints()
	list.OneItemSearchExtendedButton:Point('LEFT', list.OneItemSearchButton, 'RIGHT', 2, 0)
	list.Export:ClearAllPoints()
	list.Export:Point('RIGHT', list.Import, 'LEFT', -3, 0)

	if AS.Retail then
		recentList.InsetFrame:StripTextures()
		recentList.InsetFrame:Point('TOPLEFT', recentList, 'TOPLEFT', 3, 0)
		shoppingList.InsetFrame:StripTextures()
		shoppingList.InsetFrame:Point('TOPLEFT', shoppingList, 'TOPLEFT', 3, 0)
		AS:StripTextures(shoppingList.ScrollFrame)
		AS:SetTemplate(shoppingList.ScrollFrame, 'Transparent')
		AS:StripTextures(selling.HistoricalPriceInset)
		AS:SetTemplate(selling.HistoricalPriceInset, 'Transparent')
		selling.HistoricalPriceInset:SetPoint('TOPLEFT', selling.HistoricalPriceListing, 'TOPLEFT', -7, -25)
		selling.HistoricalPriceInset:SetPoint('BOTTOMRIGHT', selling.HistoricalPriceListing, 'BOTTOMRIGHT', -2, 0)
		--AS:StripTextures(selling.CurrentItemInset)
		--AS:SetTemplate(selling.CurrentItemInset, 'Transparent')
		--selling.CurrentItemInset:SetPoint('TOPLEFT', selling.CurrentItemListing, 'TOPLEFT', -7, -25)
		--selling.CurrentItemInset:SetPoint('BOTTOMRIGHT', selling.CurrentItemListing, 'BOTTOMRIGHT', -2, 0)
		AS:StripTextures(selling.BagInset)
		AS:StripTextures(selling.BagListing.ScrollFrame)
		AS:CreateBackdrop(selling.BagListing.ScrollFrame, 'Transparent')
		AS:SetOutside(selling.BagListing.ScrollFrame, selling.BagListing)
		AS:SetOutside(selling.BagListing.ScrollFrame.Backdrop, selling.BagListing, 5, 5)
	end

	AS:SkinButton(list.ExportCSV)

	-- handle sell item icon
	SkinItem(selling.AuctionatorSaleItem.Icon)
	selling.AuctionatorSaleItem.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))

	-- handle bag item icons
	hooksecurefunc(_G.AuctionatorBagItemMixin, 'SetItemInfo', SetItemInfo)

	for _, button in next, {
		-- Shopping
		_G.AuctionatorShoppingLists_AddItem,
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
		AS:SkinButton(button)
	end

	local scrollBars = {
		_G.AuctionatorSellingFrameScrollBar,
		cancelling.ResultsListing.ScrollFrame.scrollBar,
		recentList.ScrollFrame.scrollBar,
		shoppingList.ScrollFrame.scrollBar,
		list.ResultsListing.ScrollFrame.scrollBar,
	}
	if AS.Retail then
		--tinsert(scrollBars, selling.CurrentItemListing.ScrollFrame.scrollBar)
		tinsert(scrollBars, selling.HistoricalPriceListing.ScrollFrame.scrollBar)
		tinsert(scrollBars, selling.ResultsListing.ScrollFrame.scrollBar)
	end

	for _, scrollbar in next, scrollBars do
		AS:SkinScrollBar(scrollbar)

		scrollbar:ClearAllPoints()

		if scrollbar == _G.AuctionatorSellingFrameScrollBar then
			scrollbar:Point('TOPLEFT', nil, 'TOPRIGHT', 7, -14)
			scrollbar:Point('BOTTOMLEFT', nil, 'BOTTOMRIGHT', 7, 14)
		elseif scrollbar == recentList.ScrollFrame.scrollBar or scrollbar == shoppingList.ScrollFrame.scrollBar then
			scrollbar:Point('TOPLEFT', nil, 'TOPRIGHT', 2, -9)
			scrollbar:Point('BOTTOMLEFT', nil, 'BOTTOMRIGHT', 2, 16)
		else
			scrollbar:Point('TOPLEFT', nil, 'TOPRIGHT', 1, -16)
			scrollbar:Point('BOTTOMLEFT', nil, 'BOTTOMRIGHT', 1, 16)
		end
	end

	local tabs = {
		_G.AuctionatorTabs_Auctionator,
		_G.AuctionatorTabs_Cancelling,
		_G.AuctionatorTabs_Selling,
		_G.AuctionatorTabs_ShoppingLists,
		shopTabs.ListTab,
		shopTabs.RecentsTab,
	}
	--if AS.Retail then
		--tinsert(tabs, selling.HistoryTabsContainer.RealmHistoryTab)
		--tinsert(tabs, selling.HistoryTabsContainer.YourHistoryTab)
	--end

	for _, tab in next, tabs do
		AS:SkinTab(tab)
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
		AS:SkinEditBox(editbox)

		if editbox.iconAtlas or editbox.labelText == 'Quantity' then
			SkinMoneyInput(editbox, 28)
		elseif editbox.InputBox then
			AS:StripTextures(editbox.InputBox)
			editbox.Backdrop:SetAllPoints(editbox.InputBox)
		end
	end

	if AS.Retail then
		selling.SaleItemFrame.MaxButton:ClearAllPoints()
		selling.SaleItemFrame.MaxButton:SetPoint('LEFT', selling.SaleItemFrame.Quantity.Backdrop, 'RIGHT', 5, 0)

		selling.SaleItemFrame.SkipButton:ClearAllPoints()
		selling.SaleItemFrame.SkipButton:SetPoint('TOPLEFT', selling.SaleItemFrame.PostButton, 'TOPRIGHT', 2, 0)
	end

	local headers = {
		{ frame = list.ResultsListing.HeaderContainer, x = -20, y = -1 },
		cancelling.ResultsListing.HeaderContainer,
	}
	if AS.Retail then
		--tinsert(headers, selling.CurrentItemListing.HeaderContainer)
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
			AS:SkinRadioButton(duration.RadioButton)
		end
	end

	-- undercut butttons, refresh button
	for _, child in next, {cancelling:GetChildren()} do
		if child.StartScanButton then
			AS:SkinButton(child.StartScanButton)
		end
		if child.CancelNextButton then
			AS:SkinButton(child.CancelNextButton)
		end
		if child.StartScanButton and child.CancelNextButton then
			child.StartScanButton:ClearAllPoints()
			child.StartScanButton:Point('RIGHT', child.CancelNextButton, 'LEFT', -3, 0)

			child.CancelNextButton:ClearAllPoints()
			child.CancelNextButton:Point('TOPRIGHT', cancelling, 'BOTTOMRIGHT', -2, -2)
		end
		if child.iconAtlas == 'UI-RefreshButton' then
			AS:SkinButton(child)
			child:Size(24)
		end
	end

	for _, child in next, {selling.AuctionatorSaleItem:GetChildren()} do
		if child.iconAtlas == 'UI-RefreshButton' then
			AS:SkinButton(child)
			child:Size(24)
		end
	end

	-- Classic / TBC Skin
	if not AS.Retail then
		AS:SkinDropDownBox(AuctionatorShoppingListFrame.ListDropdown, 200)
	end

	-- create list backdrop
	for _, frame in next, {recentList, shoppingList} do
		for i = 1, frame:GetNumRegions() do
			local region = select(i, frame:GetRegions())
			if region:IsObjectType('Texture') and region:GetTexture() == 3054898 then
				AS:StripTextures(region)
				AS:CreateBackdrop(region, 'Transparent')
				--if region.Backdrop then
					AS:SetOutside(region.Backdrop, frame.InsetFrame)
				--end
			end
		end
	end
end

local function SkinOptions()
	for _, frame in next, {
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
				AS:SkinButton(child.Button)
			elseif child.CheckBox then
				AS:SkinCheckBox(child.CheckBox)
			elseif child.DropDown then
				AS:SkinDropDownBox(child.DropDown)
			elseif child.InputBox then
				AS:SkinEditBox(child.InputBox)
				SetOutsideText(child.InputBox, child.InputBox.Backdrop, 6, 6)
			elseif child.MoneyInput then
				for x = 1, child.MoneyInput:GetNumChildren() do
					local box = select(x, child.MoneyInput:GetChildren())
					if box and box.iconAtlas then
						AS:SkinEditBox(box)
						SkinMoneyInput(box, 30)
					end
				end
			elseif child.radioButtons then
				for _, duration in next, child.radioButtons do
					if duration.RadioButton then
						AS:SkinRadioButton(duration.RadioButton)
					end
				end
			elseif child.Middle and strmatch(child.Middle:GetTexture(), 'UI%-Panel%-Button') then
				AS:SkinButton(child)
			end
		end
	end
end

local function SkinExportCheckBox(frame)
	local checkbox = frame and frame.CheckBox
	if checkbox and not frame.isSkinned then -- isSkinned is set by HandleCheckBox
		AS:SkinCheckBox(checkbox)

		checkbox:SetSize(30, 30)

		if checkbox.Label then
			checkbox.Label:ClearAllPoints()
			checkbox.Label:SetPoint('LEFT', checkbox.Backdrop, 'RIGHT', 8, 0)
		end
	end
end

local function SkinImportExport()
	local export = _G.AuctionatorExportListFrame
	local import = _G.AuctionatorImportListFrame
	local copy = _G.AuctionatorCopyTextFrame

	AS:StripTextures(copy)
	AS:StripTextures(import)
	AS:StripTextures(export)

	AS:SetTemplate(copy, 'Transparent')
	AS:SetTemplate(import, 'Transparent')
	AS:SetTemplate(export, 'Transparent')

	AS:SkinScrollBar(copy.ScrollFrame.ScrollBar)
	AS:SkinScrollBar(import.ScrollFrame.ScrollBar)
	AS:SkinScrollBar(export.ScrollFrame.ScrollBar)

	AS:SkinButton(export.SelectAll)
	AS:SkinButton(export.UnselectAll)
	AS:SkinButton(export.Export)
	AS:SkinButton(import.Import)
	AS:SkinButton(copy.Close)

	AS:SkinCloseButton(export.CloseDialog)
	AS:SkinCloseButton(import.CloseDialog)

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

	AS:SetTemplate(frame)
end

local function SkinItemFrame(frame)
	AS:StripTextures(frame)
	AS:SetTemplate(frame, 'Transparent')

	AS:SkinButton(frame.Cancel)
	AS:SkinButton(frame.ResetAllButton)
	AS:SkinButton(frame.Finished)

	frame.ResetAllButton:SetPoint('TOPLEFT', frame.Cancel, 'TOPRIGHT', 3, 0)

	AS:StripTextures(frame.FilterKeySelector)
	AS:CreateBackdrop(frame.FilterKeySelector)
	AS:SetOutside(frame.FilterKeySelector.Backdrop, frame.FilterKeySelector.Text, 5, 5)

	AS:SkinArrowButton(frame.FilterKeySelector.Button)
	frame.FilterKeySelector.Button:ClearAllPoints()
	frame.FilterKeySelector.Button:SetPoint('LEFT', frame.FilterKeySelector.Backdrop, 'RIGHT', -1, 0)
	frame.FilterKeySelector.Button:SetSize(20, 20)

	AS:SkinCheckBox(frame.SearchContainer.IsExact)
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
		AS:SkinCloseButton(resetButton)
		resetButton:SetHitRectInsets(1, 1, 1, 1)
	end
end

local function HandleLostThings()
	AS:StripTextures(_G.AuctionatorShoppingListFrame.ScrollListRecents.InsetFrame)

	AS:StripTextures(_G.AuctionatorShoppingListFrame.ScrollListShoppingList.InsetFrame)
	AS:StripTextures(_G.AuctionatorSellingFrame.AuctionatorSaleItem.Icon.IconBorder)
	AS:StripTextures(_G.AuctionatorSellingFrame.BagListing.ScrollFrame)
	AS:StripTextures(_G.AuctionatorSellingFrame.BagListing)
	AS:StripTextures(_G.AuctionatorSellingFrame.BagInset)
	AS:StripTextures(_G.AuctionatorSellingFrame.BagInset.NineSlice)

	AS:StripTextures(_G.AuctionatorSellingFrame.HistoricalPriceInset.NineSlice)
	--AS:StripTextures(_G.AuctionatorSellingFrame.CurrentItemInset.NineSlice)

	--AS:SkinTab(_G.AuctionatorSellingFrame.HistoryTabsContainer.RealmHistoryTab)
	--AS:SkinTab(_G.AuctionatorSellingFrame.HistoryTabsContainer.YourHistoryTab)

	AS:SkinEditBox(_G.AuctionatorSellingFrame.AuctionatorSaleItem.Price.MoneyInput.GoldBox)
	AS:SkinEditBox(_G.AuctionatorSellingFrame.AuctionatorSaleItem.Price.MoneyInput.SilverBox)
	AS:SkinEditBox(_G.AuctionatorSellingFrame.AuctionatorSaleItem.Quantity.InputBox)

	--AS:SkinScrollBar(_G.AuctionatorSellingFrame.CurrentItemListing.ScrollFrame.scrollBar)
	AS:SkinScrollBar(_G.AuctionatorSellingFrame.HistoricalPriceListing.ScrollFrame.scrollBar)
	AS:SkinScrollBar(_G.AuctionatorSellingFrame.ResultsListing.ScrollFrame.scrollBar)
end

function AS:Auctionator(event)
	if event == 'PLAYER_ENTERING_WORLD' then
		SkinOptions()
	end

	if event == 'AUCTION_HOUSE_SHOW' then
		SkinMainFrames()
		SkinImportExport()
		SkinItemFrame(_G.AuctionatorShoppingItemFrame)
		--SkinItemFrame(_G.AuctionatorAddItemFrame)
		--SkinItemFrame(_G.AuctionatorEditItemFrame)

		HandleLostThings()

		AS:UnregisterSkinEvent('Auctionator', event)
	end
end

AS:RegisterSkin('Auctionator', AS.Auctionator, 'AUCTION_HOUSE_SHOW', 'ADDON_LOADED')
