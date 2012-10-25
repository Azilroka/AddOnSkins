local FishingButton = CreateFrame("Button", "FishingButton", UIParent, "SecureActionButtonTemplate")
FishingButton:Size(50)
FishingButton:SetPoint("BOTTOM", 0, 350)
FishingButton:SetMovable(true)
FishingButton:SetTemplate("Default")
FishingButton:SetAttribute("type", "spell");
FishingButton:SetAttribute("spell", "Fishing");
UIFrameFadeOut(FishingButton, 0.2, FishingButton:GetAlpha(), 0)
FishingButton.icon = FishingButton:CreateTexture(nil, "OVERLAY")
FishingButton.icon:SetPoint("CENTER")
FishingButton.icon:SetTexture(select(3, GetSpellInfo(131474)))
FishingButton.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
FishingButton.icon:Size(46)

FishingButton:RegisterEvent("PLAYER_ENTERING_WORLD")
FishingButton:RegisterEvent("UNIT_INVENTORY_CHANGED")
FishingButton:SetScript("OnEvent", function(self)
	if not InCombatLockdown() then
		if IsEquippedItemType("Fishing Poles") then
			UIFrameFadeIn(FishingButton, 0.2, FishingButton:GetAlpha(), 1)
		else
			UIFrameFadeOut(FishingButton, 0.2, FishingButton:GetAlpha(), 0)
		end
	end
end)

local SurveyButton = CreateFrame("Button", "SurveyButton", UIParent, "SecureActionButtonTemplate")
	SurveyButton:Size(50)
	SurveyButton:SetPoint("BOTTOM", 0, 350)
	SurveyButton:SetMovable(true)
	SurveyButton:SetTemplate("Default")
	SurveyButton:SetAttribute("type", "spell");
	SurveyButton:SetAttribute("spell", "Survey");
	SurveyButton:Hide()
	SurveyButton.icon = SurveyButton:CreateTexture(nil, "OVERLAY")
	SurveyButton.icon:SetPoint("CENTER")
	SurveyButton.icon:SetTexture(select(3, GetSpellInfo(80451)))
	SurveyButton.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	SurveyButton.icon:Size(46)
	SurveyButton:RegisterEvent("ARTIFACT_DIG_SITE_UPDATED");
