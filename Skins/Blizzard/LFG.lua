local AS = unpack(AddOnSkins)

function AS:Blizzard_PvE(event, addon)
	AS:SkinFrame(PVEFrame, nil, nil, true)
	AS:StripTextures(PVEFrameLeftInset)
	AS:SkinCloseButton(PVEFrameCloseButton)

	for i = 1, PVEFrame.numTabs do
		AS:SkinTab(_G['PVEFrameTab'..i])
	end

	PVEFrame.shadows:Kill()

	GroupFinderFrameGroupButton1.icon:SetTexture("Interface\\Icons\\INV_Helmet_08")
	GroupFinderFrameGroupButton2.icon:SetTexture("Interface\\Icons\\Icon_Scenarios")
	GroupFinderFrameGroupButton3.icon:SetTexture("Interface\\Icons\\inv_helmet_06")
	GroupFinderFrameGroupButton4.icon:SetTexture("Interface\\Icons\\Achievement_General_StayClassy")

	for i = 1, 4 do
		local Button = GroupFinderFrame["groupButton"..i]

		Button.ring:Hide()
		Button.bg:SetTexture("")
		Button.bg:SetAllPoints()

		AS:SkinFrame(Button, nil, true)
		Button:SetHighlightTexture('')

		AS:SkinTexture(Button.icon)
		Button.icon:SetSize(45, 45)
		AS:CreateBackdrop(Button)
		Button.Backdrop:SetFrameLevel(Button:GetFrameLevel())
		Button.Backdrop:SetOutside(Button.icon)

		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
			self.Backdrop:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self) 
			if self:GetID() == GroupFinderFrame.selectionIndex then
				self:SetBackdropBorderColor(unpack(AS.Color))
				self.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	hooksecurefunc('GroupFinderFrame_SelectGroupButton', function()
		for i = 1, 4 do
			local Button = GroupFinderFrame["groupButton"..i]
			if GroupFinderFrame.selectionIndex == Button:GetID() then
				Button:SetBackdropBorderColor(unpack(AS.Color))
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end
	end)

	AS:SkinButton(LFDQueueFrameFindGroupButton, true)

	AS:StripTextures(LFDParentFrame)
	AS:StripTextures(LFDParentFrameInset)
	AS:StripTextures(LFDQueueFrame, true)
	AS:StripTextures(LFDQueueFrameSpecificListScrollFrame, true)
	AS:SkinScrollBar(LFDQueueFrameSpecificListScrollFrameScrollBar)

	local function ReskinRewards()
		for i = 1, LFD_MAX_REWARDS do
			local Button = _G["LFDQueueFrameRandomScrollFrameChildFrameItem"..i]

			if Button and not Button.reskinned then
				Button.NameFrame:SetTexture(nil)
				Button.shortageBorder:SetTexture(nil)

				AS:SkinTexture(Button.Icon)

				Button.Border = CreateFrame("Frame", nil, Button)
				AS:SkinFrame(Button.Border)
				Button.Border:SetOutside(Button.Icon)
				Button.Border:SetBackdropColor(0, 0, 0, 0)

				AS:CreateBackdrop(Button, AS:CheckOption('SkinTemplate'))
				Button.Backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 0, 0)
				Button.Backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 0, 0)
				Button.Backdrop:SetPoint('RIGHT', Button, 'RIGHT', -5, 0)
				Button:HookScript('OnUpdate', function(self)
					Button.Border:SetBackdropBorderColor(unpack(AS.BorderColor))
					if Button.dungeonID then
						local Link = GetLFGDungeonRewardLink(Button.dungeonID, i)
						if Link then
							local Quality = select(3, GetItemInfo(Link))
							if Quality and Quality > 1 and BAG_ITEM_QUALITY_COLORS[Quality] then
								Button.Border:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
							end
						end
					end
				end)
				Button.reskinned = true
			end
		end
		AS:SkinButton(LFDQueueFrameRandomScrollFrameChildFrameBonusRepFrame.ChooseButton)
	end

	hooksecurefunc("LFDQueueFrameRandom_UpdateFrame", ReskinRewards)

	AS:SkinDropDownBox(LFDQueueFrameTypeDropDown)
	LFDQueueFrameTypeDropDown:SetPoint('BOTTOMLEFT', LFDQueueFrame, 'BOTTOMLEFT', 85, 285)

	for i = 1, NUM_LFD_CHOICE_BUTTONS do
		AS:SkinCheckBox(_G["LFDQueueFrameSpecificListButton"..i].enableButton)
	end

	AS:StripTextures(RaidFinderFrame)
	AS:StripTextures(RaidFinderFrameBottomInset)
	AS:StripTextures(RaidFinderFrameRoleInset)
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

	local function SkinMoneyReward(MoneyReward)
		MoneyReward.NameFrame:SetTexture(nil)
		AS:SkinTexture(MoneyReward.Icon)
		MoneyReward.Border = CreateFrame("Frame", nil, MoneyReward)
		AS:SkinFrame(MoneyReward.Border)
		MoneyReward.Border:SetOutside(MoneyReward.Icon)
		MoneyReward.Border:SetBackdropColor(0, 0, 0, 0)
		AS:CreateBackdrop(MoneyReward, AS:CheckOption('SkinTemplate'))
		MoneyReward.Backdrop:SetPoint('TOPLEFT', MoneyReward.Icon, 'TOPRIGHT', 0, 0)
		MoneyReward.Backdrop:SetPoint('BOTTOMLEFT', MoneyReward.Icon, 'BOTTOMRIGHT', 0, 0)
		MoneyReward.Backdrop:SetPoint('RIGHT', MoneyReward, 'RIGHT', -5, 0)
	end

	SkinMoneyReward(LFDQueueFrameRandomScrollFrameChildFrameMoneyReward)
	SkinMoneyReward(RaidFinderQueueFrameScrollFrameChildFrameMoneyReward)
	SkinMoneyReward(ScenarioQueueFrameRandomScrollFrameChildFrameMoneyReward)
