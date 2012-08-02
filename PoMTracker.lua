if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("PoMTracker") then return end
local SkinPoMTracker = CreateFrame("Frame")
	SkinPoMTracker:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinPoMTracker:SetScript("OnEvent", function(self)
	if (UISkinOptions.PoMTrackerSkin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	PoMOptionFrame:StripTextures(True)
	PoMOptionFrame:SetTemplate("Transparent")
	cSkinCloseButton(PoMOptionFrame_CloseButton)

	pomtracker1:CreateBackdrop("Transparent")
	pomtracker1:Size(85,15)

	pomtracker2:StripTextures(True)
	pomtracker2:SetTemplate("Transparent")

	pomtracker3:CreateBackdrop("Transparent")
	pomtracker3:ClearAllPoints()
	pomtracker3:Point("TOPLEFT", pomtracker2, "BOTTOMLEFT", 5, -10)
	pomtracker3:Size(150,15)

	cSkinButton(pomtracker3_Button1)

	pomtrackerstatusBar:ClearAllPoints()
	pomtrackerstatusBar:Point("TOPLEFT", pomtracker2, "BOTTOMLEFT", 5, -2)
	pomtrackerstatusBar:CreateBackdrop("Transparent")

	for i = 1,6 do
		cSkinCheckBox(_G["PoMOptionFrame_CheckButton"..i])
	end

end)