if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_Communities(event, addon)
	if addon ~= 'Blizzard_Communities' then return end

	AS:SkinFrame(CommunitiesFrame, nil, nil, true)
	AS:SkinCloseButton(CommunitiesFrame.CloseButton)
	AS:Kill(CommunitiesFrame.PortraitOverlay)
	AS:StripTextures(CommunitiesFrame.CommunitiesList)

	CommunitiesFrame.CommunitiesList.ListScrollFrame.ScrollBar.ScrollDownButton = CommunitiesFrame.CommunitiesList.ListScrollFrame.scrollDown
	CommunitiesFrame.CommunitiesList.ListScrollFrame.ScrollBar.ScrollUpButton = CommunitiesFrame.CommunitiesList.ListScrollFrame.scrollUp
	AS:SkinScrollBar(CommunitiesFrame.CommunitiesList.ListScrollFrame.ScrollBar)

	AS:SkinIconButton(CommunitiesFrame.ChatTab)
	AS:SkinIconButton(CommunitiesFrame.RosterTab)
	AS:SkinIconButton(CommunitiesFrame.GuildBenefitsTab)
	AS:SkinIconButton(CommunitiesFrame.GuildInfoTab)

	AS:SkinMaxMinFrame(CommunitiesFrame.MaximizeMinimizeFrame)

	AS:SkinDropDownBox(CommunitiesFrame.StreamDropDownMenu)
	CommunitiesFrame.StreamDropDownMenu.Text:SetJustifyH("RIGHT")

	AS:SkinDropDownBox(CommunitiesFrame.CommunitiesListDropDownMenu)
	CommunitiesFrame.CommunitiesListDropDownMenu.Text:SetJustifyH("RIGHT")

	AS:SkinButton(CommunitiesFrame.AddToChatButton)
	AS:SkinButton(CommunitiesFrame.InviteButton)

	AS:SkinEditBox(CommunitiesFrame.ChatEditBox)
	AS:SetInside(CommunitiesFrame.ChatEditBox.Backdrop, CommunitiesFrame.ChatEditBox, -5, 8)
	AS:StripTextures(CommunitiesFrame.MemberList)
	CommunitiesFrame.MemberList.InsetFrame:Hide()

	AS:SkinBackdropFrame(CommunitiesFrame.Chat.InsetFrame)
	CommunitiesFrame.Chat.InsetFrame.Backdrop:SetPoint('BOTTOMRIGHT', CommunitiesFrame.Chat.InsetFrame, 'BOTTOMRIGHT', 0, -2)

	AS:SkinScrollBar(CommunitiesFrame.Chat.MessageFrame.ScrollBar)

	-- Hook these
		CommunitiesFrame.Chat.MessageFrame.ScrollBar:SetPoint('TOPLEFT', CommunitiesFrame.Chat.MessageFrame, 'TOPRIGHT', 10, -6)
		CommunitiesFrame.Chat.MessageFrame.ScrollBar:SetPoint('BOTTOMLEFT', CommunitiesFrame.Chat.MessageFrame, 'BOTTOMRIGHT', 10, -16)
	--

	CommunitiesFrame.MemberList.ListScrollFrame.scrollBar.ScrollDownButton = CommunitiesFrame.MemberList.ListScrollFrame.scrollDown
	CommunitiesFrame.MemberList.ListScrollFrame.scrollBar.ScrollUpButton = CommunitiesFrame.MemberList.ListScrollFrame.scrollUp
	AS:SkinScrollBar(CommunitiesFrame.MemberList.ListScrollFrame.scrollBar)

	AS:SkinBackdropFrame(CommunitiesFrame.MemberList.ListScrollFrame)

	hooksecurefunc(CommunitiesFrame.CommunitiesList, "UpdateCommunitiesList", function(self)
		for _, Button in ipairs(self.ListScrollFrame.buttons) do
			if not Button.Backdrop then
				AS:CreateBackdrop(Button)
				Button.Backdrop:SetPoint('TOPLEFT', 4, -4)
				Button.Backdrop:SetPoint('BOTTOMRIGHT', -8, 4)

				Button.Icon:RemoveMaskTexture(self.CircleMask)
				AS:SkinTexture(Button.Icon, true)
				Button.Icon.Backdrop:Hide()
				Button.IconRing:SetAlpha(0)

				Button:SetHighlightTexture("")
				Button.Background:SetAlpha(0)
				Button.Selection:SetAlpha(0)
				hooksecurefunc(Button.Selection, "SetShown", function(self, value)
					local R, G, B
					if value == true then
						R, G, B = Button.Name:GetTextColor()
					else
						R, G, B = unpack(AS.BorderColor)
					end
					Button.Backdrop:SetBackdropBorderColor(R, G, B)
				end)
			end
		end
	end)

	hooksecurefunc(CommunitiesListEntryMixin, "SetClubInfo", function(self, clubInfo)
		if clubInfo then
			self.Icon:RemoveMaskTexture(self.CircleMask)
			if clubInfo.clubType == Enum.ClubType.BattleNet then
				self.Icon.Backdrop:Show()
			else
				self.Icon.Backdrop:Hide()
			end
		end
	end)

	AS:StripTextures(CommunitiesFrame.GuildFinderFrame)

	AS:SkinBackdropFrame(CommunitiesFrame.GuildMemberDetailFrame)
	AS:SetInside(CommunitiesFrame.GuildMemberDetailFrame.Backdrop)

	AS:SkinFrame(CommunitiesFrame.GuildMemberDetailFrame.NoteBackground)
	AS:SkinFrame(CommunitiesFrame.GuildMemberDetailFrame.OfficerNoteBackground)

	AS:SkinCloseButton(CommunitiesFrame.GuildMemberDetailFrame.CloseButton)
	AS:SkinButton(CommunitiesFrame.GuildMemberDetailFrame.RemoveButton)
	AS:SkinButton(CommunitiesFrame.GuildMemberDetailFrame.GroupInviteButton)
	AS:SkinDropDownBox(CommunitiesFrame.GuildMemberDetailFrame.RankDropdown)

	AS:StripTextures(CommunitiesFrame.MemberList.ColumnDisplay)

	AS:SkinFrame(CommunitiesFrame.MemberList.InsetFrame)
	AS:SkinDropDownBox(CommunitiesFrame.GuildMemberListDropDownMenu)
	AS:SkinButton(CommunitiesFrame.CommunitiesControlFrame.GuildControlButton)
	AS:SkinButton(CommunitiesFrame.CommunitiesControlFrame.GuildRecruitmentButton)
	AS:SkinButton(CommunitiesFrame.CommunitiesControlFrame.CommunitiesSettingsButton)
	AS:SkinCheckBox(CommunitiesFrame.MemberList.ShowOfflineButton)
	CommunitiesFrame.MemberList.ShowOfflineButton:SetSize(25, 25)

	hooksecurefunc(CommunitiesFrame.MemberList, "RefreshListDisplay", function(self)
		for Column in pairs(self.ColumnDisplay.columnHeaders.activeObjects) do
			AS:SkinButton(Column)
		end

		for _, button in ipairs(self.ListScrollFrame.buttons) do
			if not button.hooked then
				AS:SkinButton(button.ProfessionHeader)

				hooksecurefunc(button, "RefreshExpandedColumns", function(self)
					if not self.expanded then return end

					local memberInfo = self:GetMemberInfo()
					if memberInfo and memberInfo.classID then
						local classInfo = C_CreatureInfo.GetClassInfo(memberInfo.classID)
						if classInfo then
							local tcoords = CLASS_ICON_TCOORDS[classInfo.classFile]
							self.Class:SetTexCoord(tcoords[1] + .022, tcoords[2] - .025, tcoords[3] + .022, tcoords[4] - .025)
						end
					end
				end)

				button.hooked = true
			end
		end
	end)

	AS:StripTextures(CommunitiesFrame.GuildBenefitsFrame)

	AS:SkinBackdropFrame(CommunitiesFrame.GuildBenefitsFrame.Perks)
	CommunitiesFrame.GuildBenefitsFrame.Perks.Backdrop:SetPoint('TOPLEFT', 0, 0)
	CommunitiesFrame.GuildBenefitsFrame.Perks.Backdrop:SetPoint('BOTTOMRIGHT', 10, 0)

	AS:SkinBackdropFrame(CommunitiesFrame.GuildBenefitsFrame.Rewards)
	CommunitiesFrame.GuildBenefitsFrame.Rewards.Backdrop:SetPoint('TOPLEFT', 0, 0)
	CommunitiesFrame.GuildBenefitsFrame.Rewards.Backdrop:SetPoint('BOTTOMRIGHT', 0, 0)

	for _, Button in pairs(CommunitiesFrameContainer.buttons) do
		AS:SkinTexture(Button.Icon, true)
		AS:SkinBackdropFrame(Button)
		AS:SetInside(Button.Backdrop)
		Button.Backdrop:SetPoint("BOTTOMRIGHT", -15, 2)
	end

	CommunitiesFrame.GuildBenefitsFrame.Rewards.RewardsContainer.scrollBar.ScrollDownButton = CommunitiesFrame.GuildBenefitsFrame.Rewards.RewardsContainer.scrollDown
	CommunitiesFrame.GuildBenefitsFrame.Rewards.RewardsContainer.scrollBar.ScrollUpButton = CommunitiesFrame.GuildBenefitsFrame.Rewards.RewardsContainer.scrollUp
	AS:SkinScrollBar(CommunitiesFrame.GuildBenefitsFrame.Rewards.RewardsContainer.scrollBar)

	AS:SkinBackdropFrame(CommunitiesFrame.GuildBenefitsFrame.FactionFrame.Bar)
	CommunitiesFrame.GuildBenefitsFrame.FactionFrame.Bar.Progress:SetTexture(AS.NormTex)
	CommunitiesFrame.GuildBenefitsFrame.FactionFrame.Bar.Backdrop:SetPoint("TOPLEFT", 0, -3)
	CommunitiesFrame.GuildBenefitsFrame.FactionFrame.Bar.Backdrop:SetPoint("BOTTOMRIGHT", 0, 1)

	for _, Button in pairs(CommunitiesFrame.GuildBenefitsFrame.Rewards.RewardsContainer.buttons) do
		AS:SkinTexture(Button.Icon, true)
		AS:SkinBackdropFrame(Button)
		Button.Backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 1, 2)
		Button.Backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 1, -2)
		Button.Backdrop:SetPoint('RIGHT', 0, 0)
	end

	hooksecurefunc("CommunitiesGuildRewards_Update", function(self)
		for _, Button in pairs(CommunitiesFrame.GuildBenefitsFrame.Rewards.RewardsContainer.buttons) do
			if Button.index then
				local _, itemID = GetGuildRewardInfo(Button.index)
				if itemID then
					local _, _, quality = GetItemInfo(itemID)
					if quality and quality > 1 then
						Button.Icon.Backdrop:SetBackdropBorderColor(GetItemQualityColor(quality))
					end
				end
			end
		end
	end)

	AS:StripTextures(CommunitiesFrame.GuildDetailsFrame)
	AS:SkinBackdropFrame(CommunitiesFrame.GuildDetailsFrame.Info)
	CommunitiesFrame.GuildDetailsFrame.Info.Backdrop:SetPoint('TOPLEFT', 0, 0)
	CommunitiesFrame.GuildDetailsFrame.Info.Backdrop:SetPoint('BOTTOMRIGHT', 14, 0)

	AS:SkinBackdropFrame(CommunitiesFrame.GuildDetailsFrame.News)
	CommunitiesFrame.GuildDetailsFrame.News.Backdrop:SetPoint('TOPLEFT', 0, 0)
	CommunitiesFrame.GuildDetailsFrame.News.Backdrop:SetPoint('BOTTOMRIGHT', -10, 0)

	AS:SkinScrollBar(CommunitiesFrame.GuildDetailsFrame.Info.DetailsFrame.ScrollBar)
	AS:SkinScrollBar(CommunitiesFrame.GuildDetailsFrame.Info.MOTDScrollFrame.ScrollBar)

	hooksecurefunc("GuildNewsButton_SetNews", function(button, news_id)
		local newsInfo = C_GuildInfo.GetGuildNewsInfo(news_id)
		if newsInfo then
			if button.header:IsShown() then
				button.header:SetAlpha(0)
			end
		end
	end)

	CommunitiesFrame.GuildDetailsFrame.News.Container.ScrollBar.ScrollUpButton = CommunitiesFrame.GuildDetailsFrame.News.Container.scrollUp
	CommunitiesFrame.GuildDetailsFrame.News.Container.ScrollBar.ScrollDownButton = CommunitiesFrame.GuildDetailsFrame.News.Container.scrollDown
	AS:SkinScrollBar(CommunitiesFrame.GuildDetailsFrame.News.Container.ScrollBar)

	AS:SkinButton(CommunitiesFrame.GuildLogButton)

	AS:SkinFrame(CommunitiesGuildNewsFiltersFrame)
	AS:SkinCloseButton(CommunitiesGuildNewsFiltersFrame.CloseButton)
	AS:SkinCheckBox(CommunitiesGuildNewsFiltersFrame.GuildAchievement)
	AS:SkinCheckBox(CommunitiesGuildNewsFiltersFrame.Achievement)
	AS:SkinCheckBox(CommunitiesGuildNewsFiltersFrame.DungeonEncounter)
	AS:SkinCheckBox(CommunitiesGuildNewsFiltersFrame.EpicItemLooted)
	AS:SkinCheckBox(CommunitiesGuildNewsFiltersFrame.EpicItemCrafted)
	AS:SkinCheckBox(CommunitiesGuildNewsFiltersFrame.EpicItemPurchased)
	AS:SkinCheckBox(CommunitiesGuildNewsFiltersFrame.LegendaryItemLooted)

	AS:SkinFrame(CommunitiesGuildTextEditFrame)
	AS:SkinFrame(CommunitiesGuildTextEditFrame.Container)
	AS:SkinCloseButton(CommunitiesGuildTextEditFrameCloseButton)
	AS:SkinScrollBar(CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar)
	AS:SkinButton(CommunitiesGuildTextEditFrameAcceptButton)
	local CloseButton = select(4, CommunitiesGuildTextEditFrame:GetChildren())
	AS:SkinButton(CloseButton)

	---- Guild Log
	AS:SkinBackdropFrame(CommunitiesGuildLogFrame)
	AS:SetInside(CommunitiesGuildLogFrame.Backdrop)
	AS:SkinFrame(CommunitiesGuildLogFrame.Container)
	AS:SkinScrollBar(CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar)
	AS:SkinCloseButton(CommunitiesGuildLogFrameCloseButton)
	local CloseButton = select(3, CommunitiesGuildLogFrame:GetChildren())
	AS:SkinButton(CloseButton)

	AS:SkinFrame(CommunitiesGuildRecruitmentFrame)
	AS:SkinFrame(CommunitiesGuildRecruitmentFrame.Inset)

	AS:SkinFrame(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame)
	AS:SkinFrame(CommunitiesGuildRecruitmentFrameRecruitment.AvailabilityFrame)
	AS:SkinFrame(CommunitiesGuildRecruitmentFrameRecruitment.RolesFrame)
	AS:SkinFrame(CommunitiesGuildRecruitmentFrameRecruitment.LevelFrame)
	AS:SkinFrame(CommunitiesGuildRecruitmentFrameRecruitment.CommentFrame)

	AS:SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame.QuestButton)
	AS:SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame.DungeonButton)
	AS:SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame.RaidButton)
	AS:SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame.PvPButton)
	AS:SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame.RPButton)

	AS:SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.AvailabilityFrame.WeekdaysButton)
	AS:SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.AvailabilityFrame.WeekendsButton)

	AS:SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.RolesFrame.TankButton.checkButton)
	AS:SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.RolesFrame.HealerButton.checkButton)
	AS:SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.RolesFrame.DamagerButton.checkButton)

	AS:SkinCloseButton(CommunitiesGuildRecruitmentFrameCloseButton)

	AS:SkinButton(CommunitiesGuildRecruitmentFrameRecruitment.ListGuildButton)

	-- Tabs
	for i = 1, 2 do
		AS:SkinButton(_G["CommunitiesGuildRecruitmentFrameTab"..i])
	end

	AS:StripTextures(CommunitiesGuildRecruitmentFrameRecruitment.CommentFrame.CommentInputFrame)
	AS:SkinEditBox(CommunitiesGuildRecruitmentFrameRecruitment.CommentFrame.CommentInputFrame)

	AS:SkinButton(CommunitiesGuildRecruitmentFrameApplicants.InviteButton)
	AS:SkinButton(CommunitiesGuildRecruitmentFrameApplicants.MessageButton)
	AS:SkinButton(CommunitiesGuildRecruitmentFrameApplicants.DeclineButton)

	for i = 1, 5 do
		_G["CommunitiesGuildRecruitmentFrameApplicantsContainerButton"..i]:SetBackdrop(nil)
	end

	AS:SkinFrame(CommunitiesFrame.NotificationSettingsDialog)
	AS:SkinDropDownBox(CommunitiesFrame.NotificationSettingsDialog.CommunitiesListDropDownMenu)
	AS:SkinCheckBox(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.Child.QuickJoinButton)
	AS:SkinButton(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.Child.AllButton)
	AS:SkinButton(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.Child.NoneButton)
	AS:SkinButton(CommunitiesFrame.NotificationSettingsDialog.OkayButton)
	AS:SkinButton(CommunitiesFrame.NotificationSettingsDialog.CancelButton)
	AS:SkinScrollBar(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar)

	AS:SkinFrame(CommunitiesFrame.EditStreamDialog)
	AS:SkinEditBox(CommunitiesFrame.EditStreamDialog.NameEdit)

	AS:SkinEditBox(CommunitiesFrame.EditStreamDialog.Description)
	CommunitiesFrame.EditStreamDialog.Description.Backdrop:SetPoint('BOTTOMRIGHT', 0, 0)

	AS:SkinCheckBox(CommunitiesFrame.EditStreamDialog.TypeCheckBox)

	AS:SkinButton(CommunitiesFrame.EditStreamDialog.Accept)
	AS:SkinButton(CommunitiesFrame.EditStreamDialog.Cancel)

	AS:SkinFrame(CommunitiesSettingsDialog)

	AS:SkinTexture(CommunitiesSettingsDialog.IconPreview)
	CommunitiesSettingsDialog.IconPreviewRing:Hide()

	AS:SkinEditBox(CommunitiesSettingsDialog.NameEdit)
	AS:SkinEditBox(CommunitiesSettingsDialog.ShortNameEdit)

	AS:StripTextures(CommunitiesSettingsDialog.Description)
	AS:SkinEditBox(CommunitiesSettingsDialog.Description)
	AS:SkinScrollBar(CommunitiesSettingsDialog.Description.ScrollBar)

	AS:StripTextures(CommunitiesSettingsDialog.MessageOfTheDay)
	AS:SkinEditBox(CommunitiesSettingsDialog.MessageOfTheDay)

	AS:SkinButton(CommunitiesSettingsDialog.ChangeAvatarButton)
	AS:SkinButton(CommunitiesSettingsDialog.Accept)
	AS:SkinButton(CommunitiesSettingsDialog.Delete)
	AS:SkinButton(CommunitiesSettingsDialog.Cancel)


	AS:SkinFrame(CommunitiesAvatarPickerDialog)
	AS:StripTextures(CommunitiesAvatarPickerDialog.ScrollFrame)
	AS:SkinScrollBar(CommunitiesAvatarPickerDialog.ScrollFrame.ScrollBar)
	AS:SkinButton(CommunitiesAvatarPickerDialog.OkayButton)
	AS:SkinButton(CommunitiesAvatarPickerDialog.CancelButton)

	AS:SkinFrame(CommunitiesTicketManagerDialog)
	CommunitiesTicketManagerDialog.InviteManager.ArtOverlay:Hide()
	AS:StripTextures(CommunitiesTicketManagerDialog.InviteManager.ColumnDisplay)
	AS:StripTextures(CommunitiesTicketManagerDialog.InviteManager.ListScrollFrame)

	AS:SkinButton(CommunitiesTicketManagerDialog.LinkToChat)
	AS:SkinButton(CommunitiesTicketManagerDialog.Copy)
	AS:SkinButton(CommunitiesTicketManagerDialog.Close)
	AS:SkinButton(CommunitiesTicketManagerDialog.GenerateLinkButton)

	AS:SkinDropDownBox(CommunitiesTicketManagerDialog.ExpiresDropDownMenu)
	AS:SkinDropDownBox(CommunitiesTicketManagerDialog.UsesDropDownMenu)

	AS:SkinScrollBar(CommunitiesTicketManagerDialog.InviteManager.ListScrollFrame.scrollBar)
	AS:SkinButton(CommunitiesTicketManagerDialog.MaximizeButton)

	AS:UnregisterSkinEvent(addon, event)
