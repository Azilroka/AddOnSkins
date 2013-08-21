local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "SymbiosisTipSkin"
function AS:SkinSymbiosisTip()
	AS:SkinTooltip(SymbiosisTip)
end

AS:RegisterSkin(name, AS.SkinSymbiosisTip)