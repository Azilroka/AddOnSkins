local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('SearingPlasmaTracker') then return end

function AS:SearingPlasmaTracker()
	S:HandleFrame(SearingPlasmaTrackerFrame)
end

AS:RegisterSkin('SearingPlasmaTracker', AS.SearingPlasmaTracker)
