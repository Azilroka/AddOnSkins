local AS = unpack(AddOnSkins)

function AS:Blizzard_GuildUI(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		AS:SkinFrame(PetitionFrame, nil, nil, true)

		AS:SkinButton(PetitionFrameRequestButton)
		PetitionFrameRequestButton:SetWidth(110)
		AS:SkinButton(PetitionFrameRenameButton)
		AS:SkinButton(PetitionFrameCancelButton)
		AS:SkinButton(PetitionFrameSignButton)
		AS:SkinCloseButton(PetitionFrameCloseButton)

		PetitionFrameCharterTitle:SetTextColor(1, .8, .1)
		PetitionFrameCharterName:SetTextColor(1, 1, 1)
		PetitionFrameMasterTitle:SetTextColor(1, .8, .1)
		PetitionFrameMasterName:SetTextColor(1, 1, 1)
		PetitionFrameMemberTitle:SetTextColor(1, .8, .1)
		PetitionFrameInstructions:SetTextColor(1, 1, 1)

		for i = 1, 9 do
			_G["PetitionFrameMemberName"..i]:SetTextColor(1, 1, 1)
		end

		AS:SkinFrame(GuildInviteFrame)
		AS:SkinButton(GuildInviteFrameDeclineButton, true)
		AS:SkinButton(GuildInviteFrameJoinButton, true)

		AS:SkinFrame(GuildRegistrarFrame, nil, nil, true)
		AS:StripTextures(GuildRegistrarGreetingFrame)
		AS:SkinButton(GuildRegistrarFrameGoodbyeButton)
		AS:SkinButton(GuildRegistrarFrameCancelButton)
		AS:SkinButton(GuildRegistrarFramePurchaseButton)
		AS:SkinCloseButton(GuildRegistrarFrameCloseButton)
		AS:SkinEditBox(GuildRegistrarFrameEditBox, nil, 20)

		for i = 1, 2 do
			_G["GuildRegistrarButton"..i]:GetFontString():SetTextColor(1, 1, 1)
		end

		GuildRegistrarPurchaseText:SetTextColor(1, 1, 1)
		AvailableServicesText:SetTextColor(1, .8, .1)

		AS:SkinFrame(TabardFrame)
		TabardFramePortrait:Kill()

		AS:SkinCloseButton(TabardFrameCloseButton)
		AS:SkinButton(TabardFrameCancelButton)
		AS:SkinButton(TabardFrameAcceptButton)

		TabardFrameAcceptButton:ClearAllPoints()
		TabardFrameAcceptButton:SetPoint("RIGHT", TabardFrameCancelButton, "LEFT", -3, 0)

		AS:SkinArrowButton(TabardCharacterModelRotateLeftButton)
		AS:SkinArrowButton(TabardCharacterModelRotateRightButton)
		TabardCharacterModelRotateLeftButton:ClearAllPoints()
		TabardCharacterModelRotateLeftButton:SetPoint("BOTTOMLEFT", TabardModel, "BOTTOMLEFT", 4, 4)
		TabardCharacterModelRotateRightButton:ClearAllPoints()
		TabardCharacterModelRotateRightButton:SetPoint("LEFT", TabardCharacterModelRotateLeftButton, "RIGHT", 3, 0)

		AS:StripTextures(TabardFrameMoneyBg)
		AS:StripTextures(TabardFrameMoneyInset)
		AS:StripTextures(TabardFrameCostFrame)
		AS:StripTextures(TabardFrameCustomizationFrame)

		for i = 1, 5 do
			local Frame = _G["TabardFrameCustomization"..i]
			AS:StripTextures(Frame)
			AS:SkinArrowButton(_G[Frame:GetName().."LeftButton"])
			AS:SkinArrowButton(_G[Frame:GetName().."RightButton"])

			if i > 1 then
				Frame:ClearAllPoints()
				Frame:SetPoint("TOP", _G["TabardFrameCustomization"..i-1], "BOTTOM", 0, -6)
			else
				local point, anchor, point2, x, y = Frame:GetPoint()
				Frame:SetPoint(point, anchor, point2, x, y + 4)
			end
		end
	end

	if addon ~= "Blizzard_GuildUI" then return end

	AS:SkinFrame(GuildFrame, nil, nil, true)
	AS:CreateShadow(GuildFrame)

	AS:SkinCloseButton(GuildFrame.CloseButton)

	-- GuildPointFrame
	AS:SkinCloseButton(GuildMemberDetailCloseButton)

	AS:StripTextures(GuildAllPerksFrame)
	AS:StripTextures(GuildMemberDetailFrame)
	AS:StripTextures(GuildMemberNoteBackground)
	AS:StripTextures(GuildInfoFrameInfo)
	AS:StripTextures(GuildLogContainer)
	AS:StripTextures(GuildLogFrame)
	AS:StripTextures(GuildRewardsFrame)
	AS:StripTextures(GuildMemberOfficerNoteBackground)
	AS:StripTextures(GuildTextEditContainer)
	AS:StripTextures(GuildTextEditFrame)

	AS:StripTextures(GuildRecruitmentRolesFrame)
	AS:StripTextures(GuildRecruitmentAvailabilityFrame)
	AS:StripTextures(GuildRecruitmentInterestFrame)
	AS:StripTextures(GuildRecruitmentLevelFrame)
	AS:StripTextures(GuildRecruitmentCommentFrame)
	AS:StripTextures(GuildRecruitmentCommentInputFrame)

	AS:StripTextures(GuildInfoFrameApplicantsContainer)
	AS:StripTextures(GuildInfoFrameApplicants)
	AS:StripTextures(GuildInfoFrameApplicantsContainerScrollBar)

	GuildRewardsFrameVisitText:ClearAllPoints()
	GuildRewardsFrameVisitText:SetPoint("TOP", GuildRewardsFrame, "TOP", 0, 30)

	AS:SkinFrame(GuildNewsBossModel)
	AS:SkinFrame(GuildNewsBossModelTextFrame)
	GuildNewsBossModelTextFrame:SetPoint("TOPLEFT", GuildNewsBossModel, "BOTTOMLEFT", 0, -1)
	GuildNewsBossModel:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 4, -43)

	AS:SkinButton(GuildMemberRemoveButton)
	AS:SkinButton(GuildMemberGroupInviteButton)
	AS:SkinButton(GuildAddMemberButton, true)
	AS:SkinButton(GuildViewLogButton, true)
	AS:SkinButton(GuildControlButton, true)
	AS:SkinButton(GuildRecruitmentListGuildButton, true)
	AS:SkinButton(GuildTextEditFrameAcceptButton)
	AS:SkinButton(GuildRecruitmentInviteButton, true)
	AS:SkinButton(GuildRecruitmentMessageButton, true)
	AS:SkinButton(GuildRecruitmentDeclineButton, true)

	for _, frame in pairs({ "Quest", "Dungeon", "Raid", "PvP", "RP", "Weekdays", "Weekends" }) do
		AS:SkinCheckBox(_G["GuildRecruitment"..frame.."Button"])
	end

	AS:SkinCheckBox(GuildRecruitmentTankButton.checkButton)
	AS:SkinCheckBox(GuildRecruitmentHealerButton.checkButton)
	AS:SkinCheckBox(GuildRecruitmentDamagerButton.checkButton)

	for i = 1, 5 do
		AS:SkinTab(_G["GuildFrameTab"..i])
	end

	AS:SkinScrollBar(GuildPerksContainerScrollBar)

	AS:SkinBackdropFrame(GuildFactionBar)
	GuildFactionBar.progress:SetTexture(AS.NormTex)
	GuildFactionBar.Backdrop:SetPoint("TOPLEFT", GuildFactionBar.progress, "TOPLEFT", -2, 2)
	GuildFactionBar.Backdrop:SetPoint("BOTTOMRIGHT", GuildFactionBar, "BOTTOMRIGHT", 0, 0)

	for _, Button in pairs(GuildPerksContainer.buttons) do
		AS:SkinTexture(Button.icon, true)
		AS:SkinBackdropFrame(Button)
		Button.Backdrop:SetInside()
		Button.Backdrop:SetPoint("BOTTOMRIGHT", -15, 2)
	end

	for _, Button in pairs(GuildRewardsContainer.buttons) do
		AS:SkinTexture(Button.icon, true)
		AS:SkinBackdropFrame(Button)
		Button.Backdrop:SetInside()
		hooksecurefunc(Button.icon, "SetTexture", function(self)
			local r, g, b = unpack(AS.BorderColor)
			if Button.index then
				local _, itemID = GetGuildRewardInfo(Button.index)
				local Quality = select(3, GetItemInfo(itemID))
				if Quality and Quality > 1 then
					r, g, b = GetItemQualityColor(Quality)
				end
			end

			self.Backdrop:SetBackdropBorderColor(r, g, b)
		end)
	end

	AS:SkinScrollBar(GuildRosterContainerScrollBar)
	AS:SkinCheckBox(GuildRosterShowOfflineButton)
	AS:SkinDropDownBox(GuildRosterViewDropdown)

	for i = 1, 4 do
		AS:StripTextures(_G["GuildRosterColumnButton"..i], true)
	end

	for i = 1, 14 do
		AS:SkinButton(_G["GuildRosterContainerButton"..i.."HeaderButton"], true)
	end

	AS:SkinFrame(GuildMemberDetailFrame)
	AS:StripTextures(GuildMemberNoteBackground)
	AS:StripTextures(GuildMemberOfficerNoteBackground)
	GuildMemberRankDropdown:SetFrameLevel(GuildMemberRankDropdown:GetFrameLevel() + 5)
	AS:SkinDropDownBox(GuildMemberRankDropdown)

	AS:StripTextures(GuildNewsFrame)

	for i = 1, 17 do
		_G["GuildNewsContainerButton"..i].header:Kill()
	end

	AS:SkinFrame(GuildNewsFiltersFrame)
	AS:SkinCloseButton(GuildNewsFiltersFrameCloseButton)

	for _, CheckBox in pairs({'GuildAchievement', 'Achievement', 'DungeonEncounter', 'EpicItemLooted', 'EpicItemPurchased', 'EpicItemCrafted', 'LegendaryItemLooted' }) do
		AS:SkinCheckBox(GuildNewsFiltersFrame[CheckBox])
	end

	GuildNewsFiltersFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 4, -20)
	AS:SkinScrollBar(GuildNewsContainerScrollBar)

	AS:SkinScrollBar(GuildInfoDetailsFrameScrollBar)
	AS:SkinScrollBar(GuildInfoFrameApplicantsContainerScrollBar)
	AS:SkinScrollBar(GuildInfoFrameInfoMOTDScrollFrameScrollBar)

	for i = 1, 3 do
		AS:StripTextures(_G["GuildInfoFrameTab"..i])
	end

	AS:SetTemplate(GuildRecruitmentCommentInputFrame, 'Default')

	for _, button in pairs(GuildInfoFrameApplicantsContainer.buttons) do
		button.selectedTex:Kill()
		button:GetHighlightTexture():Kill()
		button:SetBackdrop(nil)
	end

	AS:SetTemplate(GuildTextEditFrame, 'Default')
	AS:SkinScrollBar(GuildTextEditScrollFrameScrollBar)
	AS:SetTemplate(GuildTextEditContainer, 'Default')
	for i = 1, GuildTextEditFrame:GetNumChildren() do
		local child = select(i, GuildTextEditFrame:GetChildren())
		local point = select(1, child:GetPoint())
		if point == "TOPRIGHT" then
			AS:SkinCloseButton(child)
		else
			AS:SkinButton(child, true)
		end
	end

	--Guild Log
	AS:SkinScrollBar(GuildLogScrollFrameScrollBar)
	AS:SkinFrame(GuildLogFrame)

	for i = 1, GuildLogFrame:GetNumChildren() do
		local child = select(i, GuildLogFrame:GetChildren())
		local point = select(1, child:GetPoint())
		if point == "TOPRIGHT" then
			AS:SkinCloseButton(child)
		else
			AS:SkinButton(child, true)
		end
	end

	AS:SkinScrollBar(GuildRewardsContainerScrollBar)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_GuildControlUI(event, addon)
	if addon ~= 'Blizzard_GuildControlUI' then return end
	AS:SkinFrame(GuildControlUI)
	AS:StripTextures(GuildControlUIHbar)
	AS:CreateShadow(GuildControlUI)

	local function SkinGuildRanks()
		for i = 1, GuildControlGetNumRanks() do
			local rankFrame = _G["GuildControlUIRankOrderFrameRank"..i]
			if rankFrame then
				AS:SkinArrowButton(rankFrame.downButton)
				AS:SkinArrowButton(rankFrame.upButton)
				AS:SkinButton(rankFrame.deleteButton)
				AS:SkinEditBox(rankFrame.nameBox)
			end
		end
	end

	hooksecurefunc("GuildControlUI_RankOrder_Update", SkinGuildRanks)

	GuildControlUIRankOrderFrameNewButton:HookScript("OnClick", function()
		AS:Delay(.8, SkinGuildRanks)
	end)

	AS:SkinDropDownBox(GuildControlUINavigationDropDown)
	AS:SkinDropDownBox(GuildControlUIRankSettingsFrameRankDropDown)

	for i = 1, NUM_RANK_FLAGS do
		local CheckBox = _G["GuildControlUIRankSettingsFrameCheckbox"..i]
		if CheckBox then
			AS:SkinCheckBox(CheckBox)
		end
	end

	AS:SkinButton(GuildControlUIRankOrderFrameNewButton)

	AS:SkinEditBox(GuildControlUIRankSettingsFrameGoldBox)
	GuildControlUIRankSettingsFrameGoldBox.Backdrop:SetPoint("TOPLEFT", -2, -4)
	GuildControlUIRankSettingsFrameGoldBox.Backdrop:SetPoint("BOTTOMRIGHT", 2, 4)
	AS:StripTextures(GuildControlUIRankSettingsFrameGoldBox)

	AS:StripTextures(GuildControlUIRankBankFrame)

	hooksecurefunc("GuildControlUI_BankTabPermissions_Update", function()
		local numTabs = GetNumGuildBankTabs()
		if numTabs < MAX_BUY_GUILDBANK_TABS then
			numTabs = numTabs + 1
		end
		for i = 1, numTabs do
			local tab = _G["GuildControlBankTab"..i]

			AS:SkinTexture(tab.owned.tabIcon)
			if not tab.owned.isSkinned then
				AS:SkinCheckBox(tab.owned.viewCB)
				AS:SkinCheckBox(tab.owned.depositCB)
				AS:SkinCheckBox(tab.owned.infoCB)

				AS:SkinButton(tab.buy.button)
				AS:SkinEditBox(tab.owned.editBox)
				tab.owned.isSkinned = true
			end
		end
	end)

	AS:SkinDropDownBox(GuildControlUIRankBankFrameRankDropDown)
	AS:SkinCloseButton(GuildControlUICloseButton)
	AS:StripTextures(GuildControlUIRankBankFrameInsetScrollFrame)
	AS:SkinScrollBar(GuildControlUIRankBankFrameInsetScrollFrameScrollBar)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_GuildBankUI(event, addon)
	if addon ~= 'Blizzard_GuildBankUI' then return end

	AS:SkinFrame(GuildBankFrame)
	AS:StripTextures(GuildBankEmblemFrame, true)

	AS:SkinCloseButton(GuildBankFrame.CloseButton)

	AS:SkinButton(GuildBankFrameDepositButton, true)
	AS:SkinButton(GuildBankFrameWithdrawButton, true)
	AS:SkinButton(GuildBankInfoSaveButton, true)
	AS:SkinButton(GuildBankFramePurchaseButton, true)
	AS:SkinScrollBar(GuildBankTransactionsScrollFrameScrollBar)

	GuildBankFrameWithdrawButton:SetPoint("RIGHT", GuildBankFrameDepositButton, "LEFT", -2, 0)

	AS:StripTextures(GuildBankInfoScrollFrame)
	AS:StripTextures(GuildBankTransactionsScrollFrame)

	for i = 1, NUM_GUILDBANK_COLUMNS do
		AS:StripTextures(_G["GuildBankColumn"..i])

		for x = 1, NUM_SLOTS_PER_GUILDBANK_GROUP do
			local Button = _G["GuildBankColumn"..i.."Button"..x]
			Button:SetNormalTexture("")
			AS:StyleButton(Button)
			AS:SetTemplate(Button, 'Default')
			Button.icon:SetInside()
			AS:SkinTexture(Button.icon)
			Button.IconBorder:SetAlpha(0)
			hooksecurefunc(Button.IconBorder, 'SetVertexColor', function(self, r, g, b) Button:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(Button.IconBorder, 'Hide', function(self) Button:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end
	end

	for i = 1, 8 do
		AS:StripTextures(_G["GuildBankTab"..i], true)
		AS:SkinIconButton(_G["GuildBankTab"..i.."Button"])
	end

	for i = 1, 4 do
		AS:SkinTab(_G["GuildBankFrameTab"..i])
	end

	--Popup
	AS:SkinFrame(GuildBankPopupFrame)
	AS:StripTextures(GuildBankPopupScrollFrame)
	AS:SkinScrollBar(GuildBankPopupScrollFrameScrollBar)
	GuildBankPopupFrame:SetPoint("TOPLEFT", GuildBankFrame, "TOPRIGHT", 1, -30)
	AS:SkinButton(GuildBankPopupOkayButton)
	AS:SkinButton(GuildBankPopupCancelButton)
	AS:SkinEditBox(GuildBankPopupEditBox)

	GuildBankPopupFrame:HookScript('OnShow', function(self)
		self:SetHeight(515)
		self.BG:SetAlpha(0)
		AS:StripTextures(self.BorderBox)
		self:SetPoint("TOPLEFT", GuildBankFrame, "TOPRIGHT", 1, -30)
		for i = 1, 90 do
			AS:SkinIconButton(_G["GuildBankPopupButton"..i])
		end
	end)

	AS:SkinEditBox(GuildItemSearchBox)
	AS:StripTextures(GuildBankMoneyFrameBackground)
	AS:SkinScrollBar(GuildBankInfoScrollFrameScrollBar)

	AS:CreateBackdrop(GuildBankFrame)
	GuildBankFrame.Backdrop:SetFrameLevel(GuildBankFrame:GetFrameLevel() + 1)
	GuildBankFrame.Backdrop:SetPoint('TOPLEFT', GuildBankColumn1Button1, 'TOPLEFT', -7, 4)
	GuildBankFrame.Backdrop:SetPoint('BOTTOMRIGHT', GuildBankColumn7Button14, 'BOTTOMRIGHT', 7, -7)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_LookingForGuildUI(event, addon)
	if addon ~= 'Blizzard_LookingForGuildUI' then return end

	LookingForGuildFrame_CreateUIElements() -- Make sure it's created.

	AS:SkinFrame(LookingForGuildFrame)
	AS:SkinFrame(LookingForGuildFrame.Inset)

	for _, v in pairs({ LookingForGuildPvPButton, LookingForGuildWeekendsButton, LookingForGuildWeekdaysButton, LookingForGuildRPButton, LookingForGuildRaidButton, LookingForGuildQuestButton, LookingForGuildDungeonButton }) do
		AS:SkinCheckBox(v)
	end

	AS:SkinCheckBox(LookingForGuildTankButton.checkButton)
	AS:SkinCheckBox(LookingForGuildHealerButton.checkButton)
	AS:SkinCheckBox(LookingForGuildDamagerButton.checkButton)

	AS:SkinScrollBar(LookingForGuildBrowseFrameContainerScrollBar)
	AS:SkinButton(LookingForGuildBrowseButton)
	AS:SkinButton(LookingForGuildRequestButton)
	AS:SkinCloseButton(LookingForGuildFrameCloseButton)
	AS:SkinBackdropFrame(LookingForGuildCommentInputFrame)

	AS:SkinFrame(GuildFinderRequestMembershipFrame)
	AS:SkinFrame(GuildFinderRequestMembershipFrameInputFrame)
	AS:SkinButton(GuildFinderRequestMembershipFrameAcceptButton)
	AS:SkinButton(GuildFinderRequestMembershipFrameCancelButton)

	AS:SkinFrame(LookingForGuildAvailabilityFrame)
	AS:SkinFrame(LookingForGuildCommentFrame)
	AS:SkinFrame(LookingForGuildInterestFrame)
	AS:SkinFrame(LookingForGuildRolesFrame)

	for i = 1, 3 do
		AS:SkinButton(_G["LookingForGuildFrameTab"..i])
	end

	for i = 1, 5 do
		local Browse = _G["LookingForGuildBrowseFrameContainerButton"..i]
		local App = _G["LookingForGuildAppsFrameContainerButton"..i]

		Browse:SetBackdrop(nil)
		AS:CreateBackdrop(Browse)
		Browse.Backdrop:SetInside()
		Browse.selectedTex:SetAlpha(0)
		Browse:SetHighlightTexture('')

		Browse:HookScript("OnEnter", function(self) self.Backdrop:SetBackdropBorderColor(unpack(AS.Color)) end)
		Browse:HookScript("OnLeave", function(self)
			if Browse.selectedTex:IsShown() then
				self.Backdrop:SetBackdropBorderColor(1, .8, .1)
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)

		hooksecurefunc(Browse.selectedTex, 'Show', function() Browse.Backdrop:SetBackdropBorderColor(1, .8, .1) end)
		hooksecurefunc(Browse.selectedTex, 'Hide', function() Browse.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

		App:SetBackdrop(nil)
	end
end

AS:RegisterSkin('Blizzard_GuildUI', AS.Blizzard_GuildUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_GuildControlUI', AS.Blizzard_GuildControlUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_GuildBankUI', AS.Blizzard_GuildBankUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_LookingForGuildUI', AS.Blizzard_LookingForGuildUI, 'ADDON_LOADED')