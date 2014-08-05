local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('InspectEquip') then return end

local name = 'InspectEquipSkin'
function AS:SkinInspectEquip()
	AS:SkinFrame(InspectEquip_InfoWindow)
	AS:SkinCloseButton(InspectEquip_InfoWindow_CloseButton)
end

AS:RegisterSkin(name, AS.SkinInspectEquip)