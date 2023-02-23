local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('EnergyWatch') then return end

function AS:EnergyWatch()
	S:StripTextures(EnergyWatchBar, true)
	S:HandleStatusBar(EnergyWatchStatusBar, {PowerBarColor[EnergyWatchBar.powerType].r, PowerBarColor[EnergyWatchBar.powerType].g, PowerBarColor[EnergyWatchBar.powerType].b})
	EnergyWatchText:SetParent(EnergyWatchStatusBar)
end

AS:RegisterSkin('EnergyWatch', AS.EnergyWatch)
