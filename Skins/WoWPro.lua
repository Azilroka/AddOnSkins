local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WoWPro') then return end

function AS:WoWPro()
	AS:SkinFrame(Titlebar)
	AS:SkinBackdropFrame(WoWPro.MainFrame)
	AS:SkinTooltip(_G['Mouseover Note Tooltip'])
end

AS:RegisterSkin('WoWPro', AS.WoWPro)