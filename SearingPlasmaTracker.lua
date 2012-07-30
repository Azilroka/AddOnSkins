if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("SearingPlasmaTracker") then return end
local SkinSearingPlasmaTracker = CreateFrame("Frame")
	SkinSearingPlasmaTracker:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinSearingPlasmaTracker:SetScript( "OnEvent", function(self)
	if (UISkinOptions.SearingPlasmaTrackerSkin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

SearingPlasmaTrackerFrame:StripTextures()
SearingPlasmaTrackerFrame:SetTemplate("Transparent")

end)