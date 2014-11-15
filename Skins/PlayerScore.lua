local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GearScore') then return end

function AS:GearScore(event, addon)
	AS:SkinFrame(TenTonHammer)
	AS:SkinFrame(TenTonHammer_TitleFrame)
	AS:SkinFrame(TenTonHammer_QuickRateFrame)
	AS:SkinFrame(TenTonHammer_EquipmentFrame_Model)
	AS:StripTextures(TTH_InspectPVPFrame, true)
	TenTonHammerTab1:Point('TOPLEFT', TenTonHammer, 'BOTTOMLEFT', 0, 2)
	TenTonHammerTab6:Point('TOPRIGHT', TenTonHammer, 'BOTTOMRIGHT', 0, 2)
	TenTonHammer_TitleFrame:Point('TOPLEFT', TenTonHammer, 'TOPLEFT', 160, 65)
	TenTonHammer_Frame6_Slider_ApplyButton:Point('TOPLEFT', TenTonHammer_Frame6_Slider, 'TOPLEFT', -2, -25)
	AS:SkinCloseButton(TenTonHammer_ExitButton)
	AS:SkinRotateButton(TenTonHammer_EquipmentFrame_Model_RotateLeftButton)
	AS:SkinRotateButton(TenTonHammer_EquipmentFrame_Model_RotateRightButton)
	if _G['TenTonHammer_Frame6_Slider_ApplyButton'] then AS:SkinButton(_G['TenTonHammer_Frame6_Slider_ApplyButton']) end
	if _G['TenTonHammer_Frame6_Check_Inspect'] then AS:SkinCheckBox(_G['TenTonHammer_Frame6_Check_Inspect']) end
	if _G['TenTonHammer_Frame6_Check_Database'] then AS:SkinCheckBox(_G['TenTonHammer_Frame6_Check_Database']) end
	if _G['TenTonHammer_Frame6_Check_Updater'] then AS:SkinCheckBox(_G['TenTonHammer_Frame6_Check_Updater']) end
	for i = 1, 11 do
		if _G['TenTonHammer_Frame6_Check'..i] then AS:SkinCheckBox(_G['TenTonHammer_Frame6_Check'..i]) end
		if _G['TenTonHammer_Frame6_Check2_'..i] then AS:SkinCheckBox(_G['TenTonHammer_Frame6_Check2_'..i]) end
		if _G['TenTonHammer_Frame6_Checky'..i] then AS:SkinCheckBox(_G['TenTonHammer_Frame6_Checky'..i]) end
	end
	for i = 1, 10 do
		if _G['TenTonHammerTab'..i] then AS:SkinTab(_G['TenTonHammerTab'..i]) end
		if _G['TenTonHammer_MainButton'..i] then AS:SkinButton(_G['TenTonHammer_MainButton'..i]) _G['TenTonHammer_MainButton'..i]:SetFrameStrata('HIGH') end
	end
end

AS:RegisterSkin('GearScore', AS.GearScore)