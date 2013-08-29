local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "MinimalArchaeologySkin"
function AS:SkinMinimalArchaeology()
	AS:SkinFrame(MinArchMain)
	AS:SkinStatusBar(MinArchMainSkillBar)
	MinArchMainSkillBar:Point("TOP", MinArchMain, "TOP", 2, -24)
	MinArchMainSkillBar:Width(253)
	AS:Desaturate(MinArchMainButtonOpenADI)
	AS:Desaturate(MinArchMainButtonOpenHist)
	AS:Desaturate(MinArchMainButtonOpenArch)
	AS:SkinCloseButton(MinArchMainButtonClose)
	MinArchMainButtonClose:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", 2, 2)
	MinArchMainButtonOpenADI:Point("RIGHT", MinArchMainButtonOpenHist, "LEFT", -3, 0)
	MinArchMainButtonOpenHist:Point("RIGHT", MinArchMainButtonOpenArch, "LEFT", -3, 0)
	MinArchMainButtonOpenArch:Point("RIGHT", MinArchMainButtonClose, "LEFT", -3, 0)
	AS:SkinFrame(MinArchDigsites)
	AS:SkinCloseButton(MinArchDigsitesButtonClose)
	AS:SkinFrame(MinArchHist)
	AS:SkinCloseButton(MinArchHistButtonClose)

	for i = 1, 12 do
		AS:SkinStatusBar(_G["MinArchMainArtifactBar"..i])
		_G["MinArchMainArtifactBar"..i]:SetStatusBarColor(1.0, 0.4, 0)
		AS:SkinButton(_G["MinArchMainArtifactBar"..i.."ButtonSolve"])
		_G["MinArchMainArtifactBar"..i.."ButtonSolve"]:SetHeight(17)
		_G["MinArchMainArtifactBar"..i.."ButtonSolve"]:SetPoint("TOPLEFT", _G["MinArchMainArtifactBar"..i], "TOPRIGHT", 5, 2)
		AS:SkinCheckBox(_G["MinArchOptionPanelHideArtifact"..i])
		AS:SkinCheckBox(_G["MinArchOptionPanelFragmentCap"..i])
		if _G["MinArchOptionPanelUseKeystones"..i] then AS:SkinCheckBox(_G["MinArchOptionPanelUseKeystones"..i]) end
	end

	local checkbox = {
		MinArchOptionPanelMiscOptionsHideMinimap,
		MinArchOptionPanelMiscOptionsDisableSound,
		MinArchOptionPanelMiscOptionsStartHidden,
		MinArchOptionPanelMiscOptionsHideAfter,
		MinArchOptionPanelMiscOptionsWaitForSolve,
	}

	for _, boxes in pairs(checkbox) do
		AS:SkinCheckBox(boxes)
	end

	AS:SkinSlideBar(MinArchOptionPanelFrameScaleSlider)
	MinArchOptionPanelFrameScaleSliderLow:ClearAllPoints()
	MinArchOptionPanelFrameScaleSliderLow:SetPoint("BOTTOMLEFT", MinArchOptionPanelFrameScale, "BOTTOMLEFT", 3, 3)
	MinArchOptionPanelFrameScaleSliderHigh:ClearAllPoints()
	MinArchOptionPanelFrameScaleSliderHigh:SetPoint("BOTTOMRIGHT", MinArchOptionPanelFrameScale, "BOTTOMRIGHT", -3, 3)

	AS:SkinFrame(MinArchOptionPanelHideArtifact)
	AS:SkinFrame(MinArchOptionPanelFragmentCap)
	AS:SkinFrame(MinArchOptionPanelUseKeystones)
	AS:SkinFrame(MinArchOptionPanelMiscOptions)
	AS:SkinFrame(MinArchOptionPanelFrameScale)
end

AS:RegisterSkin(name, AS.SkinMinimalArchaeology)