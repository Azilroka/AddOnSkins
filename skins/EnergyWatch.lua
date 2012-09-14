if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("EnergyWatch") then return end
local U = unpack(select(2,...))
local name = "EnergyWatchSkin"
local function SkinEnergyWatch(self)
	local s = U.s
	local c = U.c
	EnergyWatchBar:StripTextures(True)
	EnergyWatchStatusBar:CreateBackdrop()
	EnergyWatchStatusBar:SetStatusBarTexture(c["media"].normTex)
end

U.RegisterSkin(name,SkinEnergyWatch)

