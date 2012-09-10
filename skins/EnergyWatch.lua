if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("EnergyWatch") then return end
local name = "EnergyWatchSkin"
local function SkinEnergyWatch(self)
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	EnergyWatchBar:StripTextures(True)
	EnergyWatchStatusBar:CreateBackdrop()
	EnergyWatchStatusBar:SetStatusBarTexture(c["media"].normTex)
end

cRegisterSkin(name,SkinEnergyWatch)

