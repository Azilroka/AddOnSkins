local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('acb_CastBar') then return end

local name = 'acb_CastBarSkin'
function AS:Skinacb_CastBar(event, addon)
	AS:SkinBackdropFrame(AzCastBarPluginPlayer)
	AS:SkinBackdropFrame(AzCastBarPluginTarget)
	AS:SkinBackdropFrame(AzCastBarPluginFocus)
	AS:SkinBackdropFrame(AzCastBarPluginMirror)
	AS:SkinBackdropFrame(AzCastBarPluginPet)
end

AS:RegisterSkin(name, AS.Skinacb_CastBar)
