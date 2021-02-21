if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_AdventureMap(event, addon)
	if addon ~= 'Blizzard_AdventureMap' then return end

	local function HandleReward(frame)
		if (not frame) then return end

		if frame.Icon then
			AS:SkinTexture(frame.Icon, true)

			AS:CreateBackdrop(frame)
			frame.Backdrop:SetPoint('TOPLEFT', frame.Icon, 'TOPRIGHT', -1, 0)
			frame.Backdrop:SetPoint('BOTTOMLEFT', frame.Icon, 'BOTTOMRIGHT', -1, 0)
			frame.Backdrop:SetPoint('RIGHT', frame, 'RIGHT', -5, 0)

			frame.Count:ClearAllPoints()
			frame.Count:SetPoint("BOTTOMRIGHT", frame.Icon, "BOTTOMRIGHT", 2, 0)
		end

		if frame.NameFrame then frame.NameFrame:SetAlpha(0) end
		if frame.ItemNameBG then frame.ItemNameBG:SetAlpha(0) end

		if (frame.CircleBackground) then
			frame.CircleBackground:SetAlpha(0)
			frame.CircleBackgroundGlow:SetAlpha(0)
		end
	end

	AS:SkinBackdropFrame(AdventureMapQuestChoiceDialog)

	local function SkinRewards()
		for reward in pairs(AdventureMapQuestChoiceDialog.rewardPool.activeObjects) do
			HandleReward(reward)
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

	for i = 1, 3 do
		local Button = GroupFinderFrame["groupButton"..i]

		AS:SetTemplate(Button)
		Button.bg:SetAlpha(0)
		Button.ring:SetAlpha(0)
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

	hooksecurefunc('GroupFinderFrame_SelectGroupButton', function()
		for i = 1, 3 do
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
			Button.NameFrame:SetTexture()
			Button.shortageBorder:SetTexture()

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

		parentFrame.MoneyReward.NameFrame:SetTexture()
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

	local roleButtons = {
		LFDQueueFrameRoleButtonHealer,
		LFDQueueFrameRoleButtonDPS,
		LFDQueueFrameRoleButtonLeader,
		LFDQueueFrameRoleButtonTank,
		RaidFinderQueueFrameRoleButtonHealer,
		RaidFinderQueueFrameRoleButtonDPS,
		RaidFinderQueueFrameRoleButtonLeader,
		RaidFinderQueueFrameRoleButtonTank,
		LFGInvitePopupRoleButtonTank,
		LFGInvitePopupRoleButtonHealer,
		LFGInvitePopupRoleButtonDPS,
		LFGListApplicationDialog.TankButton,
		LFGListApplicationDialog.HealerButton,
		LFGListApplicationDialog.DamagerButton,
	}

	-- /run LFGInvitePopup_Update("Elvz", true, true, true) StaticPopupSpecial_Show(LFGInvitePopup)
	for _, roleButton in pairs(roleButtons) do
		AS:SkinCheckBox(roleButton.checkButton or roleButton.CheckButton)
	end

	hooksecurefunc('LFGListSearchPanel_UpdateResults', function(self)
		for _, Button in pairs(self.ScrollFrame.buttons) do
			if not Button.Backdrop then
				AS:CreateBackdrop(Button)
				AS:SetInside(Button.Backdrop, Button, 6, 1)
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

	AS:StripTextures(LFGListFrame.EntryCreation.Inset)
	AS:SkinButton(LFGListFrame.EntryCreation.CancelButton)
	AS:SkinButton(LFGListFrame.EntryCreation.ListGroupButton)

--	LFGListFrame.EntryCreation.CancelButton:SetPoint("BOTTOMLEFT", -1, 3)
--	LFGListFrame.EntryCreation.ListGroupButton:SetPoint("BOTTOMRIGHT", -6, 3)
	AS:SkinEditBox(LFGListFrame.EntryCreation.Description)

	AS:SkinEditBox(LFGListFrame.EntryCreation.Name)
	AS:SkinEditBox(LFGListFrame.EntryCreation.ItemLevel.EditBox)
	AS:SkinEditBox(LFGListFrame.EntryCreation.HonorLevel.EditBox)
	AS:SkinEditBox(LFGListFrame.EntryCreation.VoiceChat.EditBox)

	AS:SkinDropDownBox(LFGListFrame.EntryCreation.ActivityDropDown)
	AS:SkinDropDownBox(LFGListFrame.EntryCreation.GroupDropDown)
	AS:SkinDropDownBox(LFGListFrame.EntryCreation.CategoryDropDown, 330)

	AS:SkinCheckBox(LFGListFrame.EntryCreation.ItemLevel.CheckButton)
	AS:SkinCheckBox(LFGListFrame.EntryCreation.HonorLevel.CheckButton)
	AS:SkinCheckBox(LFGListFrame.EntryCreation.VoiceChat.CheckButton)
	AS:SkinCheckBox(LFGListFrame.EntryCreation.PrivateGroup.CheckButton)

	AS:SkinFrame(LFGListFrame.EntryCreation.ActivityFinder.Dialog)
	AS:SkinFrame(LFGListFrame.EntryCreation.ActivityFinder.Dialog.BorderFrame)

	AS:SkinEditBox(LFGListFrame.EntryCreation.ActivityFinder.Dialog.EntryBox)
	AS:SkinScrollBar(LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollFrame.scrollBar)
	AS:SkinButton(LFGListFrame.EntryCreation.ActivityFinder.Dialog.SelectButton)
	AS:SkinButton(LFGListFrame.EntryCreation.ActivityFinder.Dialog.CancelButton)

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

	AS:SkinFrame(LFGListApplicationDialog)
	AS:SkinButton(LFGListApplicationDialog.SignUpButton)
	AS:SkinButton(LFGListApplicationDialog.CancelButton)
	AS:SkinEditBox(LFGListApplicationDialogDescription)

	AS:SkinFrame(LFGInvitePopup)
	AS:SkinButton(LFGInvitePopupAcceptButton)
	AS:SkinButton(LFGInvitePopupDeclineButton)

	hooksecurefunc("LFGListApplicationDialog_UpdateRoles", function(self) --Copy from Blizzard, we just fix position
		local availTank, availHealer, availDPS = C_LFGList.GetAvailableRoles();

		local avail1, avail2;
		if ( availTank ) then
			avail1 = self.TankButton;
		end
		if ( availHealer ) then
			if ( avail1 ) then
				avail2 = self.HealerButton;
			else
				avail1 = self.HealerButton;
			end
		end
		if ( availDPS ) then
			if ( avail1 ) then
				avail2 = self.DamagerButton;
			else
				avail1 = self.DamagerButton;
			end
		end

		if ( avail2 ) then
			avail1:ClearAllPoints();
			avail1:SetPoint("TOPRIGHT", self, "TOP", -40, -35);
			avail2:ClearAllPoints();
			avail2:SetPoint("TOPLEFT", self, "TOP", 40, -35);
		elseif ( avail1 ) then
			avail1:ClearAllPoints();
			avail1:SetPoint("TOP", self, "TOP", 0, -35);
		end
	end)


	AS:SetTemplate(LFGListInviteDialog)
	AS:SkinButton(LFGListInviteDialog.AcknowledgeButton)
	AS:SkinButton(LFGListInviteDialog.AcceptButton)
	AS:SkinButton(LFGListInviteDialog.DeclineButton)
	LFGListInviteDialog.RoleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")

	hooksecurefunc("LFGListInviteDialog_Show", function(self, resultID)
		local _,_,_,_, role = C_LFGList.GetApplicationInfo(resultID)
		self.RoleIcon:SetTexCoord(GetBackgroundTexCoordsForRole(role))
	end)

	AS:SkinEditBox(LFGListFrame.SearchPanel.SearchBox)

	AS:SkinButton(LFGListFrame.SearchPanel.BackButton, true)
	AS:SkinButton(LFGListFrame.SearchPanel.SignUpButton, true)
	AS:SkinButton(LFGListSearchPanelScrollFrame.StartGroupButton,  true)
	LFGListFrame.SearchPanel.BackButton:ClearAllPoints()
	LFGListFrame.SearchPanel.BackButton:SetPoint("BOTTOMLEFT", -1, 3)
	LFGListFrame.SearchPanel.SignUpButton:ClearAllPoints()
	LFGListFrame.SearchPanel.SignUpButton:SetPoint("BOTTOMRIGHT", -6, 3)
	AS:StripTextures(LFGListFrame.SearchPanel.ResultsInset)
	AS:SkinScrollBar(LFGListSearchPanelScrollFrameScrollBar)

	AS:SkinButton(LFGListFrame.SearchPanel.FilterButton)
	LFGListFrame.SearchPanel.FilterButton:SetPoint("LEFT", LFGListFrame.SearchPanel.SearchBox, "RIGHT", 5, 0)
	AS:SkinButton(LFGListFrame.SearchPanel.RefreshButton)
	LFGListFrame.SearchPanel.RefreshButton:SetSize(24, 24)
	LFGListFrame.SearchPanel.RefreshButton.Icon:SetPoint("CENTER")

	hooksecurefunc("LFGListApplicationViewer_UpdateApplicant", function(button)
		if not button.DeclineButton.template then
			AS:SkinButton(button.DeclineButton, nil, true)
		end
		if not button.InviteButton.template then
			AS:SkinButton(button.InviteButton)
		end
	end)

	hooksecurefunc("LFGListSearchEntry_Update", function(button)
		if not button.CancelButton.template then
			AS:SkinButton(button.CancelButton, nil, true)
		end
	end)

	hooksecurefunc("LFGListSearchPanel_UpdateAutoComplete", function(self)
		for i = 1, LFGListFrame.SearchPanel.AutoCompleteFrame:GetNumChildren() do
			local child = select(i, LFGListFrame.SearchPanel.AutoCompleteFrame:GetChildren())
			if child and not child.isSkinned and child:GetObjectType() == "Button" then
				AS:SkinButton(child)
				child.isSkinned = true
			end
		end

		local text = self.SearchBox:GetText()
		local matchingActivities = C_LFGList.GetAvailableActivities(self.categoryID, nil, self.filters, text)
		local numResults = min(#matchingActivities, MAX_LFG_LIST_SEARCH_AUTOCOMPLETE_ENTRIES)

		for i = 2, numResults do
			local button = self.AutoCompleteFrame.Results[i]
			if button and not button.moved then
				button:SetPoint("TOPLEFT", self.AutoCompleteFrame.Results[i-1], "BOTTOMLEFT", 0, -2)
				button:SetPoint("TOPRIGHT", self.AutoCompleteFrame.Results[i-1], "BOTTOMRIGHT", 0, -2)
				button.moved = true
			end
		end
		self.AutoCompleteFrame:SetHeight(numResults * (self.AutoCompleteFrame.Results[1]:GetHeight() + 3.5) + 8)
	end)
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
