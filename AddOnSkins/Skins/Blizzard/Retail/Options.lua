if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_BindingUI(event, addon)
	if addon ~= 'Blizzard_BindingUI' then return end

	for _, v in pairs({ "defaultsButton", "unbindButton", "okayButton", "cancelButton" }) do
		AS:SkinButton(KeyBindingFrame[v])
	end

	AS:StripTextures(KeyBindingFrame.BG)
	AS:StripTextures(KeyBindingFrame.Header)
	AS:SkinFrame(KeyBindingFrame, nil, nil, true)

	AS:StripTextures(KeyBindingFrameScrollFrame)
	AS:SkinScrollBar(KeyBindingFrameScrollFrameScrollBar)

	AS:SkinCheckBox(KeyBindingFrame.characterSpecificButton)

	AS:SkinFrame(KeyBindingFrameCategoryList)
	AS:SkinFrame(KeyBindingFrame.bindingsContainer)
	KeyBindingFrame.bindingsContainer:SetBackdropColor(0, 0, 0, 0)

	for i = 1, KEY_BINDINGS_DISPLAYED, 1 do
		AS:SkinButton(_G["KeyBindingFrameKeyBinding"..i.."Key1Button"])
		AS:SkinButton(_G["KeyBindingFrameKeyBinding"..i.."Key2Button"])
	end

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_MacroUI(event, addon)
	if addon ~= 'Blizzard_MacroUI' then return end

	AS:SkinFrame(MacroFrame)
	MacroFrame:SetWidth(360)
	AS:SkinCloseButton(MacroFrame.CloseButton)

	AS:SkinFrame(MacroPopupFrame)
	MacroPopupFrame:SetHeight(MacroPopupFrame:GetHeight() + 15)
	AS:StripTextures(MacroPopupFrame.BorderBox)
	AS:SkinButton(MacroPopupFrame.BorderBox.OkayButton)
	AS:SkinButton(MacroPopupFrame.BorderBox.CancelButton)
	MacroPopupFrame.BorderBox.CancelButton:SetPoint("BOTTOMRIGHT", -11, 10)

	for i = 1, MAX_ACCOUNT_MACROS do
		AS:SkinIconButton(_G["MacroButton"..i])
	end

	AS:Delay(0, function()
		for i = 1, 90 do
			if _G["MacroPopupButton"..i] then
				AS:SkinIconButton(_G["MacroPopupButton"..i])
			end
		end
	end)

	local Buttons = { MacroDeleteButton, MacroNewButton, MacroExitButton, MacroEditButton, MacroSaveButton, MacroCancelButton }

	for _, Button in pairs(Buttons) do
		AS:SkinButton(Button)
	end

	for i = 1, 2 do
		AS:SkinButton(_G['MacroFrameTab'..i], true)
		_G['MacroFrameTab'..i]:SetHeight(22)
	end

	MacroFrameTab1:SetPoint("TOPLEFT", MacroFrame, "TOPLEFT", 85, -39)
	MacroFrameTab2:SetPoint("LEFT", MacroFrameTab1, "RIGHT", 4, 0)

	AS:StripTextures(MacroButtonScrollFrame)
	AS:SkinScrollBar(MacroButtonScrollFrameScrollBar)
	AS:SkinScrollBar(MacroFrameScrollFrameScrollBar)
	AS:SkinScrollBar(MacroPopupScrollFrameScrollBar)
	MacroPopupScrollFrame:SetHeight(MacroPopupScrollFrame:GetHeight() + 14)
	AS:StripTextures(MacroFrameInset)

	AS:SkinEditBox(MacroPopupEditBox)
	MacroPopupNameLeft:SetAlpha(0)
	MacroPopupNameMiddle:SetAlpha(0)
	MacroPopupNameRight:SetAlpha(0)

	AS:SkinBackdropFrame(MacroFrameTextBackground)
	MacroFrameTextBackground.Backdrop:SetPoint('TOPLEFT', 6, -3)
	MacroFrameTextBackground.Backdrop:SetPoint('BOTTOMRIGHT', 0, 1)
	AS:StripTextures(MacroPopupScrollFrame)

	MacroEditButton:ClearAllPoints()
	MacroEditButton:SetPoint("BOTTOMLEFT", MacroFrameSelectedMacroButton, "BOTTOMRIGHT", 10, 0)

	AS:SkinIconButton(MacroFrameSelectedMacroButton)

	AS:UnregisterSkinEvent(addon, event)
