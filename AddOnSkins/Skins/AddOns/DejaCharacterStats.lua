local AS, L, S, R = unpack(AddOnSkins)

function R:DejaCharacterStats()
	S:Desaturate(DCS_configButton)
	S:HandleButton(DCS_TableRelevantStats)
	S:HandleButton(DCS_TableResetButton)
end

AS:RegisterSkin('DejaCharacterStats')
