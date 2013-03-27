
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "BPTSkin"
function AS:SkinBPT()
	if (select(2, UnitClass("player")) ~= "DRUID") then
		return
	end
	BalancePowerTracker_Options.global.enabled = true
	BalancePowerTracker.CheckAll()
	BalancePowerTracker_Eclipse_Bar_Frame:SetTemplate("Transparent")
	BalancePowerTracker_SolarEclipseIcon:SetTemplate(Transparent)
	BalancePowerTracker_LunarEclipseIcon:SetTemplate(Transparent)
	
	hooksecurefunc(BalancePowerTracker.modules.eclipse_bar,"ReDraw", function() BalancePowerTracker_Eclipse_Bar_Frame:SetTemplate("Transparent") end)
end

AS:RegisterSkin(name,AS.SkinBPT)