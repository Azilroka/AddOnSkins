local AS = unpack(AddOnSkins)

function AS:Blizzard_Gossip()
	AS:StripTextures(GossipFrameGreetingPanel)

	AS:StripTextures(GossipFrameGreetingGoodbyeButton)
	AS:SkinButton(GossipFrameGreetingGoodbyeButton)

	--[[for i = 1, NUMGOSSIPBUTTONS do
		local obj = select(3, _G["GossipTitleButton"..i]:GetRegions())
		obj:SetTextColor(1, 1, 1)
	end]]

	--GossipGreetingText:SetTextColor(1,1,1)
	AS:SkinFrame(GossipFrame)
	GossipFramePortrait:Kill()
	AS:StripTextures(GossipFrameInset)
	AS:SkinCloseButton(GossipFrameCloseButton)
	AS:SkinScrollBar(GossipGreetingScrollFrameScrollBar)
	AS:SkinFrame(GossipGreetingScrollFrame)
	GossipGreetingScrollFrame.Background = GossipGreetingScrollFrame:CreateTexture(nil, 'ARTWORK')
	GossipGreetingScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
	GossipGreetingScrollFrame.Background:SetInside()
	GossipGreetingScrollFrame.Background:SetTexCoord(0, .585, 0, .655)

	--Extreme hackage, blizzard makes button text on quest frame use hex color codes for some reason
	--[[hooksecurefunc("GossipFrameUpdate", function()
		for i=1, NUMGOSSIPBUTTONS do
			local button = _G["GossipTitleButton"..i]
			
			if button:GetFontString() then
				if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
					button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), "|cff000000", "|cffFFFF00"))
				end
			end
		end
	end)]]

	AS:SkinStatusBar(NPCFriendshipStatusBar)
end

AS:RegisterSkin('Blizzard_Gossip', AS.Blizzard_Gossip)