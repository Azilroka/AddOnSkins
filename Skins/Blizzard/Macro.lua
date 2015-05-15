local AS = unpack(AddOnSkins)

function AS:Blizzard_MacroUI(event, addon)
	if (addon == 'Blizzard_MacroUI' or IsAddOnLoaded('Blizzard_MacroUI')) then
		AS:SkinFrame(MacroFrame)
		MacroFrame:Width(360)
		AS:SkinCloseButton(MacroFrameCloseButton)

		AS:SkinFrame(MacroPopupFrame)
		MacroPopupFrame:SetPoint("TOPLEFT", MacroFrame, "TOPRIGHT", 5, 0)

		for i = 1, MAX_ACCOUNT_MACROS do
			AS:SkinIconButton(_G["MacroButton"..i])
		end

		for i = 1, 20 do
			AS:SkinIconButton(_G["MacroPopupButton"..i])
		end

		local Buttons = {
			MacroDeleteButton,
			MacroNewButton,
			MacroExitButton,
			MacroEditButton,
			MacroPopupOkayButton,
			MacroPopupCancelButton,
			MacroSaveButton,
			MacroCancelButton,
		}
		
		for _, Button in pairs(Buttons) do
			AS:SkinButton(Button, true)
		end
		
		for i = 1, 2 do
			AS:SkinButton(_G['MacroFrameTab'..i], true)
			_G['MacroFrameTab'..i]:Height(22)
		end

		MacroFrameTab1:Point("TOPLEFT", MacroFrame, "TOPLEFT", 85, -39)
		MacroFrameTab2:Point("LEFT", MacroFrameTab1, "RIGHT", 4, 0)

		AS:StripTextures(MacroButtonScrollFrame)
		AS:SkinScrollBar(MacroButtonScrollFrameScrollBar)
		AS:SkinScrollBar(MacroFrameScrollFrameScrollBar)
		AS:SkinScrollBar(MacroPopupScrollFrameScrollBar)
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
		MacroEditButton:Point("BOTTOMLEFT", MacroFrameSelectedMacroButton, "BOTTOMRIGHT", 10, 0)

		AS:SkinIconButton(MacroFrameSelectedMacroButton)
	end
end

AS:RegisterSkin('Blizzard_MacroUI', AS.Blizzard_MacroUI, 'ADDON_LOADED')