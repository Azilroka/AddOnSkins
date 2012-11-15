
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "EnergyWatchSkin"
local function SkinEnergyWatch(self)
	EnergyWatchBar:StripTextures(True)
	EnergyWatchStatusBar:CreateBackdrop()
	EnergyWatchStatusBar:SetStatusBarTexture(E["media"].normTex)
end

AS:RegisterSkin(name,SkinEnergyWatch)

