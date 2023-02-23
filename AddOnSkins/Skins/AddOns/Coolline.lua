local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('CoolLine') then return end

function AS:CoolLine()
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border = 'None'
	CoolLine.updatelook()
	S:HandleFrame(CoolLine, true)
	CoolLine.backdrop:SetAllPoints(CoolLine)
	CoolLine.backdrop:CreateShadow()
	AS:RegisterForPetBattleHide(CoolLine)
end

AS:RegisterSkin('CoolLine', R.CoolLine, '[ElvUI_CoolLine]')
