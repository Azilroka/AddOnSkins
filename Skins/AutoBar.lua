local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AutoBar') then return end

function AS:AutoBar(event, addon)
	local function AutoBarSkin()
		for buttonName, button in pairs(AutoBar.buttonList) do
			if not button.IsStyled then
				AS:CreateBackdrop(button.frame)
				button.frame.Backdrop:SetAllPoints()
				AS:StyleButton(button.frame)
				button.frame:DisableDrawLayer('ARTWORK')
				AS:SkinTexture(button.frame.icon)
				button.frame.icon:SetInside(button.frame, 1, 1)
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
						popup.frame.icon:SetInside(popup.frame, 1, 1)
						popup.IsStyled = true
					end
				end
			end
		end
	end

	hooksecurefunc(AutoBar, 'UpdateSpells', AutoBarSkin)
end

AS:RegisterSkin('AutoBar', AS.AutoBar)