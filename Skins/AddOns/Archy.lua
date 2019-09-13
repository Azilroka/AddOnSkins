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
			ArchyDistanceIndicatorFrame[object].icon:SetInside()
			ArchyDistanceIndicatorFrame[object].icon:SetDrawLayer('OVERLAY')
			ArchyDistanceIndicatorFrame[object].icon:SetTexCoord(unpack(AS.TexCoords))
		end
	end

	if Archy.db.profile.general.theme ~= 'Minimal' then
		local function SkinArchyArtifactFrame()
			for _, child in pairs(ArchyArtifactFrame.children) do
				if child then
					local icon = child.icon
					local fragmentBar = child.fragmentBar
					local solveButton = child.solveButton

					if not solveButton.isSkinned then
						AS:SkinFrame(solveButton, false, true)
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

					if solveButton:GetNormalTexture() then
						solveButton:GetNormalTexture():SetTexCoord(unpack(AS.TexCoords))
						solveButton:GetNormalTexture():SetInside()
						solveButton:GetDisabledTexture():SetTexCoord(unpack(AS.TexCoords))
						solveButton:GetDisabledTexture():SetInside()
					end

					icon:SetSize(solveButton:GetHeight(),solveButton:GetHeight())
					fragmentBar:SetPoint('TOPLEFT', icon, 'TOPRIGHT', 7, -2)
				end
			end
		end

		hooksecurefunc(ArchyArtifactFrame, 'RefreshDisplay', SkinArchyArtifactFrame)

		ArchyArtifactFrame:RefreshDisplay()

		if ArchyArtifactFrameSkillBar then
			AS:SkinStatusBar(ArchyArtifactFrameSkillBar)
			ArchyArtifactFrameSkillBar.text:SetTextColor(1, 1, 1)
			ArchyArtifactFrameSkillBar.text.SetTextColor = AS.Noop
		end
	end
end

AS:RegisterSkin('Archy', AS.Archy)