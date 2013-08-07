local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "BPTSkin"
function AS:SkinBPT()
	if select(2, UnitClass("player")) ~= "DRUID" then return end
	BalancePowerTracker_Options.global.enabled = true
	BalancePowerTracker.CheckAll()

	local function SkinFunc()
		BalancePowerTracker_Eclipse_Bar_Frame:SetTemplate("Transparent")
		BalancePowerTracker_SolarEclipseIcon:SetTemplate("Transparent")
		BalancePowerTracker_LunarEclipseIcon:SetTemplate("Transparent")
	end

	hooksecurefunc(BalancePowerTracker.modules.eclipse_bar, "LoadModule", SkinFunc)
	hooksecurefunc(BalancePowerTracker.modules.eclipse_bar, "ReDraw", SkinFunc)
end

AS:RegisterSkin(name, AS.SkinBPT)