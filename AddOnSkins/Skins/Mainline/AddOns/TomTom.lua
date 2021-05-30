local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TomTom') then return end

function AS:TomTom()
	if TomTomBlock then
		AS:SkinFrame(TomTomBlock)
	end
end

AS:RegisterSkin('TomTom', AS.TomTom)