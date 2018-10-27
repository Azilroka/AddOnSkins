local AS = unpack(AddOnSkins)

function AS:Blizzard_Communities(event, addon)
	if addon ~= 'Blizzard_Communities' then return end

	AS:SkinFrame(CommunitiesFrame)
	AS:SkinCloseButton(CommunitiesFrame.CloseButton)
	CommunitiesFrame.PortraitOverlay:Kill()
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
	AS:SkinButton(CommunitiesFrame.GuildFinderFrame.FindAGuildButton)

	AS:SkinButton(CommunitiesFrame.InviteButton)
	CommunitiesFrame.AddToChatButton:SetPoint("TOPRIGHT", CommunitiesFrame.ChatEditBox, "BOTTOMRIGHT", 4, 4)

	AS:SkinEditBox(CommunitiesFrame.ChatEditBox)
	CommunitiesFrame.ChatEditBox.Backdrop:SetInside(CommunitiesFrame.ChatEditBox, -5, 8)
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
				Button.Icon:SetDrawLayer("OVERLAY", 1)
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
	CommunitiesFrame.GuildMemberDetailFrame.Backdrop:SetInside()

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
		for _, Column in pairs({self.ColumnDisplay:GetChildren()}) do
			if Column:IsObjectType("Button") then
				AS:SkinButton(Column)
			end
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
		Button.Backdrop:SetInside()
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
				local _, _, quality = GetItemInfo(itemID)
				if quality and quality > 1 then
					Button.Icon.Backdrop:SetBackdropBorderColor(GetItemQualityColor(quality))
				end
			end
		end
	end)

	AS:StripTextures(CommunitiesFrame.GuildDetailsFrame)
	AS:SkinBackdropFrame(CommunitiesFrame.GuildDetailsFrame.Info)
	CommunitiesFrame.GuildDetailsFrame.Info.Backdrop:SetPoint('TOPLEFT', 0, 0)
	CommunitiesFrame.GuildDetailsFrame.Info.Backdrop:SetPoint('BOTTOMRIGHT', 10, 0)

	AS:SkinBackdropFrame(CommunitiesFrame.GuildDetailsFrame.News)
	CommunitiesFrame.GuildDetailsFrame.News.Backdrop:SetPoint('TOPLEFT', 0, 0)
	CommunitiesFrame.GuildDetailsFrame.News.Backdrop:SetPoint('BOTTOMRIGHT', -10, 0)

	--AS:CreateBackdrop(CommunitiesFrame.GuildDetailsFrame.Info.DetailsFrame)
	--AS:SkinScrollBar(CommunitiesFrame.GuildDetailsFrame.Info.DetailsFrame.ScrollBar)

	--AS:CreateBackdrop(CommunitiesFrame.GuildDetailsFrame.Info.MOTDScrollFrame)
	--AS:SkinScrollBar(CommunitiesFrame.GuildDetailsFrame.Info.MOTDScrollFrame.ScrollBar)

	hooksecurefunc("CommunitiesGuildNewsButton_SetNews", function(button)
		if button.header:IsShown() then
			button.header:SetAlpha(0)
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
	CommunitiesGuildLogFrame.Backdrop:SetInside()
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

	CommunitiesGuildRecruitmentFrameRecruitment.ListGuildButton.LeftSeparator:Hide()
	AS:SkinButton(CommunitiesGuildRecruitmentFrameRecruitment.ListGuildButton)

	-- Tabs
	for i = 1, 2 do
		AS:SkinButton(_G["CommunitiesGuildRecruitmentFrameTab"..i])
	end

	CommunitiesGuildRecruitmentFrameRecruitment.CommentFrame.CommentInputFrame:StripTextures()
	AS:SkinEditBox(CommunitiesGuildRecruitmentFrameRecruitment.CommentFrame.CommentInputFrame)

	-- Recruitment Request
	CommunitiesGuildRecruitmentFrameApplicants.InviteButton.RightSeparator:Hide()
	CommunitiesGuildRecruitmentFrameApplicants.DeclineButton.LeftSeparator:Hide()

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
	CommunitiesTicketManagerDialog.InviteManager.ColumnDisplay:StripTextures()
	CommunitiesTicketManagerDialog.InviteManager.ListScrollFrame:StripTextures()

	AS:SkinButton(CommunitiesTicketManagerDialog.LinkToChat)
	AS:SkinButton(CommunitiesTicketManagerDialog.Copy)
	AS:SkinButton(CommunitiesTicketManagerDialog.Close)
	AS:SkinButton(CommunitiesTicketManagerDialog.GenerateLinkButton)

	AS:SkinDropDownBox(CommunitiesTicketManagerDialog.ExpiresDropDownMenu)
	AS:SkinDropDownBox(CommunitiesTicketManagerDialog.UsesDropDownMenu)

	AS:SkinScrollBar(CommunitiesTicketManagerDialog.InviteManager.ListScrollFrame.scrollBar)
	AS:SkinButton(CommunitiesTicketManagerDialog.MaximizeButton)
end

AS:RegisterSkin("Blizzard_Communities", AS.Blizzard_Communities, 'ADDON_LOADED')