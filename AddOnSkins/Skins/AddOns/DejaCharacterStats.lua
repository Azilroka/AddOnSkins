local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('DejaCharacterStats') then return end

function AS:DejaCharacterStats()
	S:Desaturate(DCS_configButton)
	S:HandleButton(DCS_TableRelevantStats)
	S:HandleButton(DCS_TableResetButton)
end

AS:RegisterSkin('DejaCharacterStats', AS.DejaCharacterStats)
