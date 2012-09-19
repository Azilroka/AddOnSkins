if not(IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("Archy") then return end
local U = unpack(select(2,...))
local name = "ArchySkin"

local function SkinArchy(self)
	local s = U.s
	local c = U.c
	
	local function SkinArchyArtifactFrame()
			U.SkinFrame(ArchyArtifactFrame)
			if not InCombatLockdown() then ArchyArtifactFrame:SetScale(1) end
			--ArchyArtifactFrame:Size(300, 210)
			ArchyArtifactFrame:Width(300)
			ArchyArtifactFrameSkillBar:Size(285, 20)	
			ArchyArtifactFrameSkillBar.text:SetTextColor(1, 1, 1)
			
			if IsAddOnLoaded("ElvUI") then
				local x = U.x
				ArchyArtifactFrameSkillBar.text:SetFont(x.pixelFont, 10, "MONOCHROMEOUTLINE")
			else
				ArchyArtifactFrameSkillBar.text:SetFont(c["media"].pixelfont, 10, "MONOCHROMEOUTLINE")
			end					
			
			ArchyArtifactFrameContainer:Width(285)
			ArchyArtifactFrameContainer:ClearAllPoints()
			ArchyArtifactFrameContainer:SetPoint('TOP', ArchyArtifactFrameSkillBar, 'BOTTOM', 0, -5)
			for i, child in pairs(ArchyArtifactFrame.children) do
				local containerFrame = _G['ArchyArtifactChildFrame'..i]
				local icon = _G['ArchyArtifactChildFrame'..i..'Icon']
				local fragmentBar = _G['ArchyArtifactChildFrame'..i..'FragmentBar']
				local solveButton = _G['ArchyArtifactChildFrame'..i..'SolveButton']

				if containerFrame then
					containerFrame:Width(285)
				end
				
				if icon then
					icon:SetTemplate('Default')
					icon:Size(26)
					icon.texture:SetTexCoord(.08, .92, .08, .92)
					icon.texture:SetInside()
				end
				
				if solveButton then
					solveButton:Size(26)
					solveButton:SetTemplate('Default')
					solveButton:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
					solveButton:GetNormalTexture():SetInside()	
					solveButton:GetDisabledTexture():SetTexCoord(.08, .92, .08, .92)
					solveButton:GetDisabledTexture():SetInside()		
					solveButton:StyleButton()
				end
				
				if fragmentBar then
					U.SkinStatusBar(fragmentBar)	
					fragmentBar:Size(180, 24)
					if IsAddOnLoaded("ElvUI") then
						local x = U.x
						fragmentBar.artifact:SetFont(x.pixelFont, 10, "MONOCHROMEOUTLINE")
						fragmentBar.fragments:SetFont(x.pixelFont, 10, "MONOCHROMEOUTLINE")
						fragmentBar.keystones.count:SetFont(x.pixelFont, 10, "MONOCHROMEOUTLINE")
					else
						fragmentBar.artifact:SetFont(c["media"].pixelfont, 10, "MONOCHROMEOUTLINE")
						fragmentBar.fragments:SetFont(c["media"].pixelfont, 10, "MONOCHROMEOUTLINE")
						fragmentBar.keystones.count:SetFont(c["media"].pixelfont, 10, "MONOCHROMEOUTLINE")
					end					
				end
			end	
	end
	hooksecurefunc(Archy, 'RefreshRacesDisplay', SkinArchyArtifactFrame)
	hooksecurefunc(Archy, "UpdateRacesFrame", SkinArchyArtifactFrame)
	Archy:UpdateRacesFrame()
	Archy:RefreshRacesDisplay()
	
	local function SkinArchyDigSiteFrame()
			U.SkinFrame(ArchyDigSiteFrame)
			if not InCombatLockdown() then ArchyDigSiteFrame:SetScale(1) end
	end

	hooksecurefunc(Archy, "UpdateDigSiteFrame", SkinArchyDigSiteFrame)

	if ArchyArtifactFrameSkillBar then
		U.SkinStatusBar(ArchyArtifactFrameSkillBar)	
	end
	U.SkinButton(ArchyDistanceIndicatorFrameSurveyButton)
	ArchyDistanceIndicatorFrameSurveyButton:SetFrameLevel(ArchyDistanceIndicatorFrameSurveyButton:GetFrameLevel() + 5)
end

U.RegisterSkin(name,SkinArchy)