local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Coolline') then return end

local name = 'CoolLineSkin'
function AS:SkinCoolLine()
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border = 'None'
	CoolLine.updatelook()
	AS:SkinBackdropFrame(CoolLine)
	local Backdrop = CoolLine.backdrop or CoolLine.Backdrop
	Backdrop:SetAllPoints(CoolLine)
	Backdrop:CreateShadow()
	AS:RegisterForPetBattleHide(CoolLine)
end

AS:RegisterSkin(name, AS.SkinCoolLine)