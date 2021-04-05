local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('SearingPlasmaTracker') then return end

function AS:SearingPlasmaTracker()
	AS:SkinFrame(SearingPlasmaTrackerFrame)
end

AS:RegisterSkin('SearingPlasmaTracker', AS.SearingPlasmaTracker)