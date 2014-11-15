local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Archy') then return end

function AS:Archy()
	-- Archy.db.profile.general.theme
	for _, object in pairs({ArchyArtifactFrame, ArchyDigSiteFrame}) do
		AS:SkinFrame(object)
		object.SetBackdrop = AS.Noop
		object.SetBackdropColor = AS.Noop
		object.SetBackdropBorderColor = AS.Noop
	end

	if ArchyDistanceIndicatorFrame then
		for _, object in pairs({"surveyButton", "crateButton", "loritemButton"}) do
			AS:SkinButton(ArchyDistanceIndicatorFrame[object])
			ArchyDistanceIndicatorFrame[object]:SetFrameLevel(ArchyDistanceIndicatorFrame:GetFrameLevel() + 3)
			AS:SkinTexture(ArchyDistanceIndicatorFrame[object].icon)
			ArchyDistanceIndicatorFrame[object].icon:SetInside()
			ArchyDistanceIndicatorFrame[object].icon:SetDrawLayer('OVERLAY')
		end
	end

	if Archy.db.profile.general.theme ~= 'Minimal' then
		local function SkinArchyArtifactFrame()
			for i, child in pairs(ArchyArtifactFrame.children) do
				local containerFrame = _G['ArchyArtifactChildFrame'..i]
				local crest = _G['ArchyArtifactChildFrame'..i..'Crest']
				local icon = _G['ArchyArtifactChildFrame'..i..'Icon']
				local fragmentBar = _G['ArchyArtifactChildFrame'..i..'FragmentBar']
				local solveButton = _G['ArchyArtifactChildFrame'..i..'SolveButton']

				if not solveButton.isSkinned then
					AS:SkinFrame(solveButton, false, true)
					AS:SkinTexture(solveButton:GetNormalTexture())
					solveButton:GetNormalTexture():SetInside()	
					AS:SkinTexture(solveButton:GetDisabledTexture())
					solveButton:GetDisabledTexture():SetInside()		
					AS:StyleButton(solveButton)
					solveButton.isSkinned = true
				end

				if not icon.isSkinned then
					AS:SkinFrame(icon, false, true)
					AS:SkinTexture(icon.texture)
					icon.texture:SetInside()
					icon.isSkinned = true
				end

				if not fragmentBar.isSkinned then
					AS:CreateBackdrop(fragmentBar)
					fragmentBar.isSkinned = true
				end

				icon:SetSize(solveButton:GetHeight(),solveButton:GetHeight())
				fragmentBar:SetPoint('TOPLEFT', icon, 'TOPRIGHT', 7, -2)
			end
		end

		hooksecurefunc(Archy, 'RefreshRacesDisplay', SkinArchyArtifactFrame)
		hooksecurefunc(Archy, 'UpdateRacesFrame', SkinArchyArtifactFrame)

		Archy:UpdateRacesFrame()
		Archy:RefreshRacesDisplay()

		if ArchyArtifactFrameSkillBar then
			AS:SkinStatusBar(ArchyArtifactFrameSkillBar)
			ArchyArtifactFrameSkillBar.text:SetTextColor(1, 1, 1)
			ArchyArtifactFrameSkillBar.text.SetTextColor = AS.Noop
		end
	end
end

AS:RegisterSkin('Archy', AS.Archy)