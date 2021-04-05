if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_Communities(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' and IsAddOnLoaded('Blizzard_Communities') or addon ~= 'Blizzard_Communities' then return end

	AS:SkinFrame(CommunitiesFrame, nil, nil, true)
	AS:SkinCloseButton(CommunitiesFrame.CloseButton)
	AS:Kill(CommunitiesFrame.PortraitOverlay)
	AS:StripTextures(CommunitiesFrame.CommunitiesList)

	CommunitiesFrame.CommunitiesList.ListScrollFrame.ScrollBar.ScrollDownButton = CommunitiesFrame.CommunitiesList.ListScrollFrame.scrollDown
	CommunitiesFrame.CommunitiesList.ListScrollFrame.ScrollBar.ScrollUpButton = CommunitiesFrame.CommunitiesList.ListScrollFrame.scrollUp
	AS:SkinScrollBar(CommunitiesFrame.CommunitiesList.ListScrollFrame.ScrollBar)

	AS:SkinIconButton(CommunitiesFrame.ChatTab)
	AS:SkinIconButton(CommunitiesFrame.RosterTab)

	AS:SkinMaxMinFrame(CommunitiesFrame.MaximizeMinimizeFrame)

	AS:SkinDropDownBox(CommunitiesFrame.StreamDropDownMenu)
	CommunitiesFrame.StreamDropDownMenu.Text:SetJustifyH("RIGHT")

	AS:SkinDropDownBox(CommunitiesFrame.CommunitiesListDropDownMenu)
	CommunitiesFrame.CommunitiesListDropDownMenu.Text:SetJustifyH("RIGHT")

	AS:SkinButton(CommunitiesFrame.AddToChatButton)

	AS:SkinButton(CommunitiesFrame.InviteButton)
	CommunitiesFrame.AddToChatButton:SetPoint("TOPRIGHT", CommunitiesFrame.ChatEditBox, "BOTTOMRIGHT", 4, 4)

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

	AS:StripTextures(CommunitiesFrame.MemberList.ColumnDisplay)

	AS:SkinFrame(CommunitiesFrame.MemberList.InsetFrame)
	AS:SkinButton(CommunitiesFrame.CommunitiesControlFrame.CommunitiesSettingsButton)
	AS:SkinCheckBox(CommunitiesFrame.MemberList.ShowOfflineButton)
	CommunitiesFrame.MemberList.ShowOfflineButton:SetSize(25, 25)

	hooksecurefunc(CommunitiesFrame.MemberList, "RefreshListDisplay", function(self)
		for Column in pairs(self.ColumnDisplay.columnHeaders.activeObjects) do
			AS:SkinButton(Column)
		end

		for _, button in ipairs(self.ListScrollFrame.buttons) do
			if not button.hooked then
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

	for i = 1, 5 do
		AS:SkinTab(_G['CommunitiesFrameTab'..i])
	end

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_GuildUI(event, addon)
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

	AS:StripTextures(GuildFrame)
	AS:StripTextures(GuildFrameLFGFrame)
	AS:SkinCheckBox(GuildFrameLFGButton)

	GuildFrameGuildListToggleButton:SetSize(24, 24)
	AS:SkinArrowButton(GuildFrameGuildListToggleButton, 'left')

	GuildFramePromoteButton:SetSize(24, 24)
	AS:SkinArrowButton(GuildFramePromoteButton, 'up')
	GuildFramePromoteButton:SetHitRectInsets(0, 0, 0, 0)
	GuildFramePromoteButton:SetPoint("TOPLEFT", GuildMemberDetailFrame, "TOPLEFT", 155, -68)

	GuildFrameDemoteButton:SetSize(24, 24)
	AS:SkinArrowButton(GuildFrameDemoteButton, 'down')
	GuildFrameDemoteButton:SetHitRectInsets(0, 0, 0, 0)
	GuildFrameDemoteButton:SetPoint("LEFT", GuildFramePromoteButton, "RIGHT", 2, 0)

	AS:StripTextures(GuildListScrollFrame)
	AS:SkinScrollBar(GuildListScrollFrameScrollBar)
	AS:SkinButton(GuildFrameAddMemberButton)
	AS:SkinButton(GuildFrameGuildInformationButton)
	AS:SkinButton(GuildFrameControlButton)

	AS:SkinCloseButton(GuildMemberDetailCloseButton)

	AS:StripTextures(GuildMemberDetailFrame)
	AS:StripTextures(GuildMemberNoteBackground)
	AS:StripTextures(GuildMemberOfficerNoteBackground)

	AS:SkinButton(GuildMemberRemoveButton)
	AS:SkinButton(GuildMemberGroupInviteButton)

	AS:SkinFrame(GuildMemberDetailFrame)
	AS:SkinFrame(GuildMemberNoteBackground)
	AS:SkinFrame(GuildMemberOfficerNoteBackground)

	_G.GuildMOTDEditButton:CreateBackdrop('Default')
	_G.GuildMOTDEditButton.Backdrop:SetPoint('TOPLEFT', -3, 3)
	_G.GuildMOTDEditButton.Backdrop:SetPoint('BOTTOMRIGHT', 3, -2)

	for i = 1, 4 do
		AS:StripTextures(_G["GuildFrameColumnHeader"..i])
		AS:StyleButton(_G["GuildFrameColumnHeader"..i])
		AS:StripTextures(_G["GuildFrameGuildStatusColumnHeader"..i])
		AS:StyleButton(_G["GuildFrameGuildStatusColumnHeader"..i])
	end

	-- Info Frame
	AS:SkinBackdropFrame(GuildInfoFrame)
	GuildInfoFrame.Backdrop:SetPoint("TOPLEFT", 3, -6)
	GuildInfoFrame.Backdrop:SetPoint("BOTTOMRIGHT", -2, 3)

	AS:SetTemplate(GuildInfoTextBackground, "Default")
	AS:SkinScrollBar(GuildInfoFrameScrollFrameScrollBar)

	AS:SkinCloseButton(GuildInfoCloseButton)

	AS:SkinButton(GuildInfoSaveButton)
	GuildInfoSaveButton:SetPoint("BOTTOMLEFT", 8, 11)

	AS:SkinButton(GuildInfoCancelButton)
	GuildInfoCancelButton:SetPoint("LEFT", GuildInfoSaveButton, "RIGHT", 3, 0)
end

function AS:Blizzard_GuildControlUI(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' and IsAddOnLoaded('Blizzard_GuildControlUI') or addon ~= 'Blizzard_GuildControlUI' then return end
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
	if event == 'PLAYER_ENTERING_WORLD' and IsAddOnLoaded('Blizzard_GuildBankUI') or addon ~= 'Blizzard_GuildBankUI' then return end

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

AS:RegisterSkin("Blizzard_Communities", AS.Blizzard_Communities, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_GuildUI', AS.Blizzard_GuildUI)
AS:RegisterSkin('Blizzard_GuildControlUI', AS.Blizzard_GuildControlUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_GuildBankUI', AS.Blizzard_GuildBankUI, 'ADDON_LOADED')
