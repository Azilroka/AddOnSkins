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

	-- Event Log Options
	AS:SkinFrame(GRM_LogExtraOptionsFrame)
	AS:SkinFrame(GRM_ExportLogBorderFrame)
	AS:SkinCloseButton(GRM_BorderFrameCloseButton)
	AS:SkinButton(GRM_LogExtraOptionsButton)
	AS:SkinButton(GRM_LogExportButton)
	AS:SkinButton(GRM_RosterClearLogButton)
	AS:SkinButton(GRM_ConfirmClearButton)
	

	-- Side Frame
	AS:SkinFrame(GRM_RosterCheckBoxSideFrame)
	
	--Options
	AS:SkinFrame(GRM_OptionsFrame)
	AS:SkinFrame(GRM_RosterSyncRankDropDownSelected)
	AS:SkinFrame(GRM_RosterSyncRankDropDownMenu)
	AS:SkinFrame(GRM_RosterBanListDropDownSelected)
	AS:SkinFrame(GRM_RosterBanListDropDownMenu)
	AS:SkinFrame(GRM_LanguageSelected)
	AS:SkinFrame(GRM_LanguageDropDownMenu)
	AS:SkinFrame(GRM_MainTagFormatSelected)
	AS:SkinFrame(GRM_MainTagFormatMenu)
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
	AS:SkinButton(GRM_BanListEditButton)
	AS:SkinScrollBar(GRM_CoreBanListScrollFrameSlider)
	

	--Ban Frame
	AS:SkinFrame(GRM_AddBanFrame)
	AS:SkinCloseButton(GRM_AddBanFrame.CloseButton)
	AS:SkinButton(GRM_AddBanConfirmButton)
	AS:SkinEditBox(GRM_AddBanNameSelectionEditBox)
	AS:SkinEditBox(GRM_AddBanServerSelectionEditBox)
	AS:SkinEditBox(GRM_AddBanReasonEditBox)
	AS:SkinFrame(GRM_AddBanDropDownClassSelected)
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
	AS:SkinFrame(GRM_AddonUsersFrame)
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
	
	-- Backup Frame
	AS:SkinFrame(GRM_UIOptionsFrame)
	AS:SkinScrollBar(GRM_CoreBackupScrollFrameSlider)
	GRM_CoreBackupScrollBorderFrameBottomBorder:Hide()
	GRM_CoreBackupScrollBorderFrameTopBorder:Hide()
	GRM_CoreBackupScrollBorderFrameLeftBorder:Hide()
	GRM_CoreBackupScrollBorderFrameRightBorder:Hide()
	GRM_CoreBackupScrollBorderFrameTopLeftCorner:Hide()
	GRM_CoreBackupScrollBorderFrameTopRightCorner:Hide()
	GRM_CoreBackupScrollBorderFrameBottomRightCorner:Hide()
	GRM_CoreBackupScrollBorderFrameBottomLeftCorner:Hide()

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
	AS:SkinButton(GRM_AddAltButton2)
	AS:SkinButton(GRM_GroupInviteButton)
	AS:SkinButton(GRM_SetUnknownButton)
	AS:SkinButton(GRM_MemberDetailBannedIgnoreButton)
	AS:SkinButton(GRM_CancelCustomNoteButton)
	AS:SkinButton(GRM_ConfirmCustomNoteButton)
	AS:SkinFrame(GRM_AddAltEditFrame)
	AS:SkinFrame(GRM_MonthDropDownMenuSelected)
	AS:SkinFrame(GRM_MonthDropDownMenu)
	AS:SkinFrame(GRM_DayDropDownMenuSelected)
	AS:SkinFrame(GRM_DayDropDownMenu)
	AS:SkinFrame(GRM_YearDropDownMenuSelected)
	AS:SkinFrame(GRM_YearDropDownMenu)

	-- Alt grouping frame
	AS:SkinFrame(GRM_AltGroupingScrollBorderFrame)
	AS:SkinCloseButton(GRM_AltGroupingScrollBorderFrameCloseButton)
	AS:SkinScrollBar(GRM_AltGroupingScrollFrameSlider)
	
	-- Ban Popup Frames
	AS:SkinFrame(GRM_PopupWindow)
	AS:SkinFrame(GRM_MemberDetailEditBoxFrame)

	local sideGroupingLogic = function()
		GRM_AltGroupingScrollBorderFrame:HookScript ( "OnShow" , function()
			if GRM_MemberDetailMetaData:IsMouseOver() then
				GRM_AltGroupingScrollBorderFrame:SetPoint ( "BOTTOMLEFT" , GRM_MemberDetailMetaData , "BOTTOMRIGHT" , 1 , 0 )
			elseif CalendarViewEventFrame and CalendarViewEventFrame:IsMouseOver() then
				GRM_AltGroupingScrollBorderFrame:SetPoint ( "BOTTOMLEFT" , CalendarViewEventFrame , "BOTTOMRIGHT" , 22 , 0 )
				GRM_MemberDetailMetaData:Hide()
			elseif CalendarCreateEventFrame and CalendarCreateEventFrame:IsMouseOver() then
				GRM_AltGroupingScrollBorderFrame:SetPoint ( "BOTTOMLEFT" , CalendarCreateEventFrame , "BOTTOMRIGHT" , 22 , 0 )
				GRM_MemberDetailMetaData:Hide()
			end
		end)
	end

	local isLoaded = false
	local isLoaded2 = false

	GRM_MemberDetailMetaData:HookScript("OnShow" , function( self )
		if not isLoaded then
			self:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 25 , 5 )
			GRM_AddAltEditFrame:SetPoint ( "BOTTOMLEFT" , self , "BOTTOMRIGHT" ,  2 , 0 )
			AS:SkinEditBox(GRM_AddAltEditBox, 120, 15)
			AS:SkinEditBox(GRM_PlayerNoteEditBox)
			AS:SkinEditBox(GRM_PlayerOfficerNoteEditBox)
			AS:SkinEditBox(GRM_CustomNoteEditBox)

			AS:SkinFrame(GRM_CustomNoteRankDropDownSelected)
			AS:SkinFrame(GRM_CustomNoteRankDropDownMenu)
			AS:SkinFrame(GRM_PlayerNoteWindow)
			AS:SkinFrame(GRM_PlayerOfficerNoteWindow)
			AS:SkinFrame(GRM_SyncJoinDateSideFrame)
			AS:SkinFrame(GRM_CustomNoteEditBoxFrame)

			GRM_MemberDetailRankToolTip:HookScript ( "OnShow" , function()
				AS:SkinFrame(GRM_MemberDetailRankToolTip)
			end)
			GRM_MemberDetailJoinDateToolTip:HookScript ( "OnShow" , function()
				AS:SkinFrame(GRM_MemberDetailJoinDateToolTip)
			end)
			GRM_MemberDetailServerNameToolTip:HookScript ( "OnShow" , function()
				AS:SkinFrame(GRM_MemberDetailServerNameToolTip)
			end)
			GRM_MemberDetailNotifyStatusChangeTooltip:HookScript ( "OnShow" , function()
				AS:SkinFrame(GRM_MemberDetailNotifyStatusChangeTooltip)
			end)
			GRM_MemberDetailNJDSyncTooltip:HookScript ( "OnShow" , function()
				AS:SkinFrame(GRM_MemberDetailNJDSyncTooltip)
			end)
			GRM_AltGroupingTooltip:HookScript ( "OnShow" , function()
				AS:SkinFrame(GRM_AltGroupingTooltip)
			end)
			
			GRM_PopupWindow:SetPoint ( "TOPLEFT" , StaticPopup1 , "BOTTOMLEFT" , 0 , -1 )
			GRM_MemberDetailEditBoxFrame:SetPoint ( "TOP" , GRM_PopupWindow , "BOTTOM" , 0 , -1 )
			GRM_SyncJoinDateSideFrame:SetPoint ( "TOPLEFT" , GRM_MemberDetailMetaData , "TOPRIGHT" , 1 , 0 )

			GRM_AltGroupingScrollFrameSlider:SetPoint ( "TOPLEFT" , GRM_AltGroupingScrollFrame , "TOPRIGHT" , -19 , -14.5 )
			GRM_AltGroupingScrollBorderFrameCloseButton:SetPoint ( "TOPRIGHT" , GRM_AltGroupingScrollBorderFrame , "TOPRIGHT" , 8 , 7 )
						
			CommunitiesFrame.GuildMemberDetailFrame:HookScript ( "OnShow" , function( self )
				self:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 34 , 0 )
				GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , self , "TOPRIGHT" , 2 , 0.5 )
			end)
			
			CommunitiesFrame.GuildMemberDetailFrame:HookScript ( "OnHide" , function( self )
				GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 25 , 5 )
			end)

			if not isLoaded2 then
				sideGroupingLogic()
			end

			-- Tooltip Scaling should be a bit bigger
			GRM_MemberDetailNJDSyncTooltip:SetScale ( 0.85 )
			GRM_MemberDetailNotifyStatusChangeTooltip:SetScale ( 0.85 )
			isLoaded = true
		end
	end)

	
	
	GRM_RosterCheckBoxSideFrame:HookScript("OnShow" , function()
		if not isLoaded2 then

			-- MISC FRAMES
			GRM_LogTab:SetPoint ( "BOTTOMLEFT" , GRM_RosterChangeLogFrame , "TOPLEFT" , 0 , 1 )
			GRM_RosterCheckBoxSideFrame:SetPoint ( "TOPLEFT" , GRM_RosterChangeLogFrame , "TOPRIGHT" , 2 , 0 )

			--Confirm Frames
			C_Timer.After ( 1 , function()
				AS:SkinFrame(GRM_RosterConfirmFrame)
				AS:SkinFrame(GRM_AddBanReasonEditBoxFrame)
				GRM_GuildNameTooltip:HookScript ( "OnShow" , function()
					AS:SkinFrame(GRM_GuildNameTooltip)
				end)
				GRM_AddonUsersTooltip:HookScript ( "OnShow" , function()
					AS:SkinFrame(GRM_AddonUsersTooltip)
				end)

				AS:SkinCloseButton(GRM_RosterConfirmFrame.CloseButton)

				AS:SkinButton(GRM_RosterConfirmYesButton)
				AS:SkinButton(GRM_RosterConfirmCancelButton)
			end)

			-- Ban Frames
			GRM_LoadLogButton:SetPoint ( "BOTTOMRIGHT" , CommunitiesFrame , "TOPRIGHT" , 1 , 1.25)
			GRM_PopupWindowConfirmFrame:SetSize ( 300 , 100 )
			GRM_PopupWindowConfirmFrame:SetPoint( "TOP" , GRM_AddBanFrame , "BOTTOM" , 0 , -1 )

			-- Log Frame
			GRM_LogExtraOptionsFrame:SetPoint ( "TOPLEFT" , GRM_LogFrame , "BOTTOMLEFT" , 0 , -1 )
			GRM_LogExtraOptionsFrame:SetSize ( 600 , 155 )
			GRM_LogExtraOptionsButton:SetPoint ( "BOTTOMRIGHT" , GRM_RosterChangeLogFrame.GRM_LogFrame , "BOTTOMLEFT" , -1 , 0 )
			
			if not isLoaded then
				sideGroupingLogic()
			end

			GRM_UIOptionsFrame:HookScript ( "OnShow" , function()
				C_Timer.After( 0.25 , function()
					if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame.AllBackupButtons ~= nil then
						for i = 1 , #GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame.AllBackupButtons do
							for j = 12 , #GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame.AllBackupButtons[i] do
								if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame.AllBackupButtons[i][j]:IsVisible() then
									AS:SkinButton ( GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame.AllBackupButtons[i][j] )
								end
							end
						end
					end
				end)
			end)
			isLoaded2 = true
		end
	end)

end

AS:RegisterSkin('Guild_Roster_Manager', AS.GuildRosterManager)
