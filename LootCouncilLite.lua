if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("LootCouncil_Lite") then return end
	local SkinLootCouncilLite = CreateFrame("Frame")
	SkinLootCouncilLite:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinLootCouncilLite:SetScript("OnEvent", function(self)
	if (UISkinOptions.LootCouncilLiteSkin ~= "Enabled") then return end
	cSkinFrame(RankFrame)
	cSkinDropDownBox(RankDropDown)
	cSkinButton(RankAcceptButton)
	cSkinButton(RankCancelButton)
	cSkinFrame(MainFrame)
	cSkinFrame(EntryFrame)
	cSkinFrame(LCTestFrame)
	cSkinButton(CloseButton)
	cSkinButton(RunTestButton)
	cSkinButton(TestCancelButton)
	cSkinButton(AbortButton)

	for i = 1,40 do
		if _G["EntryFrameEntry"..i.."AgainstButton"] then cSkinCloseButton(_G["EntryFrameEntry"..i.."AgainstButton"]) end
		if _G["EntryFrameEntry"..i.."ForButton"] then cDesaturate(_G["EntryFrameEntry"..i.."ForButton"]) end
		if _G["EntryFrameEntry"..i.."CancelButton"] then cDesaturate(_G["EntryFrameEntry"..i.."CancelButton"]) end
	end
	end)