local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "BPTSkin"
function AS:SkinBPT()
	if AS.MyClass ~= "DRUID" then return end
	BalancePowerTracker_Options.global.enabled = true
	BalancePowerTracker.CheckAll()
	AS:SkinFrame(BalancePowerTracker_Eclipse_Bar_Frame, false, true)
	AS:SkinFrame(BalancePowerTracker_SolarEclipseIcon, false, true)
	AS:SkinFrame(BalancePowerTracker_LunarEclipseIcon, false, true)
	hooksecurefunc(BalancePowerTracker.modules.eclipse_bar, "ReDraw", function() 
		AS:SkinFrame(BalancePowerTracker_Eclipse_Bar_Frame, false, true)
		AS:SkinFrame(BalancePowerTracker_SolarEclipseIcon, false, true)
		AS:SkinFrame(BalancePowerTracker_LunarEclipseIcon, false, true)
		BalancePowerTracker_Eclipse_Bar_Frame:SetTemplate("Transparent")
	end)
	BalancePowerTracker.modules.eclipse_bar:ReDraw()
end

AS:RegisterSkin(name, AS.SkinBPT)