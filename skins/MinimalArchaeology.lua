if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("MinimalArchaeology") then return end
local name = "MinimalArchaeologySkin"
local function SkinMinimalArchaeology(self)
	if IsAddOnLoaded("Tukui") then UIFont = c["media"].pixelfont UIFontSize = 12 end
	if IsAddOnLoaded("ElvUI") then UIFont = [[Interface\AddOns\ElvUI\media\fonts\Homespun.ttf]] UIFontSize = 10 end
	cSkinFrame(MinArchMain)
	cSkinStatusBar(MinArchMainSkillBar)
	MinArchMainSkillBar:Point("TOP", MinArchMain, "TOP", 2, -24)
	MinArchMainSkillBar:Width(253)

	cDesaturate(MinArchMainButtonOpenADI)
	cDesaturate(MinArchMainButtonOpenHist)
	cDesaturate(MinArchMainButtonOpenArch)
	cSkinCloseButton(MinArchMainButtonClose)
	MinArchMainButtonOpenADI:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", -66, -1)
	MinArchMainButtonOpenHist:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", -46, -1)
	MinArchMainButtonOpenArch:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", -26, -1)
	MinArchMainButtonClose:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", 2, 2)

	cSkinFrame(MinArchDigsites)
	cSkinCloseButton(MinArchDigsitesButtonClose)

	cSkinFrame(MinArchHist)
	cSkinCloseButton(MinArchHistButtonClose)

	for i = 1, 10 do
		cSkinStatusBar(_G["MinArchMainArtifactBar"..i])
		_G["MinArchMainArtifactBar"..i]:SetStatusBarColor(1.0, 0.4, 0)
		cSkinButton(_G["MinArchMainArtifactBar"..i.."ButtonSolve"])
		_G["MinArchMainArtifactBar"..i.."ButtonSolve"].text = _G["MinArchMainArtifactBar"..i.."ButtonSolve"]:CreateFontString(nil, "OVERLAY")
		_G["MinArchMainArtifactBar"..i.."ButtonSolve"].text:SetFont(UIFont, UIFontSize, "OUTLINE")
		_G["MinArchMainArtifactBar"..i.."ButtonSolve"].text:SetPoint("CENTER", 1, 1)
		_G["MinArchMainArtifactBar"..i.."ButtonSolve"].text:SetText("Solve")
		--Min Arch Options
		cSkinCheckBox(_G["MinArchOptionPanelHideArtifact"..i])
		cSkinCheckBox(_G["MinArchOptionPanelFragmentCap"..i])
		if _G["MinArchOptionPanelUseKeystones"..i] then cSkinCheckBox(_G["MinArchOptionPanelUseKeystones"..i]) end
	end

	local checkbox = {
		MinArchOptionPanelMiscOptionsHideMinimap,
		MinArchOptionPanelMiscOptionsDisableSound,
		MinArchOptionPanelMiscOptionsStartHidden,
		MinArchOptionPanelMiscOptionsHideAfter,
		MinArchOptionPanelMiscOptionsWaitForSolve,
	}

	for _,boxes in pairs(checkbox) do
		cSkinCheckBox(boxes)
	end

	cSkinSliderFrame(MinArchOptionPanelFrameScaleSlider)
	MinArchOptionPanelFrameScaleSliderLow:ClearAllPoints()
	MinArchOptionPanelFrameScaleSliderLow:SetPoint("BOTTOMLEFT", MinArchOptionPanelFrameScale, "BOTTOMLEFT", 3, 3)
	MinArchOptionPanelFrameScaleSliderHigh:ClearAllPoints()
	MinArchOptionPanelFrameScaleSliderHigh:SetPoint("BOTTOMRIGHT", MinArchOptionPanelFrameScale, "BOTTOMRIGHT", -3, 3)

	MinArchMainButtonOpenADI:SetTemplate("Default")
	MinArchMainButtonOpenADI:SetNormalTexture("")
	MinArchMainButtonOpenADI:SetPushedTexture("")
	MinArchMainButtonOpenADI:SetHighlightTexture("")
	MinArchMainButtonOpenADI:SetSize(14, 14)
	MinArchMainButtonOpenADI:ClearAllPoints()

	MinArchMainButtonOpenHist:SetTemplate("Default")
	MinArchMainButtonOpenHist:SetNormalTexture("")
	MinArchMainButtonOpenHist:SetPushedTexture("")
	MinArchMainButtonOpenHist:SetHighlightTexture("")
	MinArchMainButtonOpenHist:SetSize(14, 14)
	MinArchMainButtonOpenHist:ClearAllPoints()

	MinArchMainButtonOpenArch:SetTemplate("Default")
	MinArchMainButtonOpenArch:SetNormalTexture("")
	MinArchMainButtonOpenArch:SetPushedTexture("")
	MinArchMainButtonOpenArch:SetHighlightTexture("")
	MinArchMainButtonOpenArch:SetSize(14, 14)
	MinArchMainButtonOpenArch:ClearAllPoints()

	MinArchMainButtonOpenArch.text = MinArchMainButtonOpenArch:CreateFontString(nil, "OVERLAY")
	MinArchMainButtonOpenArch.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	MinArchMainButtonOpenArch.text:SetPoint("CENTER", 2, 1)
	MinArchMainButtonOpenArch.text:SetText("A")
	MinArchMainButtonOpenHist.text = MinArchMainButtonOpenHist:CreateFontString(nil, "OVERLAY")
	MinArchMainButtonOpenHist.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	MinArchMainButtonOpenHist.text:SetPoint("CENTER", 2, 1)
	MinArchMainButtonOpenHist.text:SetText("H")
	MinArchMainButtonOpenADI.text = MinArchMainButtonOpenADI:CreateFontString(nil, "OVERLAY")
	MinArchMainButtonOpenADI.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	MinArchMainButtonOpenADI.text:SetPoint("CENTER", 2, 1)
	MinArchMainButtonOpenADI.text:SetText("D")

	MinArchMainButtonOpenADI:Point("RIGHT", MinArchMainButtonOpenHist, "LEFT", -3, 0)
	MinArchMainButtonOpenHist:Point("RIGHT", MinArchMainButtonOpenArch, "LEFT", -3, 0)
	MinArchMainButtonOpenArch:Point("BOTTOMRIGHT", MinArchMain, "BOTTOMRIGHT", -6, 3)

end

cRegisterSkin(name,SkinMinimalArchaeology)