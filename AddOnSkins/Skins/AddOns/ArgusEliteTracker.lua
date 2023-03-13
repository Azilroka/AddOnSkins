local AS, L, S, R = unpack(AddOnSkins)

function R:ArgusEliteTracker()
	S:HandleFrame(ArgusEliteTrackerFram.TitleBar)
	S:HandleFrame(ArgusEliteTrackerFram.elitesContainer)
end

AS:RegisterSkin('ArgusEliteTracker')
