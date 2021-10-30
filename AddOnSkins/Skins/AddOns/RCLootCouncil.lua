local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('RCLootCouncil') then return end

function AS:RCLootCouncil()

	--MainFrame:SetScale(1)
	AS:SkinFrame(MainFrame, 'Transparent', true)
	AS:SkinFrame(ContentFrame, 'Default')
	AS:SkinButton(BtClose)
	if _G['BtAward'] then AS:SkinButton(BtAward) end
	if _G['BtRemove'] then AS:SkinButton(BtRemove) end
	if _G['BtClear'] then AS:SkinButton(BtClear) end
	AS:SkinCheckBox(MainFrameFilterPasses)
	AS:SkinScrollBar(ContentFrameScrollBar)

	for i = 1,10 do
		if _G['ContentFrameEntry'..i..'BtVote'] then
			AS:SkinButton(_G['ContentFrameEntry'..i..'BtVote'])
		end
	end

	AS:StripTextures(RCLootFrame)
	local function Loot_OnShow(self, event, ...)
		for i = 1,5 do
			if _G['RCLootFrameEntry'..i] then
				--_G['RCLootFrameEntry'..i]:SetScale(1)
				AS:SkinFrame(_G['RCLootFrameEntry'..i], 'Transparent', true)

				for j = 1,8 do
					if _G['RCLootFrameEntry'..i..'Button'..j] then
						AS:SkinButton(_G['RCLootFrameEntry'..i..'Button'..j])
					end
				end
			end
		end
	end
	RCLootFrame:HookScript('OnShow', Loot_OnShow)

	AS:SkinFrame(RCLootHistoryFrame)
	AS:SkinFrame(RCLootHistoryFrameScrollFrame, 'Default')
	AS:SkinCheckBox(RCLootHistoryFrameFilterPasses)
	AS:SkinButton(RCLootHistoryFrameButtonClose)
	AS:SkinScrollBar(RCLootHistoryFrameScrollFrameScrollBar)

	AS:SkinFrame(RCVersionFrame)
	AS:SkinFrame(RCVersionFrameContentFrame, 'Default')
	AS:SkinButton(ButtonGuild)
	AS:SkinButton(RaidButton)
	AS:SkinButton(CloseButton)
	AS:SkinScrollBar(RCVersionFrameContentFrameScrollBar)
end

AS:RegisterSkin('RCLootCouncil', AS.RCLootCouncil)
