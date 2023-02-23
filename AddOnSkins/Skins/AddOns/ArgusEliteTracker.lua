local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('ArgusEliteTracker') then return end

function R:ArgusEliteTracker()
	S:HandleFrame(ArgusEliteTrackerFram.TitleBar)
	S:HandleFrame(ArgusEliteTrackerFram.elitesContainer)
end

AS:RegisterSkin('ArgusEliteTracker', R.ArgusEliteTracker)
