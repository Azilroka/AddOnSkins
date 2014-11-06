local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EnergyWatch') then return end

function AS:EnergyWatch()
	EnergyWatchBar:StripTextures(true)
	AS:SkinStatusBar(EnergyWatchStatusBar)
end

AS:RegisterSkin('EnergyWatch', AS.EnergyWatch)