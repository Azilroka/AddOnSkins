local AS = unpack(AddOnSkins)

function AS:Blizzard_BarberShop(event, addon)
	if addon ~= "Blizzard_BarbershopUI" then return end

	AS:SkinFrame(BarberShopFrame)
	BarberShopFrame:SetSize(BarberShopFrame:GetWidth() - 30, BarberShopFrame:GetHeight() - 56)

	AS:StripTextures(BarberShopFrameMoneyFrame)

	AS:SkinButton(BarberShopFrameOkayButton, true)
	AS:SkinButton(BarberShopFrameCancelButton, true)
	AS:SkinButton(BarberShopFrameResetButton, true)

	for i = 1, 4 do
		local frame = _G["BarberShopFrameSelector"..i]
		if frame then
			AS:StripTextures(frame)
		end
	end

	BarberShopFrame.FaceSelector:SetPoint("TOP", 0, -42)
	BarberShopFrame.HairStyleSelector:SetPoint("TOPLEFT", BarberShopFrame.FaceSelector, "BOTTOMLEFT", 0, -1)
	BarberShopFrame.HairColorSelector:SetPoint("TOPLEFT", BarberShopFrame.HairStyleSelector, "BOTTOMLEFT", 0, -1)
	BarberShopFrame.FacialHairSelector:SetPoint("TOPLEFT", BarberShopFrame.HairColorSelector, "BOTTOMLEFT", 0, 3)

	BarberShopFrameOkayButton:ClearAllPoints()
	BarberShopFrameOkayButton:SetPoint("RIGHT", BarberShopFrame, "BOTTOM", 0, 50)

	BarberShopFrameResetButton:ClearAllPoints()
	BarberShopFrameResetButton:SetPoint("CENTER", BarberShopFrame, 'BOTTOM', 0, 20)

	BarberShopBannerFrameBGTexture:Kill()
	BarberShopBannerFrame:Kill()

	AS:SkinFrame(BarberShopAltFormFrame)
	BarberShopAltFormFrame:SetPoint("BOTTOM", BarberShopFrame, "TOP", 0, 5)
end

AS:RegisterSkin('Blizzard_BarberShop', AS.Blizzard_BarberShop, 'ADDON_LOADED')