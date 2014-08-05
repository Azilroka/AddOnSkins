local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Archy') then return end

local name = 'ArchySkin'
function AS:SkinArchy()
	local function SkinArchyArtifactFrame()
		AS:SkinFrame(ArchyArtifactFrame)

		if ArchyArtifactFrameSkillBar then
			ArchyArtifactFrameSkillBar.text:SetTextColor(1, 1, 1)
		end

		for i, child in pairs(ArchyArtifactFrame.children) do
			local containerFrame = _G['ArchyArtifactChildFrame'..i]
			local crest = _G['ArchyArtifactChildFrame'..i..'Crest']
			local icon = _G['ArchyArtifactChildFrame'..i..'Icon']
			local fragmentBar = _G['ArchyArtifactChildFrame'..i..'FragmentBar']
			local solveButton = _G['ArchyArtifactChildFrame'..i..'SolveButton']

			if icon then
				AS:SkinFrame(icon, false, true)
				icon:SetSize(solveButton:GetHeight(),solveButton:GetHeight())
				AS:SkinTexture(icon.texture)
				icon.texture:SetInside()
			end

			if solveButton then
				AS:SkinFrame(solveButton, false, true)
				AS:SkinTexture(solveButton:GetNormalTexture())
				solveButton:GetNormalTexture():SetInside()	
				AS:SkinTexture(solveButton:GetDisabledTexture())
				solveButton:GetDisabledTexture():SetInside()		
				solveButton:StyleButton()
			end

			if fragmentBar then
				AS:SkinStatusBar(fragmentBar)
				fragmentBar:SetPoint('TOPLEFT', icon, 'TOPRIGHT', 7, -2)
			end
		end
	end

	hooksecurefunc(Archy, 'RefreshRacesDisplay', SkinArchyArtifactFrame)
	hooksecurefunc(Archy, 'UpdateRacesFrame', SkinArchyArtifactFrame)

	Archy:UpdateRacesFrame()
	Archy:RefreshRacesDisplay()

	local function SkinArchyDigSiteFrame()
		AS:SkinFrame(ArchyDigSiteFrame)
	end

	hooksecurefunc(Archy, 'UpdateDigSiteFrame', SkinArchyDigSiteFrame)

	if ArchyArtifactFrameSkillBar then
		AS:SkinStatusBar(ArchyArtifactFrameSkillBar)	
	end

	if ArchyDistanceIndicatorFrame then
		ArchyDistanceIndicatorFrame.surveyButton:StripTextures()
		ArchyDistanceIndicatorFrame.surveyButton.icon:SetTexture("Interface\\Icons\\inv_misc_shovel_01")
		AS:SkinTexture(ArchyDistanceIndicatorFrame.surveyButton.icon)
		ArchyDistanceIndicatorFrame.crateButton:StripTextures()
		ArchyDistanceIndicatorFrame.crateButton.icon:SetTexture("Interface\\Icons\\inv_crate_04")
		AS:SkinTexture(ArchyDistanceIndicatorFrame.crateButton.icon)
		ArchyDistanceIndicatorFrame.loritemButton:StripTextures()
		ArchyDistanceIndicatorFrame.loritemButton.icon:SetTexture("Interface\\Icons\\inv_misc_map08")
		AS:SkinTexture(ArchyDistanceIndicatorFrame.loritemButton.icon)
	end
end

AS:RegisterSkin(name, AS.SkinArchy)