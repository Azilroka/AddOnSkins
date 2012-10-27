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
			FishingButton:Show()
			UIFrameFadeIn(FishingButton, 0.2, FishingButton:GetAlpha(), 1)
		else
			UIFrameFadeOut(FishingButton, 0.2, FishingButton:GetAlpha(), 0)
			FishingButton:Hide()
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

-- Sunsong Ranch
local RustyWateringCanButton = CreateFrame("Button", "RustyWateringCanButton", UIParent, "SecureActionButtonTemplate")
	RustyWateringCanButton:Size(50)
	RustyWateringCanButton:SetPoint("CENTER", UIParent, "BOTTOM", -53, 350)
	RustyWateringCanButton:SetMovable(true)
	RustyWateringCanButton:SetTemplate("Default")
	RustyWateringCanButton:SetAttribute("type", "item");
	RustyWateringCanButton:SetAttribute("item", "Rusty Watering Can");
	RustyWateringCanButton:CreateShadow()
	RustyWateringCanButton:Hide()
	RustyWateringCanButton.icon = RustyWateringCanButton:CreateTexture(nil, "OVERLAY")
	RustyWateringCanButton.icon:SetPoint("CENTER")
	RustyWateringCanButton.icon:SetTexture(select(10, GetItemInfo(79104)))
	RustyWateringCanButton.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	RustyWateringCanButton.icon:Size(46)
	RustyWateringCanButton:RegisterEvent("PLAYER_ENTERING_WORLD")
	RustyWateringCanButton:RegisterEvent("ZONE_CHANGED")
	RustyWateringCanButton:RegisterEvent("UNIT_INVENTORY_CHANGED")
	RustyWateringCanButton:HookScript("OnEvent", function(self) 
		if (GetSubZoneText() == "Sunsong Ranch" and GetItemCount(79104) == 1) then
			RustyWateringCanButton:Show()
		else
			RustyWateringCanButton:Hide()
		end
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end)

local VintageBugSprayerButton = CreateFrame("Button", "VintageBugSprayerButton", UIParent, "SecureActionButtonTemplate")
	VintageBugSprayerButton:Size(50)
	VintageBugSprayerButton:SetPoint("CENTER", UIParent, "BOTTOM", 0, 350)
	VintageBugSprayerButton:SetMovable(true)
	VintageBugSprayerButton:SetTemplate("Default")
	VintageBugSprayerButton:SetAttribute("type", "item");
	VintageBugSprayerButton:SetAttribute("item", "Vintage Bug Sprayer");
	VintageBugSprayerButton:CreateShadow()
	VintageBugSprayerButton:Hide()
	VintageBugSprayerButton.icon = VintageBugSprayerButton:CreateTexture(nil, "OVERLAY")
	VintageBugSprayerButton.icon:SetPoint("CENTER")
	VintageBugSprayerButton.icon:SetTexture(select(10, GetItemInfo(80513)))
	VintageBugSprayerButton.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	VintageBugSprayerButton.icon:Size(46)
	VintageBugSprayerButton:RegisterEvent("PLAYER_ENTERING_WORLD")
	VintageBugSprayerButton:RegisterEvent("ZONE_CHANGED")
	VintageBugSprayerButton:RegisterEvent("UNIT_INVENTORY_CHANGED")
	VintageBugSprayerButton:HookScript("OnEvent", function(self) 
		if (GetSubZoneText() == "Sunsong Ranch" and GetItemCount(80513) == 1) then
			VintageBugSprayerButton:Show()
		else
			VintageBugSprayerButton:Hide()
		end
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end)

local DentedShovelButton = CreateFrame("Button", "DentedShovelButton", UIParent, "SecureActionButtonTemplate")
	DentedShovelButton:Size(50)
	DentedShovelButton:SetPoint("CENTER", UIParent, "BOTTOM", 53, 350)
	DentedShovelButton:SetMovable(true)
	DentedShovelButton:SetTemplate("Default")
	DentedShovelButton:SetAttribute("type", "item");
	DentedShovelButton:SetAttribute("item", "Dented Shovel");
	DentedShovelButton:CreateShadow()
	DentedShovelButton:Hide()
	DentedShovelButton.icon = DentedShovelButton:CreateTexture(nil, "OVERLAY")
	DentedShovelButton.icon:SetPoint("CENTER")
	DentedShovelButton.icon:SetTexture(select(10, GetItemInfo(89880)))
	DentedShovelButton.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	DentedShovelButton.icon:Size(46)
	DentedShovelButton:RegisterEvent("PLAYER_ENTERING_WORLD")
	DentedShovelButton:RegisterEvent("ZONE_CHANGED")
	DentedShovelButton:RegisterEvent("UNIT_INVENTORY_CHANGED")
	DentedShovelButton:HookScript("OnEvent", function(self) 
		if (GetSubZoneText() == "Sunsong Ranch" and GetItemCount(89880) == 1) then
			DentedShovelButton:Show()
		else
			DentedShovelButton:Hide()
		end
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end)