local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "ArchySkin"

function AS:SkinArchy()
	local function SkinArchyArtifactFrame()
		AS:SkinFrame(ArchyArtifactFrame)

		if ArchyArtifactFrameSkillBar then
			ArchyArtifactFrameSkillBar.text:SetTextColor(1, 1, 1)
		end

		for i, child in pairs(ArchyArtifactFrame.children) do
			local containerFrame = _G['ArchyArtifactChildFrame'..i]
			local icon = _G['ArchyArtifactChildFrame'..i..'Icon']
			local fragmentBar = _G['ArchyArtifactChildFrame'..i..'FragmentBar']
			local solveButton = _G['ArchyArtifactChildFrame'..i..'SolveButton']

			if icon then
				icon:SetTemplate('Default')
				icon.texture:SetTexCoord(.08, .92, .08, .92)
				icon.texture:SetInside()
			end
				
			if solveButton then
				solveButton:SetTemplate('Default')
				solveButton:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
				solveButton:GetNormalTexture():SetInside()	
				solveButton:GetDisabledTexture():SetTexCoord(.08, .92, .08, .92)
				solveButton:GetDisabledTexture():SetInside()		
				solveButton:StyleButton()
			end

			if fragmentBar then
				AS:SkinStatusBar(fragmentBar)	
			end
		end	
	end
	hooksecurefunc(Archy, 'RefreshRacesDisplay', SkinArchyArtifactFrame)
	hooksecurefunc(Archy, "UpdateRacesFrame", SkinArchyArtifactFrame)
	Archy:UpdateRacesFrame()
	Archy:RefreshRacesDisplay()
	
	local function SkinArchyDigSiteFrame()
		AS:SkinFrame(ArchyDigSiteFrame)
	end

	hooksecurefunc(Archy, "UpdateDigSiteFrame", SkinArchyDigSiteFrame)

	if ArchyArtifactFrameSkillBar then
		AS:SkinStatusBar(ArchyArtifactFrameSkillBar)	
	end
	S:HandleButton(ArchyDistanceIndicatorFrameSurveyButton)
	ArchyDistanceIndicatorFrameSurveyButtonIcon:SetDrawLayer("OVERLAY")
	S:HandleButton(ArchyDistanceIndicatorFrameCrateButton)
 	ArchyDistanceIndicatorFrameCrateButtonIcon:SetDrawLayer("OVERLAY")
end

AS:RegisterSkin(name,AS.SkinArchy)