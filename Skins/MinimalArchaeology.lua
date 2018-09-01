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

	for i = 1, ARCHAEOLOGY_NUM_RACES do
		AS:SkinStatusBar(MinArch['artifactbars'][i])
		MinArch['artifactbars'][i]:SetStatusBarColor(1.0, 0.4, 0)
		AS:SkinButton(MinArch['artifactbars'][i].buttonSolve)
		--MinArch['artifactbars'][i].buttonSolve:SetHeight(17)
		--MinArch['artifactbars'][i].buttonSolve:SetPoint('TOPLEFT', _G['MinArchMainArtifactBar'..i], 'TOPRIGHT', 5, 2)
	end
end

AS:RegisterSkin('MinimalArchaeology', AS.MinimalArchaeology)
