local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "ShieldMonitorSkin"
function AS:SkinShieldMonitor()

	AS:SkinFrame(shieldmonitor_Frame, 'Default', true)
	shieldmonitor_Frame:HookScript("OnShow", function(self)
		AS:SkinFrameD(shieldmonitor_Frame, 'Default', true)
	end)
	shieldmonitor_Frame:RegisterEvent("UNIT_AURA")
	shieldmonitor_Frame:HookScript("OnEvent", function(self)
		AS:SkinFrame(shieldmonitor_Frame, 'Default', true)
	end)
	shieldmonitor_Frame:SetSize(209, 20)

	shieldmonitor_Bar:SetStatusBarTexture(AS.LSM:Fetch("statusbar",E.private.general.normTex))
	shieldmonitor_Bar:ClearAllPoints()
	shieldmonitor_Bar:SetInside()

	local IconBorder = CreateFrame("Frame", "ShieldIconBorder", shieldmonitor_Frame)
	AS:SkinFrame(IconBorder, 'Default')
	IconBorder:SetSize(20, 20)
	IconBorder:SetPoint("RIGHT", shieldmonitor_Frame, "LEFT", -3, 0)

	shieldmonitor_FrameIcon1:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	shieldmonitor_FrameIcon1:ClearAllPoints()
	shieldmonitor_FrameIcon1:SetParent(IconBorder)
	shieldmonitor_FrameIcon1:SetInside()

	shieldmonitor_BarText:SetFont(AS.LSM:Fetch("font",E.db.general.font), 12, "OUTLINE")
	shieldmonitor_BarText:SetPoint("CENTER", shieldmonitor_Bar, "CENTER", 0, 0)

	shieldmonitor_FrameDuration:SetFont(AS.LSM:Fetch("font",E.db.general.font), 12, "OUTLINE")
	shieldmonitor_FrameDuration:SetParent(shieldmonitor_Bar)
	shieldmonitor_FrameDuration:ClearAllPoints()
	shieldmonitor_FrameDuration:SetPoint("RIGHT", shieldmonitor_Frame, "RIGHT", -2, 0)

end

AS:RegisterSkin(name,AS.SkinShieldMonitor)