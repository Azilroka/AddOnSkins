if not(IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("Archy") then return end
local U = unpack(select(2,...))
local name = "ArchySkin"
local function SkinArchy(self)
	local s = U.s
	local c = U.c

	local function SkinArchyArtifactFrame()
		if not InCombatLockdown() then
			U.SkinFrame(ArchyArtifactFrame)
			ArchyArtifactFrame:SetScale(1)
			--ArchyArtifactFrame:CreateBackdrop()
			--ArchyArtifactFrame.backdrop:SetParent(UIParent)
			--ArchyArtifactFrame.backdrop:Point("TOPLEFT", ArchyArtifactFrame, 0, 0)
			--ArchyArtifactFrame.backdrop:Point("BOTTOMRIGHT", ArchyArtifactFrame, 0, 0)
		end
	end

	hooksecurefunc(Archy, "UpdateRacesFrame", SkinArchyArtifactFrame)

	local function SkinArchyDigSiteFrame()
		if not InCombatLockdown() then
			U.SkinFrame(ArchyDigSiteFrame)
			ArchyDigSiteFrame:SetScale(1)
			--ArchyDigSiteFrame:CreateBackdrop()
			--ArchyDigSiteFrame.backdrop:SetParent(UIParent)
			--ArchyDigSiteFrame.backdrop:Point("TOPLEFT", ArchyArtifactFrame, 0, 0)
			--ArchyDigSiteFrame.backdrop:Point("BOTTOMRIGHT", ArchyArtifactFrame, 0, 0)
		end
	end

	hooksecurefunc(Archy, "UpdateDigSiteFrame", SkinArchyDigSiteFrame)

	if ArchyArtifactFrameSkillBar then
			U.SkinStatusBar(ArchyArtifactFrameSkillBar)
	end
	U.SkinButton(ArchyDistanceIndicatorFrameSurveyButton)
end

U.RegisterSkin(name,SkinArchy)