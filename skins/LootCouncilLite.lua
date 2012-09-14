if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("LootCouncil_Lite") then return end
local U = unpack(select(2,...))
local name = "LootCouncilLiteSkin"
local function SkinLootCouncilLite(self)
	U.SkinFrame(RankFrame)
	U.SkinDropDownBox(RankDropDown)
	U.SkinButton(RankAcceptButton)
	U.SkinButton(RankCancelButton)
	U.SkinFrame(MainFrame)
	U.SkinFrame(EntryFrame)
	U.SkinFrame(LCTestFrame)
	U.SkinButton(CloseButton)
	U.SkinButton(RunTestButton)
	U.SkinButton(TestCancelButton)
	U.SkinButton(AbortButton)

	for i = 1,40 do
		if _G["EntryFrameEntry"..i.."AgainstButton"] then U.SkinCloseButton(_G["EntryFrameEntry"..i.."AgainstButton"]) end
		if _G["EntryFrameEntry"..i.."ForButton"] then U.Desaturate(_G["EntryFrameEntry"..i.."ForButton"]) end
		if _G["EntryFrameEntry"..i.."CancelButton"] then U.Desaturate(_G["EntryFrameEntry"..i.."CancelButton"]) end
	end
end

U.RegisterSkin(name,SkinLootCouncilLite)