local AS = unpack(AddOnSkins)

if AddOnSkins.Classic then return end
if not AS:CheckAddOn('Auctionator') then return end

-- Credits: Simpy
local _G = _G

local function SkinHeaders(header, x, y)
	header:SetPoint('TOPLEFT', header:GetParent(), 'TOPLEFT', x or -20, y or -3)

	local maxHeaders = header:GetNumChildren()
	for i = 1, maxHeaders do
		local section = select(i, header:GetChildren())
		if section then
			if not section.Backdrop then
				section:DisableDrawLayer('BACKGROUND')
				AS:CreateBackdrop(section)
				section.Backdrop:SetPoint('BOTTOMRIGHT', i < maxHeaders and -5 or 0, -2)
			end
		end
	end
end

local function SkinItem(item)
	if item.Icon and not item.backdrop then
		item.Icon:SetTexCoord(unpack(AS.TexCoords))
		AS:CreateBackdrop(item)
		AS:StyleButton(item)
		item.Backdrop:SetAllPoints()
		item.EmptySlot:Hide()
		AS:SetInside(item.Icon, item.Backdrop)
	end
end

local function SetItemInfo(item, info)
	if info then
		SkinItem(item)
	end
end

local function SetOutsideText(editbox, backdrop, width, height)
	for i=1, editbox:GetNumRegions() do
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

	AS:StripTextures(list)
	AS:CreateBackdrop(list)

	AS:StripTextures(config)
	AS:CreateBackdrop(config)

	AS:StripTextures(cancelling.ResultsListing)
	AS:CreateBackdrop(cancelling.ResultsListing.ScrollFrame)
	cancelling.ResultsListing.ScrollFrame:SetPoint('TOPLEFT', cancelling.ResultsListing.HeaderContainer, 'BOTTOMLEFT', 16, -6)
	selling.CurrentItemListing.ScrollFrame:SetPoint('TOPLEFT', selling.CurrentItemListing.HeaderContainer, 'BOTTOMLEFT', -3, -4)
	selling.HistoricalPriceListing.ScrollFrame:SetPoint('TOPLEFT', selling.HistoricalPriceListing.HeaderContainer, 'BOTTOMLEFT', -3, -4)
	list.ResultsListing.ScrollFrame:SetPoint('TOPLEFT', list.ResultsListing.HeaderContainer, 'BOTTOMLEFT', 15, -4)

	AS:StripTextures(list.ShoppingResultsInset)
	AS:StripTextures(list.ScrollList.InsetFrame)
	list.ScrollList.InsetFrame:SetPoint('TOPLEFT', list.ScrollList, 'TOPLEFT', 3, 0)
	AS:StripTextures(cancelling.HistoricalPriceInset)
	AS:StripTextures(selling.HistoricalPriceInset)
	AS:CreateBackdrop(selling.HistoricalPriceInset)
	AS:SetInside(selling.HistoricalPriceInset.Backdrop)
	selling.HistoricalPriceInset:SetPoint('TOPLEFT', selling.HistoricalPriceListing, 'TOPLEFT', -7, -25)
	selling.HistoricalPriceInset:SetPoint('BOTTOMRIGHT', selling.HistoricalPriceListing, 'BOTTOMRIGHT', -2, 0)
	AS:StripTextures(selling.CurrentItemInset)
	AS:CreateBackdrop(selling.CurrentItemInset)
	AS:SetInside(selling.CurrentItemInset.Backdrop)
	selling.CurrentItemInset:SetPoint('TOPLEFT', selling.CurrentItemListing, 'TOPLEFT', -7, -25)
	selling.CurrentItemInset:SetPoint('BOTTOMRIGHT', selling.CurrentItemListing, 'BOTTOMRIGHT', -2, 0)
	AS:StripTextures(selling.BagInset)
	AS:StripTextures(selling.BagListing.ScrollFrame)
	AS:CreateBackdrop(selling.BagListing.ScrollFrame)
	AS:SetOutside(selling.BagListing.ScrollFrame, selling.BagListing)
	AS:SetOutside(selling.BagListing.ScrollFrame.Backdrop, selling.BagListing, 5, 5)

	AS:SkinButton(list.ExportCSV)

	AS:SkinDropDownBox(list.ListDropdown, 250)

	-- handle sell item icon
	SkinItem(selling.AuctionatorSaleItem.Icon)
	selling.AuctionatorSaleItem.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))

	-- handle bag item icons
	hooksecurefunc(_G.AuctionatorBagItemMixin, 'SetItemInfo', SetItemInfo)

	list.ListDropdown:ClearAllPoints()
	list.ListDropdown:SetPoint('TOPLEFT', list, 'TOPLEFT', 0, 50)
	list.CreateList:ClearAllPoints()
	list.CreateList:SetPoint('LEFT', list.ListDropdown.Backdrop, 'RIGHT', 5, 0)

	local buttons = {
		-- Shopping
		_G.AuctionatorShoppingLists_AddItem,
		list.ManualSearch,
		list.CreateList,
		list.DeleteList,
		list.Rename,
		list.Export,
		list.Import,

		--Selling
		selling.SaleItemFrame.MaxButton,
		selling.SaleItemFrame.PostButton,

		--Auctionator
		config.OptionsButton,
		config.ScanButton
	}

	local tabs = {
		selling.HistoryTabsContainer.RealmHistoryTab,
		selling.HistoryTabsContainer.YourHistoryTab
	}

	for _, button in ipairs(buttons) do
		AS:SkinButton(button)
		--button.Backdrop:SetFrameLevel(button:GetFrameLevel()) -- h a l p
	end

	for _, tab in ipairs(tabs) do
		AS:SkinTab(tab)
	end

	local scrollbars = {
		_G.AuctionatorSellingFrameScrollBar,
		cancelling.ResultsListing.ScrollFrame.scrollBar,
		list.ScrollList.ScrollFrame.scrollBar,
		list.ResultsListing.ScrollFrame.scrollBar,
		selling.CurrentItemListing.ScrollFrame.scrollBar,
		selling.HistoricalPriceListing.ScrollFrame.scrollBar,
		selling.ResultsListing.ScrollFrame.scrollBar,
	}

	for _, scrollbar in ipairs(scrollbars) do
		AS:SkinScrollBar(scrollbar)
	end

	local tabs = {
		_G.AuctionatorTabs_Auctionator,
		_G.AuctionatorTabs_Cancelling,
		_G.AuctionatorTabs_Selling,
		_G.AuctionatorTabs_ShoppingLists
	}

	for _, tab in ipairs(tabs) do
		AS:SkinTab(tab)
	end

	local editboxes = {
		--Selling
		selling.SaleItemFrame.Quantity,
		selling.SaleItemFrame.Price.MoneyInput.GoldBox,
		selling.SaleItemFrame.Price.MoneyInput.SilverBox,
		selling.SaleItemFrame.Price.MoneyInput.CopperBox,

		--Config
		config.DiscordLink,
		config.TechnicalRoadmap,
		config.BugReportLink,
	}

	for _, editbox in ipairs(editboxes) do
		AS:SkinEditBox(editbox)

		if editbox.iconAtlas or editbox.labelText == 'Quantity' then
			SkinMoneyInput(editbox, 28)
		elseif editbox.InputBox then
			editbox.InputBox:StripTextures()
			editbox.Backdrop:SetAllPoints(editbox.InputBox)
		end
	end

	selling.SaleItemFrame.MaxButton:ClearAllPoints()
	selling.SaleItemFrame.MaxButton:SetPoint('LEFT', selling.SaleItemFrame.Quantity.Backdrop, 'RIGHT', 5, 0)

	local headers = {
		{ frame = list.ResultsListing.HeaderContainer, x = -20, y = -1 },
		cancelling.ResultsListing.HeaderContainer,
		selling.CurrentItemListing.HeaderContainer,
		selling.HistoricalPriceListing.HeaderContainer,
		selling.ResultsListing.HeaderContainer,
	}

	for _, header in ipairs(headers) do
		if header.frame then
			SkinHeaders(header.frame, header.x, header.y)
		else
			SkinHeaders(header)
		end
	end

	-- duration radio buttons
	for _, duration in ipairs(selling.AuctionatorSaleItem.Duration.radioButtons) do
		if duration.RadioButton then
			AS:SkinRadioButton(duration.RadioButton)
		end
	end

	-- undercut butttons
	for _, child in ipairs({cancelling:GetChildren()}) do
		if child.StartScanButton then
			AS:SkinButton(child.StartScanButton)
			AS:SkinButton(child.CancelNextButton)
		end
	end

	-- create list backdrop
	for i = 1, list.ScrollList:GetNumRegions() do
		local region = select(i, list.ScrollList:GetRegions())
		if region:IsObjectType('Texture') and region:GetTexture() == 3054898 then
			AS:StripTextures(region)
			AS:CreateBackdrop(region)
			AS:SetOutside(region.Backdrop, list.ScrollList.InsetFrame)
		end
	end
