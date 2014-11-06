local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Arh') then return end

function AS:Arh()
	AS:SkinFrame(Arh_MainFrame)
	AS:SkinTooltip(Arh_Tooltip, true)
end

AS:RegisterSkin('Arh', AS.Arh)