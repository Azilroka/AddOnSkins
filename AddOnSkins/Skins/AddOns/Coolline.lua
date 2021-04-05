local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('CoolLine') then return end

function AS:CoolLine()
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border = 'None'
	CoolLine.updatelook()
	AS:SkinBackdropFrame(CoolLine)
	CoolLine.Backdrop:SetAllPoints(CoolLine)
	CoolLine.Backdrop:CreateShadow()
	AS:RegisterForPetBattleHide(CoolLine)
end

AS:RegisterSkin('CoolLine', AS.CoolLine, '[ElvUI_CoolLine]')