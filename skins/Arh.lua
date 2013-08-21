local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'ArhSkin'
function AS:SkinArh()
	AS:SkinFrame(Arh_MainFrame)
	AS:SkinTooltip(Arh_Tooltip, true)
end

AS:RegisterSkin(name, AS.SkinArh)