if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("MoveAnything") then return end
local U = unpack(select(2,...))
local name = "MoveAnythingSkin"
local function SkinMoveAnything(self)
	local s = U.s
	local c = U.c

	U.SkinFrame(MAOptions)
	MAScrollBorder:StripTextures(True)

	U.SkinScrollBar(MAScrollFrameScrollBar)
	U.SkinButton(MAOptionsSync)
	U.SkinButton(MAOptionsOpenBlizzardOptions)
	U.SkinButton(MAOptionsClose)
	U.SkinButton(GameMenuButtonMoveAnything)
	GameMenuButtonMoveAnything:CreateBackdrop("Transparent")
	GameMenuButtonMoveAnything:ClearAllPoints()
	GameMenuButtonMoveAnything:Point("TOP", GameMenuFrame, "BOTTOM", 0, -3)

	U.SkinCheckBox(MAOptionsToggleModifiedFramesOnly)
	U.SkinCheckBox(MAOptionsToggleCategories)
	U.SkinCheckBox(MAOptionsToggleFrameStack)
	U.SkinCheckBox(MAOptionsToggleMovers)
	U.SkinCheckBox(MAOptionsToggleFrameEditors)

	for i = 1, 100 do
		if _G["MAMove"..i.."Reset"] then U.SkinButton(_G["MAMove"..i.."Reset"]) end
		if _G["MAMove"..i.."Reset"] then U.SkinButton(_G["MAMove"..i.."Reset"]) end
		if _G["MAMove"..i.."Backdrop"] then U.SkinFrame(_G["MAMove"..i.."Backdrop"]) end
		if _G["MAMove"..i.."Move"] then U.SkinCheckBox(_G["MAMove"..i.."Move"]) end
		if _G["MAMove"..i.."Hide"] then U.SkinCheckBox(_G["MAMove"..i.."Hide"]) end
	end

	U.SkinFrame(MANudger)
	U.SkinButton(MANudger_CenterMe)
	U.SkinButton(MANudger_CenterH)
	U.SkinButton(MANudger_CenterV)
	U.SkinButton(MANudger_NudgeUp)
	U.SkinButton(MANudger_NudgeDown)
	U.SkinButton(MANudger_NudgeLeft)
	U.SkinButton(MANudger_NudgeRight)
	U.SkinButton(MANudger_Detach)
	U.SkinButton(MANudger_Hide)
end

U.RegisterSkin(name,SkinMoveAnything)