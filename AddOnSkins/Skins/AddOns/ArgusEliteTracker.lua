local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ArgusEliteTracker') then return end

function AS:ArgusEliteTracker()
	AS:SkinFrame(ArgusEliteTrackerFram.TitleBar)
	AS:SkinFrame(ArgusEliteTrackerFram.elitesContainer)
end

AS:RegisterSkin('ArgusEliteTracker', AS.ArgusEliteTracker)