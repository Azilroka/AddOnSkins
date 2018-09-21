local AS = unpack(AddOnSkins)

function AS:Blizzard_PvE()
	AS:SkinFrame(PVEFrame)
	AS:StripTextures(PVEFrame.Inset)
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
	AS:StripTextures(LFDParentFrame.Inset)
	AS:StripTextures(LFDQueueFrame, true)

	AS:SkinButton(LFDQueueFrameFindGroupButton, true)
	LFDQueueFrameFindGroupButton:SetPoint('BOTTOM', 0, 2)

	AS:SkinScrollBar(LFDQueueFrameSpecificListScrollFrame.ScrollBar)

	hooksecurefunc("LFGRewardsFrame_SetItemButton", function(parentFrame, dungeonID, index, id, name, texture, numItems, rewardType, rewardID, quality, shortageIndex, showTankIcon, showHealerIcon, showDamageIcon)
		local parentName = parentFrame:GetName();
		local Button = _G[parentName.."Item"..index];
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
	AS:StripTextures(RaidFinderFrameBottomInset)
	AS:StripTextures(RaidFinderFrame.Inset)
	RaidFinderFrameBottomInsetBg:Hide()
	RaidFinderFrameBtnCornerRight:Hide()
	RaidFinderFrameButtonBottomBorder:Hide()
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
			return;
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
	AS:StripTextures(ScenarioFinderFrame.Inset)

	AS:StripTextures(ScenarioFinderFrame.Queue, true)
	AS:SkinDropDownBox(ScenarioFinderFrame.Queue.Dropdown)
	ScenarioFinderFrame.Queue.Dropdown:SetPoint('TOPLEFT', ScenarioFinderFrame.Queue, 'TOPLEFT', 87, -40)
	AS:StripTextures(ScenarioFinderFrame.Queue.Specific.ScrollFrame, true)
	AS:SkinScrollBar(ScenarioFinderFrame.Queue.Specific.ScrollFrame.ScrollBar)

	AS:SkinButton(ScenarioQueueFrameFindGroupButton, true)

	AS:StripTextures(LFGListFrame.CategorySelection.Inset)
	AS:SkinButton(LFGListFrame.CategorySelection.StartGroupButton, true)
	AS:SkinButton(LFGListFrame.CategorySelection.FindGroupButton, true)

	AS:StripTextures(LFGListFrame.ApplicationViewer, true)
	AS:SkinScrollBar(LFGListFrame.ApplicationViewer.ScrollFrame.scrollBar)
	AS:StripTextures(LFGListFrame.ApplicationViewer.Inset)
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

function AS:Blizzard_ChallengesUI(event, addon)
	if addon ~= 'Blizzard_ChallengesUI' then return end
	AS:StripTextures(ChallengesFrameInset, true)
	ChallengesFrameInset:Hide()
	ChallengesFrameInsetBg:Hide()

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_PVPUI(event, addon)
	if addon ~= "Blizzard_PVPUI" then return end

	AS:StripTextures(PVPUIFrame)
	AS:StripTextures(PVPQueueFrame.HonorInset)

	for i = 1, 3 do
		local Button = PVPQueueFrame['CategoryButton'..i]
		AS:SkinBackdropFrame(Button, nil, true)
		Button.Background:SetTexture('')
		Button.Ring:SetTexture('')
		Button.Icon:SetSize(45, 45)
		AS:SkinTexture(Button.Icon, true)

		Button.Name:SetTextColor(1, 1, 1)

		Button:SetHighlightTexture('')
		Button:HookScript('OnEnter', function(self)
			self.Backdrop:SetBackdropBorderColor(1, .82, 0)
			self.Icon.Backdrop:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self:GetID() == self.isSelected then
				self.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				self.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	hooksecurefunc('PVPQueueFrame_SelectButton', function(index)
		for i = 1, 3 do
			local Button = PVPQueueFrame["CategoryButton"..i]
			Button.isSelected = index
			if ( i == index ) then
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				Button.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end
	end)

	AS:SkinDropDownBox(HonorFrameTypeDropDown)

	AS:SkinScrollBar(HonorFrameSpecificFrameScrollBar)
	AS:SkinButton(HonorFrameQueueButton, true)
	AS:StripTextures(HonorFrame.BonusFrame)
	AS:StripTextures(HonorFrame.BonusFrame.ShadowOverlay)

	local Buttons = { ['RandomBGButton'] = HonorFrame.BonusFrame, ['RandomEpicBGButton'] = HonorFrame.BonusFrame, ['Arena1Button'] = HonorFrame.BonusFrame, ['BrawlButton'] = HonorFrame.BonusFrame, ['RatedBG'] = ConquestFrame, ['Arena2v2'] = ConquestFrame, ['Arena3v3'] = ConquestFrame }

	for Section, Parent in pairs(Buttons) do
		local Button = Parent[Section]
		AS:SkinButton(Button)
		Button.SelectedTexture:SetTexture('')
		Button.SelectedTexture:Hide()

		AS:StripTextures(Button.Reward)
		AS:SkinTexture(Button.Reward.Icon, true)

		AS:StripTextures(Button.Reward.EnlistmentBonus)
		AS:SkinTexture(Button.Reward.EnlistmentBonus.Icon, true)

		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self.SelectedTexture:IsShown() then
				self:SetBackdropBorderColor(unpack(AS.Color))
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	hooksecurefunc('PVPUIFrame_ConfigureRewardFrame', function(rewardFrame, honor, experience, itemRewards, currencyRewards)
		local rewardTexture, rewardQuaility = nil, 1

		if currencyRewards then
			for _, reward in ipairs(currencyRewards) do
				local name, _, texture, _, _, _, _, quality = GetCurrencyInfo(reward.id)
				if quality == LE_ITEM_QUALITY_ARTIFACT then
					_, rewardTexture, _, rewardQuaility = CurrencyContainerUtil.GetCurrencyContainerInfo(reward.id, reward.quantity, name, texture, quality)
				end
			end
		end

		if not rewardTexture and itemRewards then
			local reward = itemRewards[1]
			if reward then
				_, _, rewardQuaility, _, _, _, _, _, _, rewardTexture = GetItemInfo(reward.id)
			end
		end

		if rewardTexture then
			rewardFrame.Icon:SetTexture(rewardTexture)
			if rewardFrame.Icon.Backdrop then
				rewardFrame.Icon.Backdrop:SetBackdropBorderColor(GetItemQualityColor(rewardQuaility))
			end
		end
	end)

	for _, func in pairs({ 'ConquestFrame_UpdateJoinButton', 'HonorFrame_UpdateQueueButtons' }) do
		hooksecurefunc(func, function()
			for Section, Parent in pairs(Buttons) do
				local Button = Parent[Section]
				if Button.SelectedTexture:IsShown() then
					Button:SetBackdropBorderColor(unpack(AS.Color))
				else
					Button:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
		end)
	end

	PVPQueueFrame.CategoryButton1.Icon:SetTexture([[Interface\Icons\achievement_bg_winwsg]])
	PVPQueueFrame.CategoryButton2.Icon:SetTexture([[Interface\Icons\achievement_bg_killxenemies_generalsroom]])
	PVPQueueFrame.CategoryButton3.Icon:SetTexture([[Interface\Icons\ability_warrior_offensivestance]])

	AS:SkinButton(ConquestJoinButton, true)
	AS:StripTextures(ConquestFrame.ShadowOverlay)
	AS:SkinFrame(ConquestTooltip)

	for _, Frame in pairs({ HonorFrame, ConquestFrame }) do
		AS:StripTextures(Frame)
		AS:StripTextures(Frame.Inset)

		AS:SkinCheckBox(Frame.DPSIcon.checkButton, true)
		AS:SkinCheckBox(Frame.TankIcon.checkButton, true)
		AS:SkinCheckBox(Frame.HealerIcon.checkButton, true)

		AS:SkinStatusBar(Frame.ConquestBar)
		Frame.ConquestBar.Reward.Ring:Hide()
		Frame.ConquestBar.Reward.CircleMask:Hide()
		AS:SkinTexture(Frame.ConquestBar.Reward.Icon, true)

		Frame.ConquestBar.Reward:SetPoint("LEFT", Frame.ConquestBar, "RIGHT", -8, 0)
		Frame.ConquestBar:SetStatusBarColor(unpack(AS.Faction == "Alliance" and {0.05, 0.15, 0.36} or {0.63, 0.09, 0.09}))

		hooksecurefunc(Frame.ConquestBar.Reward.Icon, 'SetTexture', function(self) -- Code taken from :GetConquestLevelInfo the function isn't returning the correct id somehow.
			local Quality
			for _, questID in ipairs(C_QuestLine.GetQuestLineQuests(782)) do
				if not IsQuestFlaggedCompleted(questID) and not C_QuestLog.IsOnQuest(questID) then
					break
				end
				if HaveQuestRewardData(questID) then
					local itemID = select(6, GetQuestLogRewardInfo(1, questID))
					Quality = select(3, GetItemInfo(itemID))
				else
					C_TaskQuest.RequestPreloadRewardData(questID) -- Taken from WorldMapFrame
				end
			end
			if Quality then
				self.Backdrop:SetBackdropBorderColor(GetItemQualityColor(Quality))
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_PvE", AS.Blizzard_PvE)
AS:RegisterSkin("Blizzard_ChallengesUI", AS.Blizzard_ChallengesUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_PVPUI", AS.Blizzard_PVPUI, 'ADDON_LOADED')
