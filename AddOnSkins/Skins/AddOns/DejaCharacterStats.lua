local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('DejaCharacterStats') then return end

function R:DejaCharacterStats()
	S:Desaturate(DCS_configButton)
	S:HandleButton(DCS_TableRelevantStats)
	S:HandleButton(DCS_TableResetButton)
end

AS:RegisterSkin('DejaCharacterStats', R.DejaCharacterStats)
