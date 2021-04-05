local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AutoBar') then return end

function AS:AutoBar(event, addon)
	local function AutoBarSkin()
		for buttonName, button in pairs(AutoBar.buttonList) do
			if not button.IsStyled then
				AS:CreateBackdrop(button.frame)
				button.frame.Backdrop:SetAllPoints()
				AS:StyleButton(button.frame)
				button.frame.NormalTexture:SetAlpha(0)
				AS:SkinTexture(button.frame.icon)
				AS:SetInside(button.frame.icon, button.frame, 1, 1)
				button.IsStyled = true
			end
			if button.frame.popupHeader then
				for key, popup in pairs(button.frame.popupHeader.popupButtonList) do
					if not button.IsStyled then
						AS:CreateBackdrop(popup.frame)
						button.frame.Backdrop:SetAllPoints()
						AS:StyleButton(popup.frame)
						popup.frame:DisableDrawLayer('ARTWORK')
						AS:SkinTexture(popup.frame.icon)
						AS:SetInside(popup.frame.icon, popup.frame, 1, 1)
						popup.IsStyled = true
					end
				end
			end
		end
	end

	hooksecurefunc(AutoBarGlobalCodeSpace, 'UpdateSpells', AutoBarSkin)
end

AS:RegisterSkin('AutoBar', AS.AutoBar)
