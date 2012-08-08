if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("GearScore") then return end
local SkinPlayerScore = CreateFrame("Frame")
	SkinPlayerScore:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinPlayerScore:SetScript("OnEvent", function(self)
	if (UISkinOptions.PlayScoreSkin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	cSkinFrame(TenTonHammer)
	cSkinFrame(TenTonHammer_TitleFrame)
	cSkinFrame(TenTonHammer_QuickRateFrame)
	cSkinFrame(TenTonHammer_EquipmentFrame_Model)
	TTH_InspectPVPFrame:StripTextures(True)

	TenTonHammerTab1:Point("TOPLEFT", TenTonHammer, "BOTTOMLEFT", 0, 2)
	TenTonHammerTab6:Point("TOPRIGHT", TenTonHammer, "BOTTOMRIGHT", 0, 2)
	TenTonHammer_TitleFrame:Point("TOPLEFT", TenTonHammer, "TOPLEFT", 160, 65)
	TenTonHammer_Frame6_Slider_ApplyButton:Point("TOPLEFT", TenTonHammer_Frame6_Slider, "TOPLEFT", -2, -25)

	cSkinCloseButton(TenTonHammer_ExitButton)
	cSkinRotateButton(TenTonHammer_EquipmentFrame_Model_RotateLeftButton)
	cSkinRotateButton(TenTonHammer_EquipmentFrame_Model_RotateRightButton)

	if _G["TenTonHammer_Frame6_Slider_ApplyButton"] then cSkinButton(_G["TenTonHammer_Frame6_Slider_ApplyButton"]) end
	if _G["TenTonHammer_Frame6_Check_Inspect"] then cSkinCheckBox(_G["TenTonHammer_Frame6_Check_Inspect"]) end
	if _G["TenTonHammer_Frame6_Check_Database"] then cSkinCheckBox(_G["TenTonHammer_Frame6_Check_Database"]) end
	if _G["TenTonHammer_Frame6_Check_Updater"] then cSkinCheckBox(_G["TenTonHammer_Frame6_Check_Updater"]) end

	for i = 1, 11 do
		if _G["TenTonHammer_Frame6_Check"..i] then cSkinCheckBox(_G["TenTonHammer_Frame6_Check"..i]) end
		if _G["TenTonHammer_Frame6_Check2_"..i] then cSkinCheckBox(_G["TenTonHammer_Frame6_Check2_"..i]) end
		if _G["TenTonHammer_Frame6_Checky"..i] then cSkinCheckBox(_G["TenTonHammer_Frame6_Checky"..i]) end
	end

	for i = 1, 10 do
		if _G["TenTonHammerTab"..i] then cSkinTab(_G["TenTonHammerTab"..i]) end
		if _G["TenTonHammer_MainButton"..i] then cSkinButton(_G["TenTonHammer_MainButton"..i]) _G["TenTonHammer_MainButton"..i]:SetFrameStrata("HIGH") end
	end

end)