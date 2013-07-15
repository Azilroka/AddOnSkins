local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "RCLootCouncilSkin"
function AS:SkinRCLootCouncil()

	AS:SkinFrame(MainFrame, "Transparent", true)
	AS:SkinFrame(ContentFrame, "Default")
	S:HandleButton(BtClose)
	if _G["BtAward"] then S:HandleButton(BtAward) end
	if _G["BtRemove"] then S:HandleButton(BtRemove) end
	if _G["BtClear"] then S:HandleButton(BtClear) end
	S:HandleCheckBox(MainFrameFilterPasses)
	S:HandleScrollBar(ContentFrameScrollBar)

	for i = 1,10 do
		local v = _G["ContentFrameEntry"..i.."BtVote"]
		if v then S:HandleButton(_G["ContentFrameEntry"..i.."BtVote"])
		end
	end	

	--LootFrame
	for j = 1,10 do
		for i = 1,8 do
			if _G["RCLootFrameEntry"..j.."Button"..i] then S:HandleButton(_G["RCLootFrameEntry"..j.."Button"..i]) end
		end
	end	

	for i = 1,10 do
		if _G["RCLootFrameEntry"..i] then AS:SkinFrame(_G["RCLootFrameEntry"..i], "Transparent", true) end
	end	

	--LootHistoryFrame
	AS:SkinFrame(RCLootHistoryFrame)
	AS:SkinFrame(RCLootHistoryFrameScrollFrame, "Default")
	S:HandleButton(RCLootHistoryFrameButtonClose)
	S:HandleScrollBar(RCLootHistoryFrameScrollFrameScrollBar)

	--CheckVersionFrame
	AS:SkinFrame(RCVersionFrame1)
	AS:SkinFrame(RCVersionFrameContentFrame, "Default")

	S:HandleButton(ButtonGuild)
	S:HandleButton(RaidButton)
	S:HandleButton(CloseButton)
	S:HandleScrollBar(RCVersionFrameContentFrameScrollBar)
end

AS:RegisterSkin(name, AS.SkinRCLootCouncil)