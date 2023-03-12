local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('SearingPlasmaTracker') then return end

function R:SearingPlasmaTracker()
	S:HandleFrame(SearingPlasmaTrackerFrame)
end

AS:RegisterSkin('SearingPlasmaTracker', R.SearingPlasmaTracker)
