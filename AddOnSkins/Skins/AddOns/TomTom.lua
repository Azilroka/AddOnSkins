local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('TomTom') then return end

function R:TomTom()
	if TomTomBlock then
		S:HandleFrame(TomTomBlock)
	end
end

AS:RegisterSkin('TomTom', R.TomTom)
