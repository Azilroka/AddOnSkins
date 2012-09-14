if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("MizusRaidTracker") then return end
local U = unpack(select(2,...))
local name = "MRTSkin"
local function SkinMRT(self)
	local s = U.s
	local c = U.c

	U.SkinFrame(MRT_GUIFrame)
	U.SkinFrame(MRT_GUI_FourRowDialog)
	U.SkinCloseButton(MRT_GUIFrame_CloseButton)
	U.SkinButton(MRT_GUIFrame_RaidLog_Export_Button)
	U.SkinButton(MRT_GUIFrame_RaidLog_Delete_Button)
	U.SkinButton(MRT_GUIFrame_RaidLog_ExportNormal_Button)
	U.SkinButton(MRT_GUIFrame_RaidLog_ExportHeroic_Button)
	U.SkinButton(MRT_GUIFrame_RaidBosskills_Add_Button)
	U.SkinButton(MRT_GUIFrame_RaidBosskills_Delete_Button)
	U.SkinButton(MRT_GUIFrame_RaidBosskills_Export_Button)
	U.SkinButton(MRT_GUIFrame_RaidAttendees_Add_Button)
	U.SkinButton(MRT_GUIFrame_RaidAttendees_Delete_Button)
	U.SkinButton(MRT_GUIFrame_TakeSnapshot_Button)
	U.SkinButton(MRT_GUIFrame_StartNewRaid_Button)
	U.SkinButton(MRT_GUIFrame_MakeAttendanceCheck_Button)
	U.SkinButton(MRT_GUIFrame_EndCurrentRaid_Button)
	U.SkinButton(MRT_GUIFrame_ResumeLastRaid_Button)
	U.SkinButton(MRT_GUIFrame_BossLoot_Add_Button)
	U.SkinButton(MRT_GUIFrame_BossLoot_Modify_Button)
	U.SkinButton(MRT_GUIFrame_BossLoot_Delete_Button)
	U.SkinButton(MRT_GUIFrame_BossAttendees_Add_Button)
	U.SkinButton(MRT_GUIFrame_BossAttendees_Delete_Button)
	U.SkinButton(MRT_GUI_FourRowDialog_OKButton)
	U.SkinButton(MRT_GUI_FourRowDialog_CancelButton)

	for i = 1, 6 do
		U.SkinFrame(_G["ScrollTable"..i])
		_G["ScrollTable"..i.."ScrollFrameScrollBar"]:StripTextures(true)
		U.SkinScrollBar(_G["ScrollTable"..i.."ScrollFrameScrollBar"])
	end

	MRT_GUI_ItemTT:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
	MRT_GUI_TT:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
end

U.RegisterSkin(name,SkinMRT)