--[[
	for i = 1, LFD_MAX_REWARDS do
		local Button = _G["RaidFinderQueueFrameScrollFrameChildFrameItem"..i]

		if Button then
			Button.NameFrame:SetTexture(nil)
			Button.shortageBorder:SetTexture(nil)

			AS:SkinTexture(Button.Icon)

			Button.Border = CreateFrame("Frame", nil, Button)
			AS:SkinFrame(Button.Border)
			Button.Border:SetOutside(Button.Icon)
			Button.Border:SetBackdropColor(0, 0, 0, 0)

			AS:CreateBackdrop(Button, AS:CheckOption('SkinTemplate'))
			Button.Backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 0, 0)
			Button.Backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 0, 0)
			Button.Backdrop:SetPoint('RIGHT', Button, 'RIGHT', -5, 0)
			Button:HookScript('OnUpdate', function(self)
				Button.Border:SetBackdropBorderColor(unpack(AS.BorderColor))
				if Button.dungeonID then
					local Link = GetLFGDungeonRewardLink(Button.dungeonID, i)
					if Link then
						local Quality = select(3, GetItemInfo(Link))
						if Quality and Quality > 1 and BAG_ITEM_QUALITY_COLORS[Quality] then
							Button.Border:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
						end
					end
				end
			end)
		end
	end

	local function SkinIcons()
		for i = 1, LFG_ROLE_NUM_SHORTAGE_TYPES do
			if _G['LFGDungeonReadyDialogRewardsFrameReward'..i] and not _G['LFGDungeonReadyDialogRewardsFrameReward'..i].IsDone then
				_G['LFGDungeonReadyDialogRewardsFrameReward'..i..'Border']:Kill()
				AS:SkinTexture(_G['LFGDungeonReadyDialogRewardsFrameReward'..i..'Texture'])
				_G['LFGDungeonReadyDialogRewardsFrameReward'..i].IsDone = true
			end
		end
	end

	hooksecurefunc('LFGDungeonReadyDialog_UpdateRewards', SkinIcons)
]]
	local checkButtons = {
		"LFDQueueFrameRoleButtonTank",
		"LFDQueueFrameRoleButtonHealer",
		"LFDQueueFrameRoleButtonDPS",
		"LFDQueueFrameRoleButtonLeader",
		"RaidFinderQueueFrameRoleButtonTank",
		"RaidFinderQueueFrameRoleButtonHealer",
		"RaidFinderQueueFrameRoleButtonDPS",
		"RaidFinderQueueFrameRoleButtonLeader",
	}

	for _, object in pairs(checkButtons) do
		_G[object]:GetChildren():SetFrameLevel(_G[object]:GetChildren():GetFrameLevel() + 2)
		AS:SkinCheckBox(_G[object]:GetChildren())
	end

	AS:StripTextures(ScenarioFinderFrame)
	AS:StripTextures(ScenarioFinderFrameInset)
	AS:SkinDropDownBox(ScenarioQueueFrameTypeDropDown)
	ScenarioQueueFrameTypeDropDown:SetPoint('TOPLEFT', ScenarioQueueFrame, 'TOPLEFT', 87, -40)
	AS:StripTextures(ScenarioQueueFrameSpecificScrollFrame, true)
	AS:StripTextures(ScenarioQueueFrame, true)
	AS:SkinButton(ScenarioQueueFrameFindGroupButton, true)
	AS:SkinScrollBar(ScenarioQueueFrameSpecificScrollFrameScrollBar)

	AS:StripTextures(LFGDungeonReadyPopup)
	AS:SkinFrame(LFGDungeonReadyDialog, nil, nil, true)
	AS:CreateShadow(LFGDungeonReadyDialog)
	LFGDungeonReadyDialog.SetBackdrop = AS.Noop
	AS:SkinButton(LFGDungeonReadyDialogLeaveQueueButton)
	AS:SkinButton(LFGDungeonReadyDialogEnterDungeonButton)
	AS:SkinCloseButton(LFGDungeonReadyDialogCloseButton)
	AS:SkinFrame(LFGDungeonReadyStatus)
	AS:SkinCloseButton(LFGDungeonReadyStatusCloseButton)

	AS:StripTextures(LFDQueueFrameRandomScrollFrameScrollBar)
	AS:SkinScrollBar(LFDQueueFrameRandomScrollFrameScrollBar)

	AS:StripTextures(LFGListFrame.CategorySelection.Inset)
	AS:SkinButton(LFGListFrame.CategorySelection.StartGroupButton, true)
	AS:SkinButton(LFGListFrame.CategorySelection.FindGroupButton, true)

	AS:StripTextures(LFGListFrame.ApplicationViewer, true)
	AS:StripTextures(LFGListApplicationViewerScrollFrameScrollBar)
	AS:SkinScrollBar(LFGListApplicationViewerScrollFrameScrollBar)
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
	AS:SkinScrollBar(LFGListSearchPanelScrollFrameScrollBar)

	-- AS:StripTextures(LFGListFrame.EntryCreation.Inset)
	-- AS:SkinButton(LFGListFrame.EntryCreation.CancelButton, true)
	-- AS:SkinButton(LFGListFrame.EntryCreation.ListGroupButton, true)
	-- AS:SkinEditBox(LFGListFrame.EntryCreation.Name)
	-- AS:StripTextures(LFGListEntryCreationDescription)
	-- AS:SkinEditBox(LFGListEntryCreationDescription)
	-- AS:SkinDropDownBox(LFGListEntryCreationCategoryDropDown, 320)
	-- AS:SkinDropDownBox(LFGListEntryCreationGroupDropDown, 190)
	-- AS:SkinDropDownBox(LFGListEntryCreationActivityDropDown)
	-- AS:SkinCheckBox(LFGListFrame.EntryCreation.ItemLevel.CheckButton)
	-- AS:SkinEditBox(LFGListFrame.EntryCreation.ItemLevel.EditBox)
	-- AS:SkinCheckBox(LFGListFrame.EntryCreation.VoiceChat.CheckButton)
	-- AS:SkinEditBox(LFGListFrame.EntryCreation.VoiceChat.EditBox)
