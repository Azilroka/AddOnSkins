local AS, L, S, R = unpack(AddOnSkins)

function R:AutoBar()
	local function AutoBarSkin()
		for buttonName, button in pairs(AutoBar.buttonList) do
			if not button.IsStyled then
				S:CreateBackdrop(button.frame)
				button.frame.backdrop:SetAllPoints()
				S:StyleButton(button.frame)
				button.frame.NormalTexture:SetAlpha(0)
				S:HandleIcon(button.frame.icon)
				S:SetInside(button.frame.icon, button.frame, 1, 1)
				button.IsStyled = true
			end
			if button.frame.popupHeader then
				for key, popup in pairs(button.frame.popupHeader.popupButtonList) do
					if not button.IsStyled then
						S:CreateBackdrop(popup.frame)
						button.frame.backdrop:SetAllPoints()
						S:StyleButton(popup.frame)
						popup.frame:DisableDrawLayer('ARTWORK')
						S:HandleIcon(popup.frame.icon)
						S:SetInside(popup.frame.icon, popup.frame, 1, 1)
						popup.IsStyled = true
					end
				end
			end
		end
	end

	hooksecurefunc(AutoBarGlobalCodeSpace, 'UpdateSpells', AutoBarSkin)
end

AS:RegisterSkin('AutoBar')
