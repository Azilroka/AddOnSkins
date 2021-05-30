local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Hack') then return end

function AS:Hack(event)
	AS:SkinFrame(HackListFrame)
	AS:SkinFrame(HackEditFrame)
	AS:SkinCloseButton(HackListFrameClose)
	AS:SkinCloseButton(HackEditFrameClose)
	AS:SkinCheckBox(HackSearchName)
	AS:SkinCheckBox(HackSearchBody)
	AS:SkinEditBox(HackSearchEdit)
	AS:SkinScrollBar(HackEditScrollFrameScrollBar)
	AS:SkinTab(HackListFrameTab1)
	AS:SkinTab(HackListFrameTab2)
end

AS:RegisterSkin('Hack', AS.Hack)
