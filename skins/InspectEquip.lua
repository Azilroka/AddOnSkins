local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "InspectEquipSkin"
function AS:SkinInspectEquip()
	AS:SkinFrame(InspectEquip_InfoWindow)
	S:HandleCloseButton(InspectEquip_InfoWindow_CloseButton)
end
AS:RegisterSkin(name, AS.SkinInspectEquip)