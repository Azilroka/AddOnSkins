
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "MRTSkin"
local function SkinMRT(self)
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
		AS:SkinFrame(_G["ScrollTable"..i])
		_G["ScrollTable"..i.."ScrollFrameScrollBar"]:StripTextures(true)
		AS:SkinScrollBar(_G["ScrollTable"..i.."ScrollFrameScrollBar"])
	end

	MRT_GUI_ItemTT:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
	MRT_GUI_TT:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
end

AS:RegisterSkin(name,SkinMRT)