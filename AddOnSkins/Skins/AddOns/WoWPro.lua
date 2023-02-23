local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('WoWPro') then return end

function AS:WoWPro()
	S:HandleFrame(WoWPro.Titlebar)
	S:HandleFrame(WoWPro.MainFrame, true)
	for i = 1, 15 do
		S:HandleTooltip(WoWPro.mousenotes[i])
	end
end

AS:RegisterSkin('WoWPro', AS.WoWPro)
