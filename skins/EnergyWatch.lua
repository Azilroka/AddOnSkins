local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "EnergyWatchSkin"
function AS:SkinEnergyWatch()
	EnergyWatchBar:StripTextures(true)
	AS:SkinStatusBar(EnergyWatchStatusBar)
end

AS:RegisterSkin(name, AS.SkinEnergyWatch)