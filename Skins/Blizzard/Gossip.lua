local AS = unpack(AddOnSkins)

function AS:Blizzard_Gossip()
	AS:SkinFrame(GossipFrame)
	GossipFrame:SetHeight(500)

	AS:StripTextures(GossipFrame.Inset)
	AS:SkinCloseButton(GossipFrame.CloseButton)
	GossipFramePortrait:SetAlpha(0)

	AS:StripTextures(GossipFrameGreetingPanel)
	AS:SkinButton(GossipFrameGreetingGoodbyeButton)

	AS:SkinFrame(GossipGreetingScrollFrame)
	AS:SkinScrollBar(GossipGreetingScrollFrame.ScrollBar)

	if AS.ParchmentEnabled then
		GossipGreetingScrollFrame.Background = GossipGreetingScrollFrame:CreateTexture(nil, 'ARTWORK')
		GossipGreetingScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		GossipGreetingScrollFrame.Background:SetInside()
		GossipGreetingScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
	else
		local r, g, b = unpack(AS.ClassColor)

		for i = 1, NUMGOSSIPBUTTONS do
			_G["GossipTitleButton"..i]:GetFontString():SetTextColor(1, 1, 1)
			_G["GossipTitleButton"..i]:GetHighlightTexture():SetColorTexture(r, g, b, .3)
			_G["GossipTitleButton"..i]:GetHighlightTexture():SetInside(_G["GossipTitleButton"..i], 2, 0)
		end

		GossipGreetingText:SetTextColor(1, 1, 1)

		hooksecurefunc("GossipFrameUpdate", function()
			for i = 1, NUMGOSSIPBUTTONS do
				local button = _G["GossipTitleButton"..i]
				if button:GetFontString() then
					local Text = button:GetFontString():GetText()
					if Text and strfind(Text, '|cff000000') then
						button:GetFontString():SetText(string.gsub(Text, '|cff000000', '|cffFFFF00'))
					end
				end
			end
		end)
	end

	AS:SkinStatusBar(NPCFriendshipStatusBar)
end

AS:RegisterSkin('Blizzard_Gossip', AS.Blizzard_Gossip)
