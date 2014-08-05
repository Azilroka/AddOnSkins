local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('VanasKoS') then return end

local name = 'VanasKoSSkin'
function AS:SkinVanasKoS()
	VanasKoS_WarnFrame:SetTemplate("Transparent")
	VanasKoS_WarnFrame.SetBackdropBorderColor = AS.Noop

	VanasKoS_FontKos:SetFont(AS.PixelFont, 8, "MONOCHROMEOUTLINE")
	VanasKoS_FontEnemy:SetFont(AS.PixelFont, 8, "MONOCHROMEOUTLINE")
	VanasKoS_FontFriendly:SetFont(AS.PixelFont, 8, "MONOCHROMEOUTLINE")
	VanasKoS_FontNormal:SetFont(AS.PixelFont, 8, "MONOCHROMEOUTLINE")

	AS:SkinBackdropFrame(VanasKoSFrame, 'Transparent', nil, true)
	local Backdrop = VanasKoSFrame.backdrop or VanasKoSFrame.Backdrop
	Backdrop:SetPoint("TOPLEFT", 16, -12)
	Backdrop:SetPoint("BOTTOMRIGHT", -30, 75)

	AS:SkinButton(VanasKoSListFrameChangeButton)
	AS:SkinButton(VanasKoSListFrameRemoveButton)
	AS:SkinButton(VanasKoSListFrameAddButton)
	AS:SkinButton(VanasKoSListFrameConfigurationButton)

	AS:SkinCloseButton(VanasKosFrameCloseButton, Backdrop)
	AS:SkinCheckBox(VanasKoSListFrameCheckBox)
	AS:SkinNextPrevButton(VanasKoSListFrameToggleRightButton)
	AS:SkinNextPrevButton(VanasKoSListFrameToggleLeftButton)
	AS:SkinDropDownBox(VanasKoSPvPStatsCharacterDropDown, 90)
	AS:SkinDropDownBox(VanasKoSPvPStatsTimeSpanDropDown, 90)
	AS:SkinDropDownBox(VanasKoSFrameChooseListDropDown)
	AS:SkinEditBox(VanasKoSListFrameSearchBox, nil, 18)

	for i = 1, 2 do
		AS:SkinTab(_G["VanasKoSFrameTab"..i])
	end

	for i = 1, 5 do
		_G["VanasKoSListFrameColButton"..i]:StripTextures()
	end

	VanasKoSPvPStatsCharacterDropDown:ClearAllPoints()
	VanasKoSPvPStatsCharacterDropDown:SetPoint("RIGHT", VanasKoSListFrameToggleLeftButton, "LEFT", -7, 0)
	VanasKoSPvPStatsTimeSpanDropDown:ClearAllPoints()
	VanasKoSPvPStatsTimeSpanDropDown:SetPoint("RIGHT", VanasKoSPvPStatsCharacterDropDown, "LEFT", 10, 0)
	VanasKoSListFrameAddButton:ClearAllPoints()
	VanasKoSListFrameAddButton:SetPoint("BOTTOMRIGHT", VanasKoSFrame.backdrop, "BOTTOMRIGHT", -4, 4)
	VanasKoSListFrameRemoveButton:ClearAllPoints()
	VanasKoSListFrameRemoveButton:SetPoint("RIGHT", VanasKoSListFrameAddButton, "LEFT", -3, 0)
	VanasKoSListFrameChangeButton:ClearAllPoints()
	VanasKoSListFrameChangeButton:SetPoint("RIGHT", VanasKoSListFrameRemoveButton, "LEFT", -3, 0)
	VanasKoSListFrameConfigurationButton:ClearAllPoints()
	VanasKoSListFrameConfigurationButton:SetPoint("BOTTOMRIGHT", VanasKoSListFrameAddButton, "TOPRIGHT", 0, 3)
	VanasKoSListFrameSearchBox:ClearAllPoints()
	VanasKoSListFrameSearchBox:SetPoint("RIGHT", VanasKoSListFrameConfigurationButton, "LEFT", -5, 0)
end

AS:RegisterSkin(name, AS.SkinVanasKoS)