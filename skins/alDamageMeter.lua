local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "alDamageMeterSkin"
function AS:SkinALDamageMeter()
	alDamageMeterFrame.bg:Kill()
	AS:SkinBackdropFrame(alDamageMeterFrame, 'Transparent')
end

AS:RegisterSkin(name, AS.SkinALDamageMeter)