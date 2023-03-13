local AS, L, S, R = unpack(AddOnSkins)

function R:CoolLine()
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border = 'None'
	CoolLine.updatelook()
	S:HandleFrame(CoolLine, true)
	CoolLine.backdrop:SetAllPoints(CoolLine)
	CoolLine.backdrop:CreateShadow()
	AS:RegisterForPetBattleHide(CoolLine)
end

AS:RegisterSkin('CoolLine', nil, '[ElvUI_CoolLine]')
