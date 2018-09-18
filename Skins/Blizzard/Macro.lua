local AS = unpack(AddOnSkins)

function AS:Blizzard_MacroUI(event, addon)
	if addon ~= 'Blizzard_MacroUI' then return end

	AS:SkinFrame(MacroFrame)
	MacroFrame:SetWidth(360)
	AS:SkinCloseButton(MacroFrame.CloseButton)

	AS:SkinFrame(MacroPopupFrame)
	MacroPopupFrame:SetHeight(MacroPopupFrame:GetHeight() + 15)
	AS:StripTextures(MacroPopupFrame.BorderBox)
	AS:SkinButton(MacroPopupFrame.BorderBox.OkayButton)
	AS:SkinButton(MacroPopupFrame.BorderBox.CancelButton)
	MacroPopupFrame.BorderBox.CancelButton:SetPoint("BOTTOMRIGHT", -11, 10)

	for i = 1, MAX_ACCOUNT_MACROS do
		AS:SkinIconButton(_G["MacroButton"..i])
	end

	AS:Delay(0, function() for i = 1, 90 do AS:SkinIconButton(_G["MacroPopupButton"..i]) end end)

	local Buttons = { MacroDeleteButton, MacroNewButton, MacroExitButton, MacroEditButton, MacroSaveButton, MacroCancelButton }

	for _, Button in pairs(Buttons) do
		AS:SkinButton(Button)
	end

	for i = 1, 2 do
		AS:SkinButton(_G['MacroFrameTab'..i], true)
		_G['MacroFrameTab'..i]:Height(22)
	end

	MacroFrameTab1:SetPoint("TOPLEFT", MacroFrame, "TOPLEFT", 85, -39)
	MacroFrameTab2:SetPoint("LEFT", MacroFrameTab1, "RIGHT", 4, 0)

	AS:StripTextures(MacroButtonScrollFrame)
	AS:SkinScrollBar(MacroButtonScrollFrameScrollBar)
	AS:SkinScrollBar(MacroFrameScrollFrameScrollBar)
	AS:SkinScrollBar(MacroPopupScrollFrameScrollBar)
	MacroPopupScrollFrame:SetHeight(MacroPopupScrollFrame:GetHeight() + 14)
	AS:StripTextures(MacroFrameInset)

	AS:SkinEditBox(MacroPopupEditBox)
	MacroPopupNameLeft:SetAlpha(0)
	MacroPopupNameMiddle:SetAlpha(0)
	MacroPopupNameRight:SetAlpha(0)

	AS:SkinBackdropFrame(MacroFrameTextBackground)
	MacroFrameTextBackground.Backdrop:SetPoint('TOPLEFT', 6, -3)
	MacroFrameTextBackground.Backdrop:SetPoint('BOTTOMRIGHT', 0, 1)
	AS:StripTextures(MacroPopupScrollFrame)

	MacroEditButton:ClearAllPoints()
	MacroEditButton:SetPoint("BOTTOMLEFT", MacroFrameSelectedMacroButton, "BOTTOMRIGHT", 10, 0)

	AS:SkinIconButton(MacroFrameSelectedMacroButton)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_MacroUI', AS.Blizzard_MacroUI, 'ADDON_LOADED')
