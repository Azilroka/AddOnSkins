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

	-- Updates (added by Arkaan).
	-- Purpose: On frame transformation, some of the allignment changes ever so slightly, so it appears to overlap a little, particularly now
	--			with the removal of a thick border frame, so in a scroll window, the frame slightly overlaps the text. Very minor changes
	--			Purely quality of life changes here, but I don't want addon users to miss out on the addon "AddOnSkins" as a result of using GRM,
	--			or the other way around
	-- Of note - due to on-demand load order, for frame save positioning, these two need to be triggered seperately.
	-- the isLoaded booleans are gates to prevent unnecessary re-initialization spam everytime the frame loads.
	local isLoaded = false;
	GRM_MemberDetailMetaData:HookScript("OnShow" , function()
		if not isLoaded then
			GRM_MemberDetailMetaData:SetPoint("TOPLEFT", GuildRosterFrame, "TOPRIGHT", 2, 0)
			GRM_AddAltEditFrame:SetPoint("BOTTOMLEFT", GRM_MemberDetailMetaData, "BOTTOMRIGHT", 2, 0)
			isLoaded = true
		end
	end)

	local isLoaded2 = false
	GRM_RosterCheckBoxSideFrame:HookScript("OnShow" , function()
		if not isLoaded2 then
			GRM_RosterCheckBoxSideFrame:SetPoint("TOPLEFT", GRM_RosterChangeLogFrame, "TOPRIGHT", 2, 0)
			GRM_CoreBanListScrollFrame:SetPoint("RIGHT" , GRM_CoreBanListFrame, -25 , -35)
			GRM_CoreBanListFrameTitleText2:SetPoint("BOTTOMLEFT", GRM_CoreBanListScrollBorderFrame, "TOPLEFT", 15, 1)
			GRM_CoreBanListFrameTitleText3:SetPoint("BOTTOM", GRM_CoreBanListScrollBorderFrame, "TOP", 60, 1)
			GRM_CoreBanListFrameTitleText4:SetPoint("BOTTOM", GRM_CoreBanListScrollBorderFrame, "TOPRIGHT", -54, 1)
			GRM_AddonUsersCoreFrameTitleText:SetPoint("BOTTOMLEFT", GRM_AddonUsersScrollBorderFrame, "TOPLEFT", 12, 5)
			GRM_AddonUsersCoreFrameTitleText2:SetPoint("BOTTOM", GRM_AddonUsersScrollBorderFrame, "TOP", 0, 5)
			GRM_AddonUsersCoreFrameTitleText3:SetPoint("BOTTOMRIGHT", GRM_AddonUsersScrollBorderFrame, "TOPRIGHT", -12, 5)
			isLoaded2 = true
		end
	end)

end

AS:RegisterSkin('Guild_Roster_Manager', AS.GuildRosterManager)