local AS = unpack(AddOnSkins)

function AS:Blizzard_BarberShop(event, addon)
	if addon ~= "Blizzard_BarbershopUI" then return end

	AS:SkinFrame(BarberShopFrame)
	BarberShopFrame:Size(BarberShopFrame:GetWidth() - 30, BarberShopFrame:GetHeight() - 56)

	AS:StripTextures(BarberShopFrameMoneyFrame)

	AS:SkinButton(BarberShopFrameOkayButton, true)
	AS:SkinButton(BarberShopFrameCancelButton, true)
	AS:SkinButton(BarberShopFrameResetButton, true)

	for i = 1, 5 do
		AS:StripTextures(_G["BarberShopFrameSelector"..i])
		AS:SkinNextPrevButton(_G["BarberShopFrameSelector"..i.."Prev"])
		AS:SkinNextPrevButton(_G["BarberShopFrameSelector"..i.."Next"])
	end

	BarberShopFrameSelector5:SetPoint("TOP", 0, -42)
	BarberShopFrameSelector1:SetPoint("TOPLEFT", BarberShopFrameSelector5, "BOTTOMLEFT", 0, -1)
	BarberShopFrameSelector2:SetPoint("TOPLEFT", BarberShopFrameSelector1, "BOTTOMLEFT", 0, -1)
	BarberShopFrameSelector3:SetPoint("TOPLEFT", BarberShopFrameSelector2, "BOTTOMLEFT", 0, -1)
	BarberShopFrameSelector4:SetPoint("TOPLEFT", BarberShopFrameSelector3, "BOTTOMLEFT", 0, 3)

	BarberShopFrameOkayButton:ClearAllPoints()
	BarberShopFrameOkayButton:SetPoint("RIGHT", BarberShopFrame, "BOTTOM", 0, 50)

	BarberShopFrameResetButton:ClearAllPoints()
	BarberShopFrameResetButton:SetPoint("CENTER", BarberShopFrame, 'BOTTOM', 0, 20)

	BarberShopBannerFrameBGTexture:Kill()
	BarberShopBannerFrame:Kill()

	AS:SkinFrame(BarberShopAltFormFrame)
--	AS:StripTextures(BarberShopAltFormFrameBorder)
	BarberShopAltFormFrame:Point("BOTTOM", BarberShopFrame, "TOP", 0, 5)
end

AS:RegisterSkin('Blizzard_BarberShop', AS.Blizzard_BarberShop, 'ADDON_LOADED')