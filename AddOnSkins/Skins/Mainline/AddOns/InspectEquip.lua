local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('InspectEquip') then return end

function AS:InspectEquip()
	AS:SkinFrame(InspectEquip_InfoWindow)
	AS:SkinCloseButton(InspectEquip_InfoWindow_CloseButton)
end

AS:RegisterSkin('InspectEquip', AS.InspectEquip)