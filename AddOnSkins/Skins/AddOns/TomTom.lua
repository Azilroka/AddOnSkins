local AS, L, S, R = unpack(AddOnSkins)

function R:TomTom()
	if TomTomBlock then
		S:HandleFrame(TomTomBlock)
	end
end

AS:RegisterSkin('TomTom')
