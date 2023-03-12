-- Updated for 10.0.2 November 15th, 2022 GRM ver 1.948 (Classic/Wrath/Live Retail Compatible)

local AS, L, S, R = unpack(AddOnSkins)
local GRM = {}

if not AS:CheckAddOn('Guild_Roster_Manager') then return end

function R:GuildRosterManager()

	-- For Classic Compatibility and one code-base
	local buildVersion = select ( 4 , GetBuildInfo() )

	-- Stylistic choice for GRM
	local AdjustSliderThumbFrameLevel = function ( thumb )
		thumb.backdrop:SetFrameLevel ( thumb.backdrop:GetFrameLevel() - 2 )
	end

	--------------------
	-- Tabs
	--------------------
	S:HandleButton(GRM_LogTab)
	S:HandleButton(GRM_AddEventTab)
	S:HandleButton(GRM_BanListTab)
	S:HandleButton(GRM_AddonUsersTab)
	S:HandleButton(GRM_OptionsTab)
	S:HandleButton(GRM_GuildAuditTab)

	--------------------
	-- Event Log
	--------------------
	S:HandleFrame(GRM_RosterChangeLogFrame)
	GRM_RosterChangeLogScrollBorderFrameBottomBorder:Hide()
	GRM_RosterChangeLogScrollBorderFrameTopBorder:Hide()
	GRM_RosterChangeLogScrollBorderFrameLeftBorder:Hide()
	GRM_RosterChangeLogScrollBorderFrameRightBorder:Hide()
	GRM_RosterChangeLogScrollBorderFrameTopLeftCorner:Hide()
	GRM_RosterChangeLogScrollBorderFrameTopRightCorner:Hide()
	GRM_RosterChangeLogScrollBorderFrameBottomRightCorner:Hide()
	GRM_RosterChangeLogScrollBorderFrameBottomLeftCorner:Hide()

	S:HandleScrollBar(GRM_RosterChangeLogScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_RosterChangeLogScrollFrameSliderThumbTexture )
	S:HandleCloseButton(GRM_RosterChangeLogFrame.CloseButton)
	S:HandleButton(GRM_RosterClearLogButton)

	-- Event Log: Options Frame
	S:HandleFrame(GRM_LogExtraOptionsFrame)
	S:HandleFrame(GRM_ExportLogBorderFrame)
	S:HandleCloseButton(GRM_BorderFrameCloseButton)
	S:HandleButton(GRM_LogExtraOptionsButton)
	S:HandleButton(GRM_LogExportButton)
	S:HandleButton(GRM_RosterClearLogButton)
	S:HandleButton(GRM_ConfirmClearButton)

	S:HandleCheckBox(GRM_LogShowLinesCheckButton)
	S:HandleCheckBox(GRM_LogShowTooltipCheckButton)
	S:HandleCheckBox(GRM_SearchAutoFocusCheckButton)
	S:HandleCheckBox(GRM_LogEnableRmvClickCheckButton)
	S:HandleEditBox(GRM_LogExtraEditBox1)
	S:HandleEditBox(GRM_LogExtraEditBox2)
	S:HandleSlideBar(GRM_FontSizeSlider)

	-- Event Log: Side Frame
	S:HandleFrame(GRM_RosterCheckBoxSideFrame)
	S:HandleCheckBox(GRM_RosterJoinedCheckButton)
	S:HandleCheckBox(GRM_RosterJoinedChatCheckButton)
	S:HandleCheckBox(GRM_RosterLeveledChangeCheckButton)
	S:HandleCheckBox(GRM_RosterLeveledChatCheckButton)
	S:HandleCheckBox(GRM_RosterInactiveReturnCheckButton)
	S:HandleCheckBox(GRM_RosterInactiveReturnChatCheckButton)
	S:HandleCheckBox(GRM_RosterPromotionChangeCheckButton)
	S:HandleCheckBox(GRM_RosterPromotionChatCheckButton)
	S:HandleCheckBox(GRM_RosterDemotionChangeCheckButton)
	S:HandleCheckBox(GRM_RosterDemotionChatCheckButton)
	S:HandleCheckBox(GRM_RosterNoteChangeCheckButton)
	S:HandleCheckBox(GRM_RosterNoteChatCheckButton)
	S:HandleCheckBox(GRM_RosterOfficerNoteChangeCheckButton)
	S:HandleCheckBox(GRM_RosterOfficerNoteChatCheckButton)
	S:HandleCheckBox(GRM_RosterCustomNoteChangeCheckButton)
	S:HandleCheckBox(GRM_RosterCustomNoteChatCheckButton)
	S:HandleCheckBox(GRM_RosterNameChangeCheckButton)
	S:HandleCheckBox(GRM_RosterNameChangeChatCheckButton)
	S:HandleCheckBox(GRM_RosterRankRenameCheckButton)
	S:HandleCheckBox(GRM_RosterRankRenameChatCheckButton)
	S:HandleCheckBox(GRM_RosterEventCheckButton)
	S:HandleCheckBox(GRM_RosterEventChatCheckButton)
	S:HandleCheckBox(GRM_RosterLeftGuildCheckButton)
	S:HandleCheckBox(GRM_RosterLeftGuildChatCheckButton)
	S:HandleCheckBox(GRM_RosterRecommendationsButton)
	S:HandleCheckBox(GRM_RosterRecommendationsChatButton)
	S:HandleCheckBox(GRM_RosterBannedPlayersButton)
	S:HandleCheckBox(GRM_RosterBannedPlayersButtonChatButton)
	S:HandleCheckBox(GRM_RosterCheckAllLogButton)
	S:HandleCheckBox(GRM_RosterCheckAllChatButton)

	--------------------
	--Options
	--------------------
	S:HandleFrame(GRM_OptionsFrame)
	S:HandleFrame(GRM_RosterSyncRankDropDownSelected)
	S:HandleFrame(GRM_RosterSyncRankDropDownMenu)
	S:HandleFrame(GRM_RosterBanListDropDownSelected)
	S:HandleFrame(GRM_RosterBanListDropDownMenu)
	S:HandleFrame(GRM_LanguageSelected)
	S:HandleFrame(GRM_LanguageDropDownMenu)
	S:HandleFrame(GRM_MainTagFormatSelected)
	S:HandleFrame(GRM_MainTagFormatMenu)
	S:HandleFrame(GRM_DefaultCustomSelected)
	S:HandleFrame(GRM_DefaultCustomRankDropDownMenu)
	S:HandleFrame(GRM_FontSelected)
	S:HandleFrame(GRM_FontDropDownMenu)
	S:HandleFrame(GRM_TimestampSelected)
	S:HandleFrame(GRM_TimestampSelectedDropDownMenu)
	S:HandleFrame(GRM_NonGlobalTimestampSelected)
	S:HandleFrame(GRM_NonGlobalTimestampSelectedDropDownMenu)
	S:HandleFrame(GRM_24HrSelected)
	S:HandleFrame(GRM_24HrSelectedDropDownMenu)
	S:HandleButton(GRM_ScanOptionsButton)
	S:HandleButton(GRM_SyncOptionsButton)
	S:HandleButton(GRM_CenterOptionsButton)
	S:HandleButton(GRM_ResetDefaultOptionsButton)
	S:HandleButton(GRM_HelpOptionsButton)
	S:HandleButton(GRM_ClearAllOptionsButton)
	S:HandleButton(GRM_ClearGuildOptionsButton)
	S:HandleButton(GRM_VersionOptionsButton)
	S:HandleButton(GRM_CustomRankResetButton)
	S:HandleButton(GRM_HardResetButton)
	S:HandleButton(GRM_ExportGlobalControlButton)
	S:HandleButton(GRM_OpenMacroToolButton)
	S:HandleButton(GRM_OpenMouseoverButton)
	S:HandleButton(GRM_OpenExportToolButton)
	S:HandleButton(GRM_OpenAuditJoinDateToolButton)
	S:HandleButton(GRM_RosterResetOptionsButton)
	S:HandleFrame(GRM_DefaultTabSelected)
	S:HandleFrame(GRM_DefaultTabMenu	)

	-- Options: Tabs
	S:HandleButton(GRM_GeneralTab)
	S:HandleButton(GRM_ScanTab)
	S:HandleButton(GRM_SyncTab)
	S:HandleButton(GRM_OfficerTab)
	S:HandleButton(GRM_UITab)
	S:HandleButton(GRM_HelpTab)
	S:HandleButton(GRM_ModulesTab)
	S:HandleButton(GRM_UXTab)

	-- General Tab
	S:HandleCheckBox(GRM_RosterLoadOnLogonCheckButton)
	S:HandleCheckBox(GRM_RosterLoadOnLogonChangesCheckButton)
	S:HandleCheckBox(GRM_ColorizeSystemMessagesCheckButton)
	S:HandleCheckBox(GRM_RosterShowMainTagCheckButton)
	S:HandleCheckBox(GRM_ShowMainTagOnMains)
	S:HandleCheckBox(GRM_ShowMinimapButton)
	S:HandleCheckBox(GRM_SyncAllSettingsCheckButton)
	S:HandleCheckBox(GRM_DefaultTabSelectionButton)

	S:HandleEditBox(GRM_ReportDestinationEditBox)
	S:HandleSlideBar(GRM_FontSizeSlider)
	S:HandleSlideBar(GRM_TooltipScaleSlider)
	S:HandleFrame(GRM_DefaultTabSelected)
	S:HandleFrame(GRM_ColorSelectOptionsFrame)

	-- Scan Tab
	S:HandleCheckBox(GRM_RosterTimeIntervalCheckButton)
	S:HandleCheckBox(GRM_RosterReportInactiveReturnButton)
	S:HandleCheckBox(GRM_ReportInactivesOnlyIfAllButton)
	S:HandleCheckBox(GRM_RosterReportUpcomingEventsCheckButton)
	S:HandleCheckBox(GRM_RosterMainOnlyCheckButton)
	S:HandleCheckBox(GRM_ShowNotesOnLeavingPlayerButton)
	S:HandleCheckBox(GRM_LevelRecordButton)
	S:HandleCheckBox(GRM_LevelFilter1Button)
	S:HandleCheckBox(GRM_LevelFilter2Button)
	S:HandleCheckBox(GRM_LevelFilter3Button)
	S:HandleCheckBox(GRM_LevelFilter4Button)
	S:HandleCheckBox(GRM_LevelFilter5Button)
	S:HandleCheckBox(GRM_LevelFilter6Button)
	S:HandleCheckBox(GRM_AnnounceBdaysOnLoginButton)

	if GRM_LevelFilter7Button then
		S:HandleCheckBox(GRM_LevelFilter7Button)	-- 10.0 with level 70 introduced need for
	end
	if GRM_LevelFilter8Button then
		S:HandleCheckBox(GRM_LevelFilter8Button)	-- Anticipated Cata expansion Classic
	end
	S:HandleEditBox(GRM_RosterTimeIntervalEditBox)
	S:HandleEditBox(GRM_ReportInactiveReturnEditBox)
	S:HandleEditBox(GRM_RosterReportUpcomingEventsEditBox)
	S:HandleEditBox(GRM_RosterMinLvlEditBox)

	-- Sync Tab
	S:HandleCheckBox(GRM_SyncCompatibilityMessageButton)
	S:HandleCheckBox(GRM_RosterSyncCheckButton)
	S:HandleCheckBox(GRM_AutoTriggerSyncCheckButton)
	S:HandleCheckBox(GRM_SyncAllRestrictReceiveButton)
	S:HandleCheckBox(GRM_RosterSyncBanList)
	S:HandleCheckBox(GRM_CustomNoteSyncCheckBox)
	S:HandleCheckBox(GRM_BDaySyncCheckBox)
	S:HandleCheckBox(GRM_RosterNotifyOnChangesCheckButton)
	S:HandleEditBox(GRM_AutoTriggerTimeEditBox)

	-- Officer Tab
	S:HandleCheckBox(GRM_RosterAddTimestampCheckButton)
	S:HandleCheckBox(GRM_AddJoinedTagButton)
	S:HandleCheckBox(GRM_NoteTagFeatureCheckButton)
	S:HandleCheckBox(GRM_RosterReportAddEventsToCalendarButton)
	S:HandleRadioButton(GRM_RosterAddTimestampRadioButton1)
	S:HandleRadioButton(GRM_RosterAddTimestampRadioButton2)
	S:HandleRadioButton(GRM_RosterAddTimestampRadioButton3)
	S:HandleEditBox(GRM_CustomTagJoinEditBox)
	S:HandleEditBox(GRM_CustomTagREJoinEditBox)

	-- Backup Tab
	S:HandleCheckBox(GRM_AutoBackupCheckBox)
	S:HandleEditBox(GRM_AutoBackupTimeEditBox)
	S:HandleButton(GRM_HordeTab)
	S:HandleButton(GRM_AllianceTab)

	-- UX (UI) Tab
	S:HandleCheckBox(GRM_FadeCheckButton)
	S:HandleCheckBox(GRM_NoteBordersButton)
	S:HandleCheckBox(GRM_ReputationToggleButton)
	S:HandleCheckBox(GRM_BirthdayToggleButton)
	S:HandleCheckBox(GRM_ColorizePlayerNamesButton)
	S:HandleSlideBar(GRM_CoreWindowScaleSlider)
	S:HandleSlideBar(GRM_MouseOverScaleSlider)
	S:HandleSlideBar(GRM_MacroToolScaleSlider)
	S:HandleSlideBar(GRM_ExportToolScaleSlider)
	S:HandleSlideBar(GRM_AdvancedAuditToolScaleSlider)

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
	S:HandleScrollBar(GRM_AddEventScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_AddEventScrollFrameSliderThumbTexture )
	S:HandleButton(GRM_EventsFrameSetAnnounceButton)
	S:HandleButton(GRM_EventsFrameIgnoreButton)
	S:HandleButton(GRM_PlayerSearchBanEditBox)
	S:HandleButton(GRM_EventsFrameIgnoreAllButton)

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
	S:HandleButton(GRM_BanListRemoveButton)
	S:HandleButton(GRM_BanListAddButton)
	S:HandleButton(GRM_BanListEditButton)
	S:HandleButton(GRM_BanListRemoveAllCurrentButton)
	S:HandleScrollBar(GRM_CoreBanListScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_CoreBanListScrollFrameSliderThumbTexture )

	--Ban Frame
	S:HandleFrame(GRM_AddBanFrame)
	S:HandleCloseButton(GRM_AddBanFrame.CloseButton)
	S:HandleButton(GRM_AddBanConfirmButton)
	S:HandleEditBox(GRM_AddBanNameSelectionEditBox)
	S:HandleEditBox(GRM_AddBanReasonEditBox)
	S:HandleEditBox(GRM_RosterMinLvlEditBox)
	S:HandleEditBox(GRM_PlayerSearchBanEditBox)

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

	S:HandleScrollBar(GRM_AddBanScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_AddBanScrollFrameSliderThumbTexture )

	-- Ban Frame: Confirm Window
	S:HandleFrame(GRM_PopupWindowConfirmFrame)
	S:HandleButton(GRM_PopupWindowConfirmFrameYesButton)
	S:HandleButton(GRM_PopupWindowConfirmFrameCancelButton)
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
	S:HandleFrame(GRM_AddonUsersFrame)
	S:HandleScrollBar(GRM_AddonUsersScrollFrameSlider)
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
	S:HandleFrame(GRM_AuditFrame)
	S:HandleFrame(GRM_AuditWindowDropDownFrame)
	S:HandleButton(GRM_SetJoinUnkownButton)
	S:HandleButton(GRM_SetPromoUnkownButton)
	S:HandleButton(GRM_SetBdayUnkownButton)
	S:HandleButton(GRM_JDAuditToolButton)
	S:HandleScrollBar(GRM_AuditScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_AuditScrollFrameSliderThumbTexture )
	GRM_AuditScrollBorderFrameBottomBorder:Hide()
	GRM_AuditScrollBorderFrameTopBorder:Hide()
	GRM_AuditScrollBorderFrameLeftBorder:Hide()
	GRM_AuditScrollBorderFrameRightBorder:Hide()
	GRM_AuditScrollBorderFrameTopLeftCorner:Hide()
	GRM_AuditScrollBorderFrameTopRightCorner:Hide()
	GRM_AuditScrollBorderFrameBottomRightCorner:Hide()
	GRM_AuditScrollBorderFrameBottomLeftCorner:Hide()
	S:HandleEditBox(GRM_PlayerSearchAuditEditBox)

	-- AuditToolButton
	S:HandleFrame(GRM_AuditJDTool)
	S:HandleCloseButton(GRM_AuditJDTool.CloseButton)
	S:HandleScrollBar(GRM_JDToolScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_JDToolScrollFrameSliderThumbTexture )
	S:HandleCheckBox(GRM_AuditFrameShowAllCheckbox)
	S:HandleCheckBox(GRM_AuditFrameIncludeUnknownCheckBox)
	S:HandleCheckBox(GRM_AuditBirthdayToggleButton)
	S:HandleButton(GRM_AuditJDToolButton1)
	S:HandleButton(GRM_AuditJDToolButton2)
	S:HandleButton(GRM_AuditJDToolButton3)
	S:HandleButton(GRM_AuditJDToolButton4)
	S:HandleButton(GRM_AuditJDToolButton5)
	S:HandleButton(GRM_AuditJDToolButton6)
	S:HandleButton(GRM_AuditJDToolButton7)
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
	S:HandleFrame(GRM_UIOptionsFrame)
	S:HandleScrollBar(GRM_CoreBackupScrollFrameSlider)
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
	S:HandleButton(GRM_LoadLogButton)
	S:HandleButton(GRM_LoadLogOldRosterButton)
	S:HandleButton(GRM_LoadToolButton)
	S:HandleButton(GRM_LoadToolOldRosterButton)

	----------------------------------------
	-- Guild Detail Frame (GRM Tooltip)
	----------------------------------------
	S:HandleFrame(GRM_MemberDetailMetaData)
	S:HandleCloseButton(GRM_MemberDetailMetaDataCloseButton)
	S:HandleButton(GRM_MemberDetailJoinDateButton)
	S:HandleButton(GRM_SetPromoDateButton)
	S:HandleButton(GRM_DateSubmitButton)
	S:HandleButton(GRM_DateSubmitCancelButton)
	S:HandleButton(GRM_AddAltButton2)
	S:HandleButton(GRM_GroupInviteButton)
	S:HandleButton(GRM_SetUnknownButton)
	S:HandleButton(GRM_MemberDetailBannedIgnoreButton)
	S:HandleButton(GRM_CancelCustomNoteButton)
	S:HandleButton(GRM_ConfirmCustomNoteButton)
	S:HandleButton(GRM_MemberDetailBirthdayButton)
	S:HandleFrame(GRM_AddAltEditFrame)
	S:HandleFrame(GRM_MonthDropDownMenuSelected)
	S:HandleFrame(GRM_MonthDropDownMenu)
	S:HandleFrame(GRM_DayDropDownMenuSelected)
	S:HandleFrame(GRM_DayDropDownMenu)
	S:HandleFrame(GRM_YearDropDownMenuSelected)
	S:HandleFrame(GRM_YearDropDownMenu)
	S:HandleScrollBar(GRM_CoreAltScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_CoreAltScrollFrameSliderThumbTexture )
	S:HandleScrollBar(GRM_AltGroupingScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_AltGroupingScrollFrameSliderThumbTexture )
	S:HandleCheckBox(GRM_CustomNoteSyncMetaCheckBox)
	S:HandleScrollBar(GRM_AddAltScrollFrameSlider)
	S:HandleCloseButton(GRM_AddAltEditBoxCloseButton)
	S:HandleButton(GRM_SafeFromRulesButton)

	-- Alt Grouping Frame
	S:HandleFrame(GRM_AltGroupingScrollBorderFrame)
	S:HandleCloseButton(GRM_AltGroupingScrollBorderFrameCloseButton)

	------------------------------
	-- Generic Custom Popup Window
	------------------------------
	S:HandleFrame(GRM_GeneralPopupWindow)
	S:HandleFrame(GRM_ToolIgnoreListFrame)
	S:HandleButton(GRM_GeneralPopupWindowYesButton)
	S:HandleButton(GRM_GeneralPopupWindowNoButton)

	--------------------
	-- Macro Tool
	--------------------
	S:HandleFrame(GRM_ToolCoreFrame)
	S:HandleCloseButton(GRM_ToolCoreFrameCloseButton)
	S:HandleCloseButton(GRM_ToolIgnoreListFrameCloseButton)
	S:HandleButton(GRM_ToolBuildMacroButton)
	S:HandleButton(GRM_ToolViewSafeListButton)
	S:HandleButton(GRM_ToolClearSelectedMacrodNamesButton)
	S:HandleButton(GRM_ToolResetSelectedMacroNamesButton)
	S:HandleButton(GRM_ToolIgnoreClearSelectionButton)
	S:HandleButton(GRM_ToolIgnoreResetSelectedNamesButton)
	S:HandleButton(GRM_ToolIgnoreRemoveAllButton)
	S:HandleButton(GRM_ToolSyncRulesButton)
	S:HandleEditBox(GRM_RosterKickRecommendEditBox)
	S:HandleFrame(GRM_ToolMacrodScrollBorderFrame)
	S:HandleFrame(GRM_ToolQueuedScrollBorderFrame)
	S:HandleFrame(GRM_ToolIgnoredScrollBorderFrame)
	S:HandleFrame(GRM_ToolRulesScrollBorderFrame)
	S:HandleButton(GRM_ToolResetSettingsButton)
	S:HandleButton(GRM_CustomRuleAddButton)
	S:HandleFrame(GRM_ToolCustomRulesFrame)
	S:HandleFrame(GRM_TimeScaleSelected)
	S:HandleFrame(GRM_TimeScaleDropDownMenu)
	S:HandleButton(GRM_ToolCustomRulesConfirmButton)
	S:HandleButton(GRM_ToolCustomRulesCancelButton)
	S:HandleEditBox(GRM_CustomRuleNameEditBox)
	S:HandleEditBox(GRM_CustomRuleLevelStartEditBox)
	S:HandleEditBox(GRM_CustomRuleLevelStopEditBox)
	S:HandleEditBox(GRM_NoteSearchEditBox)
	S:HandleCheckBox(GRM_ToolCoreIgnoreCheckButton)
	S:HandleCheckBox(GRM_MacroToolDisableLogSpamCheckbutton)
	S:HandleCheckBox(GRM_MacroToolShowOnlineOnlyCheckButton)

	S:HandleScrollBar(GRM_ToolMacrodScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolMacrodScrollFrameSilderThumbTexture )
	S:HandleScrollBar(GRM_ToolQueuedScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolQueuedScrollFrameSilderThumbTexture )
	S:HandleScrollBar(GRM_ToolIgnoredScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolIgnoredScrollFrameSilderThumbTexture )

	S:HandleButton(GRM_KickTab)
	S:HandleButton(GRM_PromoTab)
	S:HandleButton(GRM_DemoteTab)

	--------------------
	-- Export Tool
	--------------------
	S:HandleCheckBox (GRM_ExportAutoIncludeHeadersCheckButton)
	S:HandleButton(GRM_ShowExportWindowButton)
	S:HandleButton(GRM_ExportSelectedRangeButton)
	S:HandleButton(GRM_ExportNextRangeButton)
	S:HandleButton(GRM_ExportPreviousRangeButton)
	S:HandleButton(GRM_ExportMemberDetailsHeadersButton)
	S:HandleButton(GRM_ExportResetOptionsButton)
	S:HandleFrame(GRM_ExportLogScrollBorderFrame)
	S:HandleEditBox(GRM_ExportRangeEditBox1)
	S:HandleEditBox(GRM_ExportRangeEditBox2)
	S:HandleFrame(GRM_DelimiterDropdownMenu)
	S:HandleFrame(GRM_DelimiterDropdownMenuSelected)
	S:HandleScrollBar(GRM_ExportLogScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_ExportLogScrollFrameSliderThumbTexture )

	for i = 1 , 21 do
		if i ~= 19 then
			S:HandleCheckBox(_G["GRM_ExportFilter"..i])
		end
	end

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
				S:HandleFrame(GRM_PlayerOfficerNoteWindow)
				S:HandleFrame(GRM_PlayerNoteWindow)
				S:HandleFrame(GRM_CustomNoteEditBoxFrame)
			end
		end
	end)

	-- Since much of the addon only loads on demand, this AddOnSkins file needs to wait til certain things have been configured first...
	local isLoaded , isLoaded2 , isLoaded3 , isLoaded4 , isLoaded5 , isLoaded6 = false , false , false , false , false , false
	GRM_PlayerNoteWindow:HookScript("OnShow" , function()
		if not isLoaded then
			GRM_AddAltEditFrame:SetPoint ( "BOTTOMLEFT" , GRM_MemberDetailMetaData , "BOTTOMRIGHT" ,  2 , 0 )
			S:HandleEditBox(GRM_AddAltEditBox, 120, 15)
			S:HandleEditBox(GRM_PlayerNoteEditBox)
			S:HandleEditBox(GRM_PlayerOfficerNoteEditBox)
			-- S:HandleEditBox(GRM_CustomNoteEditBox)			-- Not skinning for now - seems odd looking

			if buildVersion < 80000 then
				if GRM_UI.GuildRosterFrame:IsVisible() then
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , GRM_UI.GuildRosterFrame , "TOPRIGHT" , 0 , 5 )
				end

				if GuildMemberDetailFrame:IsVisible() then
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , GuildMemberDetailFrame , "TOPRIGHT" , 2 , 0.5 )
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
					GRM_MemberDetailMetaData:ClearAllPoints();
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 25 , 5 )
				elseif GRM_UI.GuildRosterFrame:IsVisible() then
					GRM_MemberDetailMetaData:ClearAllPoints();
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , GRM_UI.GuildRosterFrame , "TOPRIGHT" , 25 , 5 )
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

			S:HandleFrame(GRM_PlayerNoteWindow)
			S:HandleFrame(GRM_PlayerOfficerNoteWindow)
			S:HandleFrame(GRM_SyncJoinDateSideFrame)
			S:HandleFrame(GRM_CustomNoteEditBoxFrame)
			S:HandleFrame(GRM_altDropDownOptions)
			S:HandleFrame(GRM_DropDownList1AttachmentFrame)
			S:HandleFrame(GRM_PopupWindow)
			S:HandleFrame(GRM_MemberDetailEditBoxFrame)
			S:HandleCheckBox(GRM_PopupWindowCheckButton1)
			S:HandleCheckBox(GRM_PopupWindowCheckButton2)
			-- Ban Popup Frames

			GRM_MemberDetailRankToolTip:HookScript ( "OnShow" , function()
				S:HandleFrame(GRM_MemberDetailRankToolTip)
			end)
			GRM_MemberDetailJoinDateToolTip:HookScript ( "OnShow" , function()
				S:HandleFrame(GRM_MemberDetailJoinDateToolTip)
			end)
			GRM_MemberDetailServerNameToolTip:HookScript ( "OnShow" , function()
				S:HandleFrame(GRM_MemberDetailServerNameToolTip)
			end)
			GRM_MemberDetailNotifyStatusChangeTooltip:HookScript ( "OnShow" , function()
				S:HandleFrame(GRM_MemberDetailNotifyStatusChangeTooltip)
			end)
			GRM_MemberDetailNJDSyncTooltip:HookScript ( "OnShow" , function()
				S:HandleFrame(GRM_MemberDetailNJDSyncTooltip)
			end)

			GRM_SyncJoinDateSideFrame:SetPoint ( "TOPLEFT" , GRM_MemberDetailMetaData , "TOPRIGHT" , 1 , 0 )
			GRM_AltGroupingScrollFrameSlider:SetPoint ( "TOPLEFT" , GRM_AltGroupingScrollFrame , "TOPRIGHT" , -19 , -14.5 )
			GRM_AltGroupingScrollBorderFrameCloseButton:SetPoint ( "TOPRIGHT" , GRM_AltGroupingScrollBorderFrame , "TOPRIGHT" , 8 , 7 )
			GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrameTitle:SetPoint ( "Bottom" , GRM_AltGroupingScrollBorderFrame , "TOP" , 0 , 2 )
			GRM_UI.GRM_MemberDetailMetaData.GRM_WindowIsLockedText:SetPoint ( "BOTTOMRIGHT" , GRM_MemberDetailMetaData , "TOPRIGHT" , -5 , 0 )

			if not isLoaded2 then
				sideGroupingLogic()
			end

			GRM_CoreAltScrollFrameSlider:SetPoint( "TOPLEFT" , GRM_CoreAltScrollFrame , "TOPRIGHT" , -2 , -10 )

			-- FONT ISSUES
			GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTitleTxt:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 9 , "NONE" );
			GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoText:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 9 , "NONE" );
			GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 9 , "NONE" );
			GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayTitleText:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 9 , "NONE" );
			GRM_UI.GRM_MemberDetailMetaData.GRM_altFrameTitleText:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 8 , "NONE" );
			GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltTitleText:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 11 , "NONE" );

			-- Tooltip Scaling should be a bit bigger
			GRM_MemberDetailNJDSyncTooltip:SetScale ( 0.85 )
			GRM_MemberDetailNotifyStatusChangeTooltip:SetScale ( 0.85 )
			C_Timer.After ( 0.5 , function()
				GRM_MemberDetailMetaDataCloseButton:SetPoint( "TOPRIGHT" , GRM_UI.GRM_MemberDetailMetaData , "TOPRIGHT" , 0 , 0 );
				S:HandleButton(GRM_SyncDateArrowButton)
				S:HandleButton(GRM_ExtraAltDetailsArrowButton)
			end);
			isLoaded = true
		end
	end)

	GRM_RosterCheckBoxSideFrame:HookScript("OnShow" , function()
		if not isLoaded2 then
			-- MISC FRAMES
			GRM_LogTab:SetPoint ( "BOTTOMLEFT" , GRM_RosterChangeLogFrame , "TOPLEFT" , 0 , 1 )
			GRM_RosterCheckBoxSideFrame:SetPoint ( "TOPLEFT" , GRM_RosterChangeLogFrame , "TOPRIGHT" , 2 , 0 )
			GRM_AddBanNameSelectionEditBox:SetSize ( 129 , 20 )
			GRM_BanServerSelected:SetPoint ( "TOPLEFT" , GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox , "BOTTOMLEFT" , 0 , -2 )
			S:HandleFrame ( GRM_BanServerSelected )
			S:HandleFrame ( GRM_AddBanDropDownClassSelected )

			--Confirm Frames
			C_Timer.After ( 1 , function()
				S:HandleFrame(GRM_RosterConfirmFrame)
				S:HandleFrame(GRM_AddBanReasonEditBoxFrame)
				GRM_GuildNameTooltip:HookScript ( "OnShow" , function()
					S:HandleFrame(GRM_GuildNameTooltip)
				end)
				GRM_AddonUsersTooltip:HookScript ( "OnShow" , function()
					S:HandleFrame(GRM_AddonUsersTooltip)
				end)

				S:HandleCloseButton(GRM_RosterConfirmFrame.CloseButton)

				S:HandleButton(GRM_RosterConfirmYesButton)
				S:HandleButton(GRM_RosterConfirmCancelButton)
			end)

			-- Ban Frames
			GRM_LoadLogButton:SetPoint ( "BOTTOMRIGHT" , CommunitiesFrame , "TOPRIGHT" , 1 , 1.25)
			GRM_PopupWindowConfirmFrame:SetSize ( 300 , 100 )
			GRM_PopupWindowConfirmFrame:SetPoint( "TOP" , GRM_AddBanFrame , "BOTTOM" , 0 , -1 )

			-- Log Frame
			GRM_LogExtraOptionsFrame:SetPoint ( "TOPLEFT" , GRM_LogFrame , "BOTTOMLEFT" , 0 , -1 )
			GRM_LogExtraOptionsFrame:SetSize ( 600 , 155 )
			GRM_LogExtraOptionsButton:SetPoint ( "TOP" , GRM_RosterCheckBoxSideFrame , "BOTTOM" , 0 , -1 );
			GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText2:SetPoint ( "TOP" , GRM_EventsFrame , 0 , 55 );

			if not isLoaded then
				sideGroupingLogic()
			end

			GRM_UIOptionsFrame:HookScript ( "OnShow" , function()
				C_Timer.After( 0.25 , function()
					if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame.AllBackupButtons ~= nil then
						for i = 1 , #GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame.AllBackupButtons do
							for j = 7 , 8 do
								S:HandleButton ( GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame.AllBackupButtons[i][j] )
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
			S:HandleEditBox(GRM_LogEditBox)

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
			S:HandleFrame(GRM_RosterTimeIntervalOverlayNote)
			S:HandleFrame(GRM_ReportInactiveReturnOverlayNote)
			S:HandleFrame(GRM_RosterReportUpcomingEventsOverlayNote)
			S:HandleFrame(GRM_RosterMinLvlOverlayNote)
			S:HandleFrame(GRM_AutoTriggerTimeOverlayNote)
			S:HandleFrame(GRM_AutoBackupTimeOverlayNote)

			isLoaded2 = true
		end
	end)

	-- Module Group Info - GRM dependent addon
	if IsAddOnLoaded ( "Guild_Roster_Manager_Group_Info" ) then
		S:HandleButton(GRM_GroupRulesButton)
		S:HandleFrame(GRM_GroupButtonFrame)
		S:HandleCloseButton(GRM_GroupButtonFrameCloseButton)
	end

	-- Guild Recruitment Frames

	GRM.WaitForLoad = function( load1 , load2 )
		local a = load1 or true;
		local b = load2 or true;

		if a and GRM_EnableMouseOver then
			a = false
			S:HandleCheckBox(GRM_EnableMouseOver)
		end

		if b and GRM_EnableMouseOverOldRoster then
			b = false
			S:HandleCheckBox(GRM_EnableMouseOverOldRoster)
		end

		if a or b then
			C_Timer.After ( 3 , function()
				GRM.WaitForLoad( a , b )
				return;
			end)
		end
	end

	GRM.WaitForLoad()

end

AS:RegisterSkin('Guild_Roster_Manager', R.GuildRosterManager)
