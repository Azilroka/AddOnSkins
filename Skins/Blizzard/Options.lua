local AS = unpack(AddOnSkins)

function AS:Blizzard_Options(event, addon)
	if addon == 'Blizzard_GMSurveyUI' then
		AS:StripTextures(GMSurveyHeader)
		AS:SkinBackdropFrame(GMSurveyFrame)
		GMSurveyFrame.Backdrop:SetPoint("TOPLEFT", 0, 0)
		GMSurveyFrame.Backdrop:SetPoint("BOTTOMRIGHT", -44, 10)

		AS:SkinFrame(GMSurveyCommentFrame)

		AS:SkinButton(GMSurveySubmitButton)
		AS:SkinButton(GMSurveyCancelButton)

		AS:SkinCloseButton(GMSurveyCloseButton)
		AS:SkinBackdropFrame(GMSurveyScrollFrame)
		AS:SkinScrollBar(GMSurveyScrollFrameScrollBar)

		for i = 1, 11 do
			AS:StripTextures(_G["GMSurveyQuestion"..i])
		end
	end
	if event == 'PLAYER_ENTERING_WORLD' then
		-- Sytem / Interface Panel

		local OptionsFrames = { InterfaceOptionsFrame, InterfaceOptionsFrameCategories, InterfaceOptionsFramePanelContainer, InterfaceOptionsFrameAddOns, VideoOptionsFrame, VideoOptionsFrameCategoryFrame, VideoOptionsFramePanelContainer, Display_, Graphics_, RaidGraphics_ }
		local OptionsFrameBackdrops = { AudioOptionsSoundPanelHardware, AudioOptionsSoundPanelVolume, AudioOptionsSoundPanelPlayback, AudioOptionsVoicePanelTalking, AudioOptionsVoicePanelListening, AudioOptionsVoicePanelBinding }
		local OptionsButtons = { GraphicsButton, RaidButton }

		local InterfaceOptions = {
			InterfaceOptionsFrame,
			InterfaceOptionsControlsPanel,
			InterfaceOptionsCombatPanel,
			InterfaceOptionsCombatPanelEnemyCastBars,
			InterfaceOptionsCombatTextPanel,
			InterfaceOptionsDisplayPanel,
			InterfaceOptionsObjectivesPanel,
			InterfaceOptionsSocialPanel,
			InterfaceOptionsActionBarsPanel,
			InterfaceOptionsNamesPanel,
			InterfaceOptionsNamesPanelFriendly,
			InterfaceOptionsNamesPanelEnemy,
			InterfaceOptionsNamesPanelUnitNameplates,
			InterfaceOptionsBattlenetPanel,
			InterfaceOptionsCameraPanel,
			InterfaceOptionsMousePanel,
			InterfaceOptionsHelpPanel,
			InterfaceOptionsAccessibilityPanel,
			VideoOptionsFrame,
			Display_,
			Graphics_,
			RaidGraphics_,
			Advanced_,
			NetworkOptionsPanel,
			InterfaceOptionsLanguagesPanel,
			AudioOptionsSoundPanel,
			AudioOptionsSoundPanelHardware,
			AudioOptionsSoundPanelVolume,
			AudioOptionsSoundPanelPlayback,
			AudioOptionsVoicePanel,
			AudioOptionsVoicePanelTalking,
			AudioOptionsVoicePanelListening,
			AudioOptionsVoicePanelBinding,
			AudioOptionsVoicePanelMicTest,
			AudioOptionsVoicePanelChatMode1,
			AudioOptionsVoicePanelChatMode2,
		}

		for _, Frame in pairs(OptionsFrames) do
			AS:SkinFrame(Frame)
		end

		for _, Frame in pairs(OptionsFrameBackdrops) do
			AS:SkinBackdropFrame(Frame, nil, nil, nil, true)
		end

		for _, Tab in pairs(OptionsButtons) do
			AS:SkinButton(Tab)
		end

		for _, Panel in pairs(InterfaceOptions) do
			for i = 1, Panel:GetNumChildren() do
				local Child = select(i, Panel:GetChildren())
				if Child:IsObjectType('CheckButton') then
					AS:SkinCheckBox(Child)
				elseif Child:IsObjectType('Button') then
					AS:SkinButton(Child)
				elseif Child:IsObjectType('Slider') then
					AS:SkinSlideBar(Child, true)
				elseif Child:IsObjectType('Tab') then
					AS:SkinTab(Child)
				elseif Child:IsObjectType('Frame') and Child.Left and Child.Middle and Child.Right then
					AS:SkinDropDownBox(Child)
				end
			end
		end

		InterfaceOptionsFrameTab1:SetPoint('BOTTOMLEFT', InterfaceOptionsFrameCategories, 'TOPLEFT', 6, 1)
		InterfaceOptionsFrameTab2:SetPoint('TOPLEFT', InterfaceOptionsFrameTab1, 'TOPRIGHT', 1, 0)
		InterfaceOptionsSocialPanel.EnableTwitter.Logo:SetAtlas("WoWShare-TwitterLogo")

		-- -- Color Picker
		-- AS:SkinFrame(ColorPickerFrame, nil, true)
		-- AS:SkinButton(ColorPickerOkayButton)
		-- AS:SkinButton(ColorPickerCancelButton)
		-- ColorPickerCancelButton:SetPoint("BOTTOMRIGHT", -11, 6)
		-- ColorPickerOkayButton:SetPoint("RIGHT", ColorPickerCancelButton, "LEFT", -3, 0)
		-- AS:SkinFrame(OpacitySliderFrame)
		-- OpacitySliderFrame:GetThumbTexture():Size(14)
		-- OpacitySliderFrame:GetThumbTexture():SetTexture(unpack(AS.BorderColor))
		-- ColorPickerFrameHeader:SetTexture(nil)

		-- AS:SkinFrame(OpacityFrame)

		-- Item Text Frame -- Needs Parchment
		AS:SkinFrame(ItemTextFrame, nil, nil, true)
		AS:StripTextures(ItemTextFrameInset)
		AS:StripTextures(ItemTextScrollFrame)
		AS:SkinScrollBar(ItemTextScrollFrameScrollBar)
		AS:SkinCloseButton(ItemTextFrameCloseButton)
		AS:SkinNextPrevButton(ItemTextPrevPageButton)
		AS:SkinNextPrevButton(ItemTextNextPageButton)
		ItemTextPageText:SetTextColor(1, 1, 1)
		ItemTextPageText.SetTextColor = AS.Noop

		-- Chat Config
		local ChatFrames = {
			ChatConfigFrame,
			ChatConfigCategoryFrame,
			ChatConfigBackgroundFrame,
			ChatConfigCombatSettingsFilters,
			ChatConfigCombatSettingsFiltersScrollFrame,
			CombatConfigColorsHighlighting,
			CombatConfigColorsColorizeUnitName,
			CombatConfigColorsColorizeSpellNames,
			CombatConfigColorsColorizeDamageNumber,
			CombatConfigColorsColorizeDamageSchool,
			CombatConfigColorsColorizeEntireLine,
			ChatConfigChatSettingsLeft,
			ChatConfigOtherSettingsCombat,
			ChatConfigOtherSettingsPVP,
			ChatConfigOtherSettingsSystem,
			ChatConfigOtherSettingsCreature,
			ChatConfigChannelSettingsLeft,
			CombatConfigMessageSourcesDoneBy,
			CombatConfigColorsUnitColors,
			CombatConfigMessageSourcesDoneTo,
		}

		local ChatButtons = {
			ChatConfigFrameDefaultButton,
			ChatConfigFrameRedockButton,
			ChatConfigFrameOkayButton,
			ChatConfigCombatSettingsFiltersDeleteButton,
			ChatConfigCombatSettingsFiltersAddFilterButton,
			ChatConfigCombatSettingsFiltersCopyFilterButton,
			CombatConfigSettingsSaveButton,
			CombatLogDefaultButton,
		}

		local ChatCheckBoxs = {
			CombatConfigColorsHighlightingLine,
			CombatConfigColorsHighlightingAbility,
			CombatConfigColorsHighlightingDamage,
			CombatConfigColorsHighlightingSchool,
			CombatConfigColorsColorizeUnitNameCheck,
			CombatConfigColorsColorizeSpellNamesCheck,
			CombatConfigColorsColorizeSpellNamesSchoolColoring,
			CombatConfigColorsColorizeDamageNumberCheck,
			CombatConfigColorsColorizeDamageNumberSchoolColoring,
			CombatConfigColorsColorizeDamageSchoolCheck,
			CombatConfigColorsColorizeEntireLineCheck,
			CombatConfigFormattingShowTimeStamp,
			CombatConfigFormattingShowBraces,
			CombatConfigFormattingUnitNames,
			CombatConfigFormattingSpellNames,
			CombatConfigFormattingItemNames,
			CombatConfigFormattingFullText,
			CombatConfigSettingsShowQuickButton,
			CombatConfigSettingsSolo,
			CombatConfigSettingsParty,
			CombatConfigSettingsRaid,
		}

		for _, Frame in pairs(ChatFrames) do
			AS:SkinFrame(Frame)
		end

		for _, CheckBox in pairs(ChatCheckBoxs) do
			AS:SkinCheckBox(CheckBox)
		end

		for _, Button in pairs(ChatButtons) do
			AS:SkinButton(Button)
		end

		for i in pairs(COMBAT_CONFIG_TABS) do
			AS:SkinTab(_G["CombatConfigTab"..i])
			_G["CombatConfigTab"..i].Backdrop:SetPoint("TOPLEFT", 0, -10)
			_G["CombatConfigTab"..i].Backdrop:SetPoint("BOTTOMRIGHT", -2, 3)
			_G["CombatConfigTab"..i.."Text"]:SetPoint("BOTTOM", 0, 10)
		end

		CombatConfigTab1:ClearAllPoints()
		CombatConfigTab1:SetPoint("BOTTOMLEFT", ChatConfigBackgroundFrame, "TOPLEFT", 6, -2)

		AS:SkinEditBox(CombatConfigSettingsNameEditBox)
		AS:SkinNextPrevButton(ChatConfigMoveFilterUpButton, true)
		AS:SkinNextPrevButton(ChatConfigMoveFilterDownButton, true)

		ChatConfigFrameOkayButton:SetPoint("RIGHT", "$parentCancelButton", "RIGHT", -1, -3)
		ChatConfigFrameDefaultButton:SetPoint("BOTTOMLEFT", 12, 10)
		ChatConfigCombatSettingsFiltersDeleteButton:SetPoint("TOPRIGHT", "$parent", "BOTTOMRIGHT", -3, -1)
		ChatConfigCombatSettingsFiltersAddFilterButton:SetPoint("RIGHT", "$parentDeleteButton", "LEFT", -2, 0)
		ChatConfigCombatSettingsFiltersCopyFilterButton:SetPoint("RIGHT", "$parentAddFilterButton", "LEFT", -2, 0)

		ChatConfigFrame:HookScript("OnShow", function()
			for tab in ChatConfigFrameChatTabManager.tabPool:EnumerateActive() do
				AS:SkinButton(tab, true)
			end
		end)

		hooksecurefunc('ChatConfig_UpdateCheckboxes', function(frame)
			if ( not FCF_GetCurrentChatFrame() ) then
				return
			end
			for index in ipairs(frame.checkBoxTable) do
				local checkBoxNameString = frame:GetName().."CheckBox"
				local checkBoxName = checkBoxNameString..index
				local checkBox = _G[checkBoxName]
				local check = _G[checkBoxName.."Check"]
				if checkBox and not checkBox.isSkinned then
					AS:StripTextures(checkBox)
					AS:SkinCheckBox(check)
					if _G[checkBoxName.."ColorClasses"] then
						AS:SkinCheckBox(_G[checkBoxName.."ColorClasses"])
					end
					checkBox.isSkinned = true
				end
			end
		end)

		hooksecurefunc('ChatConfig_UpdateTieredCheckboxes', function(frame, index)
			local group = frame.checkBoxTable[index]
			local checkBox = _G[frame:GetName().."CheckBox"..index]
			if ( checkBox ) then
				AS:SkinCheckBox(checkBox)
			end
			if ( group.subTypes ) then
				for k in ipairs(group.subTypes) do
					AS:SkinCheckBox(_G[frame:GetName().."CheckBox"..index.."_"..k])
				end
			end
		end)

		hooksecurefunc('ChatConfig_UpdateSwatches', function(frame)
			if ( not FCF_GetCurrentChatFrame() ) then
				return
			end
			for index in ipairs(frame.swatchTable) do
				AS:StripTextures(_G[frame:GetName().."Swatch"..index])
			end
		end)

		-- Help
		AS:SkinFrame(HelpFrame, nil, nil, true)
		AS:SkinCloseButton(HelpFrameCloseButton)
		AS:SkinCloseButton(HelpFrameKnowledgebaseErrorFrameCloseButton)

		local HelpFrames = {
			HelpFrameLeftInset,
			HelpFrameMainInset,
			HelpFrameKnowledgebase,
			HelpFrameKnowledgebaseErrorFrame,
		}

		local HelpButtons = {
			HelpFrameAccountSecurityOpenTicket,
			HelpFrameOpenTicketHelpTopIssues,
			HelpFrameOpenTicketHelpOpenTicket,
			HelpFrameKnowledgebaseSearchButton,
			HelpFrameKnowledgebaseNavBarHomeButton,
			HelpFrameCharacterStuckStuck,
			GMChatOpenLog,
			HelpFrameTicketSubmit,
			HelpFrameTicketCancel,
			HelpFrameSubmitSuggestionSubmit,
		}

		for _, Frame in pairs(HelpFrames) do
			AS:SkinFrame(Frame, nil, nil, true)
		end

		AS:StripTextures(HelpFrameHeader)

		for _, Button in pairs(HelpButtons) do
			AS:SkinButton(Button, true)

			if Button.text then
				Button.text:ClearAllPoints()
				Button.text:SetPoint("CENTER")
				Button.text:SetJustifyH("CENTER")
			end
		end

		local HelpSideButtons = { 1, 2, 3, 4, 5, 6, 16 }

		for _, Num in pairs(HelpSideButtons) do
			local Button = HelpFrame['button'..Num]
			Button.selected:SetTexture('')
			Button:SetNormalTexture('')
			Button:SetPushedTexture('')
			Button:SetHighlightTexture('')
			Button:SetDisabledTexture('')
			AS:SetTemplate(Button)
		end

		local point, relativeTo, relativePoint, xOffset, yOffset = HelpFrameButton6:GetPoint()
		HelpFrameButton6:SetPoint(point, relativeTo, relativePoint, xOffset + 2, yOffset)

		hooksecurefunc('HelpFrame_SetSelectedButton', function(Button)
			for _, Num in pairs(HelpSideButtons) do
				HelpFrame['button'..Num]:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
			Button:SetBackdropBorderColor(0, 0.44, .87)
		end)

		HelpFrameCharacterStuckHearthstone:SetHighlightTexture(nil)
		HelpFrameCharacterStuckHearthstone.SetHighlightTexture = AS.Noop
		AS:SkinButton(HelpFrameCharacterStuckHearthstone)
		HelpFrameCharacterStuckHearthstone.IconTexture:SetInside()
		AS:SkinTexture(HelpFrameCharacterStuckHearthstone.IconTexture)

		for _, Frame in pairs({ HelpFrameSubmitSuggestion, HelpFrameReportBug }) do
			for i = 1, Frame:GetNumChildren() do
				local Child = select(i, Frame:GetChildren())
				if Child and Child:IsObjectType('Frame') and not Child:GetName() then
					AS:SkinFrame(Child)
				end
			end
		end

		AS:SkinButton(HelpFrameReportBugSubmit)
		AS:SkinScrollBar(HelpFrameSubmitSuggestionScrollFrameScrollBar)
		AS:SkinScrollBar(HelpFrameReportBugScrollFrameScrollBar)

		local NavButtons = {
			HelpBrowserNavHome,
			HelpBrowserNavReload,
			HelpBrowserNavStop,
			HelpBrowserBrowserSettings,
		}

		for _, Button in pairs(NavButtons) do
			AS:CreateBackdrop(Button)
			Button.Backdrop:SetInside(Button, 3, 3)
			Button:SetNormalTexture('')
			Button:SetPushedTexture('')
			Button:SetHighlightTexture('')
			Button:SetDisabledTexture('')
		end

		for _, Button in pairs({ HelpBrowserNavBack, HelpBrowserNavForward }) do
			AS:SkinNextPrevButton(Button)
		end

		AS:SkinFrame(BrowserSettingsTooltip)
		AS:SkinButton(BrowserSettingsTooltip.CookiesButton, true)
		AS:SkinButton(BrowserSettingsTooltip.CacheButton, true)
	end
end

AS:RegisterSkin('Blizzard_Options', AS.Blizzard_Options, 'ADDON_LOADED')
