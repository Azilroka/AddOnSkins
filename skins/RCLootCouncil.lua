local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "RCLootCouncilSkin"
function AS:SkinRCLootCouncil()

	--MainFrame:SetScale(1)
	AS:SkinFrame(MainFrame, "Transparent", true)
	AS:SkinFrame(ContentFrame, "Default")
	S:HandleButton(BtClose)
	if _G["BtAward"] then S:HandleButton(BtAward) end
	if _G["BtRemove"] then S:HandleButton(BtRemove) end
	if _G["BtClear"] then S:HandleButton(BtClear) end
	S:HandleCheckBox(MainFrameFilterPasses)
	S:HandleScrollBar(ContentFrameScrollBar)

	for i = 1,10 do
		if _G["ContentFrameEntry"..i.."BtVote"] then
			S:HandleButton(_G["ContentFrameEntry"..i.."BtVote"])
		end
	end	

	RCLootFrame:StripTextures()
	local function Loot_OnShow(self, event, ...)
		for i = 1,5 do
			if _G["RCLootFrameEntry"..i] then
				--_G["RCLootFrameEntry"..i]:SetScale(1)
				AS:SkinFrame(_G["RCLootFrameEntry"..i], "Transparent", true)
				
				for j = 1,8 do
					if _G["RCLootFrameEntry"..i.."Button"..j] then
						S:HandleButton(_G["RCLootFrameEntry"..i.."Button"..j])
					end
				end
			end
		end	
	end
	RCLootFrame:HookScript("OnShow", Loot_OnShow)

	AS:SkinFrame(RCLootHistoryFrame)
	AS:SkinFrame(RCLootHistoryFrameScrollFrame, "Default")
	S:HandleCheckBox(RCLootHistoryFrameFilterPasses)
	S:HandleButton(RCLootHistoryFrameButtonClose)
	S:HandleScrollBar(RCLootHistoryFrameScrollFrameScrollBar)

	AS:SkinFrame(RCVersionFrame)
	AS:SkinFrame(RCVersionFrameContentFrame, "Default")
	S:HandleButton(ButtonGuild)
	S:HandleButton(RaidButton)
	S:HandleButton(CloseButton)
	S:HandleScrollBar(RCVersionFrameContentFrameScrollBar)
end

AS:RegisterSkin(name, AS.SkinRCLootCouncil)