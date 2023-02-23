local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('Numeration') then return end

function AS:Numeration()
	S:HandleFrame(NumerationFrame)
end

AS:RegisterSkin('Numeration', AS.Numeration)
