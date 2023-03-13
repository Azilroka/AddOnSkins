local AS, L, S, R = unpack(AddOnSkins)

function R:Vendomatic()
	local Buttons = {
		VendomaticOptionsFrame_Button1,
		VendomaticOptionsFrame_StockButton,
		VendomaticOptionsFrame_SellButton,
		VendomaticOptionsFrame_RepairButton,
		Vendomatic_OptionsStockFrame_ButtonAdd,
		Vendomatic_OptionsStockFrame_ButtonClose,
		Vendomatic_OptionsStockFrame_ButtonRemove,
		Vendomatic_OptionsSellFrame_ButtonAdd,
		Vendomatic_OptionsSellFrame_ButtonClose,
		Vendomatic_OptionsSellFrame_ButtonRemove,
		Vendomatic_OptionsRepairFrame_Button1,
	}

	local CheckBoxes = {
		VendomaticOptionsFrame_CheckRepair,
		VendomaticOptionsFrame_CheckSell,
		VendomaticOptionsFrame_CheckRestock,
		Vendomatic_OptionsRepairFrame_CheckGuildRepair,
		Vendomatic_OptionsSellFrame_SellGreen,
		Vendomatic_OptionsStockFrame_CheckOverStock,
	}

	for _, object in pairs(CheckBoxes) do
		S:HandleCheckBox(object)
	end

	for _, object in pairs(Buttons) do
		S:HandleButton(object)
	end

	S:HandleFrame(VendomaticFrame)
	S:HandleFrame(VendomaticOptionsFrame)
	S:HandleFrame(Vendomatic_OptionsRepairFrame)
	S:HandleFrame(Vendomatic_OptionsStockFrame)
	S:HandleFrame(Vendomatic_OptionsSellFrame)
	S:HandleFrame(SellItemFauxFrame)
	S:HandleFrame(StockItemFauxFrame)

	VendomaticOptionsFrame:SetPoint('TOPLEFT', VendomaticFrame, 'BOTTOMLEFT', 0, 0)
	Vendomatic_OptionsRepairFrame:SetPoint('TOPLEFT', VendomaticOptionsFrame, 'TOPRIGHT', 0, 0)
	Vendomatic_OptionsStockFrame:SetPoint('TOPLEFT', VendomaticOptionsFrame, 'TOPRIGHT', 0, 0)
	Vendomatic_OptionsSellFrame:SetPoint('TOPLEFT', VendomaticOptionsFrame, 'TOPRIGHT', 0, 0)

	S:HandleNextPrevButton(SellItemFauxIncrementButton)
	SellItemFauxIncrementButton:ClearAllPoints()
	SellItemFauxIncrementButton:SetPoint('TOPRIGHT', SellItemFauxFrame, 'TOPRIGHT', -2, -2)
	S:HandleNextPrevButton(SellItemFauxDecrementButton)
	SellItemFauxDecrementButton:ClearAllPoints()
	SellItemFauxDecrementButton:SetPoint('BOTTOMRIGHT', SellItemFauxFrame, 'BOTTOMRIGHT', -2, 2)
	S:HandleNextPrevButton(StockItemFauxIncrementButton)
	StockItemFauxIncrementButton:ClearAllPoints()
	StockItemFauxIncrementButton:SetPoint('TOPRIGHT', StockItemFauxFrame, 'TOPRIGHT', -2, -2)
	S:HandleNextPrevButton(StockItemFauxDecrementButton)
	StockItemFauxDecrementButton:ClearAllPoints()
	StockItemFauxDecrementButton:SetPoint('BOTTOMRIGHT', StockItemFauxFrame, 'BOTTOMRIGHT', -2, 2)

	S:HandleEditBox(Vendomatic_OptionsStockFrame_EditBox)

	S:HandleItemButton(Vendomatic_OptionsSellFrame_DropBox)
	S:HandleItemButton(Vendomatic_OptionsStockFrame_DropBox)
end

AS:RegisterSkin('Vendomatic')
