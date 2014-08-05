local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EnergyWatch') then return end

local name = 'EnergyWatchSkin'
function AS:SkinEnergyWatch()
	EnergyWatchBar:StripTextures(true)
	AS:SkinStatusBar(EnergyWatchStatusBar)
end

AS:RegisterSkin(name, AS.SkinEnergyWatch)