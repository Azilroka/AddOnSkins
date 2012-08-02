if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("LootCouncil_Lite") then return end
	RankFrame:SetTemplate("Transparent")
	cSkinDropDownBox(RankDropDown)
	cSkinButton(RankAcceptButton)
	cSkinButton(RankCancelButton)
	MainFrame:SetTemplate("Transparent")
	EntryFrame:SetTemplate("Transparent")
	LCTestFrame:SetTemplate("Transparent")
	cSkinButton(CloseButton)
	cSkinButton(RunTestButton)
	cSkinButton(TestCancelButton)
	cSkinButton(AbortButton)

	for i = 1,40 do
		if _G["EntryFrameEntry"..i.."AgainstButton"] then cSkinCloseButton(_G["EntryFrameEntry"..i.."AgainstButton"]) end
		if _G["EntryFrameEntry"..i.."ForButton"] then cDesaturate(_G["EntryFrameEntry"..i.."ForButton"]) end
		if _G["EntryFrameEntry"..i.."CancelButton"] then cDesaturate(_G["EntryFrameEntry"..i.."CancelButton"]) end
	end
