local AS = unpack(AddOnSkins)

function AS:Blizzard_ArchaeologyUI(event, addon)
	if addon ~= "Blizzard_ArchaeologyUI" then return end

	AS:SkinFrame(ArchaeologyFrame, nil, nil, true)
	AS:CreateShadow(ArchaeologyFrame)
	AS:SkinCloseButton(ArchaeologyFrame.CloseButton)

	ArchaeologyFrame.portrait:Hide()

	AS:SkinDropDownBox(ArchaeologyFrame.raceFilterDropDown)
	AS:SkinStatusBar(ArchaeologyFrame.rankBar)

	AS:SkinButton(ArchaeologyFrame.artifactPage.solveFrame.solveButton, true)
	AS:SkinStatusBar(ArchaeologyFrame.artifactPage.solveFrame.statusBar)
	ArchaeologyFrame.artifactPage.solveFrame.statusBar:SetStatusBarColor(0.03125, .85, 0)

	for i = 1, ARCHAEOLOGY_MAX_RACES do
		local frame = ArchaeologyFrame.summaryPage['race'..i]
		local artifact = ArchaeologyFrame.completedPage['artifact'..i]
		frame.raceName:SetTextColor(1, 1, 1)

		artifact.border:SetTexture(nil)
		AS:SkinTexture(artifact.icon, true)
		artifact.artifactName:SetTextColor(1, .8, .1)
		artifact.artifactSubText:SetTextColor(0.6, 0.6, 0.6)
	end

	for _, Frame in pairs({ ArchaeologyFrame.completedPage, ArchaeologyFrame.summaryPage }) do
		for i = 1, Frame:GetNumRegions() do
			local Region = select(i, Frame:GetRegions())
			if Region:IsObjectType("FontString") then
				Region:SetTextColor(1, .8, .1)
			end
		end
	end

	ArchaeologyFrame.completedPage.infoText:SetTextColor(1, 1, 1)

	ArchaeologyFrame.artifactPage.historyTitle:SetTextColor(1, .8, .1)

	AS:SkinTexture(ArchaeologyFrame.artifactPage.icon)

	AS:CreateBackdrop(ArchaeologyFrame.artifactPage)
	ArchaeologyFrame.artifactPage.Backdrop:SetOutside(ArchaeologyFrame.artifactPage.icon)

	ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1, 1, 1)

	ArchaeologyFrame.helpPage.titleText:SetTextColor(1, .8, .1)

	ArchaeologyFrameHelpPageDigTitle:SetTextColor(1, .8, .1)
	ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1, 1, 1)

	AS:SkinArrowButton(ArchaeologyFrame.summaryPage.prevPageButton)
	AS:SkinArrowButton(ArchaeologyFrame.summaryPage.nextPageButton)

	AS:SkinArrowButton(ArchaeologyFrame.completedPage.prevPageButton)
	AS:SkinArrowButton(ArchaeologyFrame.completedPage.nextPageButton)

	AS:StripTextures(ArcheologyDigsiteProgressBar)
	AS:SkinStatusBar(ArcheologyDigsiteProgressBar.FillBar)
	ArcheologyDigsiteProgressBar.FillBar:SetStatusBarColor(.61, .25, 0)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_ArchaeologyUI", AS.Blizzard_ArchaeologyUI, 'ADDON_LOADED')