local AS = unpack(AddOnSkins)

function AS:Blizzard_Archaeology(event, addon)
	if addon ~= "Blizzard_ArchaeologyUI" then return end

	AS:SkinFrame(ArchaeologyFrame, nil, nil, true)
	AS:StripTextures(ArchaeologyFrameInset, true)
	AS:CreateShadow(ArchaeologyFrame)

	AS:SkinButton(ArchaeologyFrameArtifactPageSolveFrameSolveButton, true)
	AS:SkinDropDownBox(ArchaeologyFrameRaceFilter, 125)

	AS:SkinStatusBar(ArchaeologyFrameRankBar)

	AS:SkinStatusBar(ArchaeologyFrameArtifactPageSolveFrameStatusBar)
	ArchaeologyFrameArtifactPageSolveFrameStatusBar:SetStatusBarColor(0.7, 0.2, 0)

	for i = 1, ARCHAEOLOGY_MAX_RACES do
		local frame = _G["ArchaeologyFrameSummaryPageRace"..i]
		frame.raceName:SetTextColor(1, 1, 1)

		local artifact = _G["ArchaeologyFrameCompletedPageArtifact"..i]
		artifact.border:SetTexture(nil)
		_G[artifact:GetName().."Bg"]:Kill()
		AS:SkinTexture(artifact.icon)
		AS:CreateBackdrop(artifact)
		artifact.Backdrop:SetOutside(artifact.icon)
		artifact.artifactName:SetTextColor(1, 1, 0)
		artifact.artifactSubText:SetTextColor(0.6, 0.6, 0.6)
	end

	for _, Frame in pairs({ ArchaeologyFrameCompletedPage, ArchaeologyFrameSummaryPage}) do
		for i = 1, Frame:GetNumRegions() do
			local Region = select(i, Frame:GetRegions())
			if Region:IsObjectType("FontString") then
				Region:SetTextColor(1, 1, 0)
			end
		end
	end

	ArchaeologyFrameCompletedPage.infoText:SetTextColor(1, 1, 1)
	ArchaeologyFrameHelpPageTitle:SetTextColor(1, 1, 0)
	ArchaeologyFrameHelpPageDigTitle:SetTextColor(1, 1, 0)
	ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1, 1, 1)

	ArchaeologyFrameArtifactPageHistoryTitle:SetTextColor(1, 1, 0)
	AS:SkinTexture(ArchaeologyFrameArtifactPageIcon)
	AS:CreateBackdrop(ArchaeologyFrameArtifactPage)
	ArchaeologyFrameArtifactPage.Backdrop:SetOutside(ArchaeologyFrameArtifactPageIcon)

	ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1, 1, 1)
	AS:SkinCloseButton(ArchaeologyFrameCloseButton)
	AS:SkinNextPrevButton(ArchaeologyFrameCompletedPagePrevPageButton)
	AS:SkinNextPrevButton(ArchaeologyFrameSummaryPagePrevPageButton)
	AS:SkinNextPrevButton(ArchaeologyFrameCompletedPageNextPageButton)
	AS:SkinNextPrevButton(ArchaeologyFrameSummaryPageNextPageButton)

	AS:StripTextures(ArcheologyDigsiteProgressBar)
	AS:SkinStatusBar(ArcheologyDigsiteProgressBar.FillBar)
	ArcheologyDigsiteProgressBar.FillBar:SetStatusBarColor(.61, .25, 0)
end

AS:RegisterSkin("Blizzard_ArchaeologyUI", AS.Blizzard_Archaeology, 'ADDON_LOADED')