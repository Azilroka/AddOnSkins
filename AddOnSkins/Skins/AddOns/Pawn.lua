local AS, L, S, R = unpack(AddOnSkins)

function R:Pawn(event, addon)
	local Texture = "Interface\\AddOns\\Pawn\\Textures\\PawnLogo"

	if addon == 'Blizzard_InspectUI' or event == 'PLAYER_ENTERING_WORLD' and IsAddOnLoaded('Blizzard_InspectUI') then
		AS:Delay(0.1, function()
			S:HandleButton(PawnUI_InspectPawnButton, true)
			PawnUI_InspectPawnButton:SetNormalTexture(Texture)
			PawnUI_InspectPawnButton:GetNormalTexture():SetTexCoord(0, 1, 0, 1)
			PawnUI_InspectPawnButton:ClearAllPoints()
			PawnUI_InspectPawnButton:SetPoint('RIGHT', InspectFrameCloseButton, 'LEFT', -8, -4)
			PawnUI_InspectPawnButton:SetSize(40, 20)
		end)
	end

	if addon == 'Blizzard_ItemSocketingUI' or event == 'PLAYER_ENTERING_WORLD' and IsAddOnLoaded('Blizzard_ItemSocketingUI') then

		AS:Delay(0.1, function()
			S:HandleButton(PawnUI_SocketingPawnButton)
			PawnUI_SocketingPawnButton:SetSize(40, 20)
			PawnUI_SocketingPawnButton:SetNormalTexture(Texture)
			PawnUI_SocketingPawnButton:GetNormalTexture():SetTexCoord(0, 1, 0, 1)
			hooksecurefunc(ItemSocketingDescription, "SetSocketedItem", function()
				if (PawnSocketingTooltip and not PawnSocketingTooltip.skinned) then
					S:HandleTooltip(PawnSocketingTooltip)
					PawnSocketingTooltip.skinned = true
				end
			end)
		end)
	end

	if event == 'PLAYER_ENTERING_WORLD' then
		-- General
		S:HandleFrame(PawnUIFrame)
		S:HandleCloseButton(PawnUIFrame_TinyCloseButton)
		S:HandleScrollBar(PawnUIScaleSelectorScrollFrameScrollBar)
		S:HandleFrame(PawnUIStringDialogMultiLine)
		S:HandleEditBox(PawnUIStringDialogMultiLine_TextBox)
		S:HandleButton(PawnUIStringDialogMultiLine.OKButton)
		S:HandleButton(PawnUIStringDialogMultiLine.CancelButton)

		S:HandleButton(PawnUI_InventoryPawnButton)
		PawnUI_InventoryPawnButton:SetNormalTexture(Texture)
		PawnUI_InventoryPawnButton:SetSize(40, 20)
		PawnUI_InventoryPawnButton:GetNormalTexture():SetTexCoord(0, 1, 0, 1)

		for i = 1, PawnUIFrame.numTabs do
			S:HandleTab(_G["PawnUIFrameTab"..i])
		end

		-- Scale
		S:HandleButton(PawnUIFrame_RenameScaleButton)
		S:HandleButton(PawnUIFrame_DeleteScaleButton)
		S:HandleCheckBox(PawnUIFrame_ShowScaleCheck)
		S:HandleButton(PawnUIFrame_ImportScaleButton)
		S:HandleButton(PawnUIFrame_ExportScaleButton)
		S:HandleButton(PawnUIFrame_CopyScaleButton)
		S:HandleButton(PawnUIFrame_NewScaleFromDefaultsButton)
		S:HandleButton(PawnUIFrame_NewScaleButton)
		S:HandleButton(PawnUIFrame_AutoSelectScalesOnButton) -- huge button, with highlight
		S:HandleButton(PawnUIFrame_AutoSelectScalesOffButton) -- huge button, with highlight

		-- Weights
		S:HandleScrollBar(PawnUIFrame_StatsListScrollBar)
		S:HandleCheckBox(PawnUIFrame_NormalizeValuesCheck)
		S:HandleEditBox(PawnUIFrame_StatValueBox)
		S:HandleButton(PawnUIFrame_ClearValueButton)

		-- Compare
		S:HandleFrame(PawnUICompareItemIcon1, true)
		S:HandleFrame(PawnUICompareItemIcon2, true)
		S:HandleFrame(PawnUIFrame_ClearItemsButton, true)
		S:HandleButton(PawnUIFrame_CompareSwapButton)
		S:HandleScrollBar(PawnUICompareScrollFrameScrollBar)

		-- Gems
		S:HandleEditBox(PawnUIFrame_GemQualityLevelBox, 40, 20)
		S:HandleScrollBar(PawnUIGemScrollFrameScrollBar)

		-- Options
		S:HandleButton(PawnUIFrame_ResetUpgradesButton)
		S:HandleCheckBox(PawnUIFrame_EnchantedValuesCheck)
		S:HandleCheckBox(PawnUIFrame_ShowIconsCheck)
		S:HandleCheckBox(PawnUIFrame_ShowSpecIconsCheck)
		S:HandleCheckBox(PawnUIFrame_AlignRightCheck)
		S:HandleCheckBox(PawnUIFrame_ColorTooltipBorderCheck)
		S:HandleCheckBox(PawnUIFrame_ShowBagUpgradeAdvisorCheck)
		S:HandleCheckBox(PawnUIFrame_ShowLootUpgradeAdvisorCheck)
		S:HandleCheckBox(PawnUIFrame_ShowQuestUpgradeAdvisorCheck)
		S:HandleCheckBox(PawnUIFrame_ShowSocketingAdvisorCheck)
		S:HandleCheckBox(PawnUIFrame_IgnoreGemsWhileLevelingCheck)
		S:HandleCheckBox(PawnUIFrame_DebugCheck)
		S:HandleCheckBox(PawnUIFrame_ShowItemIDsCheck)
	end
end

AS:RegisterSkin('Pawn', nil, 'ADDON_LOADED')
