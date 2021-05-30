local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Numeration') then return end

function AS:Numeration()
	AS:SkinFrame(NumerationFrame)
end

AS:RegisterSkin('Numeration', AS.Numeration)