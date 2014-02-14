local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AskMrRobot') then return end

local name = 'AskMrRobotSkin'
function AS:SkinAskMrRobot(event, addon)
	AS:SkinFrame(AskMrRobot_Dialog)
	AS:SkinCloseButton(AskMrRobot_DialogClose)
	AS:SkinButton(AmrImportButton)
	AS:SkinBackdropFrame(AmrScrollFrame)
	AmrScrollFrameScrollBar.Show = AmrScrollFrameScrollBar.Hide
	AS:SkinButton(AmrExportManual)
	AS:SkinButton(AmrExportAuto)
	AS:SkinButton(AmrUpdateExportString)
	AS:SkinButton(AmrCombatLogStart)
	AS:SkinButton(AmrCombatLogEnd)
	AS:SkinButton(AmrAutoGemButton)
	AS:SkinButton(AmrReforgeButton)
	AS:SkinButton(AmrSendButton)
	AS:SkinDropDownBox(AmrSendType)
	AS:SkinCheckBox(AmrUsePerfectButton)
	AS:SkinCheckBox(AmrEnchantMaterialsCheckbox)
	AS:SkinCheckBox(AmrEnchantsCheckbox)
	AS:SkinCheckBox(AmrGemsCheckbox)
end

AS:RegisterSkin(name, AS.SkinAskMrRobot)
