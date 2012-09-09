if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("BalancePowerTracker") then return end
local SkinBPT = CreateFrame("Frame")
	SkinBPT:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinBPT:SetScript("OnEvent", function(self)
	if (select(2, UnitClass("player")) ~= "DRUID") then
		return
	end
	BalancePowerTracker_Eclipse_Bar_Frame:SetTemplate("Transparent")
	if (UISkinOptions.BPTSkin ~= "Enabled") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	BalancePowerTracker_SolarEclipseIcon:SetTemplate(Transparent)
	BalancePowerTracker_LunarEclipseIcon:SetTemplate(Transparent)
	
	hooksecurefunc(BalancePowerTracker.modules.eclipse_bar,"ReDraw", function() BalancePowerTracker_Eclipse_Bar_Frame:SetTemplate("Transparent") end)
end)

