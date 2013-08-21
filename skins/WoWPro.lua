local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "WoWProSkin"
function AS:SkinWoWPro()
	AS:SkinFrame(Titlebar)
	AS:SkinBackdropFrame(WoWPro.MainFrame)
	AS:SkinTooltip(_G["Mouseover Note Tooltip"])
end

AS:RegisterSkin(name, AS.SkinWoWPro)