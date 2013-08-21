local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "SpineCounterSkin"
function AS:SkinSpineCounter()
	AS:SkinFrame(SCOutput)
end

AS:RegisterSkin(name, AS.SkinSpineCounter)