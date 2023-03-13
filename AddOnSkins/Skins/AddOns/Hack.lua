local AS, L, S, R = unpack(AddOnSkins)

function R:Hack()
	S:HandleFrame(HackListFrame)
	S:HandleFrame(HackEditFrame)
	S:HandleCloseButton(HackListFrameClose)
	S:HandleCloseButton(HackEditFrameClose)
	S:HandleCheckBox(HackSearchName)
	S:HandleCheckBox(HackSearchBody)
	S:HandleEditBox(HackSearchEdit)
	S:HandleScrollBar(HackEditScrollFrameScrollBar)
	S:HandleTab(HackListFrameTab1)
	S:HandleTab(HackListFrameTab2)
end

AS:RegisterSkin('Hack')
