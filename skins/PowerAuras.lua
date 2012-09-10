if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("PowerAuras") then return end
LoadAddOn("PowerAurasOptions")
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c

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
			texture:SetTexCoord(unpack(c.TexCoords))
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
	cRegisterSkin(name,SkinPowerAurasIcons)
end

s:RegisterSkin('PowerAuras', PowerAuras_LoadSkin)

local name = "PowerAurasSkin"
local function SkinPowerAuras(self)
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	cSkinFrame(PowaOptionsFrame)
	cSkinFrame(PowaBarConfigFrame)
	cSkinFrame(PowaOptionsFrame)
	cSkinFrame(PowaBarConfigFrame)
	cSkinFrame(PowaAuraExportDialog)
	cSkinFrame(PowaAuraPlayerImportDialog)
	cSkinEditBox(PowaAuraExportDialogCopyBox)
	cSkinEditBox(PowaAuraExportDialogSendBox)
	cSkinEditBox(PowaBarCustomSound)
	cSkinEditBox(PowaBarCustomSoundEnd)

	cSkinCloseButton(PowaOptionsFrameCloseButton)
	cSkinCloseButton(PowaCloseButton)
	cSkinButton(PowaOptionsRename)
	cSkinButton(PowaOptionsSelectorNew)
	cSkinButton(PowaOptionsSelectorDelete)
	cSkinButton(PowaOptionsSelectorImport)
	cSkinButton(PowaOptionsSelectorExport)
	cSkinButton(PowaOptionsSelectorImportSet)
	cSkinButton(PowaOptionsSelectorExportSet)
	cSkinButton(PowaOptionsCopy)
	cSkinButton(PowaOptionsMove)
	cSkinButton(PowaMainLockButton)
	cSkinButton(PowaMainTestAllButton)
	cSkinButton(PowaMainTestButton)
	cSkinButton(PowaMainHideAllButton)
	cSkinButton(PowaEditButton)
	cSkinButton(PowaAuraExportDialogSendButton)
	cSkinButton(PowaAuraExportDialogCancelButton)
	cSkinButton(PowaAuraPlayerImportDialogAcceptButton)
	cSkinButton(PowaAuraPlayerImportDialogCancelButton)
	cSkinButton(PowaBarAuraTextureSliderMinus)
	cSkinButton(PowaBarAuraTextureSliderPlus)
	cSkinButton(PowaBarAuraSizeSliderMinus)
	cSkinButton(PowaBarAuraSizeSliderPlus)
	cSkinButton(PowaBarAuraCoordXSliderMinus)
	cSkinButton(PowaBarAuraCoordXSliderPlus)
	cSkinButton(PowaBarAuraCoordSliderMinus)
	cSkinButton(PowaBarAuraCoordSliderPlus)
	cSkinButton(PowaBarAuraAnimSpeedSliderPlus)
	cSkinButton(PowaBarAuraAnimSpeedSliderMinus)
	cSkinButton(PowaBarAuraDurationSliderMinus)
	cSkinButton(PowaBarAuraDurationSliderPlus)
	cSkinButton(PowaTimerCoordXSliderMinus)
	cSkinButton(PowaTimerCoordXSliderPlus)
	cSkinButton(PowaTimerCoordSliderMinus)
	cSkinButton(PowaTimerCoordSliderPlus)
	cSkinButton(PowaTimerSizeSliderMinus)
	cSkinButton(PowaTimerSizeSliderPlus)
	cSkinButton(PowaTimerAlphaSliderMinus)
	cSkinButton(PowaTimerAlphaSliderPlus)
	cSkinButton(PowaTimerInvertAuraSliderMinus)
	cSkinButton(PowaTimerInvertAuraSliderPlus)
	cSkinButton(PowaStacksCoordXSliderMinus)
	cSkinButton(PowaStacksCoordXSliderPlus)
	cSkinButton(PowaStacksCoordSliderMinus)
	cSkinButton(PowaStacksCoordSliderPlus)
	cSkinButton(PowaStacksSizeSliderMinus)
	cSkinButton(PowaStacksSizeSliderPlus)
	cSkinButton(PowaStacksAlphaSliderMinus)
	cSkinButton(PowaStacksAlphaSliderPlus)

	cSkinDropDownBox(PowaDropDownBuffType)
	cSkinDropDownBox(PowaDropDownAnimBegin)
	cSkinDropDownBox(PowaDropDownAnimEnd)
	cSkinDropDownBox(PowaDropDownAnim1)
	cSkinDropDownBox(PowaDropDownAnim2)
	cSkinDropDownBox(PowaDropDownSound)
	cSkinDropDownBox(PowaDropDownSound2)
	cSkinDropDownBox(PowaDropDownSoundEnd)
	cSkinDropDownBox(PowaDropDownSound2End)
	cSkinDropDownBox(PowaDropDownTimerTexture)
	cSkinDropDownBox(PowaBuffTimerRelative)
	cSkinDropDownBox(PowaDropDownStacksTexture)
	cSkinDropDownBox(PowaBuffStacksRelative)

	for i = 1, 5 do
		cSkinTab(_G["PowaEditorTab"..i])
		_G["PowaEditorTab"..i]:Height(30)
	end

end

cRegisterSkin(name,SkinPowerAuras)

--	cSkinFrame(PowerAurasGUIBrowser)
--	cSkinFrame(PowerAurasEditor)
--	cSkinCloseButton(PowerAurasGUIBrowser.CloseButton)
--	cSkinCloseButton(PowerAurasEditor.CloseButton)

--end)