if not(IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not (IsAddOnLoaded("Archy")) then return end
local SkinArchy = CreateFrame("Frame")
SkinArchy:RegisterEvent("ADDON_LOADED")
SkinArchy:SetScript("OnEvent", function(self, event, addon)
	if (UISkinOptions.ArchySkin ~= "Enabled")
		then return
	end

	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	local function SkinArchyArtifactFrame()
		cSkinFrame(ArchyArtifactFrame)
	end

	hooksecurefunc(Archy, "UpdateRacesFrame", SkinArchyArtifactFrame)

	local function SkinArchyDigSiteFrame()
		cSkinFrame(ArchyDigSiteFrame)
		cSkinButton(ArchyDistanceIndicatorFrameSurveyButton)
	end

	hooksecurefunc(Archy, "UpdateDigSiteFrame", SkinArchyDigSiteFrame)

	if ArchyArtifactFrameSkillBar then
		cSkinStatusBar(ArchyArtifactFrameSkillBar)
	end

	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end)
