local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "CombustionHelperSkin"
function AS:SkinCombustionHelper()
	AS:SkinBackdropFrame(CombustionFrame)
	CombuMBTrackerBorderFrame:Kill()
	CombuMBTrackerFrame:HookScript('OnUpdate', function(self) AS:SkinFrame(self) end)
	--hooksecurefunc(CombuMBTrackerBackdropBuild, function() AS:SkinFrame(CombuMBTrackerFrame) end)
end

AS:RegisterSkin(name, AS.SkinCombustionHelper)