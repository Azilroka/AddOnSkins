local AS = unpack(AddOnSkins)

function AS:Blizzard_Archaeology(event, addon)
	if addon ~= "Blizzard_ArchaeologyUI" then return end

	AS:SkinFrame(ArchaeologyFrame)
	AS:CreateShadow(ArchaeologyFrame)
	AS:SkinCloseButton(ArchaeologyFrame.CloseButton)

	ArchaeologyFrame.portrait:Hide()
	ArchaeologyFrame.Inset:Hide()
	ArchaeologyFrame.bgLeft:Hide()
	ArchaeologyFrame.bgRight:Hide()

	AS:SkinDropDownBox(ArchaeologyFrame.raceFilterDropDown, 125)
	AS:SkinStatusBar(ArchaeologyFrame.rankBar)

	AS:SkinButton(ArchaeologyFrame.artifactPage.solveFrame.solveButton, true)
	AS:SkinStatusBar(ArchaeologyFrame.artifactPage.solveFrame.statusBar)
	ArchaeologyFrame.artifactPage.solveFrame.statusBar:SetStatusBarColor(0.03125, .85, 0)

	for i = 1, ARCHAEOLOGY_MAX_RACES do
		local frame = ArchaeologyFrame.summaryPage['race'..i]
		local artifact = ArchaeologyFrame.completedPage['artifact'..i]
		frame.raceName:SetTextColor(1, 1, 1)

		artifact.border:SetTexture(nil)
		AS:SkinTexture(artifact.icon)
		AS:CreateBackdrop(artifact)
		artifact.Backdrop:SetOutside(artifact.icon)
		artifact.artifactName:SetTextColor(1, 1, 0)
		artifact.artifactSubText:SetTextColor(0.6, 0.6, 0.6)
	end

	for _, Frame in pairs({ ArchaeologyFrame.completedPage, ArchaeologyFrame.summaryPage }) do
		for i = 1, Frame:GetNumRegions() do
			local Region = select(i, Frame:GetRegions())
			if Region:IsObjectType("FontString") then
				Region:SetTextColor(1, 1, 0)
			end
		end
	end

	ArchaeologyFrame.completedPage.infoText:SetTextColor(1, 1, 1)

	ArchaeologyFrame.artifactPage.historyTitle:SetTextColor(1, 1, 0)

	AS:SkinTexture(ArchaeologyFrame.artifactPage.icon)

	AS:CreateBackdrop(ArchaeologyFrame.artifactPage)
	ArchaeologyFrame.artifactPage.Backdrop:SetOutside(ArchaeologyFrame.artifactPage.icon)

	ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1, 1, 1)

	ArchaeologyFrame.helpPage.titleText:SetTextColor(1, 1, 0)

	ArchaeologyFrameHelpPageDigTitle:SetTextColor(1, 1, 0)
	ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1, 1, 1)

	AS:SkinNextPrevButton(ArchaeologyFrame.summaryPage.prevPageButton)
	AS:SkinNextPrevButton(ArchaeologyFrame.summaryPage.nextPageButton)

	AS:SkinNextPrevButton(ArchaeologyFrame.completedPage.prevPageButton)
	AS:SkinNextPrevButton(ArchaeologyFrame.completedPage.nextPageButton)

	AS:StripTextures(ArcheologyDigsiteProgressBar)
	AS:SkinStatusBar(ArcheologyDigsiteProgressBar.FillBar)
	ArcheologyDigsiteProgressBar.FillBar:SetStatusBarColor(.61, .25, 0)
end

AS:RegisterSkin("Blizzard_ArchaeologyUI", AS.Blizzard_Archaeology, 'ADDON_LOADED')