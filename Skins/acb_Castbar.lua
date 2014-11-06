local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('acb_CastBar') then return end

function AS:acb_CastBar(event, addon)
	AS:SkinBackdropFrame(AzCastBarPluginPlayer)
	AS:SkinBackdropFrame(AzCastBarPluginTarget)
	AS:SkinBackdropFrame(AzCastBarPluginFocus)
	AS:SkinBackdropFrame(AzCastBarPluginMirror)
	AS:SkinBackdropFrame(AzCastBarPluginPet)
end

AS:RegisterSkin('acb_CastBar', AS.acb_CastBar)
