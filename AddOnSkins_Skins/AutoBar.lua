local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AutoBar') then return end

local name = 'AutoBarSkin'
function AS:SkinAutoBar(event, addon)
	local function AutoBarSkin()
		for buttonName, button in pairs(AutoBar.buttonList) do
			button.frame:CreateBackdrop()
			local Backdrop = button.frame.backdrop or button.frame.Backdrop
			Backdrop:SetAllPoints()
			button.frame:StyleButton()
			button.frame:DisableDrawLayer('ARTWORK')
			AS:SkinTexture(button.frame.icon)
			button.frame.icon:SetInside(button.frame, 1, 1)
			if button.frame.popupHeader then
				for key, popup in pairs(button.frame.popupHeader.popupButtonList) do
					popup.frame:CreateBackdrop()
					local Backdrop = popup.frame.backdrop or popup.frame.Backdrop
					Backdrop:SetAllPoints()
					popup.frame:StyleButton()
					popup.frame:DisableDrawLayer('ARTWORK')
					AS:SkinTexture(popup.frame.icon)
					popup.frame.icon:SetInside(popup.frame, 1, 1)
				end
			end
		end
	end

	hooksecurefunc(AutoBar, 'UpdateSpells', AutoBarSkin)
end

AS:RegisterSkin(name, AS.SkinAutoBar)