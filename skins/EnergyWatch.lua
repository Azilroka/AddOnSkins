local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "EnergyWatchSkin"
function AS:SkinEnergyWatch()
	EnergyWatchBar:StripTextures(true)
	EnergyWatchStatusBar:CreateBackdrop()
	EnergyWatchStatusBar:SetStatusBarTexture(AS.LSM:Fetch("statusbar", E.private.general.normTex))
end

AS:RegisterSkin(name, AS.SkinEnergyWatch)