end

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

		AS:UnregisterSkinEvent(addon, event)
	end
	if event == 'PLAYER_ENTERING_WORLD' then
		-- Sytem / Interface Panel

	local OptionsFrames = { _G.InterfaceOptionsFrame, _G.InterfaceOptionsFrameCategories, _G.InterfaceOptionsFramePanelContainer, _G.InterfaceOptionsFrameAddOns, _G.VideoOptionsFrame, _G.VideoOptionsFrameCategoryFrame, _G.VideoOptionsFramePanelContainer, _G.Display_, _G.Graphics_, _G.RaidGraphics_ }
	local OptionsFrameBackdrops = { _G.AudioOptionsSoundPanelHardware, _G.AudioOptionsSoundPanelVolume, _G.AudioOptionsSoundPanelPlayback, _G.AudioOptionsVoicePanelTalking, _G.AudioOptionsVoicePanelListening, _G.AudioOptionsVoicePanelBinding }
	local OptionsButtons = { _G.GraphicsButton, _G.RaidButton }

	local InterfaceOptions = {
		_G.InterfaceOptionsFrame,
		_G.InterfaceOptionsControlsPanel,
		_G.InterfaceOptionsCombatPanel,
		_G.InterfaceOptionsCombatPanelEnemyCastBars,
		_G.InterfaceOptionsCombatTextPanel,
		_G.InterfaceOptionsDisplayPanel,
		_G.InterfaceOptionsObjectivesPanel,
		_G.InterfaceOptionsSocialPanel,
		_G.InterfaceOptionsActionBarsPanel,
		_G.InterfaceOptionsNamesPanel,
		_G.InterfaceOptionsNamesPanelFriendly,
		_G.InterfaceOptionsNamesPanelEnemy,
		_G.InterfaceOptionsNamesPanelUnitNameplates,
		_G.InterfaceOptionsBattlenetPanel,
		_G.InterfaceOptionsCameraPanel,
		_G.InterfaceOptionsMousePanel,
		_G.InterfaceOptionsHelpPanel,
		_G.InterfaceOptionsAccessibilityPanel,
		_G.VideoOptionsFrame,
		_G.Display_,
		_G.Graphics_,
		_G.RaidGraphics_,
		_G.Advanced_,
		_G.NetworkOptionsPanel,
		_G.InterfaceOptionsLanguagesPanel,
		_G.AudioOptionsSoundPanel,
		_G.AudioOptionsSoundPanelHardware,
		_G.AudioOptionsSoundPanelVolume,
		_G.AudioOptionsSoundPanelPlayback,
		_G.AudioOptionsVoicePanel,
		_G.AudioOptionsVoicePanelTalking,
		_G.AudioOptionsVoicePanelListening,
		_G.AudioOptionsVoicePanelBinding,
		_G.AudioOptionsVoicePanelMicTest,
		_G.AudioOptionsVoicePanelChatMode1,
		_G.AudioOptionsVoicePanelChatMode2,
		_G.CompactUnitFrameProfiles,
		_G.CompactUnitFrameProfilesGeneralOptionsFrame,
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

		AS:SkinFrame(ColorPickerFrame, nil, true)
		AS:SkinButton(ColorPickerOkayButton)
		AS:SkinButton(ColorPickerCancelButton)
		ColorPickerCancelButton:SetPoint("BOTTOMRIGHT", -11, 6)
		ColorPickerOkayButton:SetPoint("RIGHT", ColorPickerCancelButton, "LEFT", -3, 0)
		AS:SkinSlideBar(OpacitySliderFrame)
--		ColorPickerFrame.Header:SetTexture()

		AS:SkinFrame(OpacityFrame)

		-- Item Text Frame -- Needs Parchment
		AS:SkinFrame(ItemTextFrame, nil, nil, true)
		AS:StripTextures(ItemTextFrameInset)
		AS:StripTextures(ItemTextScrollFrame)
		AS:SkinScrollBar(ItemTextScrollFrameScrollBar)
		AS:SkinCloseButton(ItemTextFrameCloseButton)
		AS:SkinArrowButton(ItemTextPrevPageButton)
		AS:SkinArrowButton(ItemTextNextPageButton)
		ItemTextPageText:SetTextColor(1, 1, 1)
		ItemTextPageText.SetTextColor = AS.Noop

		-- Chat Config
		local ChatFrames = {
			_G.ChatConfigFrame,
			_G.ChatConfigCategoryFrame,
			_G.ChatConfigBackgroundFrame,
			_G.ChatConfigCombatSettingsFilters,
			_G.ChatConfigCombatSettingsFiltersScrollFrame,
			_G.CombatConfigColorsHighlighting,
			_G.CombatConfigColorsColorizeUnitName,
			_G.CombatConfigColorsColorizeSpellNames,
			_G.CombatConfigColorsColorizeDamageNumber,
			_G.CombatConfigColorsColorizeDamageSchool,
			_G.CombatConfigColorsColorizeEntireLine,
			_G.ChatConfigChatSettingsLeft,
			_G.ChatConfigOtherSettingsCombat,
			_G.ChatConfigOtherSettingsPVP,
			_G.ChatConfigOtherSettingsSystem,
			_G.ChatConfigOtherSettingsCreature,
			_G.ChatConfigChannelSettingsLeft,
			_G.CombatConfigMessageSourcesDoneBy,
			_G.CombatConfigColorsUnitColors,
			_G.CombatConfigMessageSourcesDoneTo,
		}

		local ChatButtons = {
			_G.ChatConfigFrameDefaultButton,
			_G.ChatConfigFrameRedockButton,
			_G.ChatConfigFrameOkayButton,
			_G.ChatConfigCombatSettingsFiltersDeleteButton,
			_G.ChatConfigCombatSettingsFiltersAddFilterButton,
			_G.ChatConfigCombatSettingsFiltersCopyFilterButton,
			_G.CombatConfigSettingsSaveButton,
			_G.CombatLogDefaultButton,
		}

		local ChatCheckBoxs = {
			_G.CombatConfigColorsHighlightingLine,
			_G.CombatConfigColorsHighlightingAbility,
			_G.CombatConfigColorsHighlightingDamage,
			_G.CombatConfigColorsHighlightingSchool,
			_G.CombatConfigColorsColorizeUnitNameCheck,
			_G.CombatConfigColorsColorizeSpellNamesCheck,
			_G.CombatConfigColorsColorizeSpellNamesSchoolColoring,
			_G.CombatConfigColorsColorizeDamageNumberCheck,
			_G.CombatConfigColorsColorizeDamageNumberSchoolColoring,
			_G.CombatConfigColorsColorizeDamageSchoolCheck,
			_G.CombatConfigColorsColorizeEntireLineCheck,
			_G.CombatConfigFormattingShowTimeStamp,
			_G.CombatConfigFormattingShowBraces,
			_G.CombatConfigFormattingUnitNames,
			_G.CombatConfigFormattingSpellNames,
			_G.CombatConfigFormattingItemNames,
			_G.CombatConfigFormattingFullText,
			_G.CombatConfigSettingsShowQuickButton,
			_G.CombatConfigSettingsSolo,
			_G.CombatConfigSettingsParty,
			_G.CombatConfigSettingsRaid,
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
		AS:SkinArrowButton(ChatConfigMoveFilterUpButton)
		AS:SkinArrowButton(ChatConfigMoveFilterDownButton)
		ChatConfigMoveFilterUpButton:SetSize(19, 19)
		ChatConfigMoveFilterDownButton:SetSize(19, 19)
		ChatConfigMoveFilterUpButton:SetPoint("TOPLEFT", "$parent", "BOTTOMLEFT", 0, -3)
		ChatConfigMoveFilterDownButton:SetPoint("LEFT", ChatConfigMoveFilterUpButton, "RIGHT", 3, 0)

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
	end
end

AS:RegisterSkin("Blizzard_BindingUI", AS.Blizzard_BindingUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_MacroUI', AS.Blizzard_MacroUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_Options', AS.Blizzard_Options, 'ADDON_LOADED')
