local AS, L, S, R = unpack(AddOnSkins)

function R:InspectEquip()
	S:HandleFrame(InspectEquip_InfoWindow)
	S:HandleCloseButton(InspectEquip_InfoWindow_CloseButton)
end

AS:RegisterSkin('InspectEquip')
