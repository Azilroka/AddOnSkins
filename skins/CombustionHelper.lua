local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "CombustionHelperSkin"
function AS:SkinCombustionHelper()
	AS:SkinBackdropFrame(CombustionFrame)
	CombuMBTrackerBorderFrame:Kill()
	hooksecurefunc(CombuMBTrackerBackdropBuild, function() AS:SkinFrame(CombuMBTrackerFrame) end)
end

AS:RegisterSkin(name, AS.SkinCombustionHelper)