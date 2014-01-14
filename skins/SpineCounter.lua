local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('SpineCounter') then return end

local name = "SpineCounterSkin"
function AS:SkinSpineCounter()
	AS:SkinFrame(SCOutput)
end

AS:RegisterSkin(name, AS.SkinSpineCounter)