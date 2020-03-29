 	-- Updated for 8.3 March 11th, 2020 GRM ver 1.87 (Classic Compatible)

local AS = unpack(AddOnSkins)
local GRM = {}

if not AS:CheckAddOn('Guild_Roster_Manager') then return end

function AS:GuildRosterManager()

	-- For Classic Compatibility and one code-base
	local buildVersion = select ( 4 , GetBuildInfo() )

	-- Stylistic choice for GRM
	local AdjustSliderThumbFrameLevel = function ( thumb )
		thumb.Backdrop:SetFrameLevel ( thumb.Backdrop:GetFrameLevel() - 2 )
	end

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
	AdjustSliderThumbFrameLevel ( GRM_RosterChangeLogScrollFrameSliderThumbTexture )
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
	AS:SkinFrame(GRM_DefaultCustomSelected)
	AS:SkinFrame(GRM_DefaultCustomRankDropDownMenu)
	AS:SkinFrame(GRM_FontSelected)
	AS:SkinFrame(GRM_FontDropDownMenu)
	AS:SkinFrame(GRM_TimestampSelected)
	AS:SkinFrame(GRM_TimestampSelectedDropDownMenu)
	AS:SkinFrame(GRM_24HrSelected)
	AS:SkinFrame(GRM_24HrSelectedDropDownMenu)
	AS:SkinButton(GRM_ScanOptionsButton)
	AS:SkinButton(GRM_SyncOptionsButton)
	AS:SkinButton(GRM_CenterOptionsButton)
	AS:SkinButton(GRM_ResetDefaultOptionsButton)
	AS:SkinButton(GRM_HelpOptionsButton)
	AS:SkinButton(GRM_ClearAllOptionsButton)
	AS:SkinButton(GRM_ClearGuildOptionsButton)
	AS:SkinButton(GRM_VersionOptionsButton)
	AS:SkinButton(GRM_CustomRankResetButton)
	AS:SkinButton(GRM_HardResetButton)
	AS:SkinButton(GRM_ExportGlobalControlButton)
	AS:SkinButton(GRM_OpenMacroToolButton)
	AS:SkinButton(GRM_OpenMouseoverButton)
	AS:SkinButton(GRM_OpenExportToolButton)
	AS:SkinButton(GRM_OpenAuditJoinDateToolButton)
	AS:SkinButton(GRM_RosterResetOptionsButton)

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
	AdjustSliderThumbFrameLevel ( GRM_AddEventScrollFrameSliderThumbTexture )
	AS:SkinButton(GRM_EventsFrameSetAnnounceButton)
	AS:SkinButton(GRM_EventsFrameIgnoreButton)

	--Ban List
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
	AdjustSliderThumbFrameLevel ( GRM_CoreBanListScrollFrameSliderThumbTexture )

	--Ban Frame
	AS:SkinFrame(GRM_AddBanFrame)
	AS:SkinCloseButton(GRM_AddBanFrame.CloseButton)
	AS:SkinButton(GRM_AddBanConfirmButton)
	AS:SkinEditBox(GRM_AddBanNameSelectionEditBox)
	AS:SkinEditBox(GRM_AddBanReasonEditBox)

	-- Classic compatibility, one code-base
	if buildVersion < 80000 then
		GRM_BanServerDropDownMenuInsetBottomBorder:Hide()
		GRM_BanServerDropDownMenuInsetTopBorder:Hide()
		GRM_BanServerDropDownMenuInsetLeftBorder:Hide()
		GRM_BanServerDropDownMenuInsetRightBorder:Hide()
		GRM_BanServerDropDownMenuInsetTopLeftCorner:Hide()
		GRM_BanServerDropDownMenuInsetTopRightCorner:Hide()
		GRM_BanServerDropDownMenuInsetBotRightCorner:Hide()
		GRM_BanServerDropDownMenuInsetBotLeftCorner:Hide()

		GRM_AddBanDropDownMenuInsetBottomBorder:Hide()
		GRM_AddBanDropDownMenuInsetTopBorder:Hide()
		GRM_AddBanDropDownMenuInsetLeftBorder:Hide()
		GRM_AddBanDropDownMenuInsetRightBorder:Hide()
		GRM_AddBanDropDownMenuInsetTopLeftCorner:Hide()
		GRM_AddBanDropDownMenuInsetTopRightCorner:Hide()
		GRM_AddBanDropDownMenuInsetBotRightCorner:Hide()
		GRM_AddBanDropDownMenuInsetBotLeftCorner:Hide()
	else
		GRM_BanServerDropDownMenu.NineSlice:Hide()
		GRM_AddBanDropDownMenu.NineSlice:Hide()
	end

	AS:SkinScrollBar(GRM_AddBanScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_AddBanScrollFrameSliderThumbTexture )

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
	AdjustSliderThumbFrameLevel ( GRM_AddonUsersScrollFrameSliderThumbTexture )
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
	AS:SkinFrame(GRM_AuditWindowDropDownFrame)
	AS:SkinButton(GRM_SetJoinUnkownButton)
	AS:SkinButton(GRM_SetPromoUnkownButton)
	AS:SkinButton(GRM_SetBdayUnkownButton)
	AS:SkinButton(GRM_JDAuditToolButton)
	AS:SkinScrollBar(GRM_AuditScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_AuditScrollFrameSliderThumbTexture )
	GRM_AuditScrollBorderFrameBottomBorder:Hide()
	GRM_AuditScrollBorderFrameTopBorder:Hide()
	GRM_AuditScrollBorderFrameLeftBorder:Hide()
	GRM_AuditScrollBorderFrameRightBorder:Hide()
	GRM_AuditScrollBorderFrameTopLeftCorner:Hide()
	GRM_AuditScrollBorderFrameTopRightCorner:Hide()
	GRM_AuditScrollBorderFrameBottomRightCorner:Hide()
	GRM_AuditScrollBorderFrameBottomLeftCorner:Hide()

	-- AuditToolButton
	AS:SkinFrame(GRM_AuditJDTool)
	AS:SkinCloseButton(GRM_AuditJDTool.CloseButton)
	AS:SkinScrollBar(GRM_JDToolScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_JDToolScrollFrameSliderThumbTexture )
	AS:SkinButton(GRM_AuditJDToolButton1)
	AS:SkinButton(GRM_AuditJDToolButton2)
	AS:SkinButton(GRM_AuditJDToolButton3)
	AS:SkinButton(GRM_AuditJDToolButton4)
	AS:SkinButton(GRM_AuditJDToolButton5)
	AS:SkinButton(GRM_AuditJDToolButton6)
	AS:SkinButton(GRM_AuditJDToolButton7)
	GRM_JDToolScrollBorderFrameBottomBorder:Hide()
	GRM_JDToolScrollBorderFrameTopBorder:Hide()
	GRM_JDToolScrollBorderFrameLeftBorder:Hide()
	GRM_JDToolScrollBorderFrameRightBorder:Hide()
	GRM_JDToolScrollBorderFrameTopLeftCorner:Hide()
	GRM_JDToolScrollBorderFrameTopRightCorner:Hide()
	GRM_JDToolScrollBorderFrameBottomRightCorner:Hide()
	GRM_JDToolScrollBorderFrameBottomLeftCorner:Hide()

	-- Backup Frame
	AS:SkinFrame(GRM_UIOptionsFrame)
	AS:SkinScrollBar(GRM_CoreBackupScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_CoreBackupScrollFrameSliderThumbTexture )
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
	AS:SkinButton(GRM_LoadLogOldRosterButton)
	AS:SkinButton(GRM_LoadToolButton)
	AS:SkinButton(GRM_LoadToolOldRosterButton)
	--Guild Detail Frame
	AS:SkinFrame(GRM_MemberDetailMetaData)
	AS:SkinCloseButton(GRM_MemberDetailMetaDataCloseButton)
	AS:SkinButton(GRM_MemberDetailJoinDateButton)
	AS:SkinButton(GRM_SetPromoDateButton)
	AS:SkinButton(GRM_DateSubmitButton)
	AS:SkinButton(GRM_DateSubmitCancelButton)
	AS:SkinButton(GRM_AddAltButton2)
	AS:SkinButton(GRM_GroupInviteButton)
	AS:SkinButton(GRM_SetUnknownButton)
	AS:SkinButton(GRM_MemberDetailBannedIgnoreButton)
	AS:SkinButton(GRM_CancelCustomNoteButton)
	AS:SkinButton(GRM_ConfirmCustomNoteButton)
	AS:SkinButton(GRM_MemberDetailBirthdayButton)
	AS:SkinFrame(GRM_AddAltEditFrame)
	AS:SkinFrame(GRM_MonthDropDownMenuSelected)
	AS:SkinFrame(GRM_MonthDropDownMenu)
	AS:SkinFrame(GRM_DayDropDownMenuSelected)
	AS:SkinFrame(GRM_DayDropDownMenu)
	AS:SkinFrame(GRM_YearDropDownMenuSelected)
	AS:SkinFrame(GRM_YearDropDownMenu)
	AS:SkinScrollBar(GRM_CoreAltScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_CoreAltScrollFrameSliderThumbTexture )
	AS:SkinScrollBar(GRM_AltGroupingScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_AltGroupingScrollFrameSliderThumbTexture )

	-- Alt grouping frame
	AS:SkinFrame(GRM_AltGroupingScrollBorderFrame)
	AS:SkinCloseButton(GRM_AltGroupingScrollBorderFrameCloseButton)

	-- Ban Popup Frames
	AS:SkinFrame(GRM_PopupWindow)
	AS:SkinFrame(GRM_MemberDetailEditBoxFrame)

	-- Generic custom popup window
	AS:SkinFrame(GRM_GeneralPopupWindow)
	AS:SkinFrame(GRM_ToolIgnoreListFrame)
	AS:SkinButton(GRM_GeneralPopupWindowYesButton)
	AS:SkinButton(GRM_GeneralPopupWindowNoButton)

	-- Macro Tool
	AS:SkinFrame(GRM_ToolCoreFrame)
	AS:SkinCloseButton(GRM_ToolCoreFrameCloseButton)
	AS:SkinCloseButton(GRM_ToolIgnoreListFrameCloseButton)
	AS:SkinButton(GRM_ToolBuildMacroButton)
	AS:SkinButton(GRM_ToolViewSafeListButton)
	AS:SkinButton(GRM_ToolClearSelectedMacrodNamesButton)
	AS:SkinButton(GRM_ToolResetSelectedMacroNamesButton)
	AS:SkinButton(GRM_ToolIgnoreClearSelectionButton)
	AS:SkinButton(GRM_ToolIgnoreResetSelectedNamesButton)
	AS:SkinButton(GRM_ToiolIgnoreRemoveAllButton)
	AS:SkinEditBox(GRM_RosterKickRecommendEditBox)
	AS:SkinFrame(GRM_ToolMacrodScrollBorderFrame)
	AS:SkinFrame(GRM_ToolQueuedScrollBorderFrame)
	AS:SkinFrame(GRM_ToolIgnoredScrollBorderFrame)
	AS:SkinFrame(GRM_ToolRulesScrollBorderFrame)
	AS:SkinButton(GRM_ToolResetSettingsButton)
	AS:SkinButton(GRM_CustomRuleAddButton)
	AS:SkinFrame(GRM_ToolCustomRulesFrame)
	AS:SkinFrame(GRM_TimeScaleSelected)
	AS:SkinFrame(GRM_TimeScaleDropDownMenu)
	AS:SkinButton(GRM_ToolCustomRulesConfirmButton)
	AS:SkinButton(GRM_ToolCustomRulesCancelButton)
	AS:SkinEditBox(GRM_CustomRuleNameEditBox)
	AS:SkinEditBox(GRM_CustomRuleLevelStartEditBox)
	AS:SkinEditBox(GRM_CustomRuleLevelStopEditBox)
	AS:SkinEditBox(GRM_NoteSearchEditBox)

	AS:SkinScrollBar(GRM_ToolMacrodScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolMacrodScrollFrameSilderThumbTexture )
	AS:SkinScrollBar(GRM_ToolQueuedScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolQueuedScrollFrameSilderThumbTexture )
	AS:SkinScrollBar(GRM_ToolIgnoredScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolIgnoredScrollFrameSilderThumbTexture )

	-- Export Tool
	AS:SkinButton(GRM_ShowExportWindowButton)
	AS:SkinButton(GRM_ExportSelectedRangeButton)
	AS:SkinButton(GRM_ExportNextRangeButton)
	AS:SkinButton(GRM_ExportPreviousRangeButton)
	AS:SkinButton(GRM_ExportMemberDetailsHeadersButton)
	AS:SkinFrame(GRM_ExportLogScrollBorderFrame)
	AS:SkinEditBox(GRM_ExportRangeEditBox1)
	AS:SkinEditBox(GRM_ExportRangeEditBox2)
	AS:SkinFrame(GRM_DelimiterDropdownMenu)
	AS:SkinFrame(GRM_DelimiterDropdownMenuSelected)
	AS:SkinScrollBar(GRM_ExportLogScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_ExportLogScrollFrameSliderThumbTexture )

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

	GRM_NoteBordersButton:HookScript ( "OnClick" , function ( self , button )
		if button == "LeftButton" then
			if self:GetChecked() then
				AS:SkinFrame(GRM_PlayerOfficerNoteWindow)
				AS:SkinFrame(GRM_PlayerNoteWindow)
				AS:SkinFrame(GRM_CustomNoteEditBoxFrame)
			end
		end
	end)

	local isLoaded = false
	local isLoaded2 = false
	local isLoaded3 = false
	local isLoaded4 = false

	GRM_MemberDetailMetaData:HookScript("OnShow" , function( self )
		if not isLoaded then
			GRM_AddAltEditFrame:SetPoint ( "BOTTOMLEFT" , self , "BOTTOMRIGHT" ,  2 , 0 )
			AS:SkinEditBox(GRM_AddAltEditBox, 120, 15)
			AS:SkinEditBox(GRM_PlayerNoteEditBox)
			AS:SkinEditBox(GRM_PlayerOfficerNoteEditBox)
			-- AS:SkinEditBox(GRM_CustomNoteEditBox)			-- Not skinning for now - seems odd looking
			AS:SkinFrame(GRM_CustomNoteRankDropDownSelected)

			if buildVersion < 80000 then
				self:SetPoint ( "TOPLEFT" , GuildFrame , "TOPRIGHT" , -2 , 5 )
				GRM_CustomNoteRankDropDownSelectedInsetBottomBorder:Hide()
				GRM_CustomNoteRankDropDownSelectedInsetTopBorder:Hide()
				GRM_CustomNoteRankDropDownSelectedInsetLeftBorder:Hide()
				GRM_CustomNoteRankDropDownSelectedInsetRightBorder:Hide()
				GRM_CustomNoteRankDropDownSelectedInsetTopLeftCorner:Hide()
				GRM_CustomNoteRankDropDownSelectedInsetTopRightCorner:Hide()
				GRM_CustomNoteRankDropDownSelectedInsetBotRightCorner:Hide()
				GRM_CustomNoteRankDropDownSelectedInsetBotLeftCorner:Hide()

				GRM_CustomNoteRankDropDownMenuInsetBottomBorder:Hide()
				GRM_CustomNoteRankDropDownMenuInsetTopBorder:Hide()
				GRM_CustomNoteRankDropDownMenuInsetLeftBorder:Hide()
				GRM_CustomNoteRankDropDownMenuInsetRightBorder:Hide()
				GRM_CustomNoteRankDropDownMenuInsetTopLeftCorner:Hide()
				GRM_CustomNoteRankDropDownMenuInsetTopRightCorner:Hide()
				GRM_CustomNoteRankDropDownMenuInsetBotRightCorner:Hide()
				GRM_CustomNoteRankDropDownMenuInsetBotLeftCorner:Hide()

			else
				if CommunitiesFrame:IsVisible() then
					self:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 25 , 5 )
				elseif GRM_UI.GuildRosterFrame:IsVisible() then
					self:SetPoint ( "TOPLEFT" , GRM_UI.GuildRosterFrame , "TOPRIGHT" , 25 , 5 )
				end

				GRM_CustomNoteRankDropDownSelected.NineSlice:Hide()
				GRM_CustomNoteRankDropDownMenu.NineSlice:Hide()

				CommunitiesFrame.GuildMemberDetailFrame:HookScript ( "OnShow" , function( self )
					self:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 34 , 0 )
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , self , "TOPRIGHT" , 2 , 0.5 )
				end)

				CommunitiesFrame.GuildMemberDetailFrame:HookScript ( "OnHide" , function( self )
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 25 , 5 )
				end)
			end

			AS:SkinFrame(GRM_CustomNoteRankDropDownMenu)
			AS:SkinFrame(GRM_PlayerNoteWindow)
			AS:SkinFrame(GRM_PlayerOfficerNoteWindow)
			AS:SkinFrame(GRM_SyncJoinDateSideFrame)
			AS:SkinFrame(GRM_CustomNoteEditBoxFrame)
			AS:SkinFrame(GRM_altDropDownOptions)
			AS:SkinFrame(GRM_DropDownList1AttachmentFrame)

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
			GRM_AltGroupingScrollBorderFrameTitle:SetPoint ( "Bottom" , GRM_AltGroupingScrollBorderFrame , "TOP" , 0 , 2 )
			GRM_WindowIsLockedText:SetPoint ( "BOTTOMRIGHT" , GRM_MemberDetailMetaData , "TOPRIGHT" , -5 , 0 )

			if not isLoaded2 then
				sideGroupingLogic()
			end

			GRM_CoreAltScrollFrameSlider:SetPoint( "TOPLEFT" , GRM_CoreAltScrollFrame , "TOPRIGHT" , -2 , -10 )

			-- Tooltip Scaling should be a bit bigger
			GRM_MemberDetailNJDSyncTooltip:SetScale ( 0.85 )
			GRM_MemberDetailNotifyStatusChangeTooltip:SetScale ( 0.85 )
			isLoaded = true
		end
	end)

	GRM_RosterCheckBoxSideFrame:HookScript("OnShow" , function()
		if not isLoaded2 then
			-- MISC FRAMES
			GRM_LogTab:SetPoint ( "BOTTOMLEFT" , GRM_RosterChangeLogFrame , "TOPLEFT" , 0 , 0 )
			GRM_RosterCheckBoxSideFrame:SetPoint ( "TOPLEFT" , GRM_RosterChangeLogFrame , "TOPRIGHT" , 2 , 0 )
			GRM_AddBanNameSelectionEditBox:SetSize ( 129 , 20 )
			GRM_BanServerSelected:SetPoint ( "TOPLEFT" , GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox , "BOTTOMLEFT" , 0 , -2 )
			AS:SkinFrame ( GRM_BanServerSelected )
			AS:SkinFrame ( GRM_AddBanDropDownClassSelected )

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
							for j = 7 , 8 do
								AS:SkinButton ( GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame.AllBackupButtons[i][j] )
							end
						end
					end
				end)
			end)

			GRM_ExportLogBorderFrame:HookScript ( "OnShow" , function()
				if not isLoaded4 then
					isLoaded4 = true
					GRM_ExportLogScrollFrameSlider:SetPoint ( "TOPLEFT" , GRM_ExportLogScrollBorderFrame , "TOPRIGHT" , 0 , -17 )
				end
			end)

			GRM_LogEditBox:SetBackdrop ( nil )
			AS:SkinEditBox(GRM_LogEditBox)
			isLoaded2 = true
		end
	end)

	-- Guild Recruitment Frames

	if buildVersion >= 80000 then
		GRM.WaitForLoad = function()
			if not CommunitiesGuildRecruitmentFrame then
				C_Timer.After ( 3 , function()
					GRM.WaitForLoad()
				end)
			else
				CommunitiesGuildRecruitmentFrame:HookScript ( "OnShow" , function()
					if not isLoaded3 then
						C_Timer.After( 0.25 , function()
							AS:SkinButton(CommunitiesGuildRecruitmentFrame.GRM_MoveBackwardButton)
							AS:SkinButton(CommunitiesGuildRecruitmentFrame.GRM_MoveForwardButton)
							AS:SkinButton(GRM_ClearAllRecruitsButton)
							AS:SkinButton(GRM_InviteAllRecruitsButton)
							GRM_InviteMessageFrameBottomBorder:Hide()
							GRM_InviteMessageFrameTopBorder:Hide()
							GRM_InviteMessageFrameLeftBorder:Hide()
							GRM_InviteMessageFrameRightBorder:Hide()
							GRM_InviteMessageFrameTopLeftCorner:Hide()
							GRM_InviteMessageFrameTopRightCorner:Hide()
							GRM_InviteMessageFrameBottomRightCorner:Hide()
							GRM_InviteMessageFrameBottomLeftCorner:Hide()
							isLoaded3 = true
						end)
					end
				end)
			end
		end

		GRM.WaitForLoad()
	end

end

AS:RegisterSkin('Guild_Roster_Manager', AS.GuildRosterManager)
