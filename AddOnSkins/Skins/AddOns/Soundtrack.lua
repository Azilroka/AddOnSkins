local AS, L, S, R = unpack(AddOnSkins)

function R:Soundtrack()
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
			S:HandleFrame(_G[object])
		end
	end

	for _, object in pairs(buttons) do
		if _G[object] then
			S:HandleButton(_G[object])
		end
	end

	for _, object in pairs(cboxes) do
		if _G[object] then
			S:HandleCheckBox(_G[object])
		end
	end

	for i = 1, 10 do
		S:HandleTab(_G['SoundtrackFrameTab'..i])
	end

	SoundtrackFrameTab1:SetPoint('TOPLEFT', SoundtrackFrame, 'BOTTOMLEFT', 10, 2)

	S:HandleCloseButton(SoundtrackFrame_CloseButton)
	S:HandleStatusBar(SoundtrackFrame_StatusBarTrack)
	S:Kill(SoundtrackFrame_StatusBarTrackBorder)
	S:HandleStatusBar(SoundtrackFrame_StatusBarEvent)
	S:Kill(SoundtrackFrame_StatusBarEventBorder)
	S:StripTextures(SoundtrackFrame_TrackFilter)
	SoundtrackFrame_TrackFilter:SetHeight(18)
	S:HandleEditBox(SoundtrackFrame_TrackFilter)
	S:HandleFrame(NowPlayingTextFrame, true)
	S:HandleScrollBar(SoundtrackFrameTrackScrollFrameScrollBar)
	S:HandleScrollBar(SoundtrackFrameAssignedTracksScrollFrameScrollBar)
	S:HandleScrollBar(SoundtrackFrameEventScrollFrameScrollBar)
	S:HandleDropDownBox(SoundtrackFrame_ColumnHeaderNameDropDown)
	S:HandleDropDownBox(SoundtrackFrame_PlaybackButtonsLocationDropDown)
	S:HandleDropDownBox(SoundtrackFrame_BattleCooldownDropDown)
	S:HandleDropDownBox(SoundtrackFrame_LowHealthPercentDropDown)
	S:HandleDropDownBox(SoundtrackFrame_SilenceDropDown)
	S:HandleFrame(SoundtrackControlFrame, true)
	S:HandleStatusBar(SoundtrackControlFrame_StatusBarTrack)
	S:Kill(SoundtrackControlFrame_StatusBarTrackBorder)
	S:HandleStatusBar(SoundtrackControlFrame_StatusBarEvent)
	S:Kill(SoundtrackControlFrame_StatusBarEventBorder)
	S:HandleEditBox(SoundtrackReportFrame_WhisperEditBox)
	S:HandleEditBox(SoundtrackReportFrame_ChannelEditBox)

	S:HandleTooltip(SoundtrackTooltip)
	NowPlayingTextFrame:Show()
	NowPlayingTextFrame:Hide()
	NowPlayingTextFrame:SetSize(200, 40)
end

AS:RegisterSkin('Soundtrack')
