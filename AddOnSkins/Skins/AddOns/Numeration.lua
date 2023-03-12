local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('Numeration') then return end

function R:Numeration()
	S:HandleFrame(NumerationFrame)
end

AS:RegisterSkin('Numeration', R.Numeration)