end

AS:RegisterSkin("Blizzard_PvE", AS.Blizzard_PvE)

function AS:Blizzard_ChallengesUI(event, addon)
	if addon ~= 'Blizzard_ChallengesUI' then return end
	AS:StripTextures(ChallengesFrameInset, true)
	ChallengesFrameInset:Hide()
	ChallengesFrameInsetBg:Hide()
end

AS:RegisterSkin("Blizzard_ChallengesUI", AS.Blizzard_ChallengesUI, 'ADDON_LOADED')

function AS:Blizzard_PVPUI(_, addon)
	if addon ~= "Blizzard_PVPUI" then return end

	AS:StripTextures(PVPUIFrame)
	AS:StripTextures(PVPQueueFrame.HonorInset)

	for i = 1, 3 do
		local Button = PVPQueueFrame['CategoryButton'..i]
		AS:SkinBackdropFrame(Button, nil, true)
		Button.Background:SetTexture('')
		Button.Ring:SetTexture('')
		Button.Icon:SetSize(45, 45)
		AS:SkinTexture(Button.Icon)
		AS:CreateBackdrop(Button.Icon)
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
		AS:SkinTexture(Button.Reward.Icon)
		AS:CreateBackdrop(Button.Reward.Icon)

		AS:StripTextures(Button.Reward.EnlistmentBonus)
		AS:SkinTexture(Button.Reward.EnlistmentBonus.Icon)
		AS:CreateBackdrop(Button.Reward.EnlistmentBonus.Icon)

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
				local name, _, texture, _, _, _, _, quality = GetCurrencyInfo(reward.id);
				if quality == LE_ITEM_QUALITY_ARTIFACT then
					_, rewardTexture, _, rewardQuaility = CurrencyContainerUtil.GetCurrencyContainerInfo(reward.id, reward.quantity, name, texture, quality);
				end
			end
		end

		if not rewardTexture and itemRewards then
			local reward = itemRewards[1];
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
		AS:SkinTexture(Frame.ConquestBar.Reward.Icon)
		AS:CreateBackdrop(Frame.ConquestBar.Reward.Icon)
		Frame.ConquestBar.Reward:SetPoint("LEFT", Frame.ConquestBar, "RIGHT", -8, 0)
		Frame.ConquestBar:SetStatusBarColor(unpack(AS.Faction == "Alliance" and {0.05, 0.15, 0.36} or {0.63, 0.09, 0.09}))

		hooksecurefunc(Frame.ConquestBar.Reward.Icon, 'SetTexture', function(self) -- Code taken from :GetConquestLevelInfo the function isn't returning the correct id somehow.
			local Quality
			for _, questID in ipairs(C_QuestLine.GetQuestLineQuests(782)) do
				if not IsQuestFlaggedCompleted(questID) and not C_QuestLog.IsOnQuest(questID) then
					break;
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
end


AS:RegisterSkin("Blizzard_PVPUI", AS.Blizzard_PVPUI, 'ADDON_LOADED')
