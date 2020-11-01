local S, E, L, V, P, G = unpack(select(2, ...))
local Skins = E:GetModule('Skins')

local _G = _G
local ipairs = ipairs
local select = select
local unpack = unpack
local hooksecurefunc = hooksecurefunc

local function SkinHeaders(header, x, y)
	header:Point('TOPLEFT', header:GetParent(), 'TOPLEFT', x or -20, y or -3)

	local maxHeaders = header:GetNumChildren()
	for i = 1, maxHeaders do
		local section = select(i, header:GetChildren())
		if section then
			if not section.backdrop then
				section:DisableDrawLayer('BACKGROUND')
				section:CreateBackdrop('Transparent')
				section.backdrop:Point('BOTTOMRIGHT', i < maxHeaders and -5 or 0, -2)
			end
		end
	end
end

local function SkinItem(item)
	if item.Icon and not item.backdrop then
		item.Icon:SetTexCoord(unpack(E.TexCoords))
		item:CreateBackdrop()
		item.backdrop:SetAllPoints()
		item.EmptySlot:Hide()
		item.Icon:SetInside(item.backdrop)
		Skins:HandleIconBorder(item.IconBorder, item.backdrop)
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
			backdrop:SetOutside(region, width, height)
			break
		end
	end
end

local function SkinMainFrames()
	local list = _G.AuctionatorShoppingListFrame
	local config = _G.AuctionatorConfigFrame
	local selling = _G.AuctionatorSellingFrame
	local cancelling = _G.AuctionatorCancellingFrame

	list:StripTextures()
	list:CreateBackdrop('Transparent')

	config:StripTextures()
	config:CreateBackdrop('Transparent')

	cancelling.ResultsListing.ScrollFrame:StripTextures()
	cancelling.ResultsListing.ScrollFrame:CreateBackdrop('Transparent')
	cancelling.ResultsListing.ScrollFrame:Point('TOPLEFT', cancelling.ResultsListing.HeaderContainer, 'BOTTOMLEFT', 16, -6)
	selling.CurrentItemListing.ScrollFrame:Point('TOPLEFT', selling.CurrentItemListing.HeaderContainer, 'BOTTOMLEFT', -3, -4)
	selling.HistoricalPriceListing.ScrollFrame:Point('TOPLEFT', selling.HistoricalPriceListing.HeaderContainer, 'BOTTOMLEFT', -3, -4)
	list.ResultsListing.ScrollFrame:Point('TOPLEFT', list.ResultsListing.HeaderContainer, 'BOTTOMLEFT', 15, -4)

	_G.AuctionatorShoppingListFrameBg:StripTextures()
	list.ScrollList.InsetFrame:StripTextures()
	list.ScrollList.InsetFrame:Point('TOPLEFT', list.ScrollList, 'TOPLEFT', 3, 0)
	cancelling.HistoricalPriceInset:StripTextures()
	selling.HistoricalPriceInset:StripTextures()
	selling.HistoricalPriceInset:CreateBackdrop('Transparent')
	selling.HistoricalPriceInset.backdrop:SetInside()
	selling.HistoricalPriceInset:Point('TOPLEFT', selling.HistoricalPriceListing, 'TOPLEFT', -7, -25)
	selling.HistoricalPriceInset:Point('BOTTOMRIGHT', selling.HistoricalPriceListing, 'BOTTOMRIGHT', -2, 0)
	selling.CurrentItemInset:StripTextures()
	selling.CurrentItemInset:CreateBackdrop('Transparent')
	selling.CurrentItemInset.backdrop:SetInside()
	selling.CurrentItemInset:Point('TOPLEFT', selling.CurrentItemListing, 'TOPLEFT', -7, -25)
	selling.CurrentItemInset:Point('BOTTOMRIGHT', selling.CurrentItemListing, 'BOTTOMRIGHT', -2, 0)
	selling.BagInset:StripTextures()
	selling.BagListing.ScrollFrame:StripTextures()
	selling.BagListing.ScrollFrame:CreateBackdrop('Transparent')
	selling.BagListing.ScrollFrame:SetOutside(selling.BagListing)
	selling.BagListing.ScrollFrame.backdrop:SetOutside(selling.BagListing, 5, 5)

	Skins:HandleDropDownBox(list.ListDropdown, 250)

	-- handle sell item icon
	SkinItem(selling.AuctionatorSaleItem.Icon)
	selling.AuctionatorSaleItem.Icon.backdrop:SetBackdropBorderColor(unpack(E.media.bordercolor))

	-- handle bag item icons
	hooksecurefunc(_G.AuctionatorBagItemMixin, 'SetItemInfo', SetItemInfo)

	list.ListDropdown:ClearAllPoints()
	list.ListDropdown:Point('TOPLEFT', list, 'TOPLEFT', 0, 50)
	list.CreateList:ClearAllPoints()
	list.CreateList:Point('LEFT', list.ListDropdown.backdrop, 'RIGHT', 5, 0)

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

	for _, button in ipairs(buttons) do
		Skins:HandleButton(button)
		button.backdrop:SetFrameLevel(button:GetFrameLevel())
	end

	local scrollbars = {
		_G.AuctionatorSellingFrameScrollBar,
		cancelling.ResultsListing.ScrollFrame.scrollBar,
		list.ScrollList.ScrollFrame.scrollBar,
		list.ResultsListing.ScrollFrame.scrollBar,
		selling.CurrentItemListing.ScrollFrame.scrollBar,
		selling.HistoricalPriceListing.ScrollFrame.scrollBar
	}

	for _, scrollbar in ipairs(scrollbars) do
		Skins:HandleScrollBar(scrollbar)
	end

	local tabs = {
		_G.AuctionatorTabs_Auctionator,
		_G.AuctionatorTabs_Cancelling,
		_G.AuctionatorTabs_Selling,
		_G.AuctionatorTabs_ShoppingLists
	}

	for _, tab in ipairs(tabs) do
		Skins:HandleTab(tab)
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
		Skins:HandleEditBox(editbox)

		local quantity = editbox.labelText == 'Quantity'
		if editbox.iconAtlas or quantity then -- Money Input (Buyout Price) and Quantity
			local backdrop = editbox.backdrop -- reference it before change, so it doesnt try to use InputBox backdrop
			if quantity then
				editbox = editbox.InputBox
				editbox:StripTextures()
			end

			editbox:SetHeight(28)
			SetOutsideText(editbox, backdrop, 6)
		elseif editbox.InputBox then
			editbox.InputBox:StripTextures()
			editbox.backdrop:SetAllPoints(editbox.InputBox)
		end
	end

	selling.SaleItemFrame.MaxButton:ClearAllPoints()
	selling.SaleItemFrame.MaxButton:Point('LEFT', selling.SaleItemFrame.Quantity.backdrop, 'RIGHT', 5, 0)

	local headers = {
		{ frame = list.ResultsListing.HeaderContainer, x = -20, y = -1 },
		cancelling.ResultsListing.HeaderContainer,
		selling.CurrentItemListing.HeaderContainer,
		selling.HistoricalPriceListing.HeaderContainer
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
			Skins:HandleRadioButton(duration.RadioButton)
		end
	end

	-- undercut butttons
	for _, child in ipairs({cancelling:GetChildren()}) do
		if child.StartScanButton then
			Skins:HandleButton(child.StartScanButton)
			Skins:HandleButton(child.CancelNextButton)
		end
	end

	-- create list backdrop
	for i=1, list.ScrollList:GetNumRegions() do
		local region = select(i, list.ScrollList:GetRegions())
		if region:IsObjectType('Texture') and region:GetTexture() == 3054898 then
			region:StripTextures()
			region:CreateBackdrop('Transparent')
			region.backdrop:SetOutside(list.ScrollList.InsetFrame)
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
		for _, child in ipairs({frame:GetChildren()}) do
			if child.CheckBox then Skins:HandleCheckBox(child.CheckBox) end
			if child.DropDown then Skins:HandleDropDownBox(child.DropDown) end

			if child.InputBox then
				Skins:HandleEditBox(child.InputBox)
				SetOutsideText(child.InputBox, child.InputBox.backdrop, 6, 6)
			end

			if child.radioButtons then
				for _, duration in ipairs(child.radioButtons) do
					if duration.RadioButton then
						Skins:HandleRadioButton(duration.RadioButton)
					end
				end
			end
		end
	end
end

local function SkinExportCheckBox(frame)
	local checkbox = frame and frame.CheckBox
	if checkbox and not frame.isSkinned then -- isSkinned is set by HandleCheckBox
		Skins:HandleCheckBox(checkbox)

		checkbox:Size(30)

		if checkbox.Label then
			checkbox.Label:ClearAllPoints()
			checkbox.Label:Point('LEFT', checkbox.backdrop, 'RIGHT', 8, 0)
		end
	end
end

local function SkinImportExport()
	local export = _G.AuctionatorExportListFrame
	local import = _G.AuctionatorImportListFrame
	local copy = _G.AuctionatorCopyTextFrame

	copy:StripTextures()
	import:StripTextures()
	export:StripTextures()

	copy:CreateBackdrop('Transparent')
	import:CreateBackdrop('Transparent')
	export:CreateBackdrop('Transparent')

	copy.ScrollFrame:StripTextures()
	import.ScrollFrame:StripTextures()
	export.ScrollFrame:StripTextures()

	Skins:HandleScrollBar(copy.ScrollFrame.ScrollBar)
	Skins:HandleScrollBar(import.ScrollFrame.ScrollBar)
	Skins:HandleScrollBar(export.ScrollFrame.ScrollBar)

	Skins:HandleButton(export.SelectAll)
	Skins:HandleButton(export.UnselectAll)
	Skins:HandleButton(export.Export)
	Skins:HandleButton(import.Import)
	Skins:HandleButton(copy.Close)

	Skins:HandleCloseButton(export.CloseDialog)
	Skins:HandleCloseButton(import.CloseDialog)

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

	if not frame.backdrop then
		frame:CreateBackdrop()
	end
end

local function SkinItemFrame(frame)
	frame:StripTextures()
	frame:CreateBackdrop('Transparent')

	Skins:HandleButton(frame.Cancel)
	Skins:HandleButton(frame.ResetAllButton)
	Skins:HandleButton(frame.Finished)

	frame.ResetAllButton:Point('TOPLEFT', frame.Cancel, 'TOPRIGHT', 3, 0)

	frame.FilterKeySelector:StripTextures()
	frame.FilterKeySelector:CreateBackdrop()
	frame.FilterKeySelector.backdrop:SetOutside(frame.FilterKeySelector.Text, 5, 5)

	Skins:HandleNextPrevButton(frame.FilterKeySelector.Button)
	frame.FilterKeySelector.Button:ClearAllPoints()
	frame.FilterKeySelector.Button:Point('LEFT', frame.FilterKeySelector.backdrop, 'RIGHT', -1, 0)
	frame.FilterKeySelector.Button:Size(20)

	Skins:HandleCheckBox(frame.SearchContainer.IsExact)
	frame.SearchContainer.IsExact:Size(26)

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
		Skins:HandleCloseButton(resetButton)
		resetButton:SetHitRectInsets(1, 1, 1, 1)
	end
end

function S:SkinAuctionator()
	SkinOptions()
	SkinMainFrames()
	SkinImportExport()
	SkinItemFrame(_G.AuctionatorAddItemFrame)
	SkinItemFrame(_G.AuctionatorEditItemFrame)
end
