local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Ignition') then return end

local name = 'IgnitionSkin'
function AS:SkinIgnition()
	ignTimeBar:StripTextures(true)
	AS:SkinBackdropFrame(uiIgnitionFrame, true)
end

AS:RegisterSkin(name, AS.SkinIgnition)