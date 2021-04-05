local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MizusRaidTracker') then return end

function AS:MizusRaidTracker()
	AS:SkinFrame(MRT_GUIFrame)
	AS:SkinFrame(MRT_GUI_FourRowDialog)
	AS:SkinCloseButton(MRT_GUIFrame_CloseButton)
	AS:SkinButton(MRT_GUIFrame_RaidLog_Export_Button)
	AS:SkinButton(MRT_GUIFrame_RaidLog_Delete_Button)
	AS:SkinButton(MRT_GUIFrame_RaidLog_ExportNormal_Button)
	AS:SkinButton(MRT_GUIFrame_RaidLog_ExportHeroic_Button)
	AS:SkinButton(MRT_GUIFrame_RaidBosskills_Add_Button)
	AS:SkinButton(MRT_GUIFrame_RaidBosskills_Delete_Button)
	AS:SkinButton(MRT_GUIFrame_RaidBosskills_Export_Button)
	AS:SkinButton(MRT_GUIFrame_RaidAttendees_Add_Button)
	AS:SkinButton(MRT_GUIFrame_RaidAttendees_Delete_Button)
	AS:SkinButton(MRT_GUIFrame_TakeSnapshot_Button)
	AS:SkinButton(MRT_GUIFrame_StartNewRaid_Button)
	AS:SkinButton(MRT_GUIFrame_MakeAttendanceCheck_Button)
	AS:SkinButton(MRT_GUIFrame_EndCurrentRaid_Button)
	AS:SkinButton(MRT_GUIFrame_ResumeLastRaid_Button)
	AS:SkinButton(MRT_GUIFrame_BossLoot_Add_Button)
	AS:SkinButton(MRT_GUIFrame_BossLoot_Modify_Button)
	AS:SkinButton(MRT_GUIFrame_BossLoot_Delete_Button)
	AS:SkinButton(MRT_GUIFrame_BossAttendees_Add_Button)
	AS:SkinButton(MRT_GUIFrame_BossAttendees_Delete_Button)
	AS:SkinButton(MRT_GUI_FourRowDialog_OKButton)
	AS:SkinButton(MRT_GUI_FourRowDialog_CancelButton)
	for i = 1, 6 do
		AS:SkinFrame(_G['ScrollTable'..i])
		AS:StripTextures(_G['ScrollTable'..i..'ScrollFrameScrollBar'], true)
		AS:SkinScrollBar(_G['ScrollTable'..i..'ScrollFrameScrollBar'])
	end
	AS:SkinTooltip(MRT_GUI_ItemTT)
	AS:SkinTooltip(MRT_GUI_TT)
end

AS:RegisterSkin('MizusRaidTracker', AS.MizusRaidTracker)