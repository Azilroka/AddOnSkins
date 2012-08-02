if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("MizusRaidTracker") then return end
local SkinMRT = CreateFrame("Frame")
	SkinMRT:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinMRT:SetScript("OnEvent", function(self)
	if (UISkinOptions.MRTSkin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	MRT_GUIFrame:StripTextures(True)
	MRT_GUIFrame:SetTemplate("Transparent")
	MRT_GUI_FourRowDialog:StripTextures(True)
	MRT_GUI_FourRowDialog:SetTemplate("Transparent")
	cSkinCloseButton(MRT_GUIFrame_CloseButton)
	cSkinButton(MRT_GUIFrame_RaidLog_Export_Button)
	cSkinButton(MRT_GUIFrame_RaidLog_Delete_Button)
	cSkinButton(MRT_GUIFrame_RaidLog_ExportNormal_Button)
	cSkinButton(MRT_GUIFrame_RaidLog_ExportHeroic_Button)
	cSkinButton(MRT_GUIFrame_RaidBosskills_Add_Button)
	cSkinButton(MRT_GUIFrame_RaidBosskills_Delete_Button)
	cSkinButton(MRT_GUIFrame_RaidBosskills_Export_Button)
	cSkinButton(MRT_GUIFrame_RaidAttendees_Add_Button)
	cSkinButton(MRT_GUIFrame_RaidAttendees_Delete_Button)
	cSkinButton(MRT_GUIFrame_TakeSnapshot_Button)
	cSkinButton(MRT_GUIFrame_StartNewRaid_Button)
	cSkinButton(MRT_GUIFrame_MakeAttendanceCheck_Button)
	cSkinButton(MRT_GUIFrame_EndCurrentRaid_Button)
	cSkinButton(MRT_GUIFrame_ResumeLastRaid_Button)
	cSkinButton(MRT_GUIFrame_BossLoot_Add_Button)
	cSkinButton(MRT_GUIFrame_BossLoot_Modify_Button)
	cSkinButton(MRT_GUIFrame_BossLoot_Delete_Button)
	cSkinButton(MRT_GUIFrame_BossAttendees_Add_Button)
	cSkinButton(MRT_GUIFrame_BossAttendees_Delete_Button)
	cSkinButton(MRT_GUI_FourRowDialog_OKButton)
	cSkinButton(MRT_GUI_FourRowDialog_CancelButton)

	for i = 1, 6 do
		_G["ScrollTable"..i]:StripTextures(True)
		_G["ScrollTable"..i]:SetTemplate("Transparent")
		_G["ScrollTable"..i.."ScrollFrameScrollBar"]:StripTextures(true)
		cSkinScrollBar(_G["ScrollTable"..i.."ScrollFrameScrollBar"])
	end

	MRT_GUI_ItemTT:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
	MRT_GUI_TT:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
end)