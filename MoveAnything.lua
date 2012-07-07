if not IsAddOnLoaded("MoveAnything") then return end
MAOptions:StripTextures()
MAOptions:SetTemplate("Transparent")
MAScrollBorder:StripTextures()

cSkinScrollBar(MAScrollFrameScrollBar)
cSkinButton(MAOptionsSync)
cSkinButton(MAOptionsOpenBlizzardOptions)
cSkinButton(MAOptionsClose)
cSkinButton(GameMenuButtonMoveAnything)
GameMenuButtonMoveAnything:CreateBackdrop("Transparent")
GameMenuButtonMoveAnything:ClearAllPoints()
GameMenuButtonMoveAnything:Point("TOP", GameMenuFrame, "BOTTOM", 0, -3)

cSkinCheckBox(MAOptionsToggleModifiedFramesOnly)
cSkinCheckBox(MAOptionsToggleCategories)
cSkinCheckBox(MAOptionsToggleFrameStack)
cSkinCheckBox(MAOptionsToggleMovers)
cSkinCheckBox(MAOptionsToggleFrameEditors)

-- Reset Buttons
for i = 1, 100 do
	if _G["MAMove"..i.."Reset"] then cSkinButton(_G["MAMove"..i.."Reset"]) end
	if _G["MAMove"..i.."Reset"] then cSkinButton(_G["MAMove"..i.."Reset"]) end
	if _G["MAMove"..i.."Backdrop"] then _G["MAMove"..i.."Backdrop"]:StripTextures() end
	if _G["MAMove"..i.."Backdrop"] then _G["MAMove"..i.."Backdrop"]:SetTemplate("Transparent") end
	if _G["MAMove"..i.."Move"] then cSkinCheckBox(_G["MAMove"..i.."Move"]) end
	if _G["MAMove"..i.."Hide"] then cSkinCheckBox(_G["MAMove"..i.."Hide"]) end
end

--Nudger

MANudger:SetTemplate("Transparent")
cSkinButton(MANudger_CenterMe)
cSkinButton(MANudger_CenterH)
cSkinButton(MANudger_CenterV)
cSkinButton(MANudger_NudgeUp)
cSkinButton(MANudger_NudgeDown)
cSkinButton(MANudger_NudgeLeft)
cSkinButton(MANudger_NudgeRight)
cSkinButton(MANudger_Detach)
cSkinButton(MANudger_Hide)