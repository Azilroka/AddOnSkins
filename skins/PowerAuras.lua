if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("PowerAuras") then return end
local U = unpack(select(2,...))
LoadAddOn("PowerAurasOptions")
local s = U.s
local c = U.c

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
		U.RegisterSkin(name,SkinPowerAurasIcons)
	end


local name = "PowerAurasSkin"
local function SkinPowerAuras(self)
	local s = U.s
	local c = U.c

	U.SkinFrame(PowaOptionsFrame)
	U.SkinFrame(PowaBarConfigFrame)
	U.SkinFrame(PowaOptionsFrame)
	U.SkinFrame(PowaBarConfigFrame)
	U.SkinFrame(PowaAuraExportDialog)
	U.SkinFrame(PowaAuraPlayerImportDialog)
	U.SkinEditBox(PowaAuraExportDialogCopyBox)
	U.SkinEditBox(PowaAuraExportDialogSendBox)
	U.SkinEditBox(PowaBarCustomSound)
	U.SkinEditBox(PowaBarCustomSoundEnd)

	U.SkinCloseButton(PowaOptionsFrameCloseButton)
	U.SkinCloseButton(PowaCloseButton)
	U.SkinButton(PowaOptionsRename)
	U.SkinButton(PowaOptionsSelectorNew)
	U.SkinButton(PowaOptionsSelectorDelete)
	U.SkinButton(PowaOptionsSelectorImport)
	U.SkinButton(PowaOptionsSelectorExport)
	U.SkinButton(PowaOptionsSelectorImportSet)
	U.SkinButton(PowaOptionsSelectorExportSet)
	U.SkinButton(PowaOptionsCopy)
	U.SkinButton(PowaOptionsMove)
	U.SkinButton(PowaMainLockButton)
	U.SkinButton(PowaMainTestAllButton)
	U.SkinButton(PowaMainTestButton)
	U.SkinButton(PowaMainHideAllButton)
	U.SkinButton(PowaEditButton)
	U.SkinButton(PowaAuraExportDialogSendButton)
	U.SkinButton(PowaAuraExportDialogCancelButton)
	U.SkinButton(PowaAuraPlayerImportDialogAcceptButton)
	U.SkinButton(PowaAuraPlayerImportDialogCancelButton)
	U.SkinButton(PowaBarAuraTextureSliderMinus)
	U.SkinButton(PowaBarAuraTextureSliderPlus)
	U.SkinButton(PowaBarAuraSizeSliderMinus)
	U.SkinButton(PowaBarAuraSizeSliderPlus)
	U.SkinButton(PowaBarAuraCoordXSliderMinus)
	U.SkinButton(PowaBarAuraCoordXSliderPlus)
	U.SkinButton(PowaBarAuraCoordSliderMinus)
	U.SkinButton(PowaBarAuraCoordSliderPlus)
	U.SkinButton(PowaBarAuraAnimSpeedSliderPlus)
	U.SkinButton(PowaBarAuraAnimSpeedSliderMinus)
	U.SkinButton(PowaBarAuraDurationSliderMinus)
	U.SkinButton(PowaBarAuraDurationSliderPlus)
	U.SkinButton(PowaTimerCoordXSliderMinus)
	U.SkinButton(PowaTimerCoordXSliderPlus)
	U.SkinButton(PowaTimerCoordSliderMinus)
	U.SkinButton(PowaTimerCoordSliderPlus)
	U.SkinButton(PowaTimerSizeSliderMinus)
	U.SkinButton(PowaTimerSizeSliderPlus)
	U.SkinButton(PowaTimerAlphaSliderMinus)
	U.SkinButton(PowaTimerAlphaSliderPlus)
	U.SkinButton(PowaTimerInvertAuraSliderMinus)
	U.SkinButton(PowaTimerInvertAuraSliderPlus)
	U.SkinButton(PowaStacksCoordXSliderMinus)
	U.SkinButton(PowaStacksCoordXSliderPlus)
	U.SkinButton(PowaStacksCoordSliderMinus)
	U.SkinButton(PowaStacksCoordSliderPlus)
	U.SkinButton(PowaStacksSizeSliderMinus)
	U.SkinButton(PowaStacksSizeSliderPlus)
	U.SkinButton(PowaStacksAlphaSliderMinus)
	U.SkinButton(PowaStacksAlphaSliderPlus)

	U.SkinDropDownBox(PowaDropDownBuffType)
	U.SkinDropDownBox(PowaDropDownAnimBegin)
	U.SkinDropDownBox(PowaDropDownAnimEnd)
	U.SkinDropDownBox(PowaDropDownAnim1)
	U.SkinDropDownBox(PowaDropDownAnim2)
	U.SkinDropDownBox(PowaDropDownSound)
	U.SkinDropDownBox(PowaDropDownSound2)
	U.SkinDropDownBox(PowaDropDownSoundEnd)
	U.SkinDropDownBox(PowaDropDownSound2End)
	U.SkinDropDownBox(PowaDropDownTimerTexture)
	U.SkinDropDownBox(PowaBuffTimerRelative)
	U.SkinDropDownBox(PowaDropDownStacksTexture)
	U.SkinDropDownBox(PowaBuffStacksRelative)

	U.SkinCheckBox(PowaShowStacksButton)
	U.SkinCheckBox(PowaExactButton)
	U.SkinCheckBox(PowaIngoreCaseButton)
	U.SkinCheckBox(PowaInverseButton)
	U.SkinCheckBox(PowaInCombatButton)
	U.SkinCheckBox(PowaIsInPartyButton)
	U.SkinCheckBox(PowaIsMountedButton)
	U.SkinCheckBox(PowaTargetButton)
	U.SkinCheckBox(PowaFocusButton)
	U.SkinCheckBox(PowaPartyButton)
	U.SkinCheckBox(PowaOptunitnButton)
	U.SkinCheckBox(PowaTalentGroup1Button)
	U.SkinCheckBox(PowaTalentGroup2Button)
	U.SkinCheckBox(PowaMineButton)
	U.SkinCheckBox(PowaRestingButton)
	U.SkinCheckBox(PowaIsInRaidButton)
	U.SkinCheckBox(PowaInVehicleButton)
	U.SkinCheckBox(PowaTargetFriendButton)
	U.SkinCheckBox(PowaGroupOrSelfButton)
	U.SkinCheckBox(PowaRaidButton)
	U.SkinCheckBox(PowaGroupAnyButton)
	U.SkinCheckBox(PowaPvPButton)
	U.SkinCheckBox(PowaIsAliveButton)
	U.SkinCheckBox(Powa5ManInstanceButton)
	U.SkinCheckBox(Powa5ManHeroicInstanceButton)
	U.SkinCheckBox(Powa10ManInstanceButton)
	U.SkinCheckBox(Powa10ManHeroicInstanceButton)
	U.SkinCheckBox(Powa25ManInstanceButton)
	U.SkinCheckBox(Powa25ManHeroicInstanceButton)
	U.SkinCheckBox(PowaArenaInstanceButton)
	U.SkinCheckBox(PowaBgInstanceButton)
	U.SkinCheckBox(PowaRoleHealerButton)
	U.SkinCheckBox(PowaRoleTankButton)
	U.SkinCheckBox(PowaRoleMeleDpsButton)
	U.SkinCheckBox(PowaRoleRangeDpsButton)
	U.SkinCheckBox(PowaAuraDebugButton)
	U.SkinCheckBox(PowaTexModeButton)
	U.SkinCheckBox(PowaWowTextureButton)
	U.SkinCheckBox(PowaCustomTextureButton)
	U.SkinCheckBox(PowaTextAuraButton)
	U.SkinCheckBox(PowaRandomColorButton)
	U.SkinCheckBox(PowaShowSpinAtBeginning)
	U.SkinCheckBox(PowaOldAnimation)
	U.SkinCheckBox(PowaShowTimerButton)
	U.SkinCheckBox(PowaBuffTimerCentsButton)
	U.SkinCheckBox(PowaBuffTimerLeadingZerosButton)
	U.SkinCheckBox(PowaBuffTimerTransparentButton)
	U.SkinCheckBox(PowaBuffTimerUseOwnColorButton)
	U.SkinCheckBox(PowaBuffTimerUpdatePingButton)
	U.SkinCheckBox(PowaBuffTimerActivationTime)
	U.SkinCheckBox(PowaBuffTimer99)
	U.SkinCheckBox(PowaBuffStacksTransparentButton)
	U.SkinCheckBox(PowaBuffStacksUseOwnColorButton)
	U.SkinCheckBox(PowaBuffStacksUpdatePingButton)
	U.SkinCheckBox(PowaBuffStacksLegacySizing)
	U.SkinCheckBox(PowaOwntexButton)
	
	U.SkinSliderFrame(PowaBarAuraTextureSlider)
	U.SkinSliderFrame(PowaBarAuraAlphaSlider)
	U.SkinSliderFrame(PowaBarAuraSizeSlider)
	U.SkinSliderFrame(PowaBarAuraCoordXSlider)
	U.SkinSliderFrame(PowaBarAuraCoordSlider)
	U.SkinSliderFrame(PowaBarAuraSymSlider)
	U.SkinSliderFrame(PowaBarAuraDeformSlider)
	U.SkinSliderFrame(PowaBarAuraAnimSpeedSlider)
	U.SkinSliderFrame(PowaBarAuraDurationSlider)
	U.SkinSliderFrame(PowaTimerCoordXSlider)
	U.SkinSliderFrame(PowaTimerSizeSlider)
	U.SkinSliderFrame(PowaTimerCoordSlider)
	U.SkinSliderFrame(PowaTimerAlphaSlider)
	U.SkinSliderFrame(PowaTimerInvertAuraSlider)
	U.SkinSliderFrame(PowaStacksCoordXSlider)
	U.SkinSliderFrame(PowaStacksCoordSlider)
	U.SkinSliderFrame(PowaStacksSizeSlider)
	U.SkinSliderFrame(PowaStacksAlphaSlider)
	
	U.SkinEditBox(PowaBarAuraTextureEdit)
	U.SkinEditBox(PowaBarBuffStacks)
	U.SkinEditBox(PowaBarBuffName)
	U.SkinEditBox(PowaBarMultiID)
	U.SkinEditBox(PowaBarTooltipCheck)
	U.SkinEditBox(PowaBarAuraCoordXEdit)
	U.SkinEditBox(PowaBarAuraCoordYEdit)

	for i = 1, 5 do
		U.SkinTab(_G["PowaEditorTab"..i])
		_G["PowaEditorTab"..i]:Height(30)
	end

end

U.RegisterSkin(name,SkinPowerAuras)

--	U.SkinFrame(PowerAurasGUIBrowser)
--	U.SkinFrame(PowerAurasEditor)
--	U.SkinCloseButton(PowerAurasGUIBrowser.CloseButton)
--	U.SkinCloseButton(PowerAurasEditor.CloseButton)

--end)