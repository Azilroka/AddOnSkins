local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Pawn') then return end

function AS:Pawn()
	if addon == 'Blizzard_InspectUI' or IsAddOnLoaded('Blizzard_InspectUI') then
		InspectFrame:HookScript('OnShow', function() AS:SkinButton(PawnUI_InspectPawnButton, true) PawnUI_InspectPawnButton:SetFormattedText(" Pawn ") PawnUI_InspectPawnButton:ClearAllPoints() PawnUI_InspectPawnButton:Point('RIGHT', InspectFrameCloseButton, 'LEFT', -8, -4) PawnUI_InspectPawnButton:Size(66, 20)end)
		AS:UnregisterSkinEvent('Pawn', event)
	end

	-- General
	AS:SkinFrame(PawnUIFrame)
	AS:SkinCloseButton(PawnUIFrame_TinyCloseButton)
	AS:SkinScrollBar(PawnUIScaleSelectorScrollFrameScrollBar)
	AS:SkinFrame(PawnUIStringDialog)
	AS:SkinEditBox(PawnUIStringDialog_TextBox)
	AS:SkinButton(PawnUIStringDialog_OKButton)
	AS:SkinButton(PawnUIStringDialog_CancelButton)

	AS:SkinButton(PawnUI_InventoryPawnButton)
	PawnUI_InventoryPawnButton:SetFormattedText(" Pawn ")
	-- PawnUI_InspectPawnButton:SetFormattedText(" Pawn ")

	for i = 1, PawnUIFrame.numTabs do
		AS:SkinTab(_G["PawnUIFrameTab"..i])
	end

	-- Scale
	AS:SkinButton(PawnUIFrame_RenameScaleButton)
	AS:SkinButton(PawnUIFrame_DeleteScaleButton)
	AS:SkinCheckBox(PawnUIFrame_ShowScaleCheck)
	AS:SkinButton(PawnUIFrame_ImportScaleButton)
	AS:SkinButton(PawnUIFrame_ExportScaleButton)
	AS:SkinButton(PawnUIFrame_CopyScaleButton)
	AS:SkinButton(PawnUIFrame_NewScaleFromDefaultsButton)
	AS:SkinButton(PawnUIFrame_NewScaleButton)
	AS:SkinButton(PawnUIFrame_AutoSelectScalesOnButton) -- huge button, with highlight
	AS:SkinButton(PawnUIFrame_AutoSelectScalesOffButton) -- huge button, with highlight

	-- Weights
	AS:SkinScrollBar(PawnUIFrame_StatsListScrollBar)
	AS:SkinCheckBox(PawnUIFrame_NormalizeValuesCheck)
	AS:SkinEditBox(PawnUIFrame_StatValueBox)
	AS:SkinButton(PawnUIFrame_ClearValueButton)

	-- Compare
	AS:SkinBackdropFrame(PawnUICompareItemIcon1, nil, true, false, true)
	AS:SkinBackdropFrame(PawnUICompareItemIcon2, nil, true, false, true)
	-- AS:SkinButton(PawnUIFrame_ClearItemsButton) -- This button needs some attention
	AS:SkinButton(PawnUIFrame_CompareSwapButton)
	AS:SkinScrollBar(PawnUICompareScrollFrameScrollBar)

	-- Gems
	AS:SkinEditBox(PawnUIFrame_GemQualityLevelBox, 40, 20)
	AS:SkinScrollBar(PawnUIGemScrollFrameScrollBar)

	-- Options
	AS:SkinButton(PawnUIFrame_ResetUpgradesButton)
	AS:SkinCheckBox(PawnUIFrame_EnchantedValuesCheck)
	AS:SkinCheckBox(PawnUIFrame_ShowIconsCheck)
	AS:SkinCheckBox(PawnUIFrame_ShowSpecIconsCheck)
	AS:SkinCheckBox(PawnUIFrame_AlignRightCheck)
	AS:SkinCheckBox(PawnUIFrame_ColorTooltipBorderCheck)
	AS:SkinCheckBox(PawnUIFrame_ShowBagUpgradeAdvisorCheck)
	AS:SkinCheckBox(PawnUIFrame_ShowLootUpgradeAdvisorCheck)
	AS:SkinCheckBox(PawnUIFrame_ShowQuestUpgradeAdvisorCheck)
	AS:SkinCheckBox(PawnUIFrame_ShowSocketingAdvisorCheck)
	AS:SkinCheckBox(PawnUIFrame_IgnoreGemsWhileLevelingCheck)
	AS:SkinCheckBox(PawnUIFrame_DebugCheck)
	AS:SkinCheckBox(PawnUIFrame_ShowItemIDsCheck)

	--Resize Buttons
	PawnUI_InventoryPawnButton:Size(112, 20)
end

AS:RegisterSkin('Pawn', AS.Pawn)
