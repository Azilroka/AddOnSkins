local AS = unpack(AddOnSkins)

--[[
function AS:Blizzard_BindingUI() -- ADDON_LOADED Blizzard_BindingUI
	local buttons = {
		"KeyBindingFrameDefaultButton",
		"KeyBindingFrameUnbindButton",
		"KeyBindingFrameOkayButton",
		"KeyBindingFrameCancelButton",
	}

	for _, v in pairs(buttons) do
		AS:StripTextures(_G[v])
		AS:SkinButton(_G[v])
	end

	AS:SkinCheckBox(KeyBindingFrameCharacterButton)
	KeyBindingFrameHeaderText:ClearAllPoints()
	KeyBindingFrameHeaderText:SetPoint("TOP", KeyBindingFrame, "TOP", 0, -4)
	AS:StripTextures(KeyBindingFrame)
	AS:SetTemplate(KeyBindingFrame, 'Default')

	for i = 1, KEY_BINDINGS_DISPLAYED  do
		local button1 = _G["KeyBindingFrameBinding"..i.."Key1Button"]
		local button2 = _G["KeyBindingFrameBinding"..i.."Key2Button"]
		AS:StripTextures(button1, true)
		AS:StyleButton(button1)
		AS:SetTemplate(button1, 'Default', true)
		AS:StripTextures(button2, true)
		AS:StyleButton(button2)
		AS:SetTemplate(button2, 'Default', true)
	end

	KeyBindingFrameUnbindButton:SetPoint("RIGHT", KeyBindingFrameOkayButton, "LEFT", -3, 0)
	KeyBindingFrameOkayButton:SetPoint("RIGHT", KeyBindingFrameCancelButton, "LEFT", -3, 0)

	AS:SkinScrollBar(KeyBindingFrameScrollFrameScrollBar)
end
]]
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

		local OptionsFrames = {
			InterfaceOptionsFrame,
			InterfaceOptionsFrameCategories,
			InterfaceOptionsFramePanelContainer,
			InterfaceOptionsFrameAddOns,
			VideoOptionsFrame,
			VideoOptionsFrameCategoryFrame,
			VideoOptionsFramePanelContainer,
			Display_,
			Graphics_,
			RaidGraphics_,
		}

		for _, Frame in pairs(OptionsFrames) do
			AS:SkinFrame(Frame)
		end

		local OptionsFrameBackdrops = {
			AudioOptionsSoundPanelHardware,
			AudioOptionsSoundPanelVolume,
			AudioOptionsSoundPanelPlayback,
			AudioOptionsVoicePanelTalking,
			AudioOptionsVoicePanelListening,
			AudioOptionsVoicePanelBinding,
		}

		for _, Frame in pairs(OptionsFrameBackdrops) do
			AS:SkinBackdropFrame(Frame)
			Frame.Backdrop:SetAllPoints()
		end

		local OptionsTabs = {
			InterfaceOptionsFrameTab1,
			InterfaceOptionsFrameTab2,
			GraphicsButton,
			RaidButton,
		}

		for _, Tab in pairs(OptionsTabs) do
			AS:SkinTab(Tab, true)
		end

		local a, b, c, d, e = InterfaceOptionsFrameTab1:GetPoint()
		InterfaceOptionsFrameTab1:SetPoint(a, b, c, d, e + 2)

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

		for _, Panel in pairs(InterfaceOptions) do
			for i = 1, Panel:GetNumChildren() do
				local Child = select(i, Panel:GetChildren())
				if Child:IsObjectType('CheckButton') then
					AS:SkinCheckBox(Child)
				elseif Child:IsObjectType('Button') then
					AS:SkinButton(Child)
				elseif Child:IsObjectType('Slider') then
					AS:SkinSlideBar(Child, nil, true)
				elseif Child:IsObjectType('Tab') then
					AS:SkinTab(Child)
				elseif Child:IsObjectType('Frame') and Child:GetName() and strfind(Child:GetName(), 'DropDown') then
					AS:SkinDropDownBox(Child)
				end
			end
		end

		Graphics_Quality:HookScript('OnUpdate', function()
			AS:StripTextures(Graphics_Quality, true)
			if Graphics_RightQuality then
				AS:StripTextures(Graphics_RightQuality, true)
			end
		end)

		RaidGraphics_Quality:HookScript('OnUpdate', function()
			AS:StripTextures(RaidGraphics_Quality, true)
			if RaidGraphics_RightQuality then
				AS:StripTextures(RaidGraphics_RightQuality, true)
			end
		end)

		local InterfaceOptionsDropDowns = {
			InterfaceOptionsObjectivesPanelQuestSorting,
			InterfaceOptionsSocialPanelChatStyle,
			InterfaceOptionsSocialPanelTimestamps,
			InterfaceOptionsSocialPanelWhisperMode,
			InterfaceOptionsSocialPanelBnWhisperMode,
			Advanced_MultisampleAlphaTest,
		}

		for _, DropDown in pairs(InterfaceOptionsDropDowns) do
			AS:SkinDropDownBox(DropDown)
		end

		InterfaceOptionsDisplayPanelOutlineDropDown:SetWidth(210)
		InterfaceOptionsNamesPanelUnitNameplatesMotionDropDown:SetWidth(190)
		AudioOptionsVoicePanelChatModeDropDown:SetWidth(190)
		AudioOptionsSoundPanelHardwareDropDown:SetWidth(190)
		AudioOptionsSoundPanelSoundChannelsDropDown:SetWidth(190)

		AS:StripTextures(LoopbackVUMeter:GetParent())
		AS:SkinStatusBar(LoopbackVUMeter)

		-- Color Picker
		AS:SkinFrame(ColorPickerFrame, nil, true)
		AS:SkinButton(ColorPickerOkayButton)
		AS:SkinButton(ColorPickerCancelButton)
		ColorPickerCancelButton:SetPoint("BOTTOMRIGHT", -11, 6)
		ColorPickerOkayButton:SetPoint("RIGHT", ColorPickerCancelButton, "LEFT", -3, 0)
		AS:SkinFrame(OpacitySliderFrame)
		OpacitySliderFrame:GetThumbTexture():Size(14)
		OpacitySliderFrame:GetThumbTexture():SetTexture(unpack(AS.BorderColor))
		ColorPickerFrameHeader:SetTexture(nil)

		AS:SkinFrame(OpacityFrame)

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
			CombatConfigMessageSourcesDoneBy,
			CombatConfigMessageSourcesDoneTo,
			CombatConfigColorsUnitColors,
		}

		for _, Frame in pairs(ChatFrames) do
			AS:SkinFrame(Frame)
		end

		AS:StripTextures(ChatConfigChatSettingsClassColorLegend)
		AS:StripTextures(ChatConfigChannelSettingsClassColorLegend)
		AS:StripTextures(ChatConfigChatSettingsLeft)
		AS:StripTextures(ChatConfigChannelSettingsLeft)
		AS:StripTextures(ChatConfigOtherSettingsCombat)
		AS:StripTextures(ChatConfigOtherSettingsPVP)
		AS:StripTextures(ChatConfigOtherSettingsSystem)
		AS:StripTextures(ChatConfigOtherSettingsCreature)

		local Colors = {
			CombatConfigColorsColorizeSpellNames,
			CombatConfigColorsColorizeDamageNumber,
			CombatConfigColorsColorizeDamageSchool,
			CombatConfigColorsColorizeEntireLine,
		}

		for _, Frame in pairs(Colors) do
			local point, relativeTo, relativePoint, xOffset, yOffset = Frame:GetPoint()
			Frame:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset - 2)
		end

		hooksecurefunc('ChatConfig_UpdateCheckboxes', function(frame)
			if ( not FCF_GetCurrentChatFrame() ) then
				return
			end
			for index, value in ipairs(frame.checkBoxTable) do
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
			local groupChecked
			local baseName = frame:GetName().."CheckBox"..index
			local checkBox = _G[baseName]
			if ( checkBox ) then
				AS:SkinCheckBox(checkBox)
			end
			if ( group.subTypes ) then
				for k, v in ipairs(group.subTypes) do
					local subCheckBox = _G[baseName.."_"..k]
					AS:SkinCheckBox(subCheckBox)
				end
			end
		end)

		hooksecurefunc('ChatConfig_UpdateSwatches', function(frame)
			if ( not FCF_GetCurrentChatFrame() ) then
				return
			end
			local table = frame.swatchTable
			local nameString = frame:GetName().."Swatch"
			for index, value in ipairs(table) do
				local baseName = nameString..index
				AS:StripTextures(_G[baseName])
			end
		end)

		for i = 1, #COMBAT_CONFIG_TABS do
			local Tab = _G["CombatConfigTab"..i]
			if Tab then
				AS:SkinTab(Tab)
				Tab:SetHeight(Tab:GetHeight()-2)
				Tab:SetWidth(math.ceil(Tab:GetWidth()+1.6))
				_G["CombatConfigTab"..i.."Text"]:SetPoint("BOTTOM", 0, 10)
			end
		end

		CombatConfigTab1:SetPoint("BOTTOMLEFT", ChatConfigBackgroundFrame, "TOPLEFT", 6, -2)

		local ChatButtons = {
			ChatConfigFrameOkayButton,
			ChatConfigFrameDefaultButton,
			CombatLogDefaultButton,
			ChatConfigCombatSettingsFiltersDeleteButton,
			ChatConfigCombatSettingsFiltersAddFilterButton,
			ChatConfigCombatSettingsFiltersCopyFilterButton,
			CombatConfigSettingsSaveButton,
		}

		for _, Button in pairs(ChatButtons) do
			AS:SkinButton(Button)
		end

		ChatConfigFrameOkayButton:SetPoint("RIGHT", "$parentCancelButton", "RIGHT", -1, -3)
		ChatConfigFrameDefaultButton:SetPoint("BOTTOMLEFT", 12, 10)
		ChatConfigCombatSettingsFiltersDeleteButton:SetPoint("TOPRIGHT", "$parent", "BOTTOMRIGHT", -3, -1)
		ChatConfigCombatSettingsFiltersAddFilterButton:SetPoint("RIGHT", "$parentDeleteButton", "LEFT", -2, 0)
		ChatConfigCombatSettingsFiltersCopyFilterButton:SetPoint("RIGHT", "$parentAddFilterButton", "LEFT", -2, 0)

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

		for _, CheckBox in pairs(ChatCheckBoxs) do
			AS:SkinCheckBox(CheckBox)
		end

		AS:SkinNextPrevButton(ChatConfigMoveFilterUpButton, true)
		AS:SkinNextPrevButton(ChatConfigMoveFilterDownButton, true)
		ChatConfigMoveFilterUpButton:SetSize(19, 19)
		ChatConfigMoveFilterDownButton:SetSize(19, 19)
		ChatConfigMoveFilterUpButton:SetPoint("TOPLEFT", "$parent", "BOTTOMLEFT", 0, -3)
		ChatConfigMoveFilterDownButton:SetPoint("LEFT", ChatConfigMoveFilterUpButton, "RIGHT", 3, 0)

		AS:SkinEditBox(CombatConfigSettingsNameEditBox)

		AS:SkinScrollBar(ChannelRosterScrollFrameScrollBar)

		-- Channel Pullout
		ChannelPulloutBackground:Hide()
		AS:SkinFrame(ChannelPullout)
		AS:SkinCloseButton(ChannelPulloutCloseButton)
		AS:SkinTab(ChannelPulloutTab)

		-- Help
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

		local HelpSideButtons = {
			HelpFrameButton1,
			HelpFrameButton2,
			HelpFrameButton3,
			HelpFrameButton4,
			HelpFrameButton5,
			HelpFrameButton6,
			HelpFrameButton16,
		}

		for _, Button in pairs(HelpSideButtons) do
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
			for _, Button in pairs(HelpSideButtons) do
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
			Button:SetBackdropBorderColor(0, 0.44, .87)
		end)

		AS:SkinFrame(HelpFrame, nil, nil, true)
		AS:SkinCloseButton(HelpFrameCloseButton)
		AS:SkinCloseButton(HelpFrameKnowledgebaseErrorFrameCloseButton)

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
