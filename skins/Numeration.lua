local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('Numeration') then return end

local name = "NumerationSkin"
function AS:SkinNumeration()
	AS:SkinFrame(NumerationFrame)
end

AS:RegisterSkin(name, AS.SkinNumeration)