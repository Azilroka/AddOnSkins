local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "TomTomSkin"
function AS:SkinTomTom()
	if TomTomBlock then
		AS:SkinFrame(TomTomBlock)
	end
end

AS:RegisterSkin(name, AS.SkinTomTom)