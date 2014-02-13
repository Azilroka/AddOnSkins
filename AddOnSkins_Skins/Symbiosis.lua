local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('SymbiosisTip') then return end

local name = 'SymbiosisTipSkin'
function AS:SkinSymbiosisTip()
	AS:SkinTooltip(SymbiosisTip)
end

AS:RegisterSkin(name, AS.SkinSymbiosisTip)