end

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
		AS:Kill(TabardFramePortrait)

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
		AS:SetInside(Button.Backdrop)
		Button.Backdrop:SetPoint("BOTTOMRIGHT", -15, 2)
	end

	for _, Button in pairs(GuildRewardsContainer.buttons) do
		AS:SkinTexture(Button.icon, true)
		AS:SkinBackdropFrame(Button)
		AS:SetInside(Button.Backdrop)
		hooksecurefunc(Button.icon, "SetTexture", function(self)
			local r, g, b = unpack(AS.BorderColor)
			if Button.index then
				local _, itemID = GetGuildRewardInfo(Button.index)
				if itemID then
					local Quality = select(3, GetItemInfo(itemID))
					if Quality and Quality > 1 then
						r, g, b = GetItemQualityColor(Quality)
					end
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
		AS:Kill(_G["GuildNewsContainerButton"..i].header)
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
		AS:Kill(button.selectedTex)
		AS:Kill(button:GetHighlightTexture())
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
			AS:SetInside(Button.icon)
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
		AS:SetInside(Browse.Backdrop)
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

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_Communities", AS.Blizzard_Communities, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_GuildUI', AS.Blizzard_GuildUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_GuildControlUI', AS.Blizzard_GuildControlUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_GuildBankUI', AS.Blizzard_GuildBankUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_LookingForGuildUI', AS.Blizzard_LookingForGuildUI, 'ADDON_LOADED')
