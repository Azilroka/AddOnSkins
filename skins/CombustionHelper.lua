local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "CombustionHelperSkin"
function AS:SkinCombustionHelper()
	CombustionFrame:CreateBackdrop()
	combusettingstable["bgcolornormal"] = AS.BackdropColor
	combusettingstable["edgecolornormal"] = AS.BackdropColor
	CombuMBTrackerBorderFrame:Kill()
	hooksecurefunc('CombuBackdropBuild', function() CombustionFrame:SetTemplate('Transparent') end)
	hooksecurefunc('CombuMBTrackerBackdropBuild', function() CombuMBTrackerFrame:SetTemplate('Transparent') end)
end

AS:RegisterSkin(name, AS.SkinCombustionHelper)