end

local function SkinOptions()
	local options = {
		_G.AuctionatorConfigBasicOptionsFrame,
		_G.AuctionatorConfigTooltipsFrame,
		_G.AuctionatorConfigShoppingFrame,
		_G.AuctionatorConfigSellingFrame,
		_G.AuctionatorConfigLIFOFrame,		-- Selling: Items
		_G.AuctionatorConfigNotLIFOFrame,	-- Selling: Gear/Pets
		_G.AuctionatorConfigCancellingFrame,
		_G.AuctionatorConfigProfileFrame,
		_G.AuctionatorConfigAdvancedFrame
	}

	for _, frame in ipairs(options) do
		for i = 1, frame:GetNumChildren() do
			local child = select(i, frame:GetChildren())
			if child.CheckBox then
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
				for _, duration in ipairs(child.radioButtons) do
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

	AS:CreateBackdrop(copy)
	AS:CreateBackdrop(import)
	AS:CreateBackdrop(export)

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

	if not frame.Backdrop then
		AS:CreateBackdrop(frame)
	end
end

local function SkinItemFrame(frame)
	AS:StripTextures(frame)
	AS:CreateBackdrop(frame)

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

	local textareas = {
		frame.LevelRange.MaxBox,
		frame.LevelRange.MinBox,
		frame.ItemLevelRange.MaxBox,
		frame.ItemLevelRange.MinBox,
		frame.PriceRange.MaxBox,
		frame.PriceRange.MinBox,
		frame.CraftedLevelRange.MaxBox,
		frame.CraftedLevelRange.MinBox,
		frame.SearchContainer.SearchString
	}

	for _, textarea in ipairs(textareas) do
		SkinTextArea(textarea)
	end

	local resetButtons = {
		frame.LevelRange.ResetButton,
		frame.ItemLevelRange.ResetButton,
		frame.PriceRange.ResetButton,
		frame.CraftedLevelRange.ResetButton,
		frame.FilterKeySelector.ResetButton,
		frame.SearchContainer.ResetSearchStringButton
	}

	for _, resetButton in ipairs(resetButtons) do
		AS:SkinCloseButton(resetButton)
		resetButton:SetHitRectInsets(1, 1, 1, 1)
	end
end

function AS:Auctionator(event)
	if event == 'PLAYER_ENTERING_WORLD' then
		SkinOptions()
	end

	if event == 'AUCTION_HOUSE_SHOW' then
		SkinMainFrames()
		SkinImportExport()
		SkinItemFrame(_G.AuctionatorAddItemFrame)
		SkinItemFrame(_G.AuctionatorEditItemFrame)

		AS:UnregisterSkinEvent('Auctionator', event)
	end
end

AS:RegisterSkin('Auctionator', AS.Auctionator, 'AUCTION_HOUSE_SHOW', 'ADDON_LOADED')
