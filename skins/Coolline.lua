local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "CoolLineSkin"
function AS:SkinCoolLine()
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border = "None"
	CoolLine.updatelook()
	AS:SkinBackdropFrame(CoolLine)
	CoolLine.backdrop:SetAllPoints(CoolLine)
	CoolLine.backdrop:CreateShadow()
	AS:RegisterForPetBattleHide(CoolLine)

	if AS:CheckOption("EmbedCoolLine") then
		if not CoolLineDB.vertical then
			CoolLine:SetPoint('BOTTOMRIGHT', ElvUI_Bar1, 'TOPRIGHT', 0, 4)
			CoolLine:SetPoint("BOTTOMLEFT", ElvUI_Bar1, "TOPLEFT", 0, 4)
		end
	end
end

AS:RegisterSkin(name, AS.SkinCoolLine)