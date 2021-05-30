local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MoveAnything') then return end

function AS:MoveAnything()
	AS:SkinFrame(MAOptions)
	AS:StripTextures(MAScrollBorder, true)
	AS:SkinScrollBar(MAScrollFrameScrollBar)
	AS:SkinButton(MAOptionsSync)
	AS:SkinButton(MAOptionsOpenBlizzardOptions)
	AS:SkinButton(MAOptionsClose)
	AS:SkinButton(GameMenuButtonMoveAnything)
	AS:SkinEditBox(MA_Search)
	AS:SkinCheckBox(MAOptionsToggleModifiedFramesOnly)
	AS:SkinCheckBox(MAOptionsToggleCategories)
	AS:SkinCheckBox(MAOptionsToggleFrameStack)
	AS:SkinCheckBox(MAOptionsToggleMovers)
	AS:SkinCheckBox(MAOptionsToggleFrameEditors)
	for i = 1, 100 do
		if _G['MAMove'..i..'Reset'] then AS:SkinButton(_G['MAMove'..i..'Reset']) end
		if _G['MAMove'..i..'Reset'] then AS:SkinButton(_G['MAMove'..i..'Reset']) end
		if _G['MAMove'..i..'Backdrop'] then AS:SkinFrame(_G['MAMove'..i..'Backdrop']) end
		if _G['MAMove'..i..'Move'] then AS:SkinCheckBox(_G['MAMove'..i..'Move']) end
		if _G['MAMove'..i..'Hide'] then AS:SkinCheckBox(_G['MAMove'..i..'Hide']) end
	end
	AS:SkinFrame(MANudger)
	AS:SkinButton(MANudger_CenterMe)
	AS:SkinButton(MANudger_CenterH)
	AS:SkinButton(MANudger_CenterV)
	AS:SkinButton(MANudger_NudgeUp)
	AS:SkinButton(MANudger_NudgeDown)
	AS:SkinButton(MANudger_NudgeLeft)
	AS:SkinButton(MANudger_NudgeRight)
	AS:SkinButton(MANudger_Detach)
	AS:SkinButton(MANudger_Hide)
end

AS:RegisterSkin('MoveAnything', AS.MoveAnything)