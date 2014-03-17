local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AutoBar') then return end

local name = 'AutoBarSkin'
function AS:SkinAutoBar(event, addon)
	local function AutoBarSkin()
		for buttonName, button in pairs(AutoBar.buttonList) do
			if not button.IsStyled then
				button.frame:CreateBackdrop()
				local Backdrop = button.frame.backdrop or button.frame.Backdrop
				Backdrop:SetAllPoints()
				button.frame:StyleButton()
				button.frame:DisableDrawLayer('ARTWORK')
				AS:SkinTexture(button.frame.icon)
				button.frame.icon:SetInside(button.frame, 1, 1)
				button.IsStyled = true
			end
			if button.frame.popupHeader then
				for key, popup in pairs(button.frame.popupHeader.popupButtonList) do
					if not button.IsStyled then
						popup.frame:CreateBackdrop()
						local Backdrop = popup.frame.backdrop or popup.frame.Backdrop
						Backdrop:SetAllPoints()
						popup.frame:StyleButton()
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

AS:RegisterSkin(name, AS.SkinAutoBar)