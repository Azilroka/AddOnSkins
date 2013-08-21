local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "NumerationSkin"
function AS:SkinNumeration()
	AS:SkinFrame(NumerationFrame)
end

AS:RegisterSkin(name, AS.SkinNumeration)