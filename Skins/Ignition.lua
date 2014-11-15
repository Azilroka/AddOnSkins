local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Ignition') then return end

function AS:Ignition()
	AS:StripTextures(ignTimeBar, true)
	AS:SkinBackdropFrame(uiIgnitionFrame, true)
end

AS:RegisterSkin('Ignition', AS.Ignition)