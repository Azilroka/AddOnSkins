if not(IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("Archy") then return end
local SkinArchy = CreateFrame("Frame")
SkinArchy:RegisterEvent("PLAYER_ENTERING_WORLD")
SkinArchy:SetScript("OnEvent", function(self, event, addon)
	if (UISkinOptions.ArchySkin ~= "Enabled") then return end

	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	local function SkinArchyArtifactFrame()
		ArchyArtifactFrame:StripTextures()
		ArchyArtifactFrame.bg = CreateFrame("Frame", nil, UIParent)
		ArchyArtifactFrame.bg:CreateBackdrop()
		ArchyArtifactFrame.bg:Point("TOPLEFT", ArchyArtifactFrame, 0, 0)
		ArchyArtifactFrame.bg:Point("BOTTOMRIGHT", ArchyArtifactFrame, 0, 0)
	end

	hooksecurefunc(Archy, "UpdateRacesFrame", SkinArchyArtifactFrame)

	local function SkinArchyDigSiteFrame()
		ArchyDigSiteFrame:StripTextures()
		ArchyDigSiteFrame.bg = CreateFrame("Frame", nil, UIParent)
		ArchyDigSiteFrame.bg:CreateBackdrop()
		ArchyDigSiteFrame.bg:Point("TOPLEFT", ArchyDigSiteFrame, 0, 0)
		ArchyDigSiteFrame.bg:Point("BOTTOMRIGHT", ArchyDigSiteFrame, 0, 0)
		cSkinButton(ArchyDistanceIndicatorFrameSurveyButton)
	end

	hooksecurefunc(Archy, "UpdateDigSiteFrame", SkinArchyDigSiteFrame)

	if ArchyArtifactFrameSkillBar then
		cSkinStatusBar(ArchyArtifactFrameSkillBar)
	end

	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end)
