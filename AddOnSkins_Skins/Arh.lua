local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Arh') then return end

local name = 'ArhSkin'
function AS:SkinArh()
	AS:SkinFrame(Arh_MainFrame)
	AS:SkinTooltip(Arh_Tooltip, true)
end

AS:RegisterSkin(name, AS.SkinArh)