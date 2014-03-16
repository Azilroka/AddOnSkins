local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AdvancedIconSelector') then return end

local name = "AdvancedIconSelectorSkin"
function AS:SkinAdvancedIconSelector()
	local function SkinPopup(Name)
		local Popup = Name
		if Popup.IsSkinned then return end
		AS:SkinFrame(Popup)
		AS:SkinEditBox(Popup.editBox)
		Popup.editBox:DisableDrawLayer('BACKGROUND')
		AS:SkinScrollBar(Popup.iconsFrame.scrollFrame.ScrollBar)
		Popup.iconsFrame:HookScript('OnUpdate', function(self)
			for i = 1, 1024 do
				if self.icons[i] and not self.icons[i].IsStyled then
					self.icons[i]:SetTemplate()
					self.icons[i]:StyleButton()
					self.icons[i].IsStyled = true
				end
				if self.icons[i] and self.icons[i]:GetNormalTexture() and not self.icons[i].IsTextureDone then
					AS:SkinTexture(self.icons[i]:GetNormalTexture())
					self.icons[i]:GetNormalTexture():SetInside()
					self.icons[i]:GetNormalTexture().SetTexCoord = function() end
					self.icons[i]:GetNormalTexture().SetPoint = function() end
					self.icons[i].IsTextureDone = true
				end
			end
		end)
		AS:SkinCloseButton(Popup.closeButton)
		AS:SkinEditBox(Popup.searchBox)
		Popup.searchBox:DisableDrawLayer('BACKGROUND')
		AS:SkinButton(Popup.cancelButton)
		if Popup.okButton then
			AS:SkinButton(Popup.okButton)
		end
		Popup.IsSkinned = true
	end

	hooksecurefunc("CharacterFrame_Expand", function()
		SkinPopup(_G["GearManagerDialogPopup"])
	end)
	hooksecurefunc("MacroFrame_LoadUI", function()
		SkinPopup(_G["MacroPopupFrame"])
	end)
	hooksecurefunc("GuildBankFrame_LoadUI", function()
		SkinPopup(_G["GuildBankPopupFrame"])
	end)
end

AS:RegisterSkin(name, AS.SkinAdvancedIconSelector)