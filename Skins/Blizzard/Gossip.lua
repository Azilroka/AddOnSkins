local AS = unpack(AddOnSkins)

function AS:Blizzard_Gossip()
	AS:StripTextures(GossipFrameGreetingPanel)

	AS:StripTextures(GossipFrameGreetingGoodbyeButton)
	AS:SkinButton(GossipFrameGreetingGoodbyeButton)
	AS:SkinFrame(GossipFrame)
	GossipFrame:SetHeight(500)
	GossipFramePortrait:Kill()
	AS:StripTextures(GossipFrameInset)
	AS:SkinCloseButton(GossipFrameCloseButton)
	AS:SkinScrollBar(GossipGreetingScrollFrameScrollBar)
	AS:SkinFrame(GossipGreetingScrollFrame)

	if AS.ParchmentEnabled then
		GossipGreetingScrollFrame.Background = GossipGreetingScrollFrame:CreateTexture(nil, 'ARTWORK')
		GossipGreetingScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		GossipGreetingScrollFrame.Background:SetInside()
		GossipGreetingScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
	else
		for i = 1, NUMGOSSIPBUTTONS do
			select(3, _G["GossipTitleButton"..i]:GetRegions()):SetTextColor(1, 1, 1)
		end

		GossipGreetingText:SetTextColor(1,1,1)

		hooksecurefunc("GossipFrameUpdate", function()
			for i=1, NUMGOSSIPBUTTONS do
				local button = _G["GossipTitleButton"..i]
				if button:GetFontString() then
					if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
						button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), "|cff000000", "|cffFFFF00"))
					end
				end
			end
		end)
	end

	AS:SkinStatusBar(NPCFriendshipStatusBar)
end

AS:RegisterSkin('Blizzard_Gossip', AS.Blizzard_Gossip)