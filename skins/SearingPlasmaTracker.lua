if not IsAddOnLoaded("SearingPlasmaTracker") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "SearingPlasmaTrackerSkin"
local function SkinSearingPlasmaTracker(self)
	AS:SkinFrame(SearingPlasmaTrackerFrame)
end
AS:RegisterSkin(name,SkinSearingPlasmaTracker)