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
	
	for i = 1, ARCHAEOLOGY_MAX_COMPLETED_SHOWN do
		local artifact = _G["ArchaeologyFrameCompletedPageArtifact"..i]
		
		if artifact then
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Border"]:Kill()
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Bg"]:Kill()
			AS:SkinTexture(_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"])
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop = CreateFrame("Frame", nil, artifact)
			AS:SetTemplate(_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop, 'Default')
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop:Point("TOPLEFT", _G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"], "TOPLEFT", -2, 2)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop:Point("BOTTOMRIGHT", _G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"], "BOTTOMRIGHT", 2, -2)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop:SetFrameLevel(artifact:GetFrameLevel() - 2)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"]:SetDrawLayer("OVERLAY")
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."ArtifactName"]:SetTextColor(1, 1, 0)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."ArtifactSubText"]:SetTextColor(0.6, 0.6, 0.6)
		end
	end
	
	for i = 1, ARCHAEOLOGY_MAX_RACES do
		local frame = _G["ArchaeologyFrameSummaryPageRace"..i]
		
		if frame then
			frame.raceName:SetTextColor(1, 1, 1)
		end
	end
	
	for i = 1, ArchaeologyFrameCompletedPage:GetNumRegions() do
		local region = select(i, ArchaeologyFrameCompletedPage:GetRegions())
		if region:GetObjectType() == "FontString" then
			region:SetTextColor(1, 1, 0)
		end
	end
	
	for i = 1, ArchaeologyFrameSummaryPage:GetNumRegions() do
		local region = select(i, ArchaeologyFrameSummaryPage:GetRegions())
		if region:GetObjectType() == "FontString" then
			region:SetTextColor(1, 1, 0)
		end
	end
	
	ArchaeologyFrameCompletedPage.infoText:SetTextColor(1, 1, 1)
	ArchaeologyFrameHelpPageTitle:SetTextColor(1, 1, 0)
	ArchaeologyFrameHelpPageDigTitle:SetTextColor(1, 1, 0)
	ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1, 1, 1)
	
	ArchaeologyFrameArtifactPageHistoryTitle:SetTextColor(1, 1, 0)
	AS:SkinTexture(ArchaeologyFrameArtifactPageIcon)
	ArchaeologyFrameArtifactPageIcon.backdrop = CreateFrame("Frame", nil, ArchaeologyFrameArtifactPage)
	AS:SetTemplate(ArchaeologyFrameArtifactPageIcon.backdrop, 'Default')
	ArchaeologyFrameArtifactPageIcon.backdrop:Point("TOPLEFT", ArchaeologyFrameArtifactPageIcon, "TOPLEFT", -2, 2)
	ArchaeologyFrameArtifactPageIcon.backdrop:Point("BOTTOMRIGHT", ArchaeologyFrameArtifactPageIcon, "BOTTOMRIGHT", 2, -2)
	ArchaeologyFrameArtifactPageIcon.backdrop:SetFrameLevel(ArchaeologyFrameArtifactPage:GetFrameLevel())
	ArchaeologyFrameArtifactPageIcon:SetParent(ArchaeologyFrameArtifactPageIcon.backdrop)
	ArchaeologyFrameArtifactPageIcon:SetDrawLayer("OVERLAY")	
	
	ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1, 1, 1)
	AS:SkinCloseButton(ArchaeologyFrameCloseButton)
	AS:SkinNextPrevButton(ArchaeologyFrameCompletedPagePrevPageButton)
	AS:SkinNextPrevButton(ArchaeologyFrameSummaryPagePrevPageButton)
	AS:SkinNextPrevButton(ArchaeologyFrameCompletedPageNextPageButton)
	AS:SkinNextPrevButton(ArchaeologyFrameSummaryPageNextPageButton)
end

AS:RegisterSkin("Blizzard_ArchaeologyUI", AS.Blizzard_Archaeology, 'ADDON_LOADED')