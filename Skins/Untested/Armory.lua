local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Armory') then return end

function AS:Armory()

	local hideParchment = true

	local function SetItemBorder(object, quality)
		if quality and quality > 1 then 
			object:SetBackdropBorderColor(GetItemQualityColor(quality))
		else
			object:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end

	local function SkinInventoryLine(object)
		object:SetHighlightFontObject(object:GetNormalFontObject())
		AS:SkinTexute(object:GetNormalTexture())
		object:GetNormalTexture():SetSize(14, 14)
		object:GetDisabledTexture():Height(6)
	end

	local function SkinSearchBox(editBox, width)
		local frame = editBox:GetParent()
		AS:SkinEditBox(editBox)
		editBox:SetSize(width or editBox:GetWidth(), editBox:GetHeight() - 5)
		editBox:SetAutoFocus(true)
		editBox:Hide()
		frame.editBox = editBox

		frame.searchLabel = frame:CreateFontString(nil, "ARTWORK")
		frame.searchLabel:SetFontObject(editBox:GetFontObject())
		frame.searchLabel:SetAllPoints(editBox)
		frame.searchLabel:SetJustifyH("LEFT")
		frame.searchLabel:SetText("|cff9999ff" .. SEARCH)

		frame.OpenSearchBox = function(self)
			self.searchLabel:Hide()
			self.editBox:Show()
			self.editBox:SetFocus()
		end

		frame.CloseSearchBox = function(self)
			self.editBox:Hide()
			self.searchLabel:Show()
		end

		local button = CreateFrame("Button", nil, frame)
		button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		button:SetAllPoints(frame.searchLabel)
		button:SetScript("OnClick", function(self, button)
			local frame = self:GetParent()
			if button == "RightButton" then
				frame:OpenSearchBox()
			elseif frame.editBox:IsShown() then
				frame:CloseSearchBox()
			else
				frame:OpenSearchBox(self)
			end
		end)

		editBox:HookScript("OnEditFocusLost", function(self)
			self:GetParent():CloseSearchBox()
		end)
	end

	local function SkinArmoryFrame(frame, isSideFrame)
		local closeButton = _G[frame:GetName().."CloseButton"] or _G[frame:GetName():gsub("Frame", "CloseButton")]
		local title = _G[frame:GetName().."TitleText"] or _G[frame:GetName():gsub("Frame", "TitleText")]
		AS:SkinCloseButton(closeButton)
		AS:SkinFrame(frame)
		frame:SetSize(338, 424)
		closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 3, 3)
		title:ClearAllPoints()
		title:SetPoint("TOP", frame, "TOP", 0, -3)
		if isSideFrame then
			frame:SetPoint("TOPLEFT", ArmoryFrame, "TOPRIGHT", 45, 0)
		end
	end

	local function ColorItemBorder(b, link)
		local quality, _
		if link then
			_, _, quality = GetItemInfo(link)
		end
		SetItemBorder(b, quality or Armory:GetQualityFromLink(link))
	end

	local function SkinMisc()
		local skins = {
			"StaticPopup",
			"DropDownList1MenuBackdrop",
			"DropDownList2MenuBackdrop",
			"DropDownList1Backdrop",
			"DropDownList2Backdrop"
		}

		for _, skin in ipairs(skins) do
			AS:SetTemplate(_G["Armory"..skin], 'Transparent')
		end

		AS:SkinButton(ArmoryStaticPopupButton1)
		AS:SkinButton(ArmoryStaticPopupButton2)
	end

	local function SkinOptions()
		local checkBoxes = {
			"PanelEnable",
			"PanelSearchAll",
			"PanelLastViewed",
			"PanelPerCharacter",
			"PanelShowAltEquip",
			"PanelShowUnequip",
			"PanelShowEqcTooltips",
			"PanelPauseInCombat",
			"PanelPauseInInstance",
			"PanelScanOnEnter",
			"PanelFactionFilter",
			"MinimapPanelMinimapButton",
			"MinimapPanelGlobalMinimapButton",
			"MinimapPanelHideIfToolbar",
			"ModulePanelInventory",
			"ModulePanelQuestLog",
			"ModulePanelSpellBook",
			"ModulePanelTradeSkills",
			"ModulePanelSocial",
			"ModulePanelSharing",
			"ModulePanelPets",
			"ModulePanelTalents",
			"ModulePanelPVP",
			"ModulePanelReputation",
			"ModulePanelRaid",
			"ModulePanelCurrency",
			"ModulePanelBuffs",
			"ModulePanelAchievements",
			"ModulePanelStatistics",
			"SharePanelShareProfessions",
			"SharePanelShareQuests",
			"SharePanelShareCharacter",
			"SharePanelShareItems",
			"SharePanelShareAsAlt",
			"SharePanelChannelCheck",
			"SharePanelShareInInstance",
			"SharePanelShareInCombat",
			"SharePanelShowShareMessages",
			"SharePanelShareAll",
			"SharePanelShareGuild",
			"TooltipPanelItemCountPerSlot",
			"TooltipPanelGlobalItemCount",
			"TooltipPanelCrossFactionItemCount",
			"TooltipPanelShowSecondarySkillRank",
			"TooltipPanelShowGearSets",
			"TooltipPanelShowGems",
			"FindPanelSearchWindow",
			"FindPanelSearchRealms",
			"FindPanelSearchExtended",
			"FindPanelSearchRestrictive",
			"FindPanelSearchAltClick",
			"ExpirationPanelIgnoreAlts",
			"ExpirationPanelCheckVisit",
			"ExpirationPanelExcludeVisit",
			"ExpirationPanelLogonVisit",
			"ExpirationPanelCheckCount",
			"ExpirationPanelHideCount",
			"ExpirationPanelLogonCount",
			"SummaryPanelSummary",
			"SummaryPanelSummaryClass",
			"SummaryPanelSummaryLevel",
			"SummaryPanelSummaryItemLevel",
			"SummaryPanelSummaryZone",
			"SummaryPanelSummaryXP",
			"SummaryPanelSummaryPlayed",
			"SummaryPanelSummaryOnline",
			"SummaryPanelSummaryMoney",
			"SummaryPanelSummaryCurrency",
			"SummaryPanelSummaryQuest",
			"SummaryPanelSummaryExpiration",
			"SummaryPanelSummaryEvents",
			"SummaryPanelSummaryTradeSkills",
			"MiscPanelLDBLabel",
			"MiscPanelEncoding",
			"MiscPanelEnhancedTips",
			"MiscPanelCooldownEvents",
			"MiscPanelCheckCooldowns",
			"MiscPanelEventWarnings",
			"MiscPanelUseEventLocalTime",
			"MiscPanelExtendedTradeSkills",
			"MiscPanelOverlay",
			"MiscPanelMaziel",
			"MiscPanelCheckButton",
		}

		local sliders = {
			"PanelScaleSlider",
			"MinimapPanelAngleSlider",
			"MinimapPanelRadiusSlider",
			"ExpirationPanelExpDaysSlider",
			"SummaryPanelDelaySlider",
		}

		local dropDownBoxes = {
			"FindPanelDefaultSearchTypeDropDown",
			"MiscPanelWarningSoundDropDown",
		}

		local swatches = {
			"TooltipPanelShowItemCount",
			"TooltipPanelShowItemCountTotals",
			"TooltipPanelShowKnownBy",
			"TooltipPanelShowHasSkill",
			"TooltipPanelShowCanLearn",
			"TooltipPanelShowCrafters",
			"TooltipPanelShowSkillRank",
			"TooltipPanelShowQuestAlts",
			"TooltipPanelShowAchievements",
			"TooltipPanelAchievementProgressColor",
		}

		local buttons = {
			"PanelResetScreen",
			"ExpirationPanelCheck",
		}

		local editBoxes = {
			"ArmoryOptionsSharePanelChannelName",
		}

		for _, name in ipairs(checkBoxes) do
			AS:SkinCheckBox(_G["ArmoryOptions"..name])
		end

		for _, name in ipairs(sliders) do
			AS:SkinSliderFrame(_G["ArmoryOptions"..name])
		end

		for _, name in ipairs(dropDownBoxes) do
			AS:SkinDropDownBox(_G["ArmoryOptions"..name])
		end

		for _, name in ipairs(swatches) do
			AS:SkinCheckBox(_G["ArmoryOptions"..name.."Check"])
		end

		for _, name in ipairs(buttons) do
			AS:SkinButton(_G["ArmoryOptions"..name])
		end

		for _, name in ipairs(editBoxes) do
			AS:SkinEditBox(_G[name], _G[name]:GetHeight() - 5)
		end
	end

	local function SkinComparisonTooltips()
		AS:SkinFrame(ArmoryComparisonTooltip1, 'Default')
		AS:SkinFrame(ArmoryComparisonTooltip2, 'Default')

		local function AdjustTooltip(tt)
			local _, link = tt:GetItem()
			local point, relativeTo, relativePoint, x, y = tt:GetPoint()
			local xAdd = point:find("LEFT") and 2 or -2
			tt:ClearAllPoints()
			tt:SetPoint(point, relativeTo, relativePoint, x + xAdd, y)
			ColorItemBorder(tt, link)
		end

		ArmoryComparisonTooltip1:HookScript("OnShow", AdjustTooltip)
		ArmoryComparisonTooltip2:HookScript("OnShow", AdjustTooltip)
	end

	local function SkinMinimapButton()
		ArmoryMinimapButton:Hide()
		ArmoryMinimapButton:HookScript("OnShow", function(self) self:Hide() end)

		local disabled = function() return true end

		ArmoryOptionsMinimapPanelMinimapButton.disabledFunc = disabled
		ArmoryOptionsMinimapPanelGlobalMinimapButton.disabledFunc = disabled
		ArmoryOptionsMinimapPanelAngleSlider.disabledFunc = disabled
		ArmoryOptionsMinimapPanelRadiusSlider.disabledFunc = disabled

		ArmoryOptionsPanel_Refresh(ArmoryOptionsMinimapPanel)
	end

	local function SkinSkillFrame(frame)
		local name = frame:GetName()
		_G[name.."BackgroundBar"]:Kill()
		AS:SkinStatusBar(_G[name.."Bar"])
	end

	local function SkinStatFrame(suffix)
		local frame = _G["ArmoryAttributes"..suffix.."Frame"]
		local scrollBar = _G["ArmoryAttributes"..suffix.."FrameScrollFrameScrollBar"]
		AS:StripTextures(frame)
		frame:SetWidth(frame:GetWidth() + 6)

		AS:SkinSlideBar(scrollBar)
		AS:SetTemplate(scrollBar, 'Default')
		scrollBar:SetScript("OnShow", function(self)
			self:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -3, -2)
			self:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -3, 2)
		end)
	end

	local function SkinStatDropDown(suffix)
		local frame = _G["ArmoryAttributes"..suffix.."FramePlayerStatDropDown"]
		local y, width
		if suffix == "OverlayTop" then
			y = -5
			width = 229
		else
			y = -10
			width = 263
		end
		AS:SkinDropDownBox(frame, width)
		frame:SetPoint("BOTTOMLEFT", "ArmoryAttributes"..suffix.."FrameTop", "TOPLEFT", -21, y)
		AS:SetTemplate(ArmoryDropDownList1, 'Transparent')
		SkinStatFrame(suffix)
	end

	local function SkinPaperDollTalent(suffix)
		local frame = _G["ArmoryPaperDollTalent"..suffix]
		local point, relativeTo, relativePoint, x, y = frame:GetPoint()
		AS:SkinFrame(frame)
		frame:SetHeight(frame:GetHeight() - 8)
		frame:SetPoint("TOPLEFT", 51, -62)
	end

	local function SkinPaperDollSkills(suffix)
		local frame = _G["ArmoryPaperDollTradeSkill"..suffix]
		local skill1 = _G["ArmoryPaperDollTradeSkill"..suffix.."Frame1"]
		local skill2 = _G["ArmoryPaperDollTradeSkill"..suffix.."Frame2"]

		AS:SkinFrame(frame)
		frame:SetHeight(frame:GetHeight() + 8)
		frame:SetPoint("TOPLEFT", "ArmoryPaperDollTalent"..suffix, "BOTTOMLEFT", 0, -3)

		SkinSkillFrame(skill1)
		SkinSkillFrame(skill2)
		skill2:SetPoint("TOPLEFT", skill1, "BOTTOMLEFT", 0, -3)
	end

	local function SkinSockets(suffix)
		local name = "ArmorySockets"..suffix.."Frame"

		local sockets = {
			"Meta",
			"Blue",
			"Yellow",
			"Red",
			"Other"
		}

		for i = 1, #sockets do
			local icon = _G[name..sockets[i]]
			if i == 1 then
				icon:SetPoint("TOP", 3, 0)
			end
			AS:CreateBackdrop(icon, 'Default')
			icon.Backdrop:SetAllPoints()
		end
	end

	local function SkinPaperDollInset(suffix)
		suffix = suffix or ""

		SkinPaperDollTalent(suffix)
		SkinPaperDollSkills(suffix)
		SkinSockets(suffix)

		if suffix == "Overlay" then
			SkinStatDropDown(suffix.."Top")
			SkinStatDropDown(suffix.."Bottom")
		else
			SkinStatDropDown(suffix)
		end
	end

	local function SkinOverlay()
		AS:SkinCheckBox(ArmoryPaperDollOverlayFrameCheckButton)
		ArmoryPaperDollOverlayFrameCheckButton:SetPoint("BOTTOMLEFT", 3, -1)
		SkinPaperDollInset("Overlay")
	end

	local function SkinArmoryFrame()
		AS:SkinCloseButton(ArmoryFrameCloseButton)
		AS:SkinFrame(ArmoryFrame)
		AS:StripTextures(ArmoryFrameInset)

		-- Portrait
		ArmoryFramePortrait:Kill()
		ArmoryFramePortraitButton:Hide()

		-- Character selection
		AS:SkinNextPrevButton(ArmorySelectCharacter, true)
		ArmorySelectCharacter:ClearAllPoints()
		ArmoryFrameLeftButton:ClearAllPoints()
		ArmoryFrameRightButton:ClearAllPoints()
		ArmorySelectCharacter:SetPoint("TOPLEFT", ArmoryFrame, "TOPLEFT", 4, -3)
		ArmoryFrameLeftButton:SetPoint("LEFT", ArmorySelectCharacter, "RIGHT", 4, -2)
		ArmoryFrameRightButton:SetPoint("RIGHT", ArmoryFrameCloseButton, "LEFT", 6, -2)

		-- Title and character header
		ArmoryFrame.TitleText:ClearAllPoints()
		ArmoryLevelText:ClearAllPoints()
		ArmoryFrame.TitleText:SetPoint("TOP", ArmoryFrame, "TOP", -6, -4)
		ArmoryLevelText:SetPoint("TOP", ArmoryFrame.TitleText, "BOTTOM", 0, -6)
	 
		-- Bottom tabs
		for i = 1, 5 do
			AS:SkinTab(_G["ArmoryFrameTab"..i])
		end

		-- Side tabs
		for i = 1, ARMORY_MAX_LINE_TABS do
			local button = _G["ArmoryFrameLineTab"..i]
			local icon = button:GetNormalTexture()
			AS:StripTextures(button)
			AS:SetTemplate(button, 'Default', true)
			button:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
			button:GetHighlightTexture():SetInside()
			AS:SkinTexture(icon)
			icon:SetInside()

			if i > 1 then
				local prevButton = _G["ArmoryFrameLineTab"..(i-1)]
				button:ClearAllPoints()
				button:SetPoint("TOP", prevButton, "BOTTOM", 0, -8)
			end
			AS:CreateBackdrop(button)
		end

		-- Mail
		AS:SkinTexture(ArmoryMailIcon)
		ArmoryMailIcon:SetInside()
		AS:CreateBackdrop(ArmoryMailFrame)
		ArmoryMailFrame.Backdrop:SetOutside(ArmoryMailIcon)
		ArmoryMailFrame:SetPoint("TOPLEFT", 28, 24)

		-- Resting
		ArmoryRestIcon:SetTexture("Interface\\CharacterFrame\\UI-StateIcon")
		ArmoryRestIcon:ClearAllPoints()
		ArmoryRestIcon:SetPoint("BOTTOMLEFT", ArmoryFrame, "TOPLEFT", -8, 0)
	end

	local function SkinBuffs()
		hooksecurefunc("ArmoryAuraButton_Update", function(buttonName, index, filter, unit)
			local button = _G[buttonName..index]
			if button and not button.isSkinned then
				local icon = _G[buttonName..index.."Icon"]
				AS:SkinTexture(icon)
				icon:SetInside()
				AS:CreateBackdrop(button)
				button.Backdrop:SetOutside(icon)
				button.isSkinned = true
			end
		end)
	end

	local function SkinGearSet()
		local button = ArmoryGearSetToggleButton
		button.Icon = button:GetNormalTexture()
		button.Highlight = button:GetHighlightTexture()

		button:SetSize(26, 28)
		button:SetPushedTexture(nil)

		button.Icon:SetTexture("Interface\\PaperDollInfoFrame\\PaperDollSidebarTabs")
		button.Icon:SetTexCoord(0.01562500, 0.53125000, 0.46875000, 0.60546875)
		button.Icon:SetPoint("BOTTOM", 1, -2)

		button.Highlight:SetTexture(1, 1, 1, 0.3)
		button.Highlight:SetPoint("TOPLEFT", 3, -4)
		button.Highlight:SetPoint("BOTTOMRIGHT", -1, 0)

		button.Hider = button:CreateTexture(nil, "OVERLAY")
		button.Hider:SetTexture(0.4, 0.4, 0.4, 0.4)
		button.Hider:SetPoint("TOPLEFT", 3, -4)
		button.Hider:SetPoint("BOTTOMRIGHT", -1, 0)

		AS:CreateBackdrop(button, 'Default')
		button.Backdrop:SetPoint("TOPLEFT", 1, -2)
		button.Backdrop:SetPoint("BOTTOMRIGHT", 1, -2)

		ArmoryGearSetFrame:HookScript("OnShow", function()
			button.Hider:Hide();
			button.Highlight:Hide();
		end)

		ArmoryGearSetFrame:HookScript("OnHide", function()
			button.Hider:Show();
			button.Highlight:Show();
		end)

		AS:SkinCloseButton(ArmoryGearSetFrameClose)
		AS:SkinButton(ArmoryGearSetFrameEquipSet)
		AS:SkinFrame(ArmoryGearSetFrame)

		ArmoryGearSetFrame:SetPoint("TOPLEFT", ArmoryPaperDollFrame, "TOPRIGHT", 4, 0)
		ArmoryGearSetFrameEquipSet:SetWidth(ArmoryGearSetFrameEquipSet:GetWidth() - 8)

		for i = 1, MAX_EQUIPMENT_SETS_PER_PLAYER do
			local button = _G["ArmoryGearSetButton"..i]
			if button then
				local icon = button.icon
				AS:StripTextures(button)
				AS:StyleButton(button)
				AS:CreateBackdrop(button, 'Default')
				button.Backdrop:SetAllPoints()
				AS:SkinTexture(icon)
				icon:SetInside()
			end
		end
	end

	local function SkinPaperDoll()
		local slots = {
			"Head",
			"Neck",
			"Shoulder",
			"Back",
			"Chest",
			"Shirt",
			"Tabard",
			"Wrist",
			"Hands",
			"Waist",
			"Legs",
			"Feet",
			"Finger0",
			"Finger1",
			"Trinket0",
			"Trinket1",
			"MainHand",
			"SecondaryHand",
		}

		for _, slot in pairs(slots) do
			local icon = _G["Armory"..slot.."SlotIconTexture"]
			local slot = _G["Armory"..slot.."Slot"]
			AS:StripTextures(slot)
			AS:StyleButton(slot)
			AS:SetTemplate(slot, 'Default', true)
			AS:SkinTexture(icon)
			icon:SetInside()
		end

		hooksecurefunc("ArmoryPaperDollItemSlotButton_Update", function(button)
			local slotId = button:GetID()
			local quality, _
			if button.itemId ~= nil then
				if button.itemId ~= 0 then
					_, _, quality = GetItemInfo(button.itemId)
				end
			else
				quality = Armory:GetInventoryItemQuality("player", slotId) or Armory:GetQualityFromLink(button.link)
			end
			SetItemBorder(button, quality)
		end)

		hooksecurefunc("ArmoryAlternateSlotFrame_Show", function(parent, orientation, direction)
			local i = 1
			while _G["ArmoryAlternate"..i.."Slot"] do
				local button = _G["ArmoryAlternate"..i.."Slot"]
				if not button:IsShown() then break end
				button:SetNormalTexture(nil)
				AS:StyleButton(button)
				AS:SetTemplate(button, 'Default', true)
				AS:SkinTexture(button.icon)
				button.icon:SetInside()
				ColorItemBorder(button, button.link)
				i = i + 1
			end
		end)

		SkinPaperDollInset()
	end

	local function SkinPets()
		ArmoryPetFramePetInfo:SetPoint("TOPLEFT", 20, -40)
		ArmoryPetFrameSelectedPetIcon:SetSize(36, 36)
		AS:SkinTexture(ArmoryPetFrameSelectedPetIcon)
		ArmoryPetFrameIconBorder:Kill()
		AS:CreateBackdrop(ArmoryPetFramePetInfo, 'Default', true)
		ArmoryPetFramePetInfo.Backdrop:SetOutside(ArmoryPetFrameSelectedPetIcon)

		ArmoryPetFrameDiet:SetPoint("TOPRIGHT", 63, -2)
		ArmoryPetFrameTypeText:SetPoint("BOTTOMRIGHT", 60, 2)

		for i = 1, 7 do
			AS:StripTextures(_G["ArmoryPetStatsPaneCategory"..i])
		end

		ArmoryPetFramePrevPageButton:SetNormalTexture(nil)
		ArmoryPetFramePrevPageButton:SetPushedTexture(nil)
		ArmoryPetFramePrevPageButton:SetDisabledTexture(nil)
		SquareButton_SetIcon(ArmoryPetFramePrevPageButton, "LEFT")
		ArmoryPetFrameNextPageButton:SetNormalTexture(nil)
		ArmoryPetFrameNextPageButton:SetPushedTexture(nil)
		ArmoryPetFrameNextPageButton:SetDisabledTexture(nil)
		SquareButton_SetIcon(ArmoryPetFrameNextPageButton, "RIGHT")

		for i = 1, ARMORY_NUM_PET_SLOTS do
			local icon = _G["ArmoryPetFramePet"..i.."IconTexture"]
			local slot = _G["ArmoryPetFramePet"..i]
			AS:StripTextures(slot)
			AS:StyleButton(slot)
			AS:SetTemplate(slot, 'Default', true)
			AS:SkinTexture(icon)
			icon:SetInside()
		end

		ArmoryPetSpecFrame.ring:Hide()
		AS:CreateBackdrop(ArmoryPetSpecFrame, 'Default')
		ArmoryPetSpecFrame.Backdrop:SetOutside(ArmoryPetSpecFrame.specIcon)
		AS:SkinTexture(ArmoryPetSpecFrame.specIcon)
		ArmoryPetSpecFrame.specIcon:SetParent(ArmoryPetSpecFrame.Backdrop)
	 
		for i = 1, ARMORY_NUM_PET_ABILITIES do
			local button = _G["ArmoryPetAbility"..i]
			AS:StripTextures(button)
			AS:CreateBackdrop(button, 'Default')
			button.Backdrop:SetOutside(button.icon)
			button.icon:SetDrawLayer("ARTWORK")
			AS:SkinTexture(button.icon) 
		end
	end

	local function SkinTalents()
		AS:StripTextures(ArmoryTalentFrame)

		for i = 1, 2 do
			local button = _G["ArmoryPlayerSpecTab"..i]
			local icon = button:GetNormalTexture()
			AS:StyleButton(button)
			AS:SetTemplate(button, 'Default', true)
			AS:SkinTexture(icon)
			icon:SetInside()
		end
	end

	local function SkinPVP()
		AS:StripTextures(ArmoryPVPFrame, true)
		ArmoryPVPFrame:SetAllPoints()
		ArmoryPVPFrameBackground:Kill()

		local frames = {
			"ArmoryPVPFrameHonor",
			"ArmoryPVPFrameArena",
			"ArmoryPVPHonor",
			"ArmoryPVPTeam1Standard",
			"ArmoryPVPTeam2Standard",
			"ArmoryPVPTeam3Standard"
		}

		for _, frame in ipairs(frames) do
			local point, relativeTo, relativePoint, x, y = _G[frame]:GetPoint()
			local yAdd = frame:find("ArmoryPVPFrame") and 5 or 0
			_G[frame]:Point(point, relativeTo, relativePoint, x - 15, y + yAdd)
		end

		for i = 1, MAX_ARENA_TEAMS do
			AS:StripTextures(_G["ArmoryPVPTeam"..i])
		end

		AS:SkinStatusBar(ArmoryPVPFrameConquestBar)
		AS:SkinCloseButton(ArmoryPVPTeamDetailsCloseButton)
		AS:SkinFrame(ArmoryPVPTeamDetails)
		ArmoryPVPTeamDetails:SetPoint("TOPLEFT", ArmoryPVPFrame, "TOPRIGHT", 4, -40)

		for i = 1, 5 do
			AS:StripTextures(_G["ArmoryPVPTeamDetailsFrameColumnHeader"..i])
		end

		for i = 1, 10 do
			AS:StripTextures(_G["ArmoryPVPTeamDetailsButton"..i])
		end
	end

	local function SkinReputation()
		AS:SkinScrollBar(ArmoryReputationListScrollFrameScrollBar)
		AS:StripTextures(ArmoryReputationListScrollFrame)
		AS:StripTextures(ArmoryReputationFrame, true)

		ArmoryReputationFrame:HookScript("OnShow", function()
			for i = 1, Armory:GetNumFactions() do
				local statusbar = _G["ArmoryReputationBar"..i.."ReputationBar"]
				if statusbar then
					if not statusbar.Backdrop then
						AS:SkinStatusBar(statusbar)
					end
					_G["ArmoryReputationBar"..i.."Background"]:SetTexture(nil)
					_G["ArmoryReputationBar"..i.."LeftLine"]:Kill()
					_G["ArmoryReputationBar"..i.."BottomLine"]:Kill()
					_G["ArmoryReputationBar"..i.."ReputationBarHighlight1"]:SetTexture(nil)
					_G["ArmoryReputationBar"..i.."ReputationBarHighlight2"]:SetTexture(nil)
					_G["ArmoryReputationBar"..i.."ReputationBarAtWarHighlight1"]:SetTexture(nil)
					_G["ArmoryReputationBar"..i.."ReputationBarAtWarHighlight2"]:SetTexture(nil)
					_G["ArmoryReputationBar"..i.."ReputationBarLeftTexture"]:SetTexture(nil)
					_G["ArmoryReputationBar"..i.."ReputationBarRightTexture"]:SetTexture(nil)
				end
			end
		end)
	end

	local function SkinRaidInfo()
		AS:SkinScrollBar(ArmoryRaidInfoScrollFrame.scrollBar)

		ArmoryRaidInfoFrame:HookScript("OnShow", function()
			for _, button in ipairs(ArmoryRaidInfoScrollFrame.buttons) do
				button:SetHighlightTexture(nil)
			end
		end)
	end

	local function SkinCurrency()
		AS:SkinScrollBar(ArmoryTokenFrameContainerScrollBar)

		ArmoryTokenFrame:HookScript("OnShow", function()
			for i = 1, Armory:GetCurrencyListSize() do
				local button = _G["ArmoryTokenFrameContainerButton"..i]
				if button then
					button.highlight:Kill()
					button.categoryMiddle:Kill()
					button.categoryLeft:Kill()
					button.categoryRight:Kill()
					if button.icon then
						AS:SkinTexture(button.icon)
					end
				end
			end
		end)
	end

	local function SkinOther()
		for i = 1, ARMORY_MAX_OTHER_TABS do
			AS:SkinTab(_G["ArmoryOtherFrameTab"..i])
		end
		SkinReputation()
		SkinRaidInfo()
		SkinCurrency()
	end

	local function SetIconTexture(icon, ...)
		local arg1 = ...
		if type(arg1) == "string" and arg1 == "Interface\\Buttons\\UI-EmptySlot-Disabled" then
			icon:SetTexture(nil)				
		else
			icon:SetTexture(...)
			AS:SkinTexture(icon)
		end
	end

	local function SkinInventoryButton(button)
		if button.inset then return end

		for i = 1, button:GetNumRegions() do
			local region = select(i, button:GetRegions())
			if region and region:GetObjectType() == "Texture" and region ~= button.searchOverlay and region ~= button.icon then
				region:SetTexture(nil)
			end
		end

		button.inset = CreateFrame("Button", nil, button)
		button.inset:SetInside()
		AS:SetTemplate(button.inset, 'Default', true)
		button.inset.hover = button.inset:CreateTexture(nil, "HIGHLIGHT")
		button.inset.hover:SetTexture(1, 1, 1, 0.3)
		button.inset.hover:SetAllPoints()
		button.inset.hover:Hide()
		button.inset:SetScript("OnClick", function(self)
			local button = self:GetParent()
			button:GetScript("OnClick")(button)
		end)
		button.inset:SetScript("OnEnter", function(self)
			local button = self:GetParent()
			self.hover:Show()
			button:GetScript("OnEnter")(button)
		end)
		button.inset:SetScript("OnLeave", function(self)
			local button = self:GetParent()
			self.hover:Hide()
			button:GetScript("OnLeave")(button)
		end)

		button.inset.icon = button.inset:CreateTexture(nil, "BORDER")
		button.inset.icon:SetInside()
		SetIconTexture(button.inset.icon, button.icon:GetTexture())

		button.icon:Hide()
		button.icon.SetTexture = function(self, ...)
			local button = self:GetParent()
			SetIconTexture(button.inset.icon, ...)
		end

		if _G[button:GetName().."Count"] then
			_G[button:GetName().."Count"]:SetParent(button.inset)
		end
		button.searchOverlay:SetOutside(button.inset.icon)
		button.searchOverlay:SetParent(button.inset)

		if button.link then
			ColorItemBorder(button.inset, button.link)
		end
	end

	local function SkinInventory()
		SkinArmoryFrame(ArmoryInventoryFrame, true)

		AS:StripTextures(ArmoryInventoryMoneyBackgroundFrame)
		ArmoryInventoryMoneyBackgroundFrame:SetWidth(150)
		ArmoryInventoryMoneyBackgroundFrame:ClearAllPoints()
		ArmoryInventoryMoneyBackgroundFrame:SetPoint("TOPRIGHT", -8, -35)

		ArmoryInventoryFrameEditBox:ClearAllPoints()
		ArmoryInventoryFrameEditBox:SetPoint("TOPLEFT", 8, -35)
		SkinSearchBox(ArmoryInventoryFrameEditBox, 150)

		ArmoryInventoryFilterDropDown:ClearAllPoints()
		ArmoryInventoryFilterDropDown:SetPoint("TOPRIGHT", -3, -60)
		ArmoryInventoryFilterDropDownText:ClearAllPoints()
		ArmoryInventoryFilterDropDownText:SetPoint("RIGHT", ArmoryInventoryFilterDropDown, "RIGHT", 0, 0)
		ArmoryDropDownMenu_JustifyText(ArmoryInventoryFilterDropDown, "RIGHT")
		hooksecurefunc("ArmoryItemFilter_InitializeDropDown", function(self) ArmoryDropDownMenu_JustifyText(self, "RIGHT") end)

		AS:StripTextures(ArmoryInventoryExpandButtonFrame)
		ArmoryInventoryExpandButtonFrame:SetPoint("TOPLEFT", 0, -60)

		ArmoryInventoryFrameTab1:ClearAllPoints()
		ArmoryInventoryFrameTab1:SetPoint("TOPLEFT", ArmoryInventoryFrame, "BOTTOMLEFT", 19, 2)
		AS:SkinTab(ArmoryInventoryFrameTab1)
		AS:SkinTab(ArmoryInventoryFrameTab2)

		ArmoryInventoryIconViewFrame:SetPoint("TOPRIGHT", -33, -86)
		ArmoryInventoryIconViewFrame:SetWidth(ArmoryInventoryIconViewFrame:GetWidth() + 1)
		AS:SkinScrollBar(ArmoryInventoryIconViewFrameScrollBar)
		AS:SkinCheckBox(ArmoryInventoryIconViewFrameLayoutCheckButton)
		ArmoryInventoryIconViewFrameLayoutCheckButton:SetPoint("TOPLEFT", ArmoryInventoryFrame, "TOPLEFT", 2, -2)

		hooksecurefunc("ArmoryInventoryIconViewFrame_ShowContainer", function(containerFrame)
			local containerName = containerFrame:GetName()
			local id = _G[containerName.."Label"]:GetID()
			local buttonBaseName = containerName.."Item"
			if Armory:GetInventoryBagLayout() and id == ARMORY_VOID_CONTAINER then
				buttonBaseName = containerName.."VoidItem"
			end

			local i = 1
			while _G[buttonBaseName..i] do
				SkinInventoryButton(_G[buttonBaseName..i])
				i = i + 1
			end
		end)

		ArmoryInventoryListViewFrame:SetPoint("TOPRIGHT", -33, -86)
		AS:SkinScrollBar(ArmoryInventoryListViewScrollFrameScrollBar)
		AS:SkinCheckBox(ArmoryInventoryListViewFrameSearchAllCheckButton)
		ArmoryInventoryListViewFrameSearchAllCheckButton:SetPoint("TOPLEFT", ArmoryInventoryFrame, "TOPLEFT", 2, -2)

		for i = 1 ,ARMORY_INVENTORY_LINES_DISPLAYED do
			SkinInventoryLine(_G["ArmoryInventoryLine"..i])
		end

		hooksecurefunc(Armory, "SetItemLink", function(self, button, link)
			if button.searchOverlay and button.searchOverlay:IsVisible() then
				return
			elseif button.icon and button.icon.IsDesaturated and button.icon:IsDesaturated() then
				return
			else
				ColorItemBorder(button.inset or button, link)
			end
		end)
	end

	local function SkinQuestInfoItem(item)
		AS:StripTextures(item)
		AS:SetTemplate(item, 'Default')
		AS:StyleButton(item)
		item:SetWidth(item:GetWidth() - 4)
		AS:SkinTexture(item.icon)
		item.icon:SetDrawLayer("OVERLAY")
		item.icon:SetInside()
		item.count:SetDrawLayer("OVERLAY")
	end

	local function SkinQuests()
		SkinArmoryFrame(ArmoryQuestFrame, true)
		SkinSearchBox(ArmoryQuestFrameEditBox)
		ArmoryQuestFrameEditBox:ClearAllPoints()
		ArmoryQuestFrameEditBox:SetPoint("TOPLEFT", 8, -35)
		AS:StripTextures(ArmoryQuestLogFrame)
		ArmoryQuestLogFrame:SetPoint("TOPLEFT", -12, 12)
		ArmoryQuestLogExpandButtonFrame:Kill()
		ArmoryQuestFrameTab1:ClearAllPoints()
		ArmoryQuestFrameTab1:SetPoint("TOPLEFT", ArmoryQuestFrame, "BOTTOMLEFT", 19, 2)
		ArmoryQuestFrameTab2:SetPoint("LEFT", ArmoryQuestFrameTab1, "RIGHT", -16, 0)
		AS:SkinTab(ArmoryQuestFrameTab1)
		AS:SkinTab(ArmoryQuestFrameTab2)
		AS:StripTextures(ArmoryEmptyQuestLogFrame)
		AS:SetTemplate(ArmoryQuestLogListScrollFrame)
		ArmoryQuestLogListScrollFrame:SetWidth(298)
		AS:SkinScrollBar(ArmoryQuestLogListScrollFrameScrollBar)
		AS:SetTemplate(ArmoryQuestLogDetailScrollFrame)
		ArmoryQuestLogDetailScrollFrame:SetWidth(298)
		AS:SkinScrollBar(ArmoryQuestLogDetailScrollFrameScrollBar)

		if not hideParchment then
			ArmoryQuestLogDetailScrollFrame.bg = ArmoryQuestLogDetailScrollFrame:CreateTexture(nil, "ARTWORK")
			ArmoryQuestLogDetailScrollFrame.bg:SetTexture("Interface\\QuestFrame\\QuestBG")
			ArmoryQuestLogDetailScrollFrame.bg:SetTexCoord(0, 1, 0.02, 1)
			ArmoryQuestLogDetailScrollFrame.bg:SetPoint("TOPLEFT", 2, -2)
			ArmoryQuestLogDetailScrollFrame.bg:SetSize(503, 356)
		end

		ArmoryQuestInfoItem1:SetPoint("TOPLEFT", ArmoryQuestInfoItemChooseText, "BOTTOMLEFT", 0, -5)

		for i = 1, ARMORY_MAX_NUM_ITEMS do
			SkinQuestInfoItem(_G["ArmoryQuestInfoItem"..i])
		end

		SkinQuestInfoItem(ArmoryQuestInfoSkillPointFrame)		
		ArmoryQuestInfoSkillPointFramePoints:ClearAllPoints()
		ArmoryQuestInfoSkillPointFramePoints:SetPoint("BOTTOMRIGHT", ArmoryQuestInfoSkillPointFrame.icon, "BOTTOMRIGHT")

		hooksecurefunc("ArmoryQuestInfo_Display", function(template, parentFrame)
			if hideParchment then
				ArmoryQuestInfoTitleHeader:SetTextColor(1, 1, 0)
				ArmoryQuestInfoDescriptionHeader:SetTextColor(1, 1, 0)
				ArmoryQuestInfoObjectivesHeader:SetTextColor(1, 1, 0)
				ArmoryQuestInfoRewardsHeader:SetTextColor(1, 1, 0)
				ArmoryQuestInfoDescriptionText:SetTextColor(1, 1, 1)
				ArmoryQuestInfoObjectivesText:SetTextColor(1, 1, 1)
				ArmoryQuestInfoGroupSize:SetTextColor(1, 1, 1)
				ArmoryQuestInfoRewardText:SetTextColor(1, 1, 1)
				ArmoryQuestInfoItemChooseText:SetTextColor(1, 1, 1)
				ArmoryQuestInfoItemReceiveText:SetTextColor(1, 1, 1)
				ArmoryQuestInfoSpellLearnText:SetTextColor(1, 1, 1)
				ArmoryQuestInfoXPFrameReceiveText:SetTextColor(1, 1, 1)
				ArmoryQuestInfoReputationText:SetTextColor(1, 1, 1)

				local numObjectives = Armory:GetNumQuestLeaderBoards()
				local objective
				local numVisibleObjectives = 0
				for i = 1, numObjectives do
					local _, type, finished = Armory:GetQuestLogLeaderBoard(i)
					if type ~= "spell" then
						numVisibleObjectives = numVisibleObjectives + 1
						objective = _G["ArmoryQuestInfoObjective"..numVisibleObjectives]
						if finished then
							objective:SetTextColor(1, 1, 0)
						else
							objective:SetTextColor(0.6, 0.6, 0.6)
						end
					end
				end
			end

			for i = 1, ARMORY_MAX_NUM_ITEMS do
				local questItem = _G["ArmoryQuestInfoItem"..i]
				if not questItem:IsShown() then break end

				local point, relativeTo, relativePoint, x, y = questItem:GetPoint()
				if i == 1 then
					questItem:SetPoint(point, relativeTo, relativePoint, 0, y)
				elseif relativePoint == "BOTTOMLEFT" then
					questItem:SetPoint(point, relativeTo, relativePoint, 0, -4)
				else
					questItem:SetPoint(point, relativeTo, relativePoint, 4, 0)
				end
			end
		end)

		AS:StripTextures(ArmoryQuestHistoryFrame)
		ArmoryQuestHistoryFrame:SetPoint("TOPLEFT", -12, 12)
		ArmoryQuestHistoryExpandButtonFrame:Kill()
		AS:SkinScrollBar(ArmoryQuestHistoryScrollFrameScrollBar)

		ArmoryQuestHistoryGroupByDateButton:Hide()
		local checkBox = CreateFrame("CheckButton", nil, ArmoryQuestHistoryFrame, "UICheckButtonTemplate")
		checkBox:SetSize(24, 24)
		checkBox:SetPoint("TOPLEFT", ArmoryQuestFrame, "TOPLEFT", 2, -2)
		checkBox.text:SetText(ARMORY_BY_DATE)
		AS:SkinCheckBox(checkBox)
		checkBox:SetScript("OnClick", function(self)
			Armory:SetQuestHistoryGroupByDate(self:GetChecked())
			ArmoryQuestHistory_Update()
		end)
	end

	local function SkinSpellLineTab(tab)
		AS:StripTextures(tab)
		AS:SkinTexture(tab:GetNormalTexture())
		tab:GetNormalTexture():SetInside()

		tab.pushed = true
		AS:CreateBackdrop(tab, 'Default')
		tab.Backdrop:SetAllPoints()
		AS:StyleButton(tab)
		tab:GetHighlightTexture().SetTexture = AS.Noop
		tab:GetCheckedTexture().SetTexture = AS.Noop

		local point, relativeTo, relativePoint, x, y = tab:GetPoint()
		tab:SetPoint(point, relativeTo, relativePoint, 1, y)		 
	end

	local function SkinSpellBook()
		SkinArmoryFrame(ArmorySpellBookFrame, true)

		local pageBackdrop = CreateFrame("Frame", nil, ArmorySpellBookFrame)
		AS:SetTemplate(pageBackdrop, 'Default')
		pageBackdrop:SetPoint("TOPLEFT", ArmorySpellBookFrame, "TOPLEFT", 2, -75)
		pageBackdrop:SetPoint("BOTTOMRIGHT", ArmorySpellBookFrame, "BOTTOMRIGHT", -2, 2)

		if not hideParchment then
			pageBackdrop.bg = pageBackdrop:CreateTexture(nil, "BACKGROUND", nil, 2)
			pageBackdrop.bg:SetTexture("Interface\\QuestFrame\\QuestBG")
			pageBackdrop.bg:SetTexCoord(0, 1, 0.02, 1)
			pageBackdrop.bg:SetPoint("TOPLEFT", 2, -2)
			pageBackdrop.bg:SetSize(563, 528)
		end

		-- Replace tabs by standard ones		
		PanelTemplates_SetNumTabs(ArmorySpellBookFrame, 3)
		for i = 1, 3 do
			local tab = CreateFrame("Button", "ArmorySpellBookFrameTab"..i, ArmorySpellBookFrame, "CharacterFrameTabButtonTemplate")
			tab:SetID(i)
			AS:StripTextures(tab)
			AS:SkinTab(tab)

			tab.oldtab = _G["ArmorySpellBookFrameTabButton"..i]
			tab.oldtab.newtab = tab
			tab.oldtab:Kill()
			tab.oldtab.Show = function(self) self.newtab:Show() end
			tab.oldtab.Hide = function(self) self.newtab:Hide() end
			tab.oldtab.SetText = function(self, value) self.newtab:SetText(value) end
			tab.oldtab.Disable = function(self) self.newtab:Disable() end
			tab.oldtab.Enable = function(self) self.newtab:Enable() end

			tab:SetScript("OnClick", function(self)
				PanelTemplates_SetTab(ArmorySpellBookFrame, self:GetID());
				ArmoryToggleSpellBook(self.oldtab.bookType)
			end)

			if i == 1 then
				tab:SetPoint("TOPLEFT", ArmorySpellBookFrame, "BOTTOMLEFT", 19, 2)
			else
				tab:SetPoint("LEFT", "ArmorySpellBookFrameTab"..(i-1), "RIGHT", -16, 0)
			end
		end

		ArmorySpellBookPrevPageButton:SetParent(pageBackdrop)
		ArmorySpellBookNextPageButton:SetParent(pageBackdrop)
		ArmorySpellBookSpellIconsFrame:SetParent(pageBackdrop)
		ArmorySpellBookSpellIconsFrame:SetAllPoints()

		ArmorySpellBookPageText:SetPoint("BOTTOM", 0, 12)
		ArmorySpellBookPageText:SetParent(ArmorySpellBookSpellIconsFrame)
		ArmorySpellBookPrevPageButton:SetSize(24, 24)
		ArmorySpellBookNextPageButton:SetSize(24, 24)
		ArmorySpellBookPrevPageButton:SetPoint("CENTER", ArmorySpellBookFrame, "BOTTOMLEFT", 25, 18)
		ArmorySpellBookNextPageButton:SetPoint("CENTER", ArmorySpellBookFrame, "BOTTOMLEFT", 314, 18)
		AS:SkinNextPrevButton(ArmorySpellBookPrevPageButton)
		AS:SkinNextPrevButton(ArmorySpellBookNextPageButton)

		for i = 1, MAX_SKILLLINE_TABS do
			SkinSpellLineTab(_G["ArmorySpellBookSkillLineTab"..i])
		end

		ArmorySpellButton1:SetPoint("TOPLEFT", 18, -18)

		for i = 1, SPELLS_PER_PAGE do
			local button = _G["ArmorySpellButton"..i]
			local icon = _G["ArmorySpellButton"..i.."IconTexture"]
			AS:StripTextures(button)
			AS:CreateBackdrop(button, 'Default', true)
			button.SpellSubName:SetTextColor(0.6, 0.6, 0.6)
			AS:SkinTexture(icon)
			icon:ClearAllPoints()
			icon:SetAllPoints()
		end

		hooksecurefunc("ArmorySpellBook_GetCoreAbilityButton", function(index)
			local button = ArmorySpellBookCoreAbilitiesFrame.Abilities[index]
			if not button.isSkinned then
				AS:StripTextures(button)
				AS:SetTemplate(button, 'Default')
				AS:SkinTexture(button.iconTexture)
				button.iconTexture:SetInside()

				if index == 1 then
					local point, attachTo, anchorPoint, x, y = button:GetPoint()
					button:ClearAllPoints()
					button:SetPoint(point, attachTo, anchorPoint, x - 10, y - 15) 
				end
				button.isSkinned = true
			end
		end)

		hooksecurefunc("ArmorySpellBook_GetCoreAbilitySpecTab", function(index)
			local tab = ArmorySpellBookCoreAbilitiesFrame.SpecTabs[index]
			if not tab.isSkinned then
				SkinSpellLineTab(tab)
				if index > 1 then
					local point, attachTo, anchorPoint, _, y = tab:GetPoint()
					tab:ClearAllPoints()
					tab:SetPoint(point, attachTo, anchorPoint, 0, y) 
				end
				tab.isSkinned = true
			end
		end)

		ArmorySpellBookPetInfo:SetPoint("TOPLEFT", 10, -30)
		AS:SkinTexture(ArmorySpellBookPetInfo.icon)
		AS:CreateBackdrop(ArmorySpellBookPetInfo, 'Default', true)
		ArmorySpellBookPetInfo.Backdrop:SetOutside(ArmorySpellBookPetInfo.icon)
	end

	local function SkinSocial()
		SkinArmoryFrame(ArmorySocialFrame, true)

		for i = 1, ARMORY_SOCIAL_TABS do
			AS:SkinTab(_G["ArmorySocialFrameTab"..i])
		end

		local frames = {
			"ArmoryFriendsListScrollFrame",
			"ArmoryIgnoreListScrollFrame",
			"ArmoryEventsListScrollFrame",
		}

		for i, frame in ipairs(frames) do
			_G[frame]:Height(342)
			_G[frame]:Point("TOPRIGHT", -33, -75)
			AS:StripTextures(_G[frame])
			AS:SkinScrollBar(_G[frame.."ScrollBar"])
		end

		local buttons = {
			ArmoryFriendsListButton = ARMORY_FRIENDS_TO_DISPLAY,
			ArmoryIgnoreListButton = ARMORY_IGNORES_TO_DISPLAY,
			ArmoryEventsListButton = ARMORY_EVENTS_TO_DISPLAY,
		}

		for button, num in pairs(buttons) do
			for i = 1, num do
				_G[button..i]:SetHighlightTexture(nil)
				if i == 1 then
					_G[button..i]:Point("TOPLEFT", 2, -76)
				end
			end
		end
	end

	local function SkinTradeSkill()
		SkinArmoryFrame(ArmoryTradeSkillFrame, true)
		ArmoryTradeSkillFrameTopLeftTexture:Kill()
		ArmoryTradeSkillFrameTopRightTexture:Kill()
		AS:StripTextures(ArmoryTradeSkillListScrollFrame)
		AS:StripTextures(ArmoryTradeSkillDetailScrollFrame)
		ArmoryTradeSkillDetailScrollFrame:SetPoint("TOPLEFT", 8, -222)
		AS:StripTextures(ArmoryTradeSkillExpandButtonFrame)
		ArmoryTradeSkillExpandButtonFrame:SetPoint("TOPLEFT", 3, -59)
		AS:StripTextures(ArmoryTradeSkillDetailScrollChildFrame)
		AS:StripTextures(ArmoryTradeSkillRankFrameBorder)
		ArmoryTradeSkillRankFrame:ClearAllPoints()
		ArmoryTradeSkillRankFrame:SetPoint("BOTTOMRIGHT", ArmoryTradeSkillFrame, "TOPRIGHT", -10, -45)
		ArmoryTradeSkillRankFrame:SetWidth(180)
		ArmoryTradeSkillRankFrameSkillRank:ClearAllPoints()
		ArmoryTradeSkillRankFrameSkillRank:SetPoint("TOP", ArmoryTradeSkillRankFrame, "TOP", 0, -2)
		AS:SkinStatusBar(ArmoryTradeSkillRankFrame)
		AS:SkinDropDownBox(ArmoryTradeSkillInvSlotDropDown)
		AS:SkinDropDownBox(ArmoryTradeSkillSubClassDropDown)
		ArmoryTradeSkillSubClassDropDown:SetPoint("RIGHT", ArmoryTradeSkillInvSlotDropDown, "LEFT", 25, 0)
		AS:SkinScrollBar(ArmoryTradeSkillListScrollFrameScrollBar)
		AS:SkinScrollBar(ArmoryTradeSkillDetailScrollFrameScrollBar)		 
		ArmoryTradeSkillLinkButton:GetHighlightTexture():Kill()
		ArmoryTradeSkillFrameEditBox:ClearAllPoints()
		ArmoryTradeSkillFrameEditBox:SetPoint("TOPLEFT", 8, -30)
		SkinSearchBox(ArmoryTradeSkillFrameEditBox)
		hooksecurefunc("ArmoryTradeSkillFrame_Update", function()
			if ArmoryTradeSkillFrameEditBox:GetText() == SEARCH or ArmoryTradeSkillFrameEditBox:GetText() == "" then
				ArmoryTradeSkillFrameEditBox:Hide()
			end
		end)

		ArmoryTradeSkillInvSlotDropDown:SetPoint("TOPRIGHT", 0, -52)
		ArmoryTradeSkillFrame:HookScript("OnShow", function(self)
			if ARMORY_TRADE_SKILLS_DISPLAYED == 8 then
				ArmoryTradeSkillSkill1:SetPoint("TOPLEFT", ArmoryTradeSkillFrame, "TOPLEFT", 11, -84)
				ArmoryTradeSkillListScrollFrame:SetPoint("TOPRIGHT", ArmoryTradeSkillFrame, "TOPRIGHT", -33, -84)
			else
				ArmoryTradeSkillSkill1:SetPoint("TOPLEFT", ArmoryTradeSkillFrame, "TOPLEFT", 11, -68)
				ArmoryTradeSkillListScrollFrame:SetPoint("TOPRIGHT", ArmoryTradeSkillFrame, "TOPRIGHT", -33, -68)
			end
			ArmoryDropDownMenu_SetWidth(ArmoryTradeSkillInvSlotDropDown, 100)
			ArmoryDropDownMenu_SetWidth(ArmoryTradeSkillSubClassDropDown, 100)
		end)

		AS:StyleButton(ArmoryTradeSkillSkillIcon)
		AS:SetTemplate(ArmoryTradeSkillSkillIcon, 'Default')
		hooksecurefunc("ArmoryTradeSkillFrame_SetSelection", function(id)
			if ArmoryTradeSkillSkillIcon:GetNormalTexture() then
				AS:SkinTexture(ArmoryTradeSkillSkillIcon:GetNormalTexture())
				ArmoryTradeSkillSkillIcon:GetNormalTexture():SetInside()
			end
		end)

		for i = 1, ARMORY_MAX_TRADE_SKILL_REAGENTS do
			local button = _G["ArmoryTradeSkillReagent"..i]
			AS:SkinTexture(button.icon)
			button.icon:SetDrawLayer("OVERLAY")
			button.icon.backdrop = CreateFrame("Frame", nil, button)
			button.icon.backdrop:SetFrameLevel(button:GetFrameLevel() - 1)
			AS:SetTemplate(button.icon.backdrop, 'Default')
			button.icon.backdrop:SetOutside(button.icon)
			button.icon:SetParent(button.icon.backdrop)
			button.count:SetParent(button.icon.backdrop)
			button.count:SetDrawLayer("OVERLAY")

			if i > 1 and mod(i, 2) == 1 then
				local point, relativeTo, relativePoint, x, y = button:GetPoint()
				button:SetPoint(point, relativeTo, relativePoint, x, y - 3)
			end

			_G["ArmoryTradeSkillReagent"..i.."NameFrame"]:Kill()
		end
	end

	local function SkinAchievements()
		SkinArmoryFrame(ArmoryAchievementFrame, true)
		AS:SkinScrollBar(ArmoryAchievementListScrollFrameScrollBar)
		AS:StripTextures(ArmoryAchievementListScrollFrame)
		ArmoryAchievementListScrollFrame:SetPoint("TOPRIGHT", ArmoryAchievementFrame, "TOPRIGHT", -33, -63)

		SkinSearchBox(ArmoryAchievementFrameEditBox)
		ArmoryAchievementFrameEditBox:ClearAllPoints()
		ArmoryAchievementFrameEditBox:SetPoint("TOPLEFT", 8, -33)

		AS:StripTextures(ArmoryAchievementCollapseAllButton)
		ArmoryAchievementExpandButtonFrame:SetPoint("TOPLEFT", 8, -49)

		ArmoryAchievementFrameTab1:ClearAllPoints()
		ArmoryAchievementFrameTab1:SetPoint("TOPLEFT", ArmoryAchievementFrame, "BOTTOMLEFT", 19, 2)
		ArmoryAchievementFrameTab2:SetPoint("LEFT", ArmoryAchievementFrameTab1, "RIGHT", -16, 0)
		AS:SkinTab(ArmoryAchievementFrameTab1)
		AS:SkinTab(ArmoryAchievementFrameTab2)

		hooksecurefunc("ArmoryAchievementFrame_SetRowType", function(achievementRow, rowType, hasQuantity)
			if rowType == 0 then
				achievementRow:SetPoint("LEFT", ArmoryAchievementFrame, "LEFT", 29, 0)
			elseif rowType == 1 then
				achievementRow:SetPoint("LEFT", ArmoryAchievementFrame, "LEFT", 47, 0)
			elseif rowType == 2 then
				achievementRow:SetPoint("LEFT", ArmoryAchievementFrame, "LEFT", 5, 0)
			elseif rowType == 3 then
				achievementRow:SetPoint("LEFT", ArmoryAchievementFrame, "LEFT", 24, 0)
			end
		end)

		ArmoryAchievementListScrollFrame:HookScript("OnShow", function()
			ArmoryAchievementBar1:SetPoint("TOPRIGHT", ArmoryAchievementFrame, "TOPRIGHT", -35, -73)
		end)

		ArmoryAchievementListScrollFrame:HookScript("OnHide", function()
			ArmoryAchievementBar1:SetPoint("TOPRIGHT", ArmoryAchievementFrame, "TOPRIGHT", -21, -73)
		end)
		 
		ArmoryAchievementFrame:HookScript("OnShow", function()
			local numAchievements
			if ArmoryAchievementFrame.selected == "achievements" then
				numAchievements = Armory:GetNumAchievements()
			else
				numAchievements = Armory:GetNumStatistics()
			end
			for i = 1, numAchievements do
				local statusbar = _G["ArmoryAchievementBar"..i.."AchievementBar"]
				if statusbar then
					if not statusbar.Backdrop then
						AS:SkinStatusBar(statusbar)
					end
					_G["ArmoryAchievementBar"..i.."Background"]:SetTexture(nil)
					_G["ArmoryAchievementBar"..i.."LeftLine"]:Kill()
					_G["ArmoryAchievementBar"..i.."BottomLine"]:Kill()
					_G["ArmoryAchievementBar"..i.."AchievementBarHighlight1"]:SetTexture(nil)
					_G["ArmoryAchievementBar"..i.."AchievementBarHighlight2"]:SetTexture(nil)
					_G["ArmoryAchievementBar"..i.."AchievementBarLeftTexture"]:SetTexture(nil)
					_G["ArmoryAchievementBar"..i.."AchievementBarRightTexture"]:SetTexture(nil)
				end				
			end
		end)
	end

	local function SkinFind()
		SkinArmoryFrame(ArmoryFindFrame)
		AS:SkinEditBox(ArmoryFindFrameEditBox)
		ArmoryFindFrameEditBox:SetHeight(ArmoryFindFrameEditBox:GetHeight() - 3)
		ArmoryFindFrameEditBox:SetPoint("TOPLEFT", 8, -33)
		AS:SkinDropDownBox(ArmoryFindTypeDropDown)
		ArmoryFindTypeDropDown:ClearAllPoints()
		ArmoryFindTypeDropDown:SetPoint("TOPRIGHT", ArmoryFindFrame, "TOPRIGHT", -3, -29)
		AS:StripTextures(ArmoryFindFrameScrollFrame)
		AS:SkinScrollBar(ArmoryFindFrameScrollFrameScrollBar)
		ArmoryFindFrameScrollFrame:SetPoint("TOPRIGHT", -33, -84)
		ArmoryFindFrameScrollFrame:SetHeight(206)
		ArmoryFindFrameColumnHeader1:SetPoint("TOPLEFT", 6, -58)
		WhoFrameColumn_SetWidth(ArmoryFindFrameColumnHeader2, 84)

		for i = 1, 3 do
			AS:StripTextures(_G["ArmoryFindFrameColumnHeader"..i])
		end

		for i = 1, ARMORY_FIND_LINES_DISPLAYED do
			_G["ArmoryFindFrameButton"..i]:SetHighlightTexture(nil)
		end

		ArmoryFindFrameButton1:SetPoint("TOPLEFT", 3, -83)
		ArmoryFindFrameTotals:SetPoint("BOTTOM", 0, 110)

		local detailBackdrop = CreateFrame("Frame", nil, ArmoryFindFrame)
		AS:SetTemplate(detailBackdrop, 'Transparent')
		detailBackdrop:SetPoint("TOPLEFT", ArmoryFindFrame, "TOPLEFT", 10, -298)
		detailBackdrop:SetPoint("BOTTOMRIGHT", ArmoryFindFrame, "BOTTOMRIGHT", -10, 40)
		detailBackdrop:SetFrameLevel(ArmoryFindFrame:GetFrameLevel() - 1)

		ArmoryFindFrameDetailWho:ClearAllPoints()
		ArmoryFindFrameDetailWho:SetPoint("TOPLEFT", detailBackdrop, "TOPLEFT", 6, -30)

		AS:SkinButton(ArmoryFindButton)
		ArmoryFindButton:SetPoint("BOTTOMLEFT", 15, 8)
		ArmoryFindButton:SetWidth(ArmoryFindButton:GetWidth() - 8)

		AS:SkinCheckBox(ArmoryFindFrameSearchGlobalCheckButton)
		AS:SkinCheckBox(ArmoryFindFrameSearchExtendedCheckButton)
		ArmoryFindFrameSearchGlobalCheckButton:SetPoint("BOTTOMLEFT", 144, 8)
		ArmoryFindFrameSearchExtendedCheckButton:SetPoint("BOTTOMLEFT", 246, 8)
	end

	local function SkinLookup()
		SkinArmoryFrame(ArmoryLookupFrame)
		ArmoryLookupMessageFrame:SetPoint("TOP", 0, -120)
		AS:SkinEditBox(ArmoryLookupFrameEditBox)
		ArmoryLookupFrameEditBox:SetHeight(ArmoryLookupFrameEditBox:GetHeight() - 2)
		ArmoryLookupFrameEditBox:SetPoint("TOPLEFT", 8, -33)
		AS:SkinDropDownBox(ArmoryLookupTypeDropDown)
		ArmoryLookupTypeDropDown:ClearAllPoints()
		ArmoryLookupTypeDropDown:SetPoint("TOPRIGHT", -3, -29)
		AS:SkinDropDownBox(ArmoryLookupTradeSkillDropDown)
		ArmoryLookupTradeSkillDropDown:ClearAllPoints()
		ArmoryLookupTradeSkillDropDown:SetPoint("TOPRIGHT", ArmoryLookupTypeDropDown, "BOTTOMRIGHT", 0, 8)
		AS:SkinDropDownBox(ArmoryLookupQuestDropDown)
		ArmoryLookupQuestDropDown:ClearAllPoints()
		ArmoryLookupQuestDropDown:SetPoint("TOPRIGHT", ArmoryLookupTypeDropDown, "BOTTOMRIGHT", 0, 8)
		AS:SkinCheckBox(ArmoryLookupFrameSearchExactCheckButton)
		ArmoryLookupFrameSearchExactCheckButton:ClearAllPoints()
		ArmoryLookupFrameSearchExactCheckButton:SetPoint("RIGHT", ArmoryLookupFrameEditBox, "BOTTOMRIGHT", -20, -20)
		AS:StripTextures(ArmoryLookupExpandButtonFrame)
		ArmoryLookupExpandButtonFrame:SetPoint("TOPLEFT", 0, -60)
		AS:SkinButton(ArmoryLookupButton)
		ArmoryLookupButton:ClearAllPoints()
		ArmoryLookupButton:SetPoint("BOTTOMRIGHT", -18, 8)
		AS:SkinDropDownBox(ArmoryLookupChannelDropDown, 130)
		ArmoryLookupChannelDropDown:ClearAllPoints()
		ArmoryLookupChannelDropDown:SetPoint("RIGHT", ArmoryLookupButton, "LEFT", 0, -3)
		ArmoryLookupFrameTargetText:SetPoint("BOTTOMLEFT", 8, 15)
		ArmoryLookupLine1:SetPoint("TOPLEFT", 8, -83)

		for i = 1, ARMORY_LOOKUP_LINES_DISPLAYED do
			local icon = _G["ArmoryLookupLine"..i]:GetNormalTexture()
			AS:SkinTexture(icon)
			icon:SetSize(14, 14)
		end

		AS:StripTextures(ArmoryLookupScrollFrame)
		AS:SkinScrollBar(ArmoryLookupScrollFrameScrollBar)
		ArmoryLookupScrollFrame:SetPoint("TOPLEFT", 8, -83)
		ArmoryLookupScrollFrame:SetHeight(305)
	end

	local function SkinQTips()
			hooksecurefunc(Armory.qtip, "Acquire", function(self, name)
				if name:sub(1, 6) == "Armory" then
					for key, tooltip in Armory.qtip:IterateTooltips() do
						if key == name then
							tooltip:SetScript("OnShow", function(self)
								AS:SetTemplate(self, 'Transparent')
								if self.slider then
									AS:SkinSliderFrame(self.slider)
								end
							end)
						break
					end
				end
			end
		end)
	end

	local function SkinGuildOptions()
		local checkBoxes = {
			"UniItemCountColor",
			"MyGuildItemCount",
			"GlobalItemCount",
			"CrossFactionItemCount",
			"IncludeInFind",
			"Integrate",
		}

		local swatches = {
			"ShowItemCount",
		}

		for _, name in ipairs(checkBoxes) do
			AS:SkinCheckBox(_G["ArmoryOptionsGuildBankPanel"..name])
		end

		for _, name in ipairs(swatches) do
			AS:SkinCheckBox(_G["ArmoryOptionsGuildBankPanel"..name.."Check"])
		end
	end

	local function SkinGuildInventory()
		ArmoryInventoryGuildBankFrame:SetPoint("TOPRIGHT", -33, -86)
		AS:SkinScrollBar(ArmoryInventoryGuildBankScrollFrameScrollBar)

		for i = 1, ARMORY_INVENTORY_LINES_DISPLAYED do
			SkinInventoryLine(_G["ArmoryInventoryGuildBankLine"..i])
		end

		AS:SkinTab(ArmoryInventoryFrameTab3)
	end

	local function SkinListGuildBank()
		SkinArmoryFrame(ArmoryListGuildBankFrame)
		ArmoryListGuildBankFrameMessage:SetPoint("TOP", 0, -120)

		local kill = {
			"BackgroundUL",
			"BackgroundUR",
			"BackgroundBL",
			"BackgroundBR",
			"UL",
			"UR",
			"BL",
			"BR",
		}

		for i, name in ipairs(kill) do
			_G["ArmoryListGuildBankFrameEmblem"..name]:Kill()
		end

		ArmoryListGuildBankFrameTab1:ClearAllPoints()
		ArmoryListGuildBankFrameTab1:SetPoint("TOPLEFT", ArmoryListGuildBankFrame, "BOTTOMLEFT", 19, 2)
		AS:SkinTab(ArmoryListGuildBankFrameTab1)
		AS:SkinTab(ArmoryListGuildBankFrameTab2)
		AS:StripTextures(ArmoryListGuildBankFrameMoneyBackgroundFrame)
		ArmoryListGuildBankFrameMoneyBackgroundFrame:SetWidth(150)
		ArmoryListGuildBankFrameMoneyBackgroundFrame:ClearAllPoints()
		ArmoryListGuildBankFrameMoneyBackgroundFrame:SetPoint("TOPRIGHT", -8, -35)
		AS:SkinScrollBar(ArmoryListGuildBankScrollFrameScrollBar)
		ArmoryListGuildBankScrollFrame:SetPoint("TOPRIGHT", -33, -96)
		ArmoryListGuildBankScrollFrame:SetHeight(321)
		ArmoryGuildBankLine1:SetPoint("TOPLEFT", 10, -98)

		for i = 1 ,ARMORY_GUILDBANK_LINES_DISPLAYED do
			SkinInventoryLine(_G["ArmoryGuildBankLine"..i])
		end

		hooksecurefunc("ArmoryListGuildBankFrame_AllignCommonControls", function(self)
			ArmoryGuildBankFactionFrame:ClearAllPoints()
			ArmoryGuildBankFactionFrame:SetPoint("TOP", 0, -62)

			if not self.searchBox then
				ArmoryGuildBankFrameEditBox:SetHeight(20)
				AS:SkinSearchBox(ArmoryGuildBankFrameEditBox)
				self.searchBox = true
			end

			ArmoryGuildBankFrameEditBox:ClearAllPoints()
			ArmoryGuildBankFrameEditBox:SetPoint("TOPLEFT", 8, -35)
			ArmoryGuildBankFilterDropDown:ClearAllPoints()
			ArmoryGuildBankFilterDropDown:SetPoint("TOPRIGHT", ArmoryListGuildBankFrameMoneyBackgroundFrame, "BOTTOMRIGHT",	40, 0)
			ArmoryGuildBankNameDropDown:ClearAllPoints()
			ArmoryGuildBankNameDropDown:SetPoint("TOPLEFT", -15, -56)
			ArmoryGuildBankNameDropDown:SetWidth(160)
		end)
	end

	local function SkinIconGuildBank()
		AS:StripTextures(ArmoryIconGuildBankFrame)
		AS:SetTemplate(ArmoryIconGuildBankFrame, 'Transparent')
		AS:StripTextures(ArmoryIconGuildBankFrameEmblemFrame, true)
		ArmoryIconGuildBankTabTitle:ClearAllPoints()
		ArmoryIconGuildBankTabTitle:SetPoint("TOP", ArmoryIconGuildBankFrame, "TOP", 0, -40)

		for i = 1, ArmoryIconGuildBankFrame:GetNumChildren() do
			local child = select(i, ArmoryIconGuildBankFrame:GetChildren())
			if child.GetPushedTexture and child:GetPushedTexture() and not child:GetName() then
				AS:SkinCloseButton(child)
				child:SetPoint("TOPRIGHT", 2, 3)
				break
			end
		end 

		ArmoryIconGuildBankFrameTab1:ClearAllPoints()
		ArmoryIconGuildBankFrameTab1:SetPoint("TOPLEFT", ArmoryIconGuildBankFrame, "BOTTOMLEFT", 19, 2)
		AS:SkinTab(ArmoryIconGuildBankFrameTab1)
		AS:SkinTab(ArmoryIconGuildBankFrameTab2)

		for i = 1, ARMORY_NUM_GUILDBANK_COLUMNS do
			AS:StripTextures(_G["ArmoryIconGuildBankColumn"..i])
			for j = 1, ARMORY_NUM_SLOTS_PER_GUILDBANK_GROUP do
				local button = _G["ArmoryIconGuildBankColumn"..i.."Button"..j]
				local icon = _G["ArmoryIconGuildBankColumn"..i.."Button"..j.."IconTexture"]
				local texture = _G["ArmoryIconGuildBankColumn"..i.."Button"..j.."NormalTexture"]
				if texture then
					texture:SetTexture(nil)
				end
				AS:StyleButton(button)
				AS:SetTemplate(button, 'Default', true)
				button.searchOverlay:Hide()
				icon:SetInside()
				AS:SkinTexture(icon)
			end
		end

		for i = 1, MAX_GUILDBANK_TABS do
			local button = _G["ArmoryIconGuildBankTab"..i.."Button"]
			local texture = _G["ArmoryIconGuildBankTab"..i.."ButtonIconTexture"]
			AS:StripTextures(_G["ArmoryIconGuildBankTab"..i], true)
			AS:StripTextures(button)
			AS:StyleButton(button)
			AS:SetTemplate(button, 'Default', true)
			texture:SetInside()
			AS:SkinTexture(texture)
		end

		hooksecurefunc("ArmoryIconGuildBankFrame_AllignCommonControls", function(self)
			ArmoryGuildBankFactionFrame:ClearAllPoints()
			ArmoryGuildBankFactionFrame:SetPoint("LEFT", ArmoryGuildBankNameDropDown, "RIGHT", 15, -3)

			if not self.searchBox then
				ArmoryGuildBankFrameEditBox:SetHeight(20)
				AS:SkinSearchBox(ArmoryGuildBankFrameEditBox)
				self.searchBox = true
			end

			ArmoryGuildBankFrameEditBox:ClearAllPoints()
			ArmoryGuildBankFrameEditBox:SetPoint("TOPLEFT", 8, -40)
			ArmoryGuildBankFilterDropDown:ClearAllPoints()
			ArmoryGuildBankFilterDropDown:SetPoint("TOPRIGHT", 33, -35)
			ArmoryGuildBankNameDropDown:ClearAllPoints()
			ArmoryGuildBankNameDropDown:SetPoint("TOPLEFT", -15, -3)
			ArmoryGuildBankNameDropDown:SetWidth(160)
		end)
	end

	local function SkinGuildBank()
		ArmoryGuildBankFrame.filter = ""

		ArmoryGuildBankFrameDeleteButton:Kill()
		AS:SkinDropDownBox(ArmoryGuildBankNameDropDown)
		ArmoryGuildBankFilterDropDownText:ClearAllPoints()
		ArmoryGuildBankFilterDropDownText:SetPoint("RIGHT", ArmoryGuildBankFilterDropDown, "RIGHT", 0, 0)
		ArmoryDropDownMenu_JustifyText(ArmoryGuildBankFilterDropDown, "RIGHT")

		SkinListGuildBank()
		SkinIconGuildBank()
	end

	Armory:Execute(function()
		SkinMisc()
		SkinOptions()
		SkinComparisonTooltips()
		SkinMinimapButton()
		SkinOverlay()
		SkinArmoryFrame()
		SkinBuffs()
		SkinPaperDoll()
		SkinGearSet()
		SkinPets()
		SkinTalents()
		SkinPVP()
		SkinOther()
		SkinInventory()
		SkinQuests()
		SkinSpellBook()
		SkinSocial()
		SkinTradeSkill()
		SkinAchievements()
		SkinFind()
		SkinLookup()
		SkinQTips()
		if not AGB then return end
		SkinGuildOptions()
		SkinGuildInventory()
		SkinGuildBank()
	end)
end

AS:RegisterSkin('Armory', AS.Armory)