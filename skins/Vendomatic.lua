local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('Vendomatic') then return end

local name = "VendomaticSkin"
function AS:SkinVendomatic()
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
		AS:SkinCheckBox(object)
	end

	for _, object in pairs(Buttons) do
		AS:SkinButton(object)
	end

	AS:SkinFrame(VendomaticFrame)
	AS:SkinFrame(VendomaticOptionsFrame)
	VendomaticOptionsFrame:SetPoint('TOPLEFT', VendomaticFrame, 'BOTTOMLEFT', 0, 0)
	AS:SkinFrame(Vendomatic_OptionsRepairFrame)
	Vendomatic_OptionsRepairFrame:SetPoint('TOPLEFT', VendomaticOptionsFrame, 'TOPRIGHT', 0, 0)
	AS:SkinFrame(Vendomatic_OptionsStockFrame)
	Vendomatic_OptionsStockFrame:SetPoint('TOPLEFT', VendomaticOptionsFrame, 'TOPRIGHT', 0, 0)
	AS:SkinFrame(Vendomatic_OptionsSellFrame)
	Vendomatic_OptionsSellFrame:SetPoint('TOPLEFT', VendomaticOptionsFrame, 'TOPRIGHT', 0, 0)
	AS:SkinFrame(SellItemFauxFrame)
	AS:SkinFrame(StockItemFauxFrame)

	AS:SkinNextPrevButton(SellItemFauxIncrementButton)
	SquareButton_SetIcon(SellItemFauxIncrementButton, 'UP')
	SellItemFauxIncrementButton:ClearAllPoints()
	SellItemFauxIncrementButton:SetPoint('TOPRIGHT', SellItemFauxFrame, 'TOPRIGHT', -2, -2)
	AS:SkinNextPrevButton(SellItemFauxDecrementButton)
	SellItemFauxDecrementButton:ClearAllPoints()
	SellItemFauxDecrementButton:SetPoint('BOTTOMRIGHT', SellItemFauxFrame, 'BOTTOMRIGHT', -2, 2)
	SquareButton_SetIcon(SellItemFauxDecrementButton, 'DOWN')
	AS:SkinNextPrevButton(StockItemFauxIncrementButton)
	SquareButton_SetIcon(StockItemFauxIncrementButton, 'UP')
	StockItemFauxIncrementButton:ClearAllPoints()
	StockItemFauxIncrementButton:SetPoint('TOPRIGHT', StockItemFauxFrame, 'TOPRIGHT', -2, -2)
	AS:SkinNextPrevButton(StockItemFauxDecrementButton)
	StockItemFauxDecrementButton:ClearAllPoints()
	StockItemFauxDecrementButton:SetPoint('BOTTOMRIGHT', StockItemFauxFrame, 'BOTTOMRIGHT', -2, 2)
	SquareButton_SetIcon(StockItemFauxDecrementButton, 'DOWN')

	AS:SkinEditBox(Vendomatic_OptionsStockFrame_EditBox)

	AS:SkinIconButton(Vendomatic_OptionsSellFrame_DropBox)
	AS:SkinIconButton(Vendomatic_OptionsStockFrame_DropBox)
end

AS:RegisterSkin(name, AS.SkinVendomatic)