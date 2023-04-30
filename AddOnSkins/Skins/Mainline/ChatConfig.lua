local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local ipairs, pairs, next = ipairs, pairs, next

local FCF_GetCurrentChatFrame = FCF_GetCurrentChatFrame
local hooksecurefunc = hooksecurefunc

local function ReskinPickerOptions(self)
	local scrollTarget = self.ScrollBox.ScrollTarget
	if scrollTarget then
		for _, child in next, { scrollTarget:GetChildren() } do
			if not child.IsSkinned then
				child.UnCheck:SetTexture(nil)
				child.Highlight:SetColorTexture(1, .82, 0, 0.4)

				local check = child.Check
				if check then
					check:SetColorTexture(1, .82, 0, 0.8)
					check:SetSize(10, 10)
					S:Point(check, 'LEFT', 2, 0)
					S:CreateBackdrop(check)
				end

				child.IsSkinned = true
			end
		end
	end
end

local function HandleVoicePicker(voicePicker)
	local customFrame = voicePicker:GetChildren()
	S:HandleFrame(customFrame, true)
	voicePicker:HookScript('OnShow', ReskinPickerOptions)
end

function R:Blizzard_ChatConfig()
	if not AS:IsSkinEnabled('Blizzard_ChatConfig', 'blizzardOptions') then return end

	local ChatConfigFrame = _G.ChatConfigFrame
	S:HandleFrame(ChatConfigFrame)
	S:StripTextures(ChatConfigFrame.Header)

	hooksecurefunc('ChatConfig_UpdateCheckboxes', function(frame)
		if not FCF_GetCurrentChatFrame() then return end

		local nameString = frame:GetName()..'CheckBox'
		for index in ipairs(frame.checkBoxTable) do
			local checkBoxName = nameString..index
			local checkbox = _G[checkBoxName]
			if checkbox and not checkbox.IsSkinned then
				S:StripTextures(checkbox)
				S:HandleCheckBox(_G[checkBoxName..'Check'])

				checkbox.IsSkinned = true
			end
		end
	end)

	hooksecurefunc('ChatConfig_CreateTieredCheckboxes', function(frame, checkBoxTable)
		if frame.IsSkinned then return end

		local nameString = frame:GetName()..'CheckBox'
		for index, value in ipairs(checkBoxTable) do
			local checkBoxName = nameString..index
			S:HandleCheckBox(_G[checkBoxName])

			if value.subTypes then
				for i in ipairs(value.subTypes) do
					S:HandleCheckBox(_G[checkBoxName..'_'..i])
				end
			end
		end

		frame.IsSkinned = true
	end)

	hooksecurefunc(_G.ChatConfigFrameChatTabManager, 'UpdateWidth', function(frame)
		for tab in frame.tabPool:EnumerateActive() do
			if not tab.IsSkinned then
				S:StripTextures(tab)

				tab.IsSkinned = true
			end
		end
	end)

	for i = 1, 5 do
		local tab = _G['CombatConfigTab'..i]
		if tab then
			S:StripTextures(tab)

			local text = tab.Text
			if text then
				text:SetWidth(text:GetWidth() + 10)
			end
		end
	end

	for _, frame in pairs({ -- backdrops
		_G.ChatConfigCategoryFrame,
		_G.ChatConfigBackgroundFrame,
		_G.ChatConfigCombatSettingsFilters,
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
	}) do
		S:StripTextures(frame)
	end

	S:CreateBackdrop(_G.ChatConfigCategoryFrame)
	S:SetInside(_G.ChatConfigCategoryFrame.backdrop)

	S:CreateBackdrop(_G.ChatConfigBackgroundFrame)
	S:SetInside(_G.ChatConfigBackgroundFrame.backdrop)

	S:CreateBackdrop(_G.ChatConfigCombatSettingsFilters)
	S:SetInside(_G.ChatConfigCombatSettingsFilters.backdrop)

	for _, box in pairs({ -- combat boxes
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
		_G.CombatConfigSettingsRaid
	}) do
		S:HandleCheckBox(box)
	end

	hooksecurefunc('ChatConfig_UpdateSwatches', function(frame)
		if not frame.swatchTable then return end

		local nameString = frame:GetName()..'Swatch'
		for index in ipairs(frame.swatchTable) do
			local bu = _G[nameString..index]
			if bu and not bu.backdrop then
				S:HandleFrame(bu, true)
				S:SetInside(bu.backdrop)

				bu.backdrop = true
			end
		end
	end)

	S:HandleButton(_G.CombatLogDefaultButton)
	S:HandleButton(_G.ChatConfigCombatSettingsFiltersCopyFilterButton)
	S:HandleButton(_G.ChatConfigCombatSettingsFiltersAddFilterButton)
	S:HandleButton(_G.ChatConfigCombatSettingsFiltersDeleteButton)
	S:HandleButton(_G.CombatConfigSettingsSaveButton)
	S:HandleButton(_G.ChatConfigFrameOkayButton)
	S:HandleButton(_G.ChatConfigFrameDefaultButton)
	S:HandleButton(_G.ChatConfigFrameRedockButton)
	S:HandleButton(_G.ChatConfigFrame.ToggleChatButton)
	S:HandleNextPrevButton(_G.ChatConfigMoveFilterUpButton, 'up')
	S:HandleNextPrevButton(_G.ChatConfigMoveFilterDownButton, 'down')

	_G.ChatConfigMoveFilterUpButton:SetSize(22, 22)
	_G.ChatConfigMoveFilterDownButton:SetSize(22, 22)
	S:Point(_G.ChatConfigCombatSettingsFiltersAddFilterButton, 'RIGHT', _G.ChatConfigCombatSettingsFiltersDeleteButton, 'LEFT', -1, 0)
	S:Point(_G.ChatConfigCombatSettingsFiltersCopyFilterButton, 'RIGHT', _G.ChatConfigCombatSettingsFiltersAddFilterButton, 'LEFT', -1, 0)
	S:Point(_G.ChatConfigMoveFilterUpButton, 'TOPLEFT', _G.ChatConfigCombatSettingsFilters, 'BOTTOMLEFT', 3, 0)
	S:Point(_G.ChatConfigMoveFilterDownButton, 'LEFT', _G.ChatConfigMoveFilterUpButton, 'RIGHT', 1, 0)

	S:HandleEditBox(_G.CombatConfigSettingsNameEditBox)
	S:HandleRadioButton(_G.CombatConfigColorsColorizeEntireLineBySource)
	S:HandleRadioButton(_G.CombatConfigColorsColorizeEntireLineByTarget)
	S:HandleTrimScrollBar(_G.ChatConfigCombatSettingsFilters.ScrollBar)

	-- TextToSpeech
	S:StripTextures(_G.TextToSpeechButton)

	S:HandleButton(_G.TextToSpeechFramePlaySampleButton)
	S:HandleButton(_G.TextToSpeechFramePlaySampleAlternateButton)
	S:HandleButton(_G.TextToSpeechDefaultButton)
	S:HandleCheckBox(_G.TextToSpeechCharacterSpecificButton)

	S:HandleDropDownBox(_G.TextToSpeechFrameTtsVoiceDropdown)
	S:HandleDropDownBox(_G.TextToSpeechFrameTtsVoiceAlternateDropdown)
	S:HandleSliderFrame(_G.TextToSpeechFrameAdjustRateSlider)
	S:HandleSliderFrame(_G.TextToSpeechFrameAdjustVolumeSlider)

	for _, checkbox in pairs({ -- check boxes
		'PlayActivitySoundWhenNotFocusedCheckButton',
		'PlaySoundSeparatingChatLinesCheckButton',
		'AddCharacterNameToSpeechCheckButton',
		'NarrateMyMessagesCheckButton',
		'UseAlternateVoiceForSystemMessagesCheckButton',
	}) do
		S:HandleCheckBox(_G.TextToSpeechFramePanelContainer[checkbox])
	end

	hooksecurefunc('TextToSpeechFrame_UpdateMessageCheckboxes', function(frame)
		if not frame.checkBoxTable then return end

		local nameString = frame:GetName()..'CheckBox'
		for index in ipairs(frame.checkBoxTable) do
			local checkBox = _G[nameString..index]
			if checkBox and not checkBox.IsSkinned then
				S:HandleCheckBox(checkBox)

				checkBox.IsSkinned = true
			end
		end
	end)

	HandleVoicePicker(_G.TextToSpeechFrameTtsVoicePicker)
	HandleVoicePicker(_G.TextToSpeechFrameTtsVoiceAlternatePicker)

	S:StripTextures(_G.ChatConfigTextToSpeechChannelSettingsLeft)
end

AS:RegisterSkin('Blizzard_ChatConfig')
