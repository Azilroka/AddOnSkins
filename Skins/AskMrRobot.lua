local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AskMrRobot') then return end

function AS:AskMrRobot(event, addon)
	AS:SkinFrame(AskMrRobot_Dialog)
	AS:SkinCloseButton(AskMrRobot_Dialog.CloseButton)
	AskMrRobot_Dialog:HookScript('OnShow', function(self)
		if self.IsSkinned then return end
		AS:SkinButton(AmrImportButton)
        AS:SkinBackdropFrame(AmrScrollFrame)
        AS:SkinBackdropFrame(AmrImportScrollFrame)  
        AmrScrollFrameScrollBar.Show = AmrScrollFrameScrollBar.Hide
        AS:SkinButton(AmrUpdateExportString)
        AS:SkinButton(AmrCombatLogStart)
        AS:SkinButton(AmrCombatLogWipe)
        AS:SkinButton(AmrCombatLogSaveCharData)
        AS:SkinButton(AmrAutoGemButton)
        AS:SkinButton(AmrSendButton)
        AS:SkinDropDownBox(AmrSendType)
        AS:SkinCheckBox(AmrUsePerfectButton)
        AS:SkinCheckBox(AmrEnchantMaterialsCheckbox)
        AS:SkinCheckBox(AmrEnchantsCheckbox)
        AS:SkinCheckBox(AmrGemsCheckbox)
        AS:SkinButton(AmrUpdateExportString)
        AS:SkinTab(GearComparisonTab1)
        AS:SkinTab(GearComparisonTab2)
        AS:SkinTab(GearComparisonTab3)
        AS:SkinTab(GearComparisonTab4)
        AS:SkinTab(GearComparisonTab5)
		self.IsSkinned = true
	end)
end

AS:RegisterSkin('AskMrRobot', AS.AskMrRobot)
