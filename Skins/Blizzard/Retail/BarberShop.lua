if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables
-- GLOBALS:

function AS:Blizzard_BarbershopUI(event, addon)
	if addon ~= "Blizzard_BarbershopUI" then return end

	AS:SkinFrame(_G.BarberShopFrame)
	_G.BarberShopFrame:SetSize(_G.BarberShopFrame:GetWidth() - 30, _G.BarberShopFrame:GetHeight() - 56)

	AS:StripTextures(_G.BarberShopFrameMoneyFrame)

	AS:SkinButton(_G.BarberShopFrameOkayButton, true)
	AS:SkinButton(_G.BarberShopFrameCancelButton, true)
	AS:SkinButton(_G.BarberShopFrameResetButton, true)

	for i = 1, #_G.BarberShopFrame.Selector do
		local selector = _G.BarberShopFrame.Selector[i]
		local previousSelector = _G.BarberShopFrame.Selector[i-1]

		if selector then
			AS:StripTextures(selector)

			AS:SkinArrowButton(selector.Prev, nil, true)
			AS:SkinArrowButton(selector.Next)

			if i ~= 1 then
				selector:ClearAllPoints()
				selector:SetPoint("TOP", previousSelector, "BOTTOM", 0, -3)
			end
		end
	end

	_G.BarberShopFrameOkayButton:ClearAllPoints()
	_G.BarberShopFrameOkayButton:SetPoint("RIGHT", _G.BarberShopFrame, "BOTTOM", 0, 50)

	_G.BarberShopFrameResetButton:ClearAllPoints()
	_G.BarberShopFrameResetButton:SetPoint("CENTER", _G.BarberShopFrame, 'BOTTOM', 0, 20)

	AS:Kill(_G.BarberShopBannerFrameBGTexture)
	AS:Kill(_G.BarberShopBannerFrame)

	AS:SkinFrame(_G.BarberShopAltFormFrame)
	_G.BarberShopAltFormFrame:SetPoint("BOTTOM", _G.BarberShopFrame, "TOP", 0, 5)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_BarbershopUI', AS.Blizzard_BarbershopUI, 'ADDON_LOADED')
