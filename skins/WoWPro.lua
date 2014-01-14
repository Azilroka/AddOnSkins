local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('WoWPro') then return end

local name = "WoWProSkin"
function AS:SkinWoWPro()
	AS:SkinFrame(Titlebar)
	AS:SkinBackdropFrame(WoWPro.MainFrame)
	AS:SkinTooltip(_G["Mouseover Note Tooltip"])
end

AS:RegisterSkin(name, AS.SkinWoWPro)