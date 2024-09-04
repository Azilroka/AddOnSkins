 	-- Updated September 4th, 2024 - Fully compatible with the 11.0 update for GRM and 1.15.3 CE and 4.4.0 Cata

local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Guild_Roster_Manager') then return end

-- Checking if modules are ready - Classic/Retail build version API issue for now.
local AddonIsLoaded = function(addonName)
    if C_AddOns and C_AddOns.IsAddOnLoaded then
        return C_AddOns.IsAddOnLoaded(addonName);
    else
        return IsAddOnLoaded(addonName);
    end
end

function AS:GuildRosterManager()

	-- For Classic Compatibility and one code-base
	local buildVersion = select ( 4 , GetBuildInfo() )

	-- Stylistic choice for GRM
	local AdjustSliderThumbFrameLevel = function ( thumb )
		thumb.backdrop:SetFrameLevel( thumb.backdrop:GetFrameLevel() - 2 )
	end

	local HideEdges = function ( frameName , isClassic )

		local bottomRight , bottomLeft = "BottomRightCorner" , "BottomLeftCorner";
		if isClassic then
			bottomRight , bottomLeft = "BotRightCorner","BotLeftCorner"
		end

		local edgeNames = {"BottomBorder","TopBorder","LeftBorder","RightBorder","TopLeftCorner","TopRightCorner",bottomRight,bottomLeft}

		for i = 1 , #edgeNames do
			_G[frameName .. edgeNames[i]]:Hide()
		end
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
	HideEdges("GRM_RosterChangeLogScrollBorderFrame");

	AS:SkinScrollBar(GRM_RosterChangeLogScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_RosterChangeLogScrollFrameSliderThumbTexture )
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
	AS:SkinFrame(GRM_NonGlobalTimestampSelected)
	AS:SkinFrame(GRM_NonGlobalTimestampSelectedDropDownMenu)
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
	AS:SkinButton(GRM_RosterResetOptionsButton)
	AS:SkinFrame(GRM_DefaultTabSelected)
	AS:SkinFrame(GRM_DefaultTabMenu	)

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
	AS:SkinCheckBox(GRM_AchievementAnnounceButton)
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
	if GRM_LevelFilter7Button then
		AS:SkinCheckBox(GRM_LevelFilter7Button)	-- 10.0 with level 70 introduced need for
	end
	if GRM_LevelFilter8Button then
		AS:SkinCheckBox(GRM_LevelFilter8Button)	-- Anticipated Cata expansion Classic
	end
	AS:SkinEditBox(GRM_RosterTimeIntervalEditBox)
	AS:SkinEditBox(GRM_ReportInactiveReturnEditBox)
	AS:SkinEditBox(GRM_RosterReportUpcomingEventsEditBox)
	AS:SkinEditBox(GRM_RosterMinLvlEditBox)

	-- Sync Tab
	AS:SkinCheckBox(GRM_SyncCompatibilityMessageButton)
	AS:SkinCheckBox(GRM_RosterSyncCheckButton)
	AS:SkinCheckBox(GRM_AutoTriggerSyncCheckButton)
	AS:SkinCheckBox(GRM_SyncAllRestrictReceiveButton)
	AS:SkinCheckBox(GRM_RosterSyncBanList)
	AS:SkinCheckBox(GRM_CustomNoteSyncCheckBox)
	AS:SkinCheckBox(GRM_RosterNotifyOnChangesCheckButton)
	AS:SkinEditBox(GRM_AutoTriggerTimeEditBox)
	AS:SkinButton(GRM_SyncProgressButton)

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
	AS:SkinButton(GRM_TransferGuideButton)

	-- UX (UI) Tab
	AS:SkinCheckBox(GRM_FadeCheckButton)
	AS:SkinCheckBox(GRM_NoteBordersButton)
	AS:SkinCheckBox(GRM_ReputationToggleButton)
	AS:SkinCheckBox(GRM_BirthdayToggleButton)
	AS:SkinCheckBox(GRM_ColorizePlayerNamesButton)
	AS:SkinCheckBox(GRM_ShowLevelCheckButton)
	AS:SkinCheckBox(GRM_ShowLevelCheckButton2)
	AS:SkinCheckBox(GRM_ShowMythicRatingButton)
	AS:SkinCheckBox(GRM_ShowFactionCheckButton)
	AS:SkinCheckBox(GRM_AutoHideFramesInCombatCheckButton)

	----------------------------
	-- Add Event to Calendar Frame
	------------------------------

	HideEdges("GRM_AddEventScrollBorderFrame")
	AS:SkinScrollBar(GRM_AddEventScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_AddEventScrollFrameSliderThumbTexture )
	AS:SkinButton(GRM_EventsFrameSetAnnounceButton)
	AS:SkinButton(GRM_EventsFrameIgnoreButton)
	AS:SkinButton(GRM_PlayerSearchBanEditBox)
	AS:SkinButton(GRM_EventsFrameIgnoreAllButton)

	--------------------
	-- Ban List
	--------------------

	HideEdges("GRM_CoreBanListScrollBorderFrame")
	AS:SkinButton(GRM_BanListRemoveButton)
	AS:SkinButton(GRM_BanListAddButton)
	AS:SkinButton(GRM_BanListEditButton)
	AS:SkinButton(GRM_BanListRemoveAllCurrentButton)
	AS:SkinScrollBar(GRM_CoreBanListScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_CoreBanListScrollFrameSliderThumbTexture )

	--Ban Frame
	AS:SkinFrame(GRM_AddBanFrame)
	AS:SkinButton(GRM_AddBanConfirmButton)
	AS:SkinEditBox(GRM_AddBanNameSelectionEditBox)
	AS:SkinEditBox(GRM_AddBanServerSelectionEditBox)
	AS:SkinEditBox(GRM_AddBanReasonEditBox)
	AS:SkinEditBox(GRM_RosterMinLvlEditBox)
	AS:SkinEditBox(GRM_PlayerSearchBanEditBox)
	AS:SkinFrame(GRM_AddBanDropDownClassSelected)
	AS:SkinFrame(GRM_AddBanDropDownMenu)
	AS:SkinFrame(GRM_AddBanReasonEditBoxFrame)

	AS:SkinScrollBar(GRM_AddBanScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_AddBanScrollFrameSliderThumbTexture )

	-- Ban Frame: Confirm Window
	AS:SkinFrame(GRM_PopupWindowConfirmFrame)
	AS:SkinButton(GRM_PopupWindowConfirmFrameYesButton)
	AS:SkinButton(GRM_PopupWindowConfirmFrameCancelButton)
	HideEdges("GRM_PopupWindowConfirmFrame")

	-- GRM popup Window
	AS:SkinFrame(GRM_GeneralPopupWindow)
	AS:SkinButton(GRM_GeneralPopupWindowYesButton)
	AS:SkinButton(GRM_GeneralPopupWindowIgnoreButton)
	AS:SkinButton(GRM_GeneralPopupWindowNoButton)

	--------------------
	-- Addon Users
	--------------------
	AS:SkinFrame(GRM_AddonUsersFrame)
	AS:SkinScrollBar(GRM_AddonUsersScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_AddonUsersScrollFrameSliderThumbTexture )
	HideEdges("GRM_AddonUsersScrollBorderFrame")

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
	HideEdges("GRM_AuditScrollBorderFrame")
	AS:SkinEditBox(GRM_PlayerSearchAuditEditBox)

	-- AuditToolButton
	AS:SkinFrame(GRM_AuditJDTool)
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
	HideEdges("GRM_JDToolScrollBorderFrame")

	------------------
	-- Backup Frame
	--------------------
	AS:SkinFrame(GRM_UIOptionsFrame)
	AS:SkinScrollBar(GRM_CoreBackupScrollFrameSlider)
	AdjustSliderThumbFrameLevel ( GRM_CoreBackupScrollFrameSliderThumbTexture )
	HideEdges("GRM_CoreBackupScrollBorderFrame")

	--------------------
	-- Guild Frame
	--------------------
	AS:SkinButton(GRM_LoadLogButton)
	AS:SkinButton(GRM_LoadToolButton)

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
	AS:SkinButton(GRM_ToolBuildMacroButton)
	AS:SkinButton(GRM_ToolViewSafeListButton)
	AS:SkinButton(GRM_ToolClearSelectedMacrodNamesButton)
	AS:SkinButton(GRM_ToolResetSelectedMacroNamesButton)
	AS:SkinButton(GRM_ToolIgnoreClearSelectionButton)
	AS:SkinButton(GRM_ToolIgnoreResetSelectedNamesButton)
	AS:SkinButton(GRM_ToolIgnoreRemoveAllButton)
	AS:SkinButton(GRM_ToolSyncRulesButton)
	AS:SkinButton(GRM_ToolCopyQuedButton)
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
	AS:SkinCheckBox(GRM_MacroToolShowOnlineOnlyCheckButton)

	AS:SkinScrollBar(GRM_ToolMacrodScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolMacrodScrollFrameSilderThumbTexture )
	AS:SkinScrollBar(GRM_ToolQueuedScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolQueuedScrollFrameSilderThumbTexture )
	AS:SkinScrollBar(GRM_ToolIgnoredScrollFrameSilder)
	AdjustSliderThumbFrameLevel ( GRM_ToolIgnoredScrollFrameSilderThumbTexture )

	AS:SkinButton(GRM_KickTab)
	AS:SkinButton(GRM_PromoTab)
	AS:SkinButton(GRM_DemoteTab)
	AS:SkinButton(GRM_SpecialTab)
	AS:SkinButton(GRM_ToolHotKeyEditButton)
	AS:SkinCheckBox(GRM_MacroRuleSelectAllCheckBox)

	--------------------
	-- Export Tool
	--------------------
	AS:SkinCheckBox (GRM_ExportAutoIncludeHeadersCheckButton)
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

	for i = 1 , 23 do
		if i ~= 19 then
			AS:SkinCheckBox(_G["GRM_ExportFilter"..i])
		end
	end

	AS:SkinButton(GRM_ExportLogTab)
	AS:SkinButton(GRM_ExportGuildDataTab)
	AS:SkinButton(GRM_ExportLeftGuildDataTab)
	AS:SkinButton(GRM_ExportDeathsTab)

	AS:SkinCheckBox(GRM_ExportSelectAllButton)
	AS:SkinRadioButton(GRM_ExportFilter17_Radial1)
	AS:SkinRadioButton(GRM_ExportFilter17_Radial2)
	AS:SkinEditBox(GRM_ExportLevelRangeEditBox1)
	AS:SkinEditBox(GRM_ExportLevelRangeEditBox2)

	------------------
	-- GRM Roster ----
	------------------

	local SkinNewRoster = function()

		-- Sort tabs
		AS:SkinFrame(GRM_RosterFrame)
		AS:SkinFrame(GRM_RosterFrameScrollFrame)
		AS:SkinFrame(GRM_RosterFrameDropDown)
		AS:SkinFrame(GRM_RosterFrameDropDownRank)
		AS:SkinFrame(GRM_RosterOptions)
		AS:SkinButton(GRM_RosterColumnLvl)
		AS:SkinButton(GRM_RosterColumnName)
		AS:SkinButton(GRM_RosterColumnLastOnline)
		AS:SkinButton(GRM_RosterColumnRank)
		AS:SkinButton(GRM_RosterColumnNote)
		AS:SkinButton(GRM_RosterColumnOfficerNote)
		AS:SkinButton(GRM_RosterColumnCustomNote)
		AS:SkinCheckBox(GRM_RosterShowOfflineCheckBox)
		AS:SkinCheckBox(GRM_RosterOptionsShowMains)
		AS:SkinCheckBox(GRM_RosterOptionsShowAlts)
		AS:SkinCheckBox(GRM_RosterOptionsShowMainTag)
		AS:SkinCheckBox(GRM_RosterOptionsShowAltTag)
		AS:SkinCheckBox(GRM_RosterOptionsGroupByMain)
		AS:SkinSlideBar(GRM_RowsCountSlider)

		if GRM_G.BuildVersion >= 80000 then
			AS:SkinButton(GRM_RosterColumnMythicPlus)
		end
		AS:SkinScrollBar(GRM_RosterFrameScrollFrameSlider)
		AS:SkinEditBox(GRM_RosterFrameNameEditBox)
		AS:SkinEditBox(GRM_RosterNoteEditBox)

		-- Spacing
		GRM_RosterOptions:SetPoint ( "TOP" , GRM_UI.GRM_RosterFrame , "BOTTOM" , 0 , -1 )
		GRM_RosterOptionsButton:SetPoint ( "BOTTOMRIGHT" , GRM_UI.GRM_RosterFrame , "BOTTOMLEFT" , 0 , 0 )

		newRosterLoaded = true;

	end

	-- EXPORT WINDOW FRAMES
	local SkinExportWindow = function()
		AS:SkinCheckBox(GRM_ExportFilterRealm)
	end

	-- GRM wrote it's own custom UI API to load frames on-demand, this has some issues now with skinning frames that might not exist on load. This creates the skinning
	-- to be nested. More will be added with time as this is a recent update, and eventually all frames will be rewritten into the new API, saving 1000s
	-- of lines of code.
	local GRM_CustomUI_API_DelayLoad = function()

		-- Hardcore
		AS:SkinButton(GRM_HardcoreTab)

		-- Audit Window
		AS:SkinFrame(GRM_AuditVerifyAllFrame)
		AS:SkinEditBox(GRM_VerifyFrameEditBox1)
		AS:SkinButton(GRM_VerifyAllConfirmButton)
		AS:SkinButton(GRM_VerifyAllRankButton)
		AS:SkinButton(GRM_VerifyAllJoinButton)

		-- Macro Frame
		AS:SkinFrame(GRM_ToolEditHotKeyFrame)
		AS:SkinEditBox(GRM_HotKeyEditBox)
		AS:SkinButton(GRM_HotKeyClearButton)
		AS:SkinButton(GRM_HotKeyConfirmButton)
		AS:SkinButton(GRM_HotKeyShiftButton)
		AS:SkinButton(GRM_HotKeyControlButton)

	end

	-- Macro Rule Ignore Lists
	local skinMacroIgnoreLists = function()
		AS:SkinFrame(GRM_MacroToolIgnoreListSettingsFrame)
		AS:SkinCheckBox(GRM_IgnoreListKickTimeExpireButton)
		AS:SkinCheckBox(GRM_IgnoreListPromoteTimeExpireButton)
		AS:SkinCheckBox(GRM_IgnoreListDemoteTimeExpireButton)
		AS:SkinCheckBox(GRM_IgnoreListFrameKickCheckBox)
		AS:SkinCheckBox(GRM_IgnoreListFramePromoteCheckBox)
		AS:SkinCheckBox(GRM_IgnoreListFrameDemoteCheckBox)
		AS:SkinEditBox(GRM_IgnoreListPromoteTimeExpireEditBox)
		AS:SkinEditBox(GRM_IgnoreListKickTimeExpireEditBox)
		AS:SkinEditBox(GRM_IgnoreListDemoteTimeExpireEditBox)
	end

	local skinModules = function()
		-- Module Group Info - GRM dependent addon
		if AddonIsLoaded ( "Guild_Roster_Manager_Group_Info" ) then
			AS:SkinCheckBox(GRM_EnableGIModuleCheckButton)
			AS:SkinCheckBox(GRM_DisableGroupInfoTooltipCheckButton)
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
				AS:SkinFrame(GRM_PlayerOfficerNoteWindow)
				AS:SkinFrame(GRM_PlayerNoteWindow)
				AS:SkinFrame(GRM_CustomNoteEditBoxFrame)
			end
		end
	end)

	-- Since much of the addon only loads on demand, this AddOnSkins file needs to wait til certain things have been configured first...
	local isLoaded , isLoaded2 , isLoaded3 , isLoaded4 , isLoaded5 = false , false , false , false , false
	GRM_PlayerNoteWindow:HookScript("OnShow" , function()
		if not isLoaded then
			GRM_AddAltEditFrame:SetPoint ( "BOTTOMLEFT" , GRM_MemberDetailMetaData , "BOTTOMRIGHT" ,  2 , 0 )
			AS:SkinEditBox(GRM_AddAltEditBox, 120, 15)
			AS:SkinEditBox(GRM_PlayerNoteEditBox)
			AS:SkinEditBox(GRM_PlayerOfficerNoteEditBox)

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
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 35 , 5 )
				end

				CommunitiesFrame.GuildMemberDetailFrame:HookScript ( "OnShow" , function( self )
					self:ClearAllPoints();
					self:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 34 , 0 )
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , self , "TOPRIGHT" , 2 , 0.5 )
				end)

				CommunitiesFrame.GuildMemberDetailFrame:HookScript ( "OnHide" , function( self )
					GRM_MemberDetailMetaData:ClearAllPoints()
					GRM_MemberDetailMetaData:SetPoint ( "TOPLEFT" , CommunitiesFrame , "TOPRIGHT" , 34 , 5 )
				end)

			end

			AS:SkinFrame(GRM_PlayerNoteWindow)
			AS:SkinFrame(GRM_PlayerOfficerNoteWindow)
			AS:SkinFrame(GRM_SyncJoinDateSideFrame)
			AS:SkinFrame(GRM_CustomNoteEditBoxFrame)
			AS:SkinFrame(GRM_altDropDownOptions)
			AS:SkinFrame(GRM_DropDownList1AttachmentFrame)
			AS:SkinFrame(GRM_PopupWindow)
			AS:SkinFrame(GRM_MemberDetailEditBoxFrame)
			AS:SkinCheckBox(GRM_PopupWindowCheckButton1)
			AS:SkinCheckBox(GRM_PopupWindowCheckButton2)
			-- Ban Popup Frames

			AS:SkinFrame(GRM_MemberDetailRankToolTip)
			AS:SkinFrame(GRM_MemberDetailJoinDateToolTip)
			AS:SkinFrame(GRM_MemberDetailServerNameToolTip)
			AS:SkinFrame(GRM_MemberDetailNotifyStatusChangeTooltip)
			AS:SkinFrame(GRM_MemberDetailNJDSyncTooltip)

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
			GRM_UI.GRM_MemberDetailMetaData.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltTitleText:SetFont ( GRM_G.FontChoice , GRM_G.FontModifier + 11 , "NONE" );

			-- Tooltip Scaling should be a bit bigger
			GRM_MemberDetailNJDSyncTooltip:SetScale ( 0.85 )
			GRM_MemberDetailNotifyStatusChangeTooltip:SetScale ( 0.85 )
			C_Timer.After ( 0.5 , function()
				GRM_MemberDetailMetaDataCloseButton:SetPoint( "TOPRIGHT" , GRM_UI.GRM_MemberDetailMetaData , "TOPRIGHT" , 0 , 0 );
			end);

			-- Ignore Macro
			skinMacroIgnoreLists()

			-- Need to update textures
			GRM_UI.GRM_MemberDetailMetaData.GRM_HordeIconTexture:SetTexture ( "Interface\\AddOns\\Guild_Roster_Manager\\media\\Icons\\Horde_Icon.blp" );
			GRM_UI.GRM_MemberDetailMetaData.GRM_AllianceIconTexture:SetTexture ( "Interface\\AddOns\\Guild_Roster_Manager\\media\\Icons\\Alliance_Icon.blp" );
			GRM_UI.GRM_MemberDetailMetaData.GRM_DeathTexture:SetTexture ( "Interface\\AddOns\\Guild_Roster_Manager\\media\\Icons\\dead.png" );

			isLoaded = true
		end
	end)

	GRM_RosterCheckBoxSideFrame:HookScript("OnShow" , function()
		if not isLoaded2 then
			-- MISC FRAMES
			GRM_LogTab:SetPoint ( "BOTTOMLEFT" , GRM_RosterChangeLogFrame , "TOPLEFT" , 0 , 1 )
			GRM_RosterCheckBoxSideFrame:SetPoint ( "TOPLEFT" , GRM_RosterChangeLogFrame , "TOPRIGHT" , 2 , 0 )
			GRM_AddBanNameSelectionEditBox:SetSize ( 129 , 20 )
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
			GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText2:SetPoint ( "TOP" , GRM_EventsFrame , 0 , 55 );

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
				if not isLoaded3 then
					isLoaded3 = true
					GRM_ExportLogScrollFrameSlider:SetPoint ( "TOPLEFT" , GRM_ExportLogScrollBorderFrame , "TOPRIGHT" , 0 , -17 )
				end
			end)

			GRM_LogEditBox:SetBackdrop ( nil )
			AS:SkinEditBox(GRM_LogEditBox)

			GRM_LogExtraOptionsFrame:HookScript ( "OnShow" , function()
				if not isLoaded4 then
					isLoaded4 = true;
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
			AS:SkinCheckBox(GRM_ScanOptionsAnniversaryAnnounce)
			AS:SkinCheckBox(GRM_ScanOptionsBirthdayAnnounce)
			AS:SkinFrame(GRM_RosterMinLvlOverlayNote)
			AS:SkinFrame(GRM_AutoTriggerTimeOverlayNote)
			AS:SkinCheckBox(GRM_AnnounceBdaysOnLoginButton)

			AS:SkinCheckBox(GRM_DeathsChannelEnabledCheckbox)
			AS:SkinCheckBox(GRM_HardcoreAddTagCheckbox)
			AS:SkinCheckBox(GRM_HardcoreAddTimeCheckbox)

			-- Classic Professions
			AS:SkinCheckBox(GRM_ProfAutoUpdateCheckbox)
			AS:SkinCheckBox(GRM_ProfReportUpdatesToChatCheckBox)
			AS:SkinButton(GRM_SetProfessionsToNoteButton)
			AS:SkinRadioButton(GRM_ProfNoteDestinationRadial1)
			AS:SkinRadioButton(GRM_ProfNoteDestinationRadial2)
			AS:SkinRadioButton(GRM_ProfNoteDestinationRadial3)

			isLoaded2 = true
		end
	end)

	-- Module Group Info - GRM dependent addon
	if AddonIsLoaded ( "Guild_Roster_Manager_Group_Info" ) then
		AS:SkinButton(GRM_GroupRulesButton)
		AS:SkinFrame(GRM_GroupButtonFrame)
		AS:SkinCloseButton(GRM_GroupButtonFrameCloseButton)
	end

	-- GRM is compartmentalized and certain frame objects only load on demand. AddOnSkins needs to check if these are loaded first before processing
	local WaitForLoad;
	WaitForLoad = function ( load1 , load2 , load3 , load4 , load5 , load6 )

		if load1 and GRM_EnableMouseOver then
			load1 = false
			AS:SkinCheckBox(GRM_EnableMouseOver)
		end

		if load2 and GRM_RosterTab and CommunitiesFrame then
			AS:SkinButton (GRM_RosterTab)
			GRM_RosterTab:SetSize ( 32,32 )
			GRM_RosterTab:SetPoint( "TOP" , CommunitiesFrame.GuildInfoTab , "BOTTOM" , 0 , -20 )
			load2 = false;
		end

		if load3 and GRM_RosterFrame then
			load3 = false;

			GRM_RosterFrame:HookScript ( "OnShow" , function()
				SkinNewRoster()
				GRM_RosterFrame:SetScript ( "OnShow" , nil );
				GRM_RosterFrame:SetScript ( "OnShow" , GRM_UI.RosterFrameSetScript );
			end);
		end

		if load4 then

			if GRM_HardcoreTab then
				load4 = false;
				GRM_CustomUI_API_DelayLoad()
			end
		end

		if load5 then
			if GRM_ExportLogBorderFrame and GRM_ExportLogBorderFrame:GetScript("OnShow") then	-- Slight delay before script is set, so need to make sure first

				GRM_ExportLogBorderFrame:HookScript ( "OnShow" , function()
					SkinExportWindow();
					GRM_ExportLogBorderFrame:SetScript ( "OnShow" , nil );
					GRM_ExportLogBorderFrame:SetScript ( "OnShow" , GRM_UI.SetExportTabHighlights );
				end)

				load5 = false;
			end
		end

		if load6 then
			if GRM_ModulesFrame and GRM_ModulesFrame:GetScript ( "OnShow" ) then
				GRM_ModulesFrame:HookScript ( "OnShow" , function()
					skinModules();
					GRM_ModulesFrame:SetScript ( "OnShow" , nil );
					GRM_ModulesFrame:SetScript ( "OnShow" , GRM_UI.LoadModulesFrameOnShow );
				end)

				load6 = false;
			end
		end

		if load1 or load2 or load3 or load4 or load5 or load6 then
			C_Timer.After ( 5 , function()
				WaitForLoad( load1 , load2 , load3 , load4 , load5 , load6 )
				return;
			end)
		end

	end

	WaitForLoad ( true , true , true , true , true , true );

end

AS:RegisterSkin('Guild_Roster_Manager', AS.GuildRosterManager)
