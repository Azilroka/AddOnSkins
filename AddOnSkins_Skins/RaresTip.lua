local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RaresTip') then return end

local name = 'RaresTipSkin'
function AS:SkinRaresTip()
	AS:SkinTooltip(RaresTip)
end

AS:RegisterSkin(name, AS.SkinRaresTip)