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

	hooksecurefunc('GroupFinderFrame_SelectGroupButton', function()
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

	hooksecurefunc('PVPHonorXPBar_SetNextAvailable', function(self)
		self:StripTextures()

		if self.Bar and not self.Bar.Backdrop then
			AS:CreateBackdrop(self.Bar, "Default")
			if self.Bar.Spark then
				self.Bar.Spark:SetAlpha(0)
			end
			if self.Bar.OverlayFrame and self.Bar.OverlayFrame.Text then
				self.Bar.OverlayFrame.Text:ClearAllPoints()
				self.Bar.OverlayFrame.Text:Point("CENTER", self.Bar)
			end
		end

		if self.PrestigeReward and self.PrestigeReward.Accept then
			self.PrestigeReward.Accept:ClearAllPoints()
			self.PrestigeReward.Accept:SetPoint("TOP", self.PrestigeReward, "BOTTOM", 0, 0)
			if not self.PrestigeReward.Accept.template then
				AS:SkinButton(self.PrestigeReward.Accept)
			end
		end

		if self.NextAvailable then
			if self.Bar then
				self.NextAvailable:ClearAllPoints()
				self.NextAvailable:SetPoint("LEFT", self.Bar, "RIGHT", 0, -2)
			end

			if not self.NextAvailable.Backdrop then
				self.NextAvailable:StripTextures()
				AS:CreateBackdrop(self.NextAvailable)
				if self.NextAvailable.Icon then
					self.NextAvailable.Backdrop:SetPoint("TOPLEFT", self.NextAvailable.Icon, AS:AdjustForPixelPerfect(-2), AS:AdjustForPixelPerfect(2))
					self.NextAvailable.Backdrop:SetPoint("BOTTOMRIGHT", self.NextAvailable.Icon, AS:AdjustForPixelPerfect(2), AS:AdjustForPixelPerfect(-2))
				end
			end

			if self.NextAvailable.Icon then
				self.NextAvailable.Icon:SetDrawLayer("ARTWORK")
				self.NextAvailable.Icon:SetTexCoord(unpack(AS.TexCoords))
			end
		end
	end)

	AS:SkinCheckBox(HonorFrame.DPSIcon.checkButton, true)
	AS:SkinCheckBox(HonorFrame.TankIcon.checkButton, true)
	AS:SkinCheckBox(HonorFrame.HealerIcon.checkButton, true)

	for i = 1, 3 do
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

	hooksecurefunc('PVPQueueFrame_SelectButton', function(index)
		for i = 1, 3 do
			local Button = PVPQueueFrame["CategoryButton"..i]
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

	for _, Section in pairs({ 'RandomBGButton', 'RandomEpicBGButton', 'Arena1Button', 'BrawlButton' }) do
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
		for _, Section in pairs({ 'RandomBGButton', 'RandomEpicBGButton', 'Arena1Button', 'BrawlButton' }) do
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

	AS:SkinCheckBox(ConquestFrame.DPSIcon.checkButton, true)
	AS:SkinCheckBox(ConquestFrame.TankIcon.checkButton, true)
	AS:SkinCheckBox(ConquestFrame.HealerIcon.checkButton, true)

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

	AS:StripTextures(PVPQueueFrame.HonorInset)
end


AS:RegisterSkin("Blizzard_PVPUI", AS.Blizzard_PVPUI, 'ADDON_LOADED')