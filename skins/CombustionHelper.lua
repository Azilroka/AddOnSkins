local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "CombustionHelperSkin"
function AS:SkinCombustionHelper()
	AS:SkinBackdropFrame(CombustionFrame)
	CombustionFrame:HookScript("OnUpdate", function(frame) frame:StripTextures() end)
	CombuMBTrackerBorderFrame:Kill()
	CombuMBTrackerFrame:HookScript("OnUpdate", function(frame) AS:SkinFrame(frame) frame:SetPoint("BOTTOM", CombustionFrame, "TOP", 0, 4) end)
end

AS:RegisterSkin(name, AS.SkinCombustionHelper)