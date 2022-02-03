local AS = unpack(AddOnSkins)

function AS:Blizzard_EventTrace(event, addon)
	print(addon)
	AS:SkinFrame(EventTrace)
	AS:SkinCloseButton(EventTrace.CloseButton)
end

AS:RegisterSkin('Blizzard_EventTrace', AS.Blizzard_EventTrace, 'ADDON_LOADED')
