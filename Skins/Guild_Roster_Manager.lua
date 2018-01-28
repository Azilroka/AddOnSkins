local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Guild_Roster_Manager') then return end

function AS:GuildRosterManager()

	-- Tabs
	AS:SkinButton(GRM_LogTab)
	AS:SkinButton(GRM_AddEventTab)
	AS:SkinButton(GRM_BanListTab)
	AS:SkinButton(GRM_AddonUsersTab)
	AS:SkinButton(GRM_OptionsTab)
	AS:SkinButton(GRM_GuildAuditTab)
	GRM_LogTab:SetPoint ( "BOTTOMLEFT" , GRM_UI.GRM_RosterChangeLogFrame , "TOPLEFT" , 0 , 1 )

	-- Event Log
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

	-- Side Frame
	AS:SkinFrame(GRM_RosterCheckBoxSideFrame)
	GRM_RosterCheckBoxSideFrame:SetPoint ( "TOPLEFT" , GRM_RosterChangeLogFrame , "TOPRIGHT" , 2 , 0 )

	--Options
	AS:SkinFrame(GRM_OptionsFrame);
	AS:SkinFrame(GRM_RosterSyncRankDropDownSelected);
	AS:SkinFrame(GRM_RosterSyncRankDropDownMenu);
	AS:SkinFrame(GRM_RosterBanListDropDownSelected);
	AS:SkinFrame(GRM_RosterBanListDropDownMenu);
	AS:SkinButton(GRM_ScanOptionsButton)
	AS:SkinButton(GRM_SyncOptionsButton)
	AS:SkinButton(GRM_CenterOptionsButton)
	AS:SkinButton(GRM_ResetDefaultOptionsButton)
	AS:SkinButton(GRM_HelpOptionsButton)
	AS:SkinButton(GRM_ClearAllOptionsButton)
	AS:SkinButton(GRM_ClearGuildOptionsButton)
	AS:SkinButton(GRM_VersionOptionsButton)


	-- Add Event to Calendar Frame
	GRM_AddEventScrollBorderFrameBottomBorder:Hide()
	GRM_AddEventScrollBorderFrameTopBorder:Hide()
	GRM_AddEventScrollBorderFrameLeftBorder:Hide()
	GRM_AddEventScrollBorderFrameRightBorder:Hide()
	GRM_AddEventScrollBorderFrameTopLeftCorner:Hide()
	GRM_AddEventScrollBorderFrameTopRightCorner:Hide()
	GRM_AddEventScrollBorderFrameBottomRightCorner:Hide()
	GRM_AddEventScrollBorderFrameBottomLeftCorner:Hide()
	AS:SkinScrollBar(GRM_AddEventScrollFrameSlider)
	AS:SkinButton(GRM_EventsFrameSetAnnounceButton)
	AS:SkinButton(GRM_EventsFrameIgnoreButton)
	
	-- --Ban List
	GRM_CoreBanListScrollBorderFrameBottomBorder:Hide()
	GRM_CoreBanListScrollBorderFrameTopBorder:Hide()
	GRM_CoreBanListScrollBorderFrameLeftBorder:Hide()
	GRM_CoreBanListScrollBorderFrameRightBorder:Hide()
	GRM_CoreBanListScrollBorderFrameTopLeftCorner:Hide()
	GRM_CoreBanListScrollBorderFrameTopRightCorner:Hide()
	GRM_CoreBanListScrollBorderFrameBottomRightCorner:Hide()
	GRM_CoreBanListScrollBorderFrameBottomLeftCorner:Hide()
	AS:SkinButton(GRM_BanListRemoveButton)
	AS:SkinButton(GRM_BanListAddButton)
	AS:SkinScrollBar(GRM_CoreBanListScrollFrameSlider)
	

	--Ban Frame
	AS:SkinFrame(GRM_AddBanFrame)
	AS:SkinCloseButton(GRM_AddBanFrame.CloseButton)
	AS:SkinButton(GRM_AddBanConfirmButton)
	AS:SkinEditBox(GRM_AddBanNameSelectionEditBox)
	AS:SkinEditBox(GRM_AddBanServerSelectionEditBox)
	AS:SkinEditBox(GRM_AddBanReasonEditBox)
	AS:SkinFrame(GRM_AddBanDropDownClassSelected);
	AS:SkinFrame(GRM_AddBanDropDownMenu)
	-- Ban Frame Confirm Window
	AS:SkinFrame(GRM_PopupWindowConfirmFrame)
	AS:SkinButton(GRM_PopupWindowConfirmFrameYesButton)
	AS:SkinButton(GRM_PopupWindowConfirmFrameCancelButton)
	GRM_PopupWindowConfirmFrameBottomBorder:Hide()
	GRM_PopupWindowConfirmFrameTopBorder:Hide()
	GRM_PopupWindowConfirmFrameLeftBorder:Hide()
	GRM_PopupWindowConfirmFrameRightBorder:Hide()
	GRM_PopupWindowConfirmFrameTopLeftCorner:Hide()
	GRM_PopupWindowConfirmFrameTopRightCorner:Hide()
	GRM_PopupWindowConfirmFrameBottomRightCorner:Hide()
	GRM_PopupWindowConfirmFrameBottomLeftCorner:Hide()
	
	-- Addon Users Frame
	-- AS:SkinFrame(GRM_AddonUsersFrame)
	AS:SkinScrollBar(GRM_AddonUsersScrollFrameSlider)
	GRM_AddonUsersScrollBorderFrameBottomBorder:Hide()
	GRM_AddonUsersScrollBorderFrameTopBorder:Hide()
	GRM_AddonUsersScrollBorderFrameLeftBorder:Hide()
	GRM_AddonUsersScrollBorderFrameRightBorder:Hide()
	GRM_AddonUsersScrollBorderFrameTopLeftCorner:Hide()
	GRM_AddonUsersScrollBorderFrameTopRightCorner:Hide()
	GRM_AddonUsersScrollBorderFrameBottomRightCorner:Hide()
	GRM_AddonUsersScrollBorderFrameBottomLeftCorner:Hide()

	-- Audit Frame
	AS:SkinFrame(GRM_AuditFrame)
	AS:SkinButton(GRM_SetJoinUnkownButton)
	AS:SkinButton(GRM_SetPromoUnkownButton)
	AS:SkinScrollBar(GRM_AuditScrollFrameSlider)
	GRM_AuditScrollBorderFrameBottomBorder:Hide()
	GRM_AuditScrollBorderFrameTopBorder:Hide()
	GRM_AuditScrollBorderFrameLeftBorder:Hide()
	GRM_AuditScrollBorderFrameRightBorder:Hide()
	GRM_AuditScrollBorderFrameTopLeftCorner:Hide()
	GRM_AuditScrollBorderFrameTopRightCorner:Hide()
	GRM_AuditScrollBorderFrameBottomRightCorner:Hide()
	GRM_AuditScrollBorderFrameBottomLeftCorner:Hide()
	

	-- --Guild Frame
	AS:SkinButton(GRM_LoadLogButton)

	--Guild Detail Frame
	AS:SkinFrame(GRM_MemberDetailMetaData)	
	AS:SkinCloseButton(GRM_MemberDetailMetaDataCloseButton)
	AS:SkinButton(GRM_MemberDetailJoinDateButton)
	AS:SkinButton(GRM_SetPromoDateButton)
	AS:SkinButton(GRM_DateSubmitButton)
	AS:SkinButton(GRM_DateSubmitCancelButton)
	AS:SkinButton(GRM_AddAltButton)
	AS:SkinButton(GRM_GroupInviteButton)
	AS:SkinButton(GRM_SetUnknownButton)
	AS:SkinButton(GRM_MemberDetailBannedIgnoreButton)
	AS:SkinFrame(GRM_AddAltEditFrame)
	AS:SkinFrame(GRM_MonthDropDownMenuSelected)
	AS:SkinFrame(GRM_MonthDropDownMenu)
	AS:SkinFrame(GRM_DayDropDownMenuSelected)
	AS:SkinFrame(GRM_DayDropDownMenu)
	AS:SkinFrame(GRM_YearDropDownMenuSelected)
	AS:SkinFrame(GRM_YearDropDownMenu)

	-- Ban Popup Frames
	AS:SkinFrame(GRM_PopupWindow)
	AS:SkinFrame(GRM_MemberDetailEditBoxFrame)
	
	local isLoaded = false;
	GRM_MemberDetailMetaData:HookScript("OnShow" , function( self )
		if not isLoaded then
			self:SetPoint ( "TOPLEFT" , GuildRosterFrame , "TOPRIGHT" , 2 , 0 );
			GRM_AddAltEditFrame:SetPoint ( "BOTTOMLEFT" , self , "BOTTOMRIGHT" ,  2 , 0 );
			AS:SkinEditBox(GRM_AddAltEditBox, 120, 15)
			AS:SkinFrame(GRM_PlayerNoteWindow)
			AS:SkinEditBox(GRM_PlayerNoteEditBox)
			AS:SkinFrame(GRM_PlayerOfficerNoteWindow)
			AS:SkinEditBox(GRM_PlayerOfficerNoteEditBox)
			AS:SkinFrame(GRM_SyncJoinDateSideFrame)
			
			GuildMemberDetailFrame:HookScript ( "OnShow" , function( self )
				GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , self , "TOPRIGHT" , 1 , 0 )
				GuildMemberDetailFrame:SetPoint ( "TOPLEFT" , GuildRosterFrame , "TOPRIGHT" , 2 , 0 )
			end);
			
			GuildMemberDetailFrame:HookScript ( "OnHide" , function( self )
				GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , GuildRosterFrame , "TOPRIGHT" , 1 , 0 )
			end);
			
			GRM_PopupWindow:SetPoint ( "TOPLEFT" , StaticPopup1 , "BOTTOMLEFT" , 0 , -1 )
			GRM_MemberDetailEditBoxFrame:SetPoint ( "TOP" , GRM_PopupWindow , "BOTTOM" , 0 , -1 )
			GRM_SyncJoinDateSideFrame:SetPoint ( "TOPLEFT" , GRM_MemberDetailMetaData , "TOPRIGHT" , 1 , 0 );

			-- Tooltip Scaling should be a bit bigger
			GRM_MemberDetailNJDSyncTooltip:SetScale ( 0.85 )
			GRM_MemberDetailNotifyStatusChangeTooltip:SetScale ( 0.85 )
			isLoaded = true;
		end
	end)

	
	local isLoaded2 = false;
	GRM_RosterCheckBoxSideFrame:HookScript("OnShow" , function()
		if not isLoaded2 then
			GRM_RosterCheckBoxSideFrame:SetPoint ( "TOPLEFT" , GRM_RosterChangeLogFrame , "TOPRIGHT" , 2 , 0 )
			--Confirm Frames
			AS:SkinFrame(GRM_RosterConfirmFrame)
			AS:SkinCloseButton(GRM_RosterConfirmFrame.CloseButton)
			AS:SkinButton(GRM_RosterConfirmYesButton)
			AS:SkinButton(GRM_RosterConfirmCancelButton)

			-- Ban Frames
			AS:SkinFrame(GRM_AddBanReasonEditBoxFrame)
			GRM_PopupWindowConfirmFrame:SetSize ( 300 , 100 )
			GRM_PopupWindowConfirmFrame:SetPoint( "TOP" , GRM_AddBanFrame , "BOTTOM" , 0 , -1 )
			GRM_CoreBanListFrameTitleText4:SetPoint ( "BOTTOMRIGHT" , GRM_CoreBanListScrollBorderFrame , "TOPRIGHT" , -45 , -4 );

			-- Audit Frames
			GRM_AuditFrameText2:SetPoint ( "BOTTOMLEFT" , GRM_AuditScrollBorderFrame , "TOP" , -58 , -2 );
			GRM_AuditFrameText3:SetPoint ( "BOTTOMLEFT" , GRM_AuditScrollBorderFrame , "TOP" , 62 , -2 );
			GRM_AuditFrameText4:SetPoint ( "BOTTOMRIGHT" , GRM_AuditScrollBorderFrame , "TOPRIGHT" , -29 ,  -2 );

			-- Add Events
			GRM_EventsFrameNameTitleText3:SetPoint ( "TOPRIGHT" , GRM_AddEventScrollBorderFrame , -218 , 8 )

			-- Addon Users
			GRM_AddonUsersCoreFrameTitleText3:SetPoint ( "BOTTOMRIGHT" , GRM_AddonUsersScrollBorderFrame , "TOPRIGHT" , -26 , -2 );

			-- Options Frame
			GRM_OptionsFrame.OptionsHeaderText:SetPoint ( "TOP" , GRM_UI.GRM_RosterChangeLogFrame , 0 , - 25 );
			isLoaded2 = true;
		end
	end)

end

AS:RegisterSkin('Guild_Roster_Manager', AS.GuildRosterManager)
