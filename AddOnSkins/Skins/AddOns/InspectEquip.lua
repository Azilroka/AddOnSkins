local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('InspectEquip') then return end

function R:InspectEquip()
	S:HandleFrame(InspectEquip_InfoWindow)
	S:HandleCloseButton(InspectEquip_InfoWindow_CloseButton)
end

AS:RegisterSkin('InspectEquip', R.InspectEquip)
