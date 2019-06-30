local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EnergyWatch') then return end

function AS:EnergyWatch()
	AS:StripTextures(EnergyWatchBar, true)
	AS:SkinStatusBar(EnergyWatchStatusBar, {PowerBarColor[EnergyWatchBar.powerType].r, PowerBarColor[EnergyWatchBar.powerType].g, PowerBarColor[EnergyWatchBar.powerType].b})
	EnergyWatchText:SetParent(EnergyWatchStatusBar)
end

AS:RegisterSkin('EnergyWatch', AS.EnergyWatch)
