if IsAddOnLoaded("EnergyWatch") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "EnergyWatchSkin"
local function SkinEnergyWatch(self)
	EnergyWatchBar:StripTextures(True)
	EnergyWatchStatusBar:CreateBackdrop()
	EnergyWatchStatusBar:SetStatusBarTexture(E["media"].normTex)
end

AS:RegisterSkin(name,SkinEnergyWatch)

