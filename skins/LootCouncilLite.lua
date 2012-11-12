
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "LootCouncilLiteSkin"
local function SkinLootCouncilLite(self)
	AS:SkinFrame(RankFrame)
	AS:SkinDropDownBox(RankDropDown)
	AS:SkinButton(RankAcceptButton)
	AS:SkinButton(RankCancelButton)
	AS:SkinFrame(MainFrame)
	AS:SkinFrame(EntryFrame)
	AS:SkinFrame(LCTestFrame)
	AS:SkinButton(CloseButton)
	AS:SkinButton(RunTestButton)
	AS:SkinButton(TestCancelButton)
	AS:SkinButton(AbortButton)

	for i = 1,40 do
		if _G["EntryFrameEntry"..i.."AgainstButton"] then AS:SkinCloseButton(_G["EntryFrameEntry"..i.."AgainstButton"]) end
		if _G["EntryFrameEntry"..i.."ForButton"] then AS:Desaturate(_G["EntryFrameEntry"..i.."ForButton"]) end
		if _G["EntryFrameEntry"..i.."CancelButton"] then AS:Desaturate(_G["EntryFrameEntry"..i.."CancelButton"]) end
	end
end

AS:RegisterSkin(name,SkinLootCouncilLite)