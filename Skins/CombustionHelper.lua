local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('CombustionHelper') then return end

function AS:CombustionHelper()
	CombustionFrame:CreateBackdrop()
	if combusettingstable then
		combusettingstable["bgcolornormal"] = AS.BackdropColor
		combusettingstable["edgecolornormal"] = AS.BackdropColor
	end
	CombuMBTrackerBorderFrame:Kill()
	hooksecurefunc('CombuBackdropBuild', function() CombustionFrame:SetTemplate('Transparent') end)
	hooksecurefunc('CombuMBTrackerBackdropBuild', function() CombuMBTrackerFrame:SetTemplate('Transparent') end)
end

AS:RegisterSkin('CombustionHelper', AS.CombustionHelper)