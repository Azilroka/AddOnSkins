local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('SearingPlasmaTracker') then return end

local name = "SearingPlasmaTrackerSkin"
function AS:SkinSearingPlasmaTracker()
	AS:SkinFrame(SearingPlasmaTrackerFrame)
end

AS:RegisterSkin(name, AS.SkinSearingPlasmaTracker)