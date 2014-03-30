local AS = unpack(AddOnSkins)

local name = 'PowerAurasSkin'
function AS:SkinPowerAuras(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		local function SkinPowerAuras(self, aura, elapsed)
			local returnValue = PowaAuras.OldUpdateAura(self, aura, elapsed)

			if (aura == nil) or (aura.off) then
				return false
			end

			if (aura.Showing) then
				local frame = aura:GetFrame()
				if (frame == nil) then
					return false
				end

				local backdrop = frame.backdrop or frame.Backdrop
				if frame and not backdrop then
					frame:CreateBackdrop()
					backdrop = frame.backdrop or frame.Backdrop
					backdrop:Hide()
				end

				if frame and aura.owntex then
					local texture = aura:GetTexture()
					if not backdrop:IsShown() then
						backdrop:Show()
					end
					texture:SetTexCoord(unpack(AS.TexCoords))
				elseif frame and backdrop:IsShown() then
					backdrop:Hide()
				end
			end

			return returnValue
		end

		PowaAuras.OldUpdateAura = PowaAuras.UpdateAura
		PowaAuras.UpdateAura = SkinPowerAuras
	end
	if addon == 'PowerAurasOptions' then
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
		AS:SkinButton(PowaTimerCoordXSliderMinus)
		AS:SkinButton(PowaTimerCoordXSliderPlus)
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
		
		AS:SkinSlideBar(PowaBarAuraTextureSlider)
		AS:SkinSlideBar(PowaBarAuraAlphaSlider)
		AS:SkinSlideBar(PowaBarAuraSizeSlider)
		AS:SkinSlideBar(PowaBarAuraCoordASlider)
		AS:SkinSlideBar(PowaBarAuraCoordSlider)
		AS:SkinSlideBar(PowaBarAuraSymSlider)
		AS:SkinSlideBar(PowaBarAuraDeformSlider)
		AS:SkinSlideBar(PowaBarAuraAnimSpeedSlider)
		AS:SkinSlideBar(PowaBarAuraDurationSlider)
		AS:SkinSlideBar(PowaTimerCoordASlider)
		AS:SkinSlideBar(PowaTimerSizeSlider)
		AS:SkinSlideBar(PowaTimerCoordSlider)
		AS:SkinSlideBar(PowaTimerAlphaSlider)
		AS:SkinSlideBar(PowaTimerInvertAuraSlider)
		AS:SkinSlideBar(PowaStacksCoordASlider)
		AS:SkinSlideBar(PowaStacksCoordSlider)
		AS:SkinSlideBar(PowaStacksSizeSlider)
		AS:SkinSlideBar(PowaStacksAlphaSlider)
		
		AS:SkinEditBox(PowaBarAuraTextureEdit)
		AS:SkinEditBox(PowaBarBuffStacks)
		AS:SkinEditBox(PowaBarBuffName)
		AS:SkinEditBox(PowaBarMultiID)
		AS:SkinEditBox(PowaBarTooltipCheck)
		AS:SkinEditBox(PowaBarAuraCoordXEdit)
		AS:SkinEditBox(PowaBarAuraCoordYEdit)

		for i = 1, 5 do
			AS:SkinTab(_G['PowaEditorTab'..i])
			_G['PowaEditorTab'..i]:Height(30)
		end
	end
end

AS:RegisterSkin(name, AS.SkinPowerAuras, 'ADDON_LOADED')