local AS, L, S, R = unpack(AddOnSkins)

function R:WoWPro()
	S:HandleFrame(WoWPro.Titlebar)
	S:HandleFrame(WoWPro.MainFrame, true)
	for i = 1, 15 do
		S:HandleTooltip(WoWPro.mousenotes[i])
	end
end

AS:RegisterSkin('WoWPro')
