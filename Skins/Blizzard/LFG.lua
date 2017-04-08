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

	AS:StripTextures(LFGListFrame.EntryCreation.Inset)
	AS:SkinButton(LFGListFrame.EntryCreation.CancelButton, true)
	AS:SkinButton(LFGListFrame.EntryCreation.ListGroupButton, true)
	AS:SkinEditBox(LFGListFrame.EntryCreation.Name)
	AS:StripTextures(LFGListEntryCreationDescription)
	AS:SkinEditBox(LFGListEntryCreationDescription)
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
	ChallengesFrameInset:Hide()
	ChallengesFrameInsetBg:Hide()
end

AS:RegisterSkin("Blizzard_ChallengesUI", AS.Blizzard_ChallengesUI, 'ADDON_LOADED')

function AS:Blizzard_PVPUI(event, addon)
	if addon ~= "Blizzard_PVPUI" then return end
	AS:StripTextures(PVPUIFrame)
	
	AS:StripTextures(HonorFrame.RoleInset)
	AS:SkinStatusBar(HonorFrame.XPBar.Bar)

	HonorFrame.XPBar:StripTextures()
	HonorFrame.XPBar.Bar.OverlayFrame.Text:SetPoint('CENTER')

	AS:SkinCheckBox(HonorFrame.RoleInset.DPSIcon.checkButton, true)
	AS:SkinCheckBox(HonorFrame.RoleInset.TankIcon.checkButton, true)
	AS:SkinCheckBox(HonorFrame.RoleInset.HealerIcon.checkButton, true)
	
	for i = 1, 4 do
		local Button = PVPQueueFrame['CategoryButton'..i]
		AS:SkinFrame(Button, nil, true)
		Button.Background:SetTexture('')
		Button.Ring:SetTexture('')
		Button.Icon:SetSize(45, 45)
		AS:SkinTexture(Button.Icon)
		AS:CreateBackdrop(Button)
		Button.Backdrop:SetOutside(Button.Icon)
		Button.Backdrop:SetFrameLevel(Button:GetFrameLevel())
		Button:SetHighlightTexture('')
		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
			self.Backdrop:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self) 
			if self:GetID() == self.isSelected then
				self:SetBackdropBorderColor(0, 0.44, .87, 1)
				self.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	PVPQueueFrame.CategoryButton1.Icon:SetTexture("Interface\\Icons\\achievement_bg_winwsg")
	PVPQueueFrame.CategoryButton2.Icon:SetTexture("Interface\\Icons\\achievement_bg_killxenemies_generalsroom")
	PVPQueueFrame.CategoryButton3.Icon:SetTexture("Interface\\Icons\\ability_warrior_offensivestance")
	PVPQueueFrame.CategoryButton4.Icon:SetTexture("Interface\\Icons\\Achievement_General_StayClassy")

	hooksecurefunc('PVPQueueFrame_SelectButton', function(index)
		for i = 1, 4 do
			local Button = PVPQueueFrame["CategoryButton"..i];
			if ( i == index ) then
				Button:SetBackdropBorderColor(0, 0.44, .87, 1)
				Button.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
				Button.isSelected = i
			else
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.isSelected = 0
			end
		end
	end)

	AS:SkinDropDownBox(HonorFrameTypeDropDown)

	AS:StripTextures(HonorFrame.Inset)

	AS:SkinScrollBar(HonorFrameSpecificFrameScrollBar)
	AS:SkinButton(HonorFrameQueueButton, true)
	AS:StripTextures(HonorFrame.BonusFrame)
	AS:StripTextures(HonorFrame.BonusFrame.ShadowOverlay)
	AS:StripTextures(ConquestFrame.Inset)

	for _, Section in pairs({ 'RandomBGButton', 'Arena1Button', 'AshranButton' }) do
		local Button = HonorFrame.BonusFrame[Section]
		AS:StripTextures(Button)
		AS:SkinButton(Button)
		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self.SelectedTexture:IsShown() then
				self:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
		Button.SelectedTexture:SetTexture('')
	end

	hooksecurefunc('HonorFrame_UpdateQueueButtons', function()
		for _, Section in pairs({ 'RandomBGButton', 'Arena1Button', 'AshranButton' }) do
			local Button = HonorFrame.BonusFrame[Section]
			if Button.SelectedTexture:IsShown() then
				Button:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end
	end)

	AS:StripTextures(ConquestFrame)
	AS:StripTextures(ConquestFrame.ShadowOverlay)
	AS:SkinButton(ConquestJoinButton, true)
	AS:SkinFrame(ConquestTooltip)
	
	AS:StripTextures(ConquestFrame.RoleInset)
	
	AS:SkinCheckBox(ConquestFrame.RoleInset.DPSIcon.checkButton, true)
	AS:SkinCheckBox(ConquestFrame.RoleInset.TankIcon.checkButton, true)
	AS:SkinCheckBox(ConquestFrame.RoleInset.HealerIcon.checkButton, true)

	for _, Section in pairs({ 'RatedBG', 'Arena2v2', 'Arena3v3'}) do
		local Button = ConquestFrame[Section]
		AS:StripTextures(Button)
		AS:SkinButton(Button)
		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self.SelectedTexture:IsShown() then
				self:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
		Button.SelectedTexture:SetTexture('')
	end

	hooksecurefunc('ConquestFrame_UpdateJoinButton', function()
		for _, Section in pairs({ 'RatedBG', 'Arena2v2', 'Arena3v3'}) do
			local Button = ConquestFrame[Section]
			if Button.SelectedTexture:IsShown() then
				Button:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end
	end)

	AS:StripTextures(WarGamesFrame)
	AS:StripTextures(WarGamesFrame.RightInset)
	AS:StripTextures(WarGamesFrame.HorizontalBar)
	AS:StripTextures(WarGamesFrameInfoScrollFrameScrollBar)
	AS:SkinButton(WarGameStartButton, true)
	AS:SkinScrollBar(WarGamesFrameScrollFrameScrollBar)
	AS:SkinScrollBar(WarGamesFrameInfoScrollFrameScrollBar)
	AS:SkinCheckBox(WarGameTournamentModeCheckButton)

	hooksecurefunc('WarGamesFrame_Update', function()
		local scrollFrame = WarGamesFrame.scrollFrame;
		local offset = HybridScrollFrame_GetOffset(scrollFrame);
		local buttons = scrollFrame.buttons;
		local numButtons = #buttons;
		local numWarGames = GetNumWarGameTypes();
		local selectedIndex = GetSelectedWarGameType();

		for i = 1, numButtons do
			local button = buttons[i];
			local index = offset + i;
			if index <= numWarGames  then
				local name, pvpType, collapsed, id, minPlayers, maxPlayers, isRandom, iconTexture = GetWarGameTypeInfo(index);
				if not button.Entry.isSkinned then
					button.Entry:SetHighlightTexture('')
					AS:CreateBackdrop(button.Entry)
					button.Entry.Backdrop:SetInside(button.Entry, 1, 1)
					AS:SkinTexture(button.Entry.Icon)
					button.Entry.Icon:SetPoint("TOPLEFT", 6, -4)
					button.Entry.Icon.Background = CreateFrame('Frame', nil, button.Entry)
					AS:CreateBackdrop(button.Entry.Icon.Background)
					button.Entry.Icon.Background.Backdrop:SetOutside(button.Entry.Icon, 0, 0)
					button.Entry.Bg:SetTexture('')
					button.Entry.Border:SetTexture('')
					button.Entry.SelectedTexture:SetTexture('')
					button.Entry.isSkinned = true
				end
			end
		end
	end)
end

AS:RegisterSkin("Blizzard_PVPUI", AS.Blizzard_PVPUI, 'ADDON_LOADED')