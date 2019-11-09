if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local pairs, select = pairs, select
--WoW API / Variables
-- GLOBALS:

function AS:Blizzard_ArchaeologyUI(event, addon)
	if addon ~= "Blizzard_ArchaeologyUI" then return end

	AS:SkinFrame(_G.ArchaeologyFrame, nil, nil, true)
	AS:CreateShadow(_G.ArchaeologyFrame)
	AS:SkinCloseButton(_G.ArchaeologyFrame.CloseButton)

	_G.ArchaeologyFrame.portrait:Hide()

	AS:SkinDropDownBox(_G.ArchaeologyFrame.raceFilterDropDown)
	AS:SkinStatusBar(_G.ArchaeologyFrame.rankBar)

	AS:SkinButton(_G.ArchaeologyFrame.artifactPage.solveFrame.solveButton, true)
	AS:SkinButton(_G.ArchaeologyFrame.artifactPage.backButton, true)

	AS:SkinStatusBar(_G.ArchaeologyFrame.artifactPage.solveFrame.statusBar)

	for i = 1, _G.ARCHAEOLOGY_MAX_RACES do
		local frame = _G.ArchaeologyFrame.summaryPage['race'..i]
		local artifact = _G.ArchaeologyFrame.completedPage['artifact'..i]
		frame.raceName:SetTextColor(1, 1, 1)

		artifact.border:SetTexture()
		AS:SkinTexture(artifact.icon, true)
		artifact.artifactName:SetTextColor(1, .8, .1)
		artifact.artifactSubText:SetTextColor(0.6, 0.6, 0.6)
	end

	for _, Frame in pairs({ _G.ArchaeologyFrame.completedPage, _G.ArchaeologyFrame.summaryPage }) do
		for i = 1, Frame:GetNumRegions() do
			local Region = select(i, Frame:GetRegions())
			if Region:IsObjectType("FontString") then
				Region:SetTextColor(1, .8, .1)
			end
		end
	end

	_G.ArchaeologyFrame.completedPage.infoText:SetTextColor(1, 1, 1)

	_G.ArchaeologyFrame.artifactPage.historyTitle:SetTextColor(1, .8, .1)

	AS:SkinTexture(_G.ArchaeologyFrame.artifactPage.icon)

	AS:CreateBackdrop(_G.ArchaeologyFrame.artifactPage)
	AS:SetOutside(_G.ArchaeologyFrame.artifactPage.Backdrop, _G.ArchaeologyFrame.artifactPage.icon)

	_G.ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1, 1, 1)

	_G.ArchaeologyFrame.helpPage.titleText:SetTextColor(1, .8, .1)

	_G.ArchaeologyFrameHelpPageDigTitle:SetTextColor(1, .8, .1)
	_G.ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1, 1, 1)

	AS:SkinArrowButton(_G.ArchaeologyFrame.summaryPage.prevPageButton)
	AS:SkinArrowButton(_G.ArchaeologyFrame.summaryPage.nextPageButton)

	AS:SkinArrowButton(_G.ArchaeologyFrame.completedPage.prevPageButton)
	AS:SkinArrowButton(_G.ArchaeologyFrame.completedPage.nextPageButton)

	AS:StripTextures(_G.ArcheologyDigsiteProgressBar)
	AS:SkinStatusBar(_G.ArcheologyDigsiteProgressBar.FillBar, {.61, .25, 0})

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_ArchaeologyUI", AS.Blizzard_ArchaeologyUI, 'ADDON_LOADED')
