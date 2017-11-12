local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Guild_Roster_Manager') then return end

function AS:GuildRosterManager()
	--Event Log
	AS:SkinFrame(GRM_RosterChangeLogFrame)
	GRM_RosterChangeLogScrollBorderFrameBottomBorder:Hide()
	GRM_RosterChangeLogScrollBorderFrameTopBorder:Hide()
	GRM_RosterChangeLogScrollBorderFrameLeftBorder:Hide()
	GRM_RosterChangeLogScrollBorderFrameRightBorder:Hide()
	GRM_RosterChangeLogScrollBorderFrameTopLeftCorner:Hide()
	GRM_RosterChangeLogScrollBorderFrameTopRightCorner:Hide()
	GRM_RosterChangeLogScrollBorderFrameBottomRightCorner:Hide()
	GRM_RosterChangeLogScrollBorderFrameBottomLeftCorner:Hide()
	AS:SkinScrollBar(GRM_RosterChangeLogScrollFrameSlider)
	AS:SkinCloseButton(GRM_RosterChangeLogFrame.CloseButton)
	AS:SkinButton(GRM_RosterClearLogButton)
	AS:SkinButton(GRM_RosterOptionsButton)

	--Event Log Side Frame
	AS:SkinFrame(GRM_RosterCheckBoxSideFrame)

	--Event Log Confirm Frame
	AS:SkinFrame(GRM_RosterConfirmFrame)
	AS:SkinCloseButton(GRM_RosterConfirmFrame.CloseButton)
	AS:SkinButton(GRM_RosterConfirmYesButton)
	AS:SkinButton(GRM_RosterConfirmCancelButton)

	--Options
	AS:SkinButton(GRM_ResetDefaultOptionsButton)

	--Guild Frame
	AS:SkinButton(GRM_AddonUsersButton)
	AS:SkinButton(GRM_BanListButton)
	GRM_BanListButton:ClearAllPoints()
	GRM_BanListButton:Point("RIGHT", GRM_AddonUsersButton, "LEFT", 0, 1)
	AS:SkinButton(GRM_LoadLogButton)
	-- GRM_LoadLogButton:ClearAllPoints()
	-- GRM_LoadLogButton:SetPoint("RIGHT", BanListButton, "LEFT", 0, 1)

	--Guild Detail Frame
	AS:SkinFrame(GRM_MemberDetailMetaData)
	AS:SkinCloseButton(GRM_MemberDetailMetaDataCloseButton)
	AS:SkinButton(GRM_MemberDetailJoinDateButton)
	AS:SkinButton(GRM_SetPromoDateButton)
	AS:SkinButton(GRM_DateSubmitButton)
	AS:SkinButton(GRM_DateSubmitCancelButton)
	AS:SkinButton(GRM_AddAltButton)
	AS:SkinButton(GRM_GroupInviteButton)
	AS:SkinFrame(GRM_AddAltEditFrame)

	GRM_AddAltEditBox:HookScript("OnShow", function()
		AS:SkinEditBox(GRM_AddAltEditBox, 120, 15)
	end)

	GRM_PlayerNoteWindow:HookScript("OnShow", function()
		AS:SkinFrame(GRM_PlayerNoteWindow)
		-- AS:SkinEditBox(GRM_PlayerNoteEditBox)
	end)

	GRM_PlayerOfficerNoteWindow:HookScript("OnShow", function()
		AS:SkinFrame(GRM_PlayerOfficerNoteWindow)
		-- AS:SkinEditBox(GRM_PlayerOfficerNoteEditBox)
	end)

	--Ban List
	AS:SkinFrame(GRM_CoreBanListFrame)
	AS:SkinCloseButton(GRM_CoreBanListFrame.CloseButton)
	AS:SkinButton(GRM_BanListRemoveButton)
	AS:SkinButton(GRM_BanListAddButton)
	AS:SkinScrollBar(GRM_CoreBanListScrollFrameSlider)
	AS:SkinBackdropFrame(GRM_CoreBanListScrollBorderFrame)

	GRM_CoreBanListScrollBorderFrame:HookScript("OnShow", function()
		GRM_CoreBanListScrollBorderFrame:SetSize(475 , 150)
	end)

	--Sync Info Frame
	AS:SkinFrame(GRM_AddonUsersCoreFrame)
	AS:SkinCloseButton(GRM_AddonUsersCoreFrame.CloseButton)
	AS:SkinScrollBar(GRM_AddonUsersScrollFrameSlider)
	AS:SkinFrame(GRM_AddonUsersScrollBorderFrame)
end

AS:RegisterSkin('Guild_Roster_Manager', AS.GuildRosterManager)