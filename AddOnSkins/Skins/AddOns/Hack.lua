local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('Hack') then return end

function AS:Hack(event)
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

AS:RegisterSkin('Hack', AS.Hack)
