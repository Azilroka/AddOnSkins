local AS = unpack(AddOnSkins)

function AS:Blizzard_PvE(event, addon)
	AS:SkinFrame(PVEFrame, nil, nil, true)
	AS:StripTextures(PVEFrameLeftInset)
	AS:SkinCloseButton(PVEFrameCloseButton)

	for i = 1, PVEFrame.numTabs do
		AS:SkinTab(_G['PVEFrameTab'..i])
	end

	PVEFrame.shadows:Hide()

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
		Button.icon:Size(45)
		AS:CreateBackdrop(Button)
		Button.Backdrop:SetFrameLevel(Button:GetFrameLevel())
		Button.Backdrop:SetOutside(Button.icon)

		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
			self.Backdrop:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self) 
			if self:GetID() == GroupFinderFrame.selectionIndex then
				self:SetBackdropBorderColor(0, 0.44, .87, 1)
				self.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	hooksecurefunc('GroupFinderFrame_SelectGroupButton', function(index)
		for i = 1, 4 do
			local Button = GroupFinderFrame["groupButton"..i]
			if GroupFinderFrame.selectionIndex == Button:GetID() then
				Button:SetBackdropBorderColor(0, 0.44, .87, 1)
				Button.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
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

	AS:StripTextures(LFGListFrame.SearchPanel.ResultsInset)
	AS:SkinButton(LFGListFrame.SearchPanel.BackButton, true)
	AS:SkinButton(LFGListFrame.SearchPanel.SignUpButton, true)
	AS:SkinEditBox(LFGListFrame.SearchPanel.SearchBox)
	AS:SkinScrollBar(LFGListSearchPanelScrollFrameScrollBar)

	AS:StripTextures(LFGListFrame.EntryCreation.Inset)
	AS:SkinButton(LFGListFrame.EntryCreation.CancelButton, true)
	AS:SkinButton(LFGListFrame.EntryCreation.ListGroupButton, true)
	AS:SkinEditBox(LFGListFrame.EntryCreation.Name)
	AS:StripTextures(LFGListEntryCreationDescription)
	AS:SkinEditBox(LFGListEntryCreationDescription)
	AS:SkinButton(LFGListFrame.EntryCreation.ListGroupButton, true)
	AS:SkinDropDownBox(LFGListEntryCreationCategoryDropDown, 320)
	AS:SkinDropDownBox(LFGListEntryCreationGroupDropDown, 190)
	AS:SkinDropDownBox(LFGListEntryCreationActivityDropDown)
	AS:SkinCheckBox(LFGListFrame.EntryCreation.ItemLevel.CheckButton)
	AS:SkinEditBox(LFGListFrame.EntryCreation.ItemLevel.EditBox)
	AS:SkinCheckBox(LFGListFrame.EntryCreation.VoiceChat.CheckButton)
	AS:SkinEditBox(LFGListFrame.EntryCreation.VoiceChat.EditBox)
end

AS:RegisterSkin("Blizzard_PvE", AS.Blizzard_PvE)

function AS:Blizzard_ChallengesUI(event, addon)
	if addon ~= 'Blizzard_ChallengesUI' then return end
	AS:StripTextures(ChallengesFrameInset, true)
	ChallengesFrameInsetBg:Hide()
	ChallengesFrameDetails.bg:Hide()
	AS:StripTextures(ChallengesFrameLeaderboard)
	AS:SkinButton(ChallengesFrameLeaderboard)
	select(2, ChallengesFrameDetails:GetRegions()):Hide()
	select(9, ChallengesFrameDetails:GetRegions()):Hide()
	select(10, ChallengesFrameDetails:GetRegions()):Hide()
	select(11, ChallengesFrameDetails:GetRegions()):Hide()
	ChallengesFrameDungeonButton1:SetPoint("TOPLEFT", ChallengesFrame, "TOPLEFT", 8, -83)

	hooksecurefunc('ChallengesFrame_Update', function(self, mapID)
		for i = 1, self.numMaps do
			local Button = self["button"..i];
			if Button then
				if not Button.isSkinned then
					AS:SkinButton(Button)
					Button:SetHighlightTexture("")
					Button.selectedTex:SetTexture('')
					Button:SetScript('OnEnter', function(self)
						self:SetBackdropBorderColor(1, .82, 0)
					end)
					Button:SetScript('OnLeave', function(self)
						if self.selectedTex:IsShown() then
							Button:SetBackdropBorderColor(0, 0.44, .87, 1)
						else
							Button:SetBackdropBorderColor(unpack(AS.BorderColor))
						end
					end)
					Button.isSkinned = true
				end
				if Button.selectedTex:IsShown() then
					Button:SetBackdropBorderColor(0, 0.44, .87, 1)
				else
					Button:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
		end
	end)

	for i = 1, 3 do
		local rewardsRow = ChallengesFrame["RewardRow"..i]
		AS:SkinBackdropFrame(rewardsRow, nil, true)
		for j = 1, 2 do
			local Button = rewardsRow["Reward"..j]
			AS:CreateBackdrop(Button)
			AS:SkinTexture(Button.Icon)
		end
	end
	
	AS:SkinScrollBar(LFRBrowseFrameListScrollFrameScrollBar)
end

AS:RegisterSkin("Blizzard_ChallengesUI", AS.Blizzard_ChallengesUI, 'ADDON_LOADED')