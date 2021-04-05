local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('DejaCharacterStats') then return end

function AS:DejaCharacterStats()
	AS:Desaturate(DCS_configButton)
	AS:SkinButton(DCS_TableRelevantStats)
	AS:SkinButton(DCS_TableResetButton)
end

AS:RegisterSkin('DejaCharacterStats', AS.DejaCharacterStats)