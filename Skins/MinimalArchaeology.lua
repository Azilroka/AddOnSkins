local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MinimalArchaeology') then return end

function AS:MinimalArchaeology()
	AS:SkinFrame(MinArchMain)
	AS:SkinStatusBar(MinArchMainSkillBar)
	MinArchMainSkillBar:SetPoint('TOP', MinArchMain, 'TOP', 2, -24)
	MinArchMainSkillBar:SetWidth(253)
	AS:Desaturate(MinArchMainButtonOpenADI)
	AS:Desaturate(MinArchMainButtonOpenHist)
	AS:Desaturate(MinArchMainButtonOpenArch)
	AS:SkinCloseButton(MinArchMainButtonClose)
	MinArchMainButtonOpenADI:SetPoint('TOPRIGHT', MinArchMain, 'TOPRIGHT', -66, -2)
	MinArchMainButtonOpenHist:SetPoint('TOPRIGHT', MinArchMain, 'TOPRIGHT', -46, -2)
	MinArchMainButtonOpenArch:SetPoint('TOPRIGHT', MinArchMain, 'TOPRIGHT', -26, -2)
	MinArchMainButtonClose:SetPoint('TOPRIGHT', MinArchMain, 'TOPRIGHT', 2, 2)
	AS:SkinFrame(MinArchDigsites)
	AS:SkinCloseButton(MinArchDigsitesButtonClose)
	AS:SkinFrame(MinArchHist)
	AS:SkinCloseButton(MinArchHistButtonClose)

	for i = 1, 12 do
		AS:SkinStatusBar(_G['MinArchMainArtifactBar'..i])
		_G['MinArchMainArtifactBar'..i]:SetStatusBarColor(1.0, 0.4, 0)
		AS:SkinButton(_G['MinArchMainArtifactBar'..i..'ButtonSolve'])
		_G['MinArchMainArtifactBar'..i..'ButtonSolve']:SetHeight(17)
		_G['MinArchMainArtifactBar'..i..'ButtonSolve']:SetPoint('TOPLEFT', _G['MinArchMainArtifactBar'..i], 'TOPRIGHT', 5, 2)
		AS:SkinCheckBox(_G['MinArchOptionPanelHideArtifact'..i])
		AS:SkinCheckBox(_G['MinArchOptionPanelFragmentCap'..i])
		if _G['MinArchOptionPanelUseKeystones'..i] then AS:SkinCheckBox(_G['MinArchOptionPanelUseKeystones'..i]) end
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
	MinArchOptionPanelFrameScaleSliderLow:SetPoint('BOTTOMLEFT', MinArchOptionPanelFrameScale, 'BOTTOMLEFT', 3, 3)
	MinArchOptionPanelFrameScaleSliderHigh:ClearAllPoints()
	MinArchOptionPanelFrameScaleSliderHigh:SetPoint('BOTTOMRIGHT', MinArchOptionPanelFrameScale, 'BOTTOMRIGHT', -3, 3)

	AS:SkinFrame(MinArchOptionPanelHideArtifact)
	AS:SkinFrame(MinArchOptionPanelFragmentCap)
	AS:SkinFrame(MinArchOptionPanelUseKeystones)
	AS:SkinFrame(MinArchOptionPanelMiscOptions)
	AS:SkinFrame(MinArchOptionPanelFrameScale)
end

AS:RegisterSkin('MinimalArchaeology', AS.MinimalArchaeology)