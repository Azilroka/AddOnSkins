local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Soundtrack') then return end

function AS:Soundtrack()
	local frames = {
		'SoundtrackFrame',
		'SoundtrackFrameEventList',
		'SoundtrackFrameTrackList',
		'SoundtrackFrame_AssignedFrame',
		'SoundtrackReportFrame',
	}

	local buttons = {
		'SoundtrackFrame_CloseButton',
		'SoundtrackFrameCopyCopiedTracksButton',
		'SoundtrackFramePasteCopiedTracksButton',
		'SoundtrackFrameClearCopiedTracksButton',
		'SoundtrackFrameMoveUp',
		'SoundtrackFrameMoveDown',
		'SoundtrackFrameClearButton',
		'SoundtrackFrameAllButton',
		'SoundtrackFrameDeleteTargetButton',
		'SoundtrackFrameAddBossTargetButton',
		'SoundtrackFrameAddWorldBossTargetButton',
		'SoundtrackFrameRemoveZoneButton',
		'SoundtrackFrameAddZoneButton',
		'SoundtrackFrameDeletePetBattlesTargetButton',
		'SoundtrackFrameAddPetBattlesTargetButton',
		'SoundtrackFrameDeleteCustomEventButton',
		'SoundtrackFrameAddCustomEventButton',
		'SoundtrackFrameEditCustomEventButton',
		'SoundtrackFrameDeletePlaylistButton',
		'SoundtrackFrameAddPlaylistButton',
		'SoundtrackFrame_LoadProject',
		'SoundtrackFrame_RemoveProject',
		'SoundtrackReportFrame_Say',
		'SoundtrackReportFrame_Party',
		'SoundtrackReportFrame_Guild',
		'SoundtrackReportFrame_Whisper',
		'SoundtrackReportFrame_Channel',
		'SoundtrackReportFrame_Cancel',
	}

	local cboxes = {
		'SoundtrackFrame_EnableMinimapButton',
		'SoundtrackFrame_ShowPlaybackControls',
		'SoundtrackFrame_LockPlaybackControls',
		'SoundtrackFrame_ShowTrackInformation',
		'SoundtrackFrame_LockNowPlayingFrame',
		'SoundtrackFrame_ShowDefaultMusic',
		'SoundtrackFrame_HidePlaybackButtons',
		'SoundtrackFrame_AutoAddZones',
		'SoundtrackFrame_AutoEscalateBattleMusic',
		'SoundtrackFrame_YourEnemyLevelOnly',
		'SoundtrackFrame_LoopMusic',
		'SoundtrackFrame_EnableMusic',
		'SoundtrackFrame_EnableZoneMusic',
		'SoundtrackFrame_EnableBattleMusic',
		'SoundtrackFrame_EnableMiscMusic',
		'SoundtrackFrame_EnableCustomMusic',
		'SoundtrackFrame_EnableDebugMode',
		'SoundtrackFrame_ShowEventStack',
		'SoundtrackFrameTrackButton1CheckBox',
		'SoundtrackFrameTrackButton2CheckBox',
		'SoundtrackFrameTrackButton3CheckBox',
		'SoundtrackFrameTrackButton4CheckBox',
		'SoundtrackFrameTrackButton5CheckBox',
		'SoundtrackFrameTrackButton6CheckBox',
		'SoundtrackFrameTrackButton7CheckBox',
		'SoundtrackFrameTrackButton8CheckBox',
		'SoundtrackFrameTrackButton9CheckBox',
		'SoundtrackFrameTrackButton10CheckBox',
		'SoundtrackFrameTrackButton11CheckBox',
		'SoundtrackFrameTrackButton12CheckBox',
		'SoundtrackFrameTrackButton13CheckBox',
		'SoundtrackFrameTrackButton14CheckBox',
		'SoundtrackFrameTrackButton15CheckBox',
		'SoundtrackAssignedTrackButton1CheckBox',
		'SoundtrackAssignedTrackButton2CheckBox',
		'SoundtrackAssignedTrackButton3CheckBox',
		'SoundtrackAssignedTrackButton4CheckBox',
		'SoundtrackAssignedTrackButton5CheckBox',
		'SoundtrackAssignedTrackButton6CheckBox',
	}

	for _, object in pairs(frames) do
		if _G[object] then
			AS:SkinFrame(_G[object])
		end
	end

	for _, object in pairs(buttons) do
		if _G[object] then
			AS:SkinButton(_G[object])
		end
	end

	for _, object in pairs(cboxes) do
		if _G[object] then
			AS:SkinCheckBox(_G[object])
		end
	end

	for i = 1, 10 do
		AS:SkinTab(_G['SoundtrackFrameTab'..i])
	end

	SoundtrackFrameTab1:SetPoint('TOPLEFT', SoundtrackFrame, 'BOTTOMLEFT', 10, 2)

	AS:SkinCloseButton(SoundtrackFrame_CloseButton)
	AS:SkinStatusBar(SoundtrackFrame_StatusBarTrack)
	AS:Kill(SoundtrackFrame_StatusBarTrackBorder)
	AS:SkinStatusBar(SoundtrackFrame_StatusBarEvent)
	AS:Kill(SoundtrackFrame_StatusBarEventBorder)
	AS:StripTextures(SoundtrackFrame_TrackFilter)
	SoundtrackFrame_TrackFilter:SetHeight(18)
	AS:SkinEditBox(SoundtrackFrame_TrackFilter)
	AS:SkinBackdropFrame(NowPlayingTextFrame)
	AS:SkinScrollBar(SoundtrackFrameTrackScrollFrameScrollBar)
	AS:SkinScrollBar(SoundtrackFrameAssignedTracksScrollFrameScrollBar)
	AS:SkinScrollBar(SoundtrackFrameEventScrollFrameScrollBar)
	AS:SkinDropDownBox(SoundtrackFrame_ColumnHeaderNameDropDown)
	AS:SkinDropDownBox(SoundtrackFrame_PlaybackButtonsLocationDropDown)
	AS:SkinDropDownBox(SoundtrackFrame_BattleCooldownDropDown)
	AS:SkinDropDownBox(SoundtrackFrame_LowHealthPercentDropDown)
	AS:SkinDropDownBox(SoundtrackFrame_SilenceDropDown)
	AS:SkinBackdropFrame(SoundtrackControlFrame)
	AS:SkinStatusBar(SoundtrackControlFrame_StatusBarTrack)
	AS:Kill(SoundtrackControlFrame_StatusBarTrackBorder)
	AS:SkinStatusBar(SoundtrackControlFrame_StatusBarEvent)
	AS:Kill(SoundtrackControlFrame_StatusBarEventBorder)
	AS:SkinEditBox(SoundtrackReportFrame_WhisperEditBox)
	AS:SkinEditBox(SoundtrackReportFrame_ChannelEditBox)

	AS:SkinTooltip(SoundtrackTooltip)
	NowPlayingTextFrame:Show()
	NowPlayingTextFrame:Hide()
	NowPlayingTextFrame:SetSize(200, 40)
end

AS:RegisterSkin('Soundtrack', AS.Soundtrack)
