local AS, L, S, R = unpack(AddOnSkins)

function R:RCLootCouncil()
	--MainFrame:SetScale(1)
	S:HandleFrame(MainFrame, true)
	S:HandleFrame(ContentFrame, 'Default')
	S:HandleButton(BtClose)
	if _G['BtAward'] then S:HandleButton(BtAward) end
	if _G['BtRemove'] then S:HandleButton(BtRemove) end
	if _G['BtClear'] then S:HandleButton(BtClear) end
	S:HandleCheckBox(MainFrameFilterPasses)
	S:HandleScrollBar(ContentFrameScrollBar)

	for i = 1,10 do
		if _G['ContentFrameEntry'..i..'BtVote'] then
			S:HandleButton(_G['ContentFrameEntry'..i..'BtVote'])
		end
	end

	S:StripTextures(RCLootFrame)
	local function Loot_OnShow(self, event, ...)
		for i = 1,5 do
			if _G['RCLootFrameEntry'..i] then
				--_G['RCLootFrameEntry'..i]:SetScale(1)
				S:HandleFrame(_G['RCLootFrameEntry'..i], true)

				for j = 1,8 do
					if _G['RCLootFrameEntry'..i..'Button'..j] then
						S:HandleButton(_G['RCLootFrameEntry'..i..'Button'..j])
					end
				end
			end
		end
	end
	RCLootFrame:HookScript('OnShow', Loot_OnShow)

	S:HandleFrame(RCLootHistoryFrame)
	S:HandleFrame(RCLootHistoryFrameScrollFrame, 'Default')
	S:HandleCheckBox(RCLootHistoryFrameFilterPasses)
	S:HandleButton(RCLootHistoryFrameButtonClose)
	S:HandleScrollBar(RCLootHistoryFrameScrollFrameScrollBar)

	S:HandleFrame(RCVersionFrame)
	S:HandleFrame(RCVersionFrameContentFrame, 'Default')
	S:HandleButton(ButtonGuild)
	S:HandleButton(RaidButton)
	S:HandleButton(CloseButton)
	S:HandleScrollBar(RCVersionFrameContentFrameScrollBar)
end

--AS:RegisterSkin('RCLootCouncil')
