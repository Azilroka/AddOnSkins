if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("SearingPlasmaTracker") then return end
local name = "SearingPlasmaTrackerSkin"
local function SkinSearingPlasmaTracker(self)
	cSkinFrame(SearingPlasmaTrackerFrame)
end
cRegisterSkin(name,SkinSearingPlasmaTracker)