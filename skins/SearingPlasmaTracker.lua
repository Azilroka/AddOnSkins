local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "SearingPlasmaTrackerSkin"
function AS:SkinSearingPlasmaTracker()
	AS:SkinFrame(SearingPlasmaTrackerFrame)
end

AS:RegisterSkin(name, AS.SkinSearingPlasmaTracker)