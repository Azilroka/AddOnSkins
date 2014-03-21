local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AskMrRobot') then return end

local name = 'AskMrRobotSkin'
function AS:SkinAskMrRobot(event, addon)
	AS:SkinFrame(AskMrRobot_Dialog)
	AS:SkinCloseButton(AskMrRobot_Dialog.CloseButton)
	AskMrRobot_Dialog:HookScript('OnShow', function(self)
		if self.IsSkinned then return end
		AS:SkinButton(AmrImportButton)
		AS:SkinBackdropFrame(AmrScrollFrame)
		AS:SkinBackdropFrame(AmrImportScrollFrame)
		AS:SkinBackdropFrame(AmrExportManual:GetParent().txtExportString)
		AmrScrollFrameScrollBar.Show = AmrScrollFrameScrollBar.Hide
		AS:SkinButton(AmrExportManual)
		AS:SkinButton(AmrExportAuto)
		AS:SkinButton(AmrExportFile)
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
		self.IsSkinned = true
	end)
end

AS:RegisterSkin(name, AS.SkinAskMrRobot)
