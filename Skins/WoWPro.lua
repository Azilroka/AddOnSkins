local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WoWPro') then return end

function AS:WoWPro()
	AS:SkinFrame(WoWPro.Titlebar)
	AS:SkinBackdropFrame(WoWPro.MainFrame)
	for i = 1, 15 do
		AS:SkinTooltip(WoWPro.mousenotes[i])
	end
end

AS:RegisterSkin('WoWPro', AS.WoWPro)