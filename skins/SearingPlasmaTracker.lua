if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("SearingPlasmaTracker") then return end
local U = unpack(select(2,...))
local name = "SearingPlasmaTrackerSkin"
local function SkinSearingPlasmaTracker(self)
	U.SkinFrame(SearingPlasmaTrackerFrame)
end
U.RegisterSkin(name,SkinSearingPlasmaTracker)