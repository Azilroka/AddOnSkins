 	-- Updated for 9.0 October 21st, 2020 GRM ver 1.913 (Classic Compatible)

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

	--------------------
	-- Tabs
	--------------------
	AS:SkinButton(GRM_LogTab)
	AS:SkinButton(GRM_AddEventTab)
	AS:SkinButton(GRM_BanListTab)
	AS:SkinButton(GRM_AddonUsersTab)
	AS:SkinButton(GRM_OptionsTab)
	AS:SkinButton(GRM_GuildAuditTab)

	--------------------
	-- Event Log
	--------------------
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

	-- Event Log: Options Frame
	AS:SkinFrame(GRM_LogExtraOptionsFrame)
	AS:SkinFrame(GRM_ExportLogBorderFrame)
	AS:SkinCloseButton(GRM_BorderFrameCloseButton)
	AS:SkinButton(GRM_LogExtraOptionsButton)
	AS:SkinButton(GRM_LogExportButton)
	AS:SkinButton(GRM_RosterClearLogButton)
	AS:SkinButton(GRM_ConfirmClearButton)

	AS:SkinCheckBox(GRM_LogShowLinesCheckButton)
	AS:SkinCheckBox(GRM_LogShowTooltipCheckButton)
	AS:SkinCheckBox(GRM_SearchAutoFocusCheckButton)
	AS:SkinCheckBox(GRM_LogEnableRmvClickCheckButton)
	AS:SkinEditBox(GRM_LogExtraEditBox1)
	AS:SkinEditBox(GRM_LogExtraEditBox2)
	AS:SkinSlideBar(GRM_FontSizeSlider)

	-- Event Log: Side Frame
	AS:SkinFrame(GRM_RosterCheckBoxSideFrame)
	AS:SkinCheckBox(GRM_RosterJoinedCheckButton)
	AS:SkinCheckBox(GRM_RosterJoinedChatCheckButton)
	AS:SkinCheckBox(GRM_RosterLeveledChangeCheckButton)
	AS:SkinCheckBox(GRM_RosterLeveledChatCheckButton)
	AS:SkinCheckBox(GRM_RosterInactiveReturnCheckButton)
	AS:SkinCheckBox(GRM_RosterInactiveReturnChatCheckButton)
	AS:SkinCheckBox(GRM_RosterPromotionChangeCheckButton)
	AS:SkinCheckBox(GRM_RosterPromotionChatCheckButton)
	AS:SkinCheckBox(GRM_RosterDemotionChangeCheckButton)
	AS:SkinCheckBox(GRM_RosterDemotionChatCheckButton)
	AS:SkinCheckBox(GRM_RosterNoteChangeCheckButton)
	AS:SkinCheckBox(GRM_RosterNoteChatCheckButton)
	AS:SkinCheckBox(GRM_RosterOfficerNoteChangeCheckButton)
	AS:SkinCheckBox(GRM_RosterOfficerNoteChatCheckButton)
	AS:SkinCheckBox(GRM_RosterCustomNoteChangeCheckButton)
	AS:SkinCheckBox(GRM_RosterCustomNoteChatCheckButton)
	AS:SkinCheckBox(GRM_RosterNameChangeCheckButton)
	AS:SkinCheckBox(GRM_RosterNameChangeChatCheckButton)
	AS:SkinCheckBox(GRM_RosterRankRenameCheckButton)
	AS:SkinCheckBox(GRM_RosterRankRenameChatCheckButton)
	AS:SkinCheckBox(GRM_RosterEventCheckButton)
	AS:SkinCheckBox(GRM_RosterEventChatCheckButton)
	AS:SkinCheckBox(GRM_RosterLeftGuildCheckButton)
	AS:SkinCheckBox(GRM_RosterLeftGuildChatCheckButton)
	AS:SkinCheckBox(GRM_RosterRecommendationsButton)
	AS:SkinCheckBox(GRM_RosterRecommendationsChatButton)
	AS:SkinCheckBox(GRM_RosterBannedPlayersButton)
	AS:SkinCheckBox(GRM_RosterBannedPlayersButtonChatButton)
	AS:SkinCheckBox(GRM_RosterCheckAllLogButton)
	AS:SkinCheckBox(GRM_RosterCheckAllChatButton)

	--------------------
	--Options
	--------------------
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

	-- Options: Tabs
	AS:SkinButton(GRM_GeneralTab)
	AS:SkinButton(GRM_ScanTab)
	AS:SkinButton(GRM_SyncTab)
	AS:SkinButton(GRM_OfficerTab)
	AS:SkinButton(GRM_UITab)
	AS:SkinButton(GRM_HelpTab)
	AS:SkinButton(GRM_ModulesTab)
	AS:SkinButton(GRM_UXTab)

	-- General Tab
	AS:SkinCheckBox(GRM_RosterLoadOnLogonCheckButton)
	AS:SkinCheckBox(GRM_RosterLoadOnLogonChangesCheckButton)
	AS:SkinCheckBox(GRM_ColorizeSystemMessagesCheckButton)
	AS:SkinCheckBox(GRM_RosterShowMainTagCheckButton)
	AS:SkinCheckBox(GRM_ShowMainTagOnMains)
	AS:SkinCheckBox(GRM_ShowMinimapButton)
	AS:SkinCheckBox(GRM_SyncAllSettingsCheckButton)
	AS:SkinCheckBox(GRM_DefaultTabSelectionButton)

	AS:SkinEditBox(GRM_ReportDestinationEditBox)
	AS:SkinSlideBar(GRM_FontSizeSlider)
	AS:SkinSlideBar(GRM_TooltipScaleSlider)
	AS:SkinFrame(GRM_DefaultTabSelected)
	AS:SkinFrame(GRM_ColorSelectOptionsFrame)

	-- Scan Tab
	AS:SkinCheckBox(GRM_RosterTimeIntervalCheckButton)
	AS:SkinCheckBox(GRM_RosterReportInactiveReturnButton)
	AS:SkinCheckBox(GRM_ReportInactivesOnlyIfAllButton)
	AS:SkinCheckBox(GRM_RosterReportUpcomingEventsCheckButton)
	AS:SkinCheckBox(GRM_RosterMainOnlyCheckButton)
	AS:SkinCheckBox(GRM_ShowNotesOnLeavingPlayerButton)
	AS:SkinCheckBox(GRM_LevelRecordButton)
	AS:SkinCheckBox(GRM_LevelFilter1Button)
	AS:SkinCheckBox(GRM_LevelFilter2Button)
	AS:SkinCheckBox(GRM_LevelFilter3Button)
	AS:SkinCheckBox(GRM_LevelFilter4Button)
	AS:SkinCheckBox(GRM_LevelFilter5Button)
	AS:SkinCheckBox(GRM_LevelFilter6Button)
	AS:SkinEditBox(GRM_RosterTimeIntervalEditBox)
	AS:SkinEditBox(GRM_ReportInactiveReturnEditBox)
	AS:SkinEditBox(GRM_RosterReportUpcomingEventsEditBox)
	AS:SkinEditBox(GRM_RosterMinLvlEditBox)

	-- Sync Tab
	AS:SkinCheckBox(GRM_SyncOnlyCurrentVersionCheckButton)
	AS:SkinCheckBox(GRM_SyncCompatibilityMessageButton)
	AS:SkinCheckBox(GRM_RosterSyncCheckButton)
	AS:SkinCheckBox(GRM_AutoTriggerSyncCheckButton)
	AS:SkinCheckBox(GRM_SyncAllRestrictReceiveButton)
	AS:SkinCheckBox(GRM_RosterSyncBanList)
	AS:SkinCheckBox(GRM_CustomNoteSyncCheckBox)
	AS:SkinCheckBox(GRM_BDaySyncCheckBox)
	AS:SkinCheckBox(GRM_RosterNotifyOnChangesCheckButton)
	AS:SkinSlideBar(GRM_SyncSpeedSlider)
	AS:SkinEditBox(GRM_AutoTriggerTimeEditBox)

	-- Officer Tab
	AS:SkinCheckBox(GRM_RosterAddTimestampCheckButton)
	AS:SkinCheckBox(GRM_AddJoinedTagButton)
	AS:SkinCheckBox(GRM_NoteTagFeatureCheckButton)
	AS:SkinCheckBox(GRM_RosterReportAddEventsToCalendarButton)
	AS:SkinRadioButton(GRM_RosterAddTimestampRadioButton1)
	AS:SkinRadioButton(GRM_RosterAddTimestampRadioButton2)
	AS:SkinRadioButton(GRM_RosterAddTimestampRadioButton3)
	AS:SkinEditBox(GRM_CustomTagJoinEditBox)
	AS:SkinEditBox(GRM_CustomTagREJoinEditBox)

	-- Backup Tab
	AS:SkinCheckBox(GRM_AutoBackupCheckBox)
	AS:SkinEditBox(GRM_AutoBackupTimeEditBox)
	AS:SkinButton(GRM_HordeTab)
	AS:SkinButton(GRM_AllianceTab)

	-- UX (UI) Tab
	AS:SkinCheckBox(GRM_FadeCheckButton)
	AS:SkinCheckBox(GRM_NoteBordersButton)
	AS:SkinCheckBox(GRM_ReputationToggleButton)
	AS:SkinCheckBox(GRM_BirthdayToggleButton)
	AS:SkinCheckBox(GRM_ColorizePlayerNamesButton)
	AS:SkinSlideBar(GRM_CoreWindowScaleSlider)
	AS:SkinSlideBar(GRM_MouseOverScaleSlider)
	AS:SkinSlideBar(GRM_MacroToolScaleSlider)
	AS:SkinSlideBar(GRM_ExportToolScaleSlider)
	AS:SkinSlideBar(GRM_AdvancedAuditToolScaleSlider)

	------------------------------
	-- Add Event to Calendar Frame
	------------------------------
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

	--------------------
	--Ban List
	--------------------
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

	-- Ban Frame: Confirm Window
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

	--------------------
	-- Addon Users
	--------------------
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

	--------------------
	-- Audit Frame
	--------------------
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
	AS:SkinCheckBox(GRM_AuditFrameShowAllCheckbox)
	AS:SkinCheckBox(GRM_AuditFrameIncludeUnknownCheckBox)
	AS:SkinCheckBox(GRM_AuditBirthdayToggleButton)
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

	------------------
	-- Backup Frame
	--------------------
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

	--------------------
	-- Guild Frame
	--------------------
	AS:SkinButton(GRM_LoadLogButton)
	AS:SkinButton(GRM_LoadLogOldRosterButton)
	AS:SkinButton(GRM_LoadToolButton)
	AS:SkinButton(GRM_LoadToolOldRosterButton)

	----------------------------------------
	-- Guild Detail Frame (GRM Tooltip)
	----------------------------------------
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
	AS:SkinCheckBox(GRM_CustomNoteSyncMetaCheckBox)
	AS:SkinScrollBar(GRM_AddAltScrollFrameSlider)
	AS:SkinCloseButton(GRM_AddAltEditBoxCloseButton)
	AS:SkinButton(GRM_SafeFromRulesButton)

	-- Alt Grouping Frame
	AS:SkinFrame(GRM_AltGroupingScrollBorderFrame)
	AS:SkinCloseButton(GRM_AltGroupingScrollBorderFrameCloseButton)

	------------------------------
	-- Generic Custom Popup Window
	------------------------------
	AS:SkinFrame(GRM_GeneralPopupWindow)
	AS:SkinFrame(GRM_ToolIgnoreListFrame)
	AS:SkinButton(GRM_GeneralPopupWindowYesButton)
	AS:SkinButton(GRM_GeneralPopupWindowNoButton)

	--------------------
	-- Macro Tool
	--------------------
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
	AS:SkinCheckBox(GRM_ToolCoreIgnoreCheckButton)
	AS:SkinCheckBox(GRM_MacroToolDisableLogSpamCheckbutton)

	AS:SkinScrollBar(GRM_ToolMacrodScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolMacrodScrollFrameSilderThumbTexture )
	AS:SkinScrollBar(GRM_ToolQueuedScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolQueuedScrollFrameSilderThumbTexture )
	AS:SkinScrollBar(GRM_ToolIgnoredScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolIgnoredScrollFrameSilderThumbTexture )

	AS:SkinButton(GRM_KickTab)
	AS:SkinButton(GRM_PromoTab)
	AS:SkinButton(GRM_DemoteTab)

	--------------------
	-- Export Tool
	--------------------
	AS:SkinButton(GRM_ShowExportWindowButton)
	AS:SkinButton(GRM_ExportSelectedRangeButton)
	AS:SkinButton(GRM_ExportNextRangeButton)
	AS:SkinButton(GRM_ExportPreviousRangeButton)
	AS:SkinButton(GRM_ExportMemberDetailsHeadersButton)
	AS:SkinButton(GRM_ExportResetOptionsButton)
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

	-- Since much of the addon only loads on demand, this AddOnSkins file needs to wait til certain things have been configured first...
	local isLoaded , isLoaded2 , isLoaded3 , isLoaded4 , isLoaded5 , isLoaded6 = false , false , false , false , false , false


	GRM_MemberDetailMetaData:HookScript("OnShow" , function( self )
		if not isLoaded then
			GRM_AddAltEditFrame:SetPoint ( "BOTTOMLEFT" , self , "BOTTOMRIGHT" ,  2 , 0 )
			AS:SkinEditBox(GRM_AddAltEditBox, 120, 15)
			AS:SkinEditBox(GRM_PlayerNoteEditBox)
			AS:SkinEditBox(GRM_PlayerOfficerNoteEditBox)
			-- AS:SkinEditBox(GRM_CustomNoteEditBox)			-- Not skinning for now - seems odd looking

			if buildVersion < 80000 then
				if GRM_UI.GuildRosterFrame:IsVisible() then
					self:ClearAllPoints()
					self:SetPoint ( "TOPLEFT" , GRM_UI.GuildRosterFrame , "TOPRIGHT" , 0 , 5 )
				end

				if GuildMemberDetailFrame:IsVisible() then
					self:ClearAllPoints()
					self:SetPoint ( "TOPLEFT" , GuildMemberDetailFrame , "TOPRIGHT" , 2 , 0.5 )
				end

				GuildMemberDetailFrame:HookScript ( "OnShow" , function( self )
					GuildMemberDetailFrame:ClearAllPoints()
					GuildMemberDetailFrame:SetPoint ( "TOPLEFT" , GuildFrame , "TOPRIGHT" , 1 , -1 )
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , self , "TOPRIGHT" , 2 , 0.5 )
				end)

				GuildMemberDetailFrame:HookScript ( "OnHide" , function()
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , GuildFrame , "TOPRIGHT" , 0 , 5 )
				end)

			else
				if CommunitiesFrame:IsVisible() then
					self:ClearAllPoints();
					self:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 25 , 5 )
				elseif GRM_UI.GuildRosterFrame:IsVisible() then
					self:ClearAllPoints();
					self:SetPoint ( "TOPLEFT" , GRM_UI.GuildRosterFrame , "TOPRIGHT" , 25 , 5 )
				end

				if GuildFrame:IsVisible() and not GRM_G.CurrentPinCommunity then
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , GRM_UI.GuildRosterFrame , "TOPRIGHT" , 1 , 5 );
				end

				if GuildMemberDetailFrame:IsVisible() and not GRM_G.CurrentPinCommunity then
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , GuildMemberDetailFrame , "TOPRIGHT" , 2 , 0.5 );
				end

				CommunitiesFrame.GuildMemberDetailFrame:HookScript ( "OnShow" , function( self )
					self:ClearAllPoints();
					self:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 34 , 0 )
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , self , "TOPRIGHT" , 2 , 0.5 )
				end)

				CommunitiesFrame.GuildMemberDetailFrame:HookScript ( "OnHide" , function( self )
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 25 , 5 )
				end)

				GRM_UI.MemberDetailFrameClassic:SetScript ( "OnShow" , function( self )
					GRM_UI.MemberDetailFrameClassic:ClearAllPoints()
					GRM_UI.MemberDetailFrameClassic:SetPoint ( "TOPLEFT" , GRM_UI.GuildRosterFrame , "TOPRIGHT" , 2 , -1 );
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , self , "TOPRIGHT" , 2 , 0.5 );
				end);
			
				GRM_UI.MemberDetailFrameClassic:SetScript ( "OnHide" , function()
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , GuildFrame , "TOPRIGHT" , 1 , 5 );
				end);

			end

			AS:SkinFrame(GRM_PlayerNoteWindow)
			AS:SkinFrame(GRM_PlayerOfficerNoteWindow)
			AS:SkinFrame(GRM_SyncJoinDateSideFrame)
			AS:SkinFrame(GRM_CustomNoteEditBoxFrame)
			AS:SkinFrame(GRM_altDropDownOptions)
			AS:SkinFrame(GRM_DropDownList1AttachmentFrame)
			-- Ban Popup Frames
			AS:SkinFrame(GRM_PopupWindow)
			AS:SkinFrame(GRM_MemberDetailEditBoxFrame)

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

			-- FONT ISSUES
			GRM_MemberDetailLastOnlineTitleTxt:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 9 , "NONE" );
			GRM_MemberDetailMetaZoneInfoText:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 9 , "NONE" );
			GRM_MemberDetailDateJoinedTitleTxt:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 9 , "NONE" );
			GRM_MemberDetailBirthdayTitleText:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 9 , "NONE" );
			GRM_altFrameTitleText:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 8 , "NONE" );
			GRM_AddAltTitleText:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 11 , "NONE" );

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
			GRM_LogExtraOptionsButton:SetPoint ( "TOP" , GRM_RosterCheckBoxSideFrame , "BOTTOM" , 0 , -1 );
			GRM_EventsFrameStatusMessageText2:SetPoint ( "TOP" , GRM_EventsFrame , 0 , 55 );

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

			GRM_LogExtraOptionsFrame:HookScript ( "OnShow" , function()
				if not isLoaded5 then
					isLoaded5 = true;
					for i = 1 , 14 do
						-- no need to skin here, just remove edge...
						GRM_LogExtraOptionsFrame["colorBoxFrame" .. i]:SetBackdrop ( {
							bgFile = nil,
							edgeFile = nil,
							tile = true,
							tileSize = 32,
							edgeSize = 9,
							insets = { left = -2 , right = -2 , top = -3 , bottom = -2 }
						} );				
					end
				end
			end);

			-- Skinning the EditBoxes in options now the overlay
			AS:SkinFrame(GRM_RosterTimeIntervalOverlayNote)
			AS:SkinFrame(GRM_ReportInactiveReturnOverlayNote)
			AS:SkinFrame(GRM_RosterReportUpcomingEventsOverlayNote)
			AS:SkinFrame(GRM_RosterMinLvlOverlayNote)
			AS:SkinFrame(GRM_AutoTriggerTimeOverlayNote)
			AS:SkinFrame(GRM_AutoBackupTimeOverlayNote)

			isLoaded2 = true
		end
	end)

	-- Module Group Info - GRM dependent addon
	if IsAddOnLoaded ( "Guild_Roster_Manager_Group_Info" ) then
		AS:SkinButton(GRM_GroupRulesButton)
		AS:SkinFrame(GRM_GroupButtonFrame)
		AS:SkinCloseButton(GRM_GroupButtonFrameCloseButton)
	end

	-- Guild Recruitment Frames

	GRM.WaitForLoad = function( load1 , load2 )
		local a = load1 or true;
		local b = load2 or true;

		if a and GRM_EnableMouseOver then
			a = false
			AS:SkinCheckBox(GRM_EnableMouseOver)
		end

		if b and GRM_EnableMouseOverOldRoster then
			b = false
			AS:SkinCheckBox(GRM_EnableMouseOverOldRoster)
		end

		if a or b then
			C_Timer.After ( 3 , function()
				GRM.WaitForLoad( a , b )
			end)
		end
	end

	GRM.WaitForLoad()

end

AS:RegisterSkin('Guild_Roster_Manager', AS.GuildRosterManager)
