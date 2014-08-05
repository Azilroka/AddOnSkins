local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TomTom') then return end

local name = 'TomTomSkin'
function AS:SkinTomTom()
	if TomTomBlock then
		AS:SkinFrame(TomTomBlock)
	end
end

AS:RegisterSkin(name, AS.SkinTomTom)