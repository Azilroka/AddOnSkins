local AS = unpack(AddOnSkins)

function AS:Blizzard_AdventureMap(event, addon)
	if addon ~= 'Blizzard_AdventureMap' then return end

	AS:SkinBackdropFrame(AdventureMapQuestChoiceDialog)

	local function SkinRewards()
		for reward in pairs(AdventureMapQuestChoiceDialog.rewardPool.activeObjects) do
			if not reward.isSkinned then
				AS:SkinIconButton(reward)
				reward.Icon:SetDrawLayer("OVERLAY")
				reward.isSkinned = true
			end
		end
	end

	hooksecurefunc(AdventureMapQuestChoiceDialog, "RefreshRewards", SkinRewards)

	AdventureMapQuestChoiceDialog.Details.Child.TitleHeader:SetTextColor(1, 1, 0)
	AdventureMapQuestChoiceDialog.Details.Child.DescriptionText:SetTextColor(1, 1, 1)
	AdventureMapQuestChoiceDialog.Details.Child.ObjectivesHeader:SetTextColor(1, 1, 0)
	AdventureMapQuestChoiceDialog.Details.Child.ObjectivesText:SetTextColor(1, 1, 1)

	AS:SkinCloseButton(AdventureMapQuestChoiceDialog.CloseButton)
	AS:SkinScrollBar(AdventureMapQuestChoiceDialog.Details.ScrollBar)
	AS:SkinButton(AdventureMapQuestChoiceDialog.AcceptButton)
	AS:SkinButton(AdventureMapQuestChoiceDialog.DeclineButton)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_ChallengesUI(event, addon)
	if addon ~= 'Blizzard_ChallengesUI' then return end

	AS:StripTextures(ChallengesFrameInset, true)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_PvE()
	AS:SkinFrame(PVEFrame)
	AS:SkinCloseButton(PVEFrame.CloseButton)
	PVEFrame.portrait:SetAlpha(0)
	PVEFrame.shadows:SetAlpha(0)

	for i = 1, 3 do
		AS:SkinTab(PVEFrame['tab'..i])
	end

	for i = 1, 4 do
		local Button = GroupFinderFrame["groupButton"..i]

		AS:SkinFrame(Button)
		Button:SetHighlightTexture('')

		AS:SkinTexture(Button.icon, true)
		Button.icon:SetSize(45, 45)
		Button.icon.Backdrop:SetFrameLevel(Button.icon.Backdrop:GetFrameLevel() + 1)

		Button.name:SetTextColor(1, 1, 1)

		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
			self.icon.Backdrop:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self:GetID() == GroupFinderFrame.selectionIndex then
				self:SetBackdropBorderColor(unpack(AS.Color))
				self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	GroupFinderFrameGroupButton1.icon:SetTexture("Interface\\Icons\\INV_Helmet_08")
	GroupFinderFrameGroupButton2.icon:SetTexture("Interface\\Icons\\Icon_Scenarios")
	GroupFinderFrameGroupButton3.icon:SetTexture("Interface\\Icons\\inv_helmet_06")
	GroupFinderFrameGroupButton4.icon:SetTexture("Interface\\Icons\\Achievement_General_StayClassy")

	hooksecurefunc('GroupFinderFrame_SelectGroupButton', function()
		for i = 1, 4 do
			local Button = GroupFinderFrame["groupButton"..i]
			if GroupFinderFrame.selectionIndex == Button:GetID() then
				Button:SetBackdropBorderColor(unpack(AS.Color))
				Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end
	end)

	AS:StripTextures(LFDParentFrame)
	AS:StripTextures(LFDQueueFrame, true)

	AS:SkinFrame(LFDQueueFrame.PartyBackfill)
	AS:SkinFrame(LFDQueueFrameNoLFDWhileLFR)
	AS:SkinButton(LFDQueueFrameNoLFDWhileLFRLeaveQueueButton)
	AS:SkinButton(LFDQueueFramePartyBackfillBackfillButton)
	AS:SkinButton(LFDQueueFramePartyBackfillNoBackfillButton)

	AS:SkinButton(LFDQueueFrameFindGroupButton, true)
	LFDQueueFrameFindGroupButton:SetPoint('BOTTOM', 0, 2)

	AS:StripTextures(LFDQueueFrameSpecificListScrollFrame)
	AS:SkinScrollBar(LFDQueueFrameSpecificListScrollFrame.ScrollBar)

	hooksecurefunc("LFGRewardsFrame_SetItemButton", function(parentFrame, dungeonID, index, id, name, texture, numItems, rewardType, rewardID, quality, shortageIndex, showTankIcon, showHealerIcon, showDamageIcon)
		local parentName = parentFrame:GetName()
		local Button = _G[parentName.."Item"..index]
		if Button and not Button.Backdrop then
			Button.NameFrame:SetTexture(nil)
			Button.shortageBorder:SetTexture(nil)

			Button.IconBorder:SetAlpha(0)
			AS:SkinTexture(Button.Icon, true)

			AS:CreateBackdrop(Button)
			Button.Backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 1, 0)
			Button.Backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 1, 0)
			Button.Backdrop:SetPoint('RIGHT', Button, 'RIGHT', -5, 0)
			hooksecurefunc(Button.IconBorder, 'SetVertexColor', function(self, r, g, b) Button.Icon.Backdrop:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(Button.IconBorder, 'Hide', function(self) Button.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end
	end)

	AS:SkinScrollBar(LFDQueueFrameRandomScrollFrame.ScrollBar)
	AS:SkinButton(LFDQueueFrameRandomScrollFrameChildFrameBonusRepFrame.ChooseButton)

	hooksecurefunc('LFGDungeonReadyDialog_UpdateRewards', function()
		for i = 1, LFG_ROLE_NUM_SHORTAGE_TYPES do
			local Button = LFGDungeonReadyDialogRewardsFrame.Rewards[i]
			if Button then
				AS:SkinTexture(Button.texture, true)
				Button:DisableDrawLayer('OVERLAY')
			end
		end
	end)

	AS:SkinDropDownBox(LFDQueueFrameTypeDropDown)
	LFDQueueFrameTypeDropDown:SetPoint('BOTTOMLEFT', LFDQueueFrame, 'BOTTOMLEFT', 85, 285)

	for i = 1, NUM_LFD_CHOICE_BUTTONS do
		AS:SkinCheckBox(_G["LFDQueueFrameSpecificListButton"..i].enableButton)
	end

	AS:StripTextures(RaidFinderFrame)
	--RaidFinderFrameBottomInsetBg:Hide()
	--RaidFinderFrameBtnCornerRight:Hide()
	--RaidFinderFrameButtonBottomBorder:Hide()
	AS:SkinDropDownBox(RaidFinderQueueFrameSelectionDropDown)
	RaidFinderQueueFrameSelectionDropDown:SetPoint('BOTTOMLEFT', RaidFinderFrame, 'BOTTOMLEFT', 85, 285)

	AS:StripTextures(RaidFinderFrameFindRaidButton)
	AS:SkinButton(RaidFinderFrameFindRaidButton)
	AS:StripTextures(RaidFinderQueueFrame)
	RaidFinderQueueFrameBackground:SetAlpha(0)
	AS:SkinButton(RaidFinderQueueFramePartyBackfillBackfillButton)
	AS:SkinButton(RaidFinderQueueFramePartyBackfillNoBackfillButton)

	hooksecurefunc('LFGRewardsFrame_UpdateFrame', function(parentFrame, dungeonID, background)
		if ( not dungeonID ) then
			return
		end

		parentFrame.MoneyReward.NameFrame:SetTexture(nil)
		AS:SkinTexture(parentFrame.MoneyReward.Icon, true)

		AS:CreateBackdrop(parentFrame.MoneyReward)
		parentFrame.MoneyReward.Backdrop:SetPoint('TOPLEFT', parentFrame.MoneyReward.Icon, 'TOPRIGHT', 1, 0)
		parentFrame.MoneyReward.Backdrop:SetPoint('BOTTOMLEFT', parentFrame.MoneyReward.Icon, 'BOTTOMRIGHT', 1, 0)
		parentFrame.MoneyReward.Backdrop:SetPoint('RIGHT', parentFrame.MoneyReward, 'RIGHT', -5, 0)

		--parentFrame.bonusRepFrame
	end)

	for _, Button in pairs({ 'LFDQueueFrameRoleButton', 'RaidFinderQueueFrameRoleButton' }) do
		for _, Role in pairs({ 'Tank', 'Healer', 'DPS', 'Leader' }) do
			AS:SkinCheckBox(_G[Button..Role].checkButton)
			_G[Button..Role].checkButton:SetFrameLevel(_G[Button..Role].checkButton:GetFrameLevel() + 1)
		end
	end

	AS:StripTextures(ScenarioFinderFrame)

	AS:StripTextures(ScenarioFinderFrame.Queue, true)
	AS:SkinDropDownBox(ScenarioFinderFrame.Queue.Dropdown)
	ScenarioFinderFrame.Queue.Dropdown:SetPoint('TOPLEFT', ScenarioFinderFrame.Queue, 'TOPLEFT', 87, -40)
	AS:StripTextures(ScenarioFinderFrame.Queue.Specific.ScrollFrame, true)
	AS:SkinScrollBar(ScenarioFinderFrame.Queue.Specific.ScrollFrame.ScrollBar)

	AS:SkinButton(ScenarioQueueFrameFindGroupButton, true)

	AS:StripTextures(LFGListFrame.CategorySelection.Inset)
	AS:SkinButton(LFGListFrame.CategorySelection.StartGroupButton, true)
	AS:SkinButton(LFGListFrame.CategorySelection.FindGroupButton, true)

	hooksecurefunc("LFGListCategorySelection_AddButton", function(self, btnIndex, categoryID, filters)
		local Button = self.CategoryButtons[btnIndex]
		if (Button) then
			if not Button.Backdrop then
				AS:SkinTexture(Button.Icon, true)
				Button.Cover:Hide()
				Button.HighlightTexture:SetColorTexture(1, 1, 1, 0.1)
				Button.HighlightTexture:SetAllPoints(Button.Icon)
				Button.Label:SetFontObject(GameFontNormal)
				Button.SelectedTexture:SetAlpha(0)
			end

			local selected = self.selectedCategory == categoryID and self.selectedFilters == filters
			Button.Icon.Backdrop:SetBackdropBorderColor(unpack(selected and AS.Color or AS.BorderColor))
		end
	end)


	hooksecurefunc('LFGListSearchPanel_UpdateResults', function(self)
		for _, Button in pairs(self.ScrollFrame.buttons) do
			if not Button.Backdrop then
				AS:CreateBackdrop(Button)
				Button.Backdrop:SetInside(Button, 6, 1)
				Button.ResultBG:SetAlpha(0)
				Button.Highlight:SetColorTexture(1, 1, 1, 0.1)
				Button.Highlight:SetAllPoints(Button.Backdrop)
				Button.Selected:SetAlpha(0)
				hooksecurefunc(Button.Selected, 'SetShown', function(self, value) Button.Backdrop:SetBackdropBorderColor(unpack(value == true and AS.Color or AS.BorderColor)) end)
			end
		end
	end)

	AS:StripTextures(LFGListFrame.ApplicationViewer, true)
	AS:SkinScrollBar(LFGListFrame.ApplicationViewer.ScrollFrame.scrollBar)
	AS:SkinButton(LFGListFrame.ApplicationViewer.RemoveEntryButton, true)
	AS:SkinButton(LFGListFrame.ApplicationViewer.EditButton, true)
	AS:SkinFrame(LFGListFrame.ApplicationViewer.NameColumnHeader)
	AS:SkinFrame(LFGListFrame.ApplicationViewer.RoleColumnHeader)
	AS:SkinFrame(LFGListFrame.ApplicationViewer.ItemLevelColumnHeader)
	AS:SkinButton(LFGListFrame.ApplicationViewer.RefreshButton)

	AS:StripTextures(LFGListFrame.SearchPanel.ResultsInset)
	AS:SkinButton(LFGListFrame.SearchPanel.BackButton, true)
	AS:SkinButton(LFGListFrame.SearchPanel.SignUpButton, true)
	AS:SkinEditBox(LFGListFrame.SearchPanel.SearchBox)
	AS:SkinScrollBar(LFGListFrame.SearchPanel.ScrollFrame.scrollBar)

	AS:StripTextures(LFGDungeonReadyPopup)

	AS:SkinFrame(LFGDungeonReadyDialog, nil, nil, true)
	AS:SkinCloseButton(LFGDungeonReadyDialogCloseButton)
	AS:CreateShadow(LFGDungeonReadyDialog)
	LFGDungeonReadyDialog.SetBackdrop = AS.Noop
	AS:SkinButton(LFGDungeonReadyDialog.leaveButton)
	AS:SkinButton(LFGDungeonReadyDialog.enterButton)

	AS:SkinFrame(LFGDungeonReadyStatus)
	AS:SkinCloseButton(LFGDungeonReadyStatusCloseButton)
end

function AS:Blizzard_RaidUI(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		AS:SkinFrame(RaidInfoFrame)
		AS:SkinScrollBar(RaidInfoScrollFrameScrollBar)
		AS:SkinCloseButton(RaidInfoCloseButton)

		AS:StripTextures(RaidInfoInstanceLabel)
		AS:StripTextures(RaidInfoIDLabel)
		AS:SkinButton(RaidFrameConvertToRaidButton)
		AS:SkinButton(RaidFrameRaidInfoButton)
		AS:SkinButton(RaidInfoExtendButton)
		AS:SkinButton(RaidInfoCancelButton)
		AS:SkinCheckBox(RaidFrameAllAssistCheckButton)
	end

	if addon ~= 'Blizzard_RaidUI' then return end

	for i = 1, 8 do
		AS:SkinFrame(_G["RaidGroup"..i])
		for j = 1, 5 do
			AS:StripTextures(_G["RaidGroup"..i.."Slot"..j])
		end
	end

	for i = 1, 40 do
		AS:SkinFrame(_G["RaidGroupButton"..i], 'Default')
	end

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_AdventureMap', AS.Blizzard_AdventureMap, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_ChallengesUI", AS.Blizzard_ChallengesUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_PvE", AS.Blizzard_PvE)
AS:RegisterSkin("Blizzard_RaidUI", AS.Blizzard_RaidUI, 'ADDON_LOADED')