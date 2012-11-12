
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

LoadAddOn("PowerAurasOptions")


local function SkinPowerAuras(self, aura, elapsed)
	local returnValue = PowaAuras.OldUpdateAura(self, aura, elapsed)
	
	if (aura == nil) or (aura.off) then
		return false;
	end

	if (aura.Showing) then
		local frame = aura:GetFrame();
		if (frame == nil) then
			return false;
		end
		
		if frame and not frame.backdrop then
			frame:CreateBackdrop('Default')
			frame.backdrop:Hide()
		end
		
		if frame and aura.owntex then
			local texture = aura:GetTexture()
			if not frame.backdrop:IsShown() then
				frame.backdrop:Show()
			end
			texture:SetTexCoord(0.08, 0.92, 0.08, 0.92)
		elseif frame and frame.backdrop:IsShown() then
			frame.backdrop:Hide()
		end
	end
	
	return returnValue
end

	local function PowerAuras_LoadSkin()
		local name = "PowerAurasIconsSkin"
		local function SkinPowerAurasIcons(self)
			PowaAuras.OldUpdateAura = PowaAuras.UpdateAura
			PowaAuras.UpdateAura = SkinPowerAuras
		end
		AS:RegisterSkin(name,SkinPowerAurasIcons)
	end


local name = "PowerAurasSkin"
local function SkinPowerAuras(self)
	AS:SkinFrame(PowaOptionsFrame)
	AS:SkinFrame(PowaBarConfigFrame)
	AS:SkinFrame(PowaOptionsFrame)
	AS:SkinFrame(PowaBarConfigFrame)
	AS:SkinFrame(PowaAuraExportDialog)
	AS:SkinFrame(PowaAuraPlayerImportDialog)
	AS:SkinEditBox(PowaAuraExportDialogCopyBox)
	AS:SkinEditBox(PowaAuraExportDialogSendBox)
	AS:SkinEditBox(PowaBarCustomSound)
	AS:SkinEditBox(PowaBarCustomSoundEnd)

	AS:SkinCloseButton(PowaOptionsFrameCloseButton)
	AS:SkinCloseButton(PowaCloseButton)
	AS:SkinButton(PowaOptionsRename)
	AS:SkinButton(PowaOptionsSelectorNew)
	AS:SkinButton(PowaOptionsSelectorDelete)
	AS:SkinButton(PowaOptionsSelectorImport)
	AS:SkinButton(PowaOptionsSelectorExport)
	AS:SkinButton(PowaOptionsSelectorImportSet)
	AS:SkinButton(PowaOptionsSelectorExportSet)
	AS:SkinButton(PowaOptionsCopy)
	AS:SkinButton(PowaOptionsMove)
	AS:SkinButton(PowaMainLockButton)
	AS:SkinButton(PowaMainTestAllButton)
	AS:SkinButton(PowaMainTestButton)
	AS:SkinButton(PowaMainHideAllButton)
	AS:SkinButton(PowaEditButton)
	AS:SkinButton(PowaAuraExportDialogSendButton)
	AS:SkinButton(PowaAuraExportDialogCancelButton)
	AS:SkinButton(PowaAuraPlayerImportDialogAcceptButton)
	AS:SkinButton(PowaAuraPlayerImportDialogCancelButton)
	AS:SkinButton(PowaBarAuraTextureSliderMinus)
	AS:SkinButton(PowaBarAuraTextureSliderPlus)
	AS:SkinButton(PowaBarAuraSizeSliderMinus)
	AS:SkinButton(PowaBarAuraSizeSliderPlus)
	AS:SkinButton(PowaBarAuraCoordASliderMinus)
	AS:SkinButton(PowaBarAuraCoordASliderPlus)
	AS:SkinButton(PowaBarAuraCoordSliderMinus)
	AS:SkinButton(PowaBarAuraCoordSliderPlus)
	AS:SkinButton(PowaBarAuraAnimSpeedSliderPlus)
	AS:SkinButton(PowaBarAuraAnimSpeedSliderMinus)
	AS:SkinButton(PowaBarAuraDurationSliderMinus)
	AS:SkinButton(PowaBarAuraDurationSliderPlus)
	AS:SkinButton(PowaTimerCoordASliderMinus)
	AS:SkinButton(PowaTimerCoordASliderPlus)
	AS:SkinButton(PowaTimerCoordSliderMinus)
	AS:SkinButton(PowaTimerCoordSliderPlus)
	AS:SkinButton(PowaTimerSizeSliderMinus)
	AS:SkinButton(PowaTimerSizeSliderPlus)
	AS:SkinButton(PowaTimerAlphaSliderMinus)
	AS:SkinButton(PowaTimerAlphaSliderPlus)
	AS:SkinButton(PowaTimerInvertAuraSliderMinus)
	AS:SkinButton(PowaTimerInvertAuraSliderPlus)
	AS:SkinButton(PowaStacksCoordASliderMinus)
	AS:SkinButton(PowaStacksCoordASliderPlus)
	AS:SkinButton(PowaStacksCoordSliderMinus)
	AS:SkinButton(PowaStacksCoordSliderPlus)
	AS:SkinButton(PowaStacksSizeSliderMinus)
	AS:SkinButton(PowaStacksSizeSliderPlus)
	AS:SkinButton(PowaStacksAlphaSliderMinus)
	AS:SkinButton(PowaStacksAlphaSliderPlus)

	AS:SkinDropDownBox(PowaDropDownBuffType)
	AS:SkinDropDownBox(PowaDropDownAnimBegin)
	AS:SkinDropDownBox(PowaDropDownAnimEnd)
	AS:SkinDropDownBox(PowaDropDownAnim1)
	AS:SkinDropDownBox(PowaDropDownAnim2)
	AS:SkinDropDownBox(PowaDropDownSound)
	AS:SkinDropDownBox(PowaDropDownSound2)
	AS:SkinDropDownBox(PowaDropDownSoundEnd)
	AS:SkinDropDownBox(PowaDropDownSound2End)
	AS:SkinDropDownBox(PowaDropDownTimerTexture)
	AS:SkinDropDownBox(PowaBuffTimerRelative)
	AS:SkinDropDownBox(PowaDropDownStacksTexture)
	AS:SkinDropDownBox(PowaBuffStacksRelative)

	AS:SkinCheckBox(PowaShowStacksButton)
	AS:SkinCheckBox(PowaExactButton)
	AS:SkinCheckBox(PowaIngoreCaseButton)
	AS:SkinCheckBox(PowaInverseButton)
	AS:SkinCheckBox(PowaInCombatButton)
	AS:SkinCheckBox(PowaIsInPartyButton)
	AS:SkinCheckBox(PowaIsMountedButton)
	AS:SkinCheckBox(PowaTargetButton)
	AS:SkinCheckBox(PowaFocusButton)
	AS:SkinCheckBox(PowaPartyButton)
	AS:SkinCheckBox(PowaOptunitnButton)
	AS:SkinCheckBox(PowaTalentGroup1Button)
	AS:SkinCheckBox(PowaTalentGroup2Button)
	AS:SkinCheckBox(PowaMineButton)
	AS:SkinCheckBox(PowaRestingButton)
	AS:SkinCheckBox(PowaIsInRaidButton)
	AS:SkinCheckBox(PowaInVehicleButton)
	AS:SkinCheckBox(PowaTargetFriendButton)
	AS:SkinCheckBox(PowaGroupOrSelfButton)
	AS:SkinCheckBox(PowaRaidButton)
	AS:SkinCheckBox(PowaGroupAnyButton)
	AS:SkinCheckBox(PowaPvPButton)
	AS:SkinCheckBox(PowaIsAliveButton)
	AS:SkinCheckBox(Powa5ManInstanceButton)
	AS:SkinCheckBox(Powa5ManHeroicInstanceButton)
	AS:SkinCheckBox(Powa10ManInstanceButton)
	AS:SkinCheckBox(Powa10ManHeroicInstanceButton)
	AS:SkinCheckBox(Powa25ManInstanceButton)
	AS:SkinCheckBox(Powa25ManHeroicInstanceButton)
	AS:SkinCheckBox(PowaArenaInstanceButton)
	AS:SkinCheckBox(PowaBgInstanceButton)
	AS:SkinCheckBox(PowaRoleHealerButton)
	AS:SkinCheckBox(PowaRoleTankButton)
	AS:SkinCheckBox(PowaRoleMeleDpsButton)
	AS:SkinCheckBox(PowaRoleRangeDpsButton)
	AS:SkinCheckBox(PowaAuraDebugButton)
	AS:SkinCheckBox(PowaTexModeButton)
	AS:SkinCheckBox(PowaWowTextureButton)
	AS:SkinCheckBox(PowaCustomTextureButton)
	AS:SkinCheckBox(PowaTextAuraButton)
	AS:SkinCheckBox(PowaRandomColorButton)
	AS:SkinCheckBox(PowaShowSpinAtBeginning)
	AS:SkinCheckBox(PowaOldAnimation)
	AS:SkinCheckBox(PowaShowTimerButton)
	AS:SkinCheckBox(PowaBuffTimerCentsButton)
	AS:SkinCheckBox(PowaBuffTimerLeadingZerosButton)
	AS:SkinCheckBox(PowaBuffTimerTransparentButton)
	AS:SkinCheckBox(PowaBuffTimerUseOwnColorButton)
	AS:SkinCheckBox(PowaBuffTimerUpdatePingButton)
	AS:SkinCheckBox(PowaBuffTimerActivationTime)
	AS:SkinCheckBox(PowaBuffTimer99)
	AS:SkinCheckBox(PowaBuffStacksTransparentButton)
	AS:SkinCheckBox(PowaBuffStacksUseOwnColorButton)
	AS:SkinCheckBox(PowaBuffStacksUpdatePingButton)
	AS:SkinCheckBox(PowaBuffStacksLegacySizing)
	AS:SkinCheckBox(PowaOwntexButton)
	
	AS:SkinSliderFrame(PowaBarAuraTextureSlider)
	AS:SkinSliderFrame(PowaBarAuraAlphaSlider)
	AS:SkinSliderFrame(PowaBarAuraSizeSlider)
	AS:SkinSliderFrame(PowaBarAuraCoordASlider)
	AS:SkinSliderFrame(PowaBarAuraCoordSlider)
	AS:SkinSliderFrame(PowaBarAuraSymSlider)
	AS:SkinSliderFrame(PowaBarAuraDeformSlider)
	AS:SkinSliderFrame(PowaBarAuraAnimSpeedSlider)
	AS:SkinSliderFrame(PowaBarAuraDurationSlider)
	AS:SkinSliderFrame(PowaTimerCoordASlider)
	AS:SkinSliderFrame(PowaTimerSizeSlider)
	AS:SkinSliderFrame(PowaTimerCoordSlider)
	AS:SkinSliderFrame(PowaTimerAlphaSlider)
	AS:SkinSliderFrame(PowaTimerInvertAuraSlider)
	AS:SkinSliderFrame(PowaStacksCoordASlider)
	AS:SkinSliderFrame(PowaStacksCoordSlider)
	AS:SkinSliderFrame(PowaStacksSizeSlider)
	AS:SkinSliderFrame(PowaStacksAlphaSlider)
	
	AS:SkinEditBox(PowaBarAuraTextureEdit)
	AS:SkinEditBox(PowaBarBuffStacks)
	AS:SkinEditBox(PowaBarBuffName)
	AS:SkinEditBox(PowaBarMultiID)
	AS:SkinEditBox(PowaBarTooltipCheck)
	AS:SkinEditBox(PowaBarAuraCoordXEdit)
	AS:SkinEditBox(PowaBarAuraCoordYEdit)

	for i = 1, 5 do
		AS:SkinTab(_G["PowaEditorTab"..i])
		_G["PowaEditorTab"..i]:Height(30)
	end

end

AS:RegisterSkin(name,SkinPowerAuras)

--	AS:SkinFrame(PowerAurasGUIBrowser)
--	AS:SkinFrame(PowerAurasEditor)
--	AS:SkinCloseButton(PowerAurasGUIBrowser.CloseButton)
--	AS:SkinCloseButton(PowerAurasEditor.CloseButton)

--end)