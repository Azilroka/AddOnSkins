local AS, L, S, R = unpack(AddOnSkins)

function R:EnergyWatch()
	S:StripTextures(EnergyWatchBar, true)
	S:HandleStatusBar(EnergyWatchStatusBar, {PowerBarColor[EnergyWatchBar.powerType].r, PowerBarColor[EnergyWatchBar.powerType].g, PowerBarColor[EnergyWatchBar.powerType].b})
	EnergyWatchText:SetParent(EnergyWatchStatusBar)
end

AS:RegisterSkin('EnergyWatch')
