local AS, L, S, R = unpack(AddOnSkins)

function R:MinimalArchaeology()
	S:HandleFrame(MinArchMain)
	S:HandleStatusBar(MinArchMainSkillBar)
	MinArchMainSkillBar:SetPoint('TOP', MinArchMain, 'TOP', 2, -24)
	MinArchMainSkillBar:SetWidth(253)
	S:Desaturate(MinArchMainButtonOpenADI)
	S:Desaturate(MinArchMainButtonOpenHist)
	S:Desaturate(MinArchMainButtonOpenArch)
	S:HandleCloseButton(MinArchMainButtonClose)
	MinArchMainButtonOpenADI:SetPoint('TOPRIGHT', MinArchMain, 'TOPRIGHT', -66, -2)
	MinArchMainButtonOpenHist:SetPoint('TOPRIGHT', MinArchMain, 'TOPRIGHT', -46, -2)
	MinArchMainButtonOpenArch:SetPoint('TOPRIGHT', MinArchMain, 'TOPRIGHT', -26, -2)
	MinArchMainButtonClose:SetPoint('TOPRIGHT', MinArchMain, 'TOPRIGHT', 2, 2)
	S:HandleFrame(MinArchDigsites)
	S:HandleCloseButton(MinArchDigsitesButtonClose)
	S:HandleFrame(MinArchHist)
	S:HandleCloseButton(MinArchHistButtonClose)

	for i = 1, ARCHAEOLOGY_NUM_RACES do
		S:HandleStatusBar(MinArchArtifactBars[i], {1.0, 0.4, 0})
		S:HandleButton(MinArchArtifactBars[i].buttonSolve)
		--MinArchArtifactBars[i].buttonSolve:SetHeight(17)
		--MinArchArtifactBars[i].buttonSolve:SetPoint('TOPLEFT', _G['MinArchMainArtifactBar'..i], 'TOPRIGHT', 5, 2)
	end
end

AS:RegisterSkin('MinimalArchaeology')
