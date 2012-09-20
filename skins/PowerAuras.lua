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