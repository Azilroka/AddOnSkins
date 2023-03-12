local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('MizusRaidTracker') then return end

function R:MizusRaidTracker()
	S:HandleFrame(MRT_GUIFrame)
	S:HandleFrame(MRT_GUI_FourRowDialog)
	S:HandleCloseButton(MRT_GUIFrame_CloseButton)
	S:HandleButton(MRT_GUIFrame_RaidLog_Export_Button)
	S:HandleButton(MRT_GUIFrame_RaidLog_Delete_Button)
	S:HandleButton(MRT_GUIFrame_RaidLog_ExportNormal_Button)
	S:HandleButton(MRT_GUIFrame_RaidLog_ExportHeroic_Button)
	S:HandleButton(MRT_GUIFrame_RaidBosskills_Add_Button)
	S:HandleButton(MRT_GUIFrame_RaidBosskills_Delete_Button)
	S:HandleButton(MRT_GUIFrame_RaidBosskills_Export_Button)
	S:HandleButton(MRT_GUIFrame_RaidAttendees_Add_Button)
	S:HandleButton(MRT_GUIFrame_RaidAttendees_Delete_Button)
	S:HandleButton(MRT_GUIFrame_TakeSnapshot_Button)
	S:HandleButton(MRT_GUIFrame_StartNewRaid_Button)
	S:HandleButton(MRT_GUIFrame_MakeAttendanceCheck_Button)
	S:HandleButton(MRT_GUIFrame_EndCurrentRaid_Button)
	S:HandleButton(MRT_GUIFrame_ResumeLastRaid_Button)
	S:HandleButton(MRT_GUIFrame_BossLoot_Add_Button)
	S:HandleButton(MRT_GUIFrame_BossLoot_Modify_Button)
	S:HandleButton(MRT_GUIFrame_BossLoot_Delete_Button)
	S:HandleButton(MRT_GUIFrame_BossAttendees_Add_Button)
	S:HandleButton(MRT_GUIFrame_BossAttendees_Delete_Button)
	S:HandleButton(MRT_GUI_FourRowDialog_OKButton)
	S:HandleButton(MRT_GUI_FourRowDialog_CancelButton)
	for i = 1, 6 do
		S:HandleFrame(_G['ScrollTable'..i])
		S:StripTextures(_G['ScrollTable'..i..'ScrollFrameScrollBar'], true)
		S:HandleScrollBar(_G['ScrollTable'..i..'ScrollFrameScrollBar'])
	end
	S:HandleTooltip(MRT_GUI_ItemTT)
	S:HandleTooltip(MRT_GUI_TT)
end

AS:RegisterSkin('MizusRaidTracker', R.MizusRaidTracker)
