local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "InspectEquipSkin"
function AS:SkinInspectEquip()
	AS:SkinFrame(InspectEquip_InfoWindow)
	AS:SkinCloseButton(InspectEquip_InfoWindow_CloseButton)
end

AS:RegisterSkin(name, AS.SkinInspectEquip)