local AS = unpack(AddOnSkins)

function AS:Blizzard_WorldMap()
	AS:StripTextures(WorldMapFrame.BorderFrame.Inset)
	AS:StripTextures(WorldMapFrame.BorderFrame)
	AS:StripTextures(WorldMapFrameNavBar)
	AS:StripTextures(WorldMapFrameNavBarOverlay)

	AS:SkinDropDownBox(WorldMapLevelDropDown)
	WorldMapLevelDropDown:SetPoint("TOPLEFT", -17, 0)

	AS:SkinBackdropFrame(WorldMapFrame.BorderFrame)
	AS:SkinFrame(WorldMapFrame.BorderFrame.Inset)

	AS:SkinScrollBar(QuestScrollFrameScrollBar)
	AS:SkinButton(QuestScrollFrame.ViewAll)

	WorldMapFrameTutorialButton:Kill()

	AS:SkinButton(QuestMapFrame.DetailsFrame.BackButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.AbandonButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.ShareButton, true)
	AS:SkinButton(WorldMapFrame.UIElementsFrame.TrackingOptionsButton)
	WorldMapFrame.UIElementsFrame.TrackingOptionsButton.Background:SetAlpha(0)
	WorldMapFrame.UIElementsFrame.TrackingOptionsButton.IconOverlay:SetAlpha(0)
	WorldMapFrame.UIElementsFrame.TrackingOptionsButton.Button.Border:SetAlpha(0)
	WorldMapFrame.UIElementsFrame.TrackingOptionsButton.Button.Shine:SetAlpha(0)
	WorldMapFrame.UIElementsFrame.TrackingOptionsButton.Button:SetHighlightTexture('')
	AS:SkinFrame(QuestMapFrame.QuestsFrame.StoryTooltip)

	AS:SkinCloseButton(WorldMapFrameCloseButton)
	AS:StripTextures(WorldMapFrameSizeDownButton, true)
	WorldMapFrameSizeDownButton:SetNormalTexture('')
	WorldMapFrameSizeDownButton:SetPushedTexture('')
	WorldMapFrameSizeDownButton:SetHighlightTexture('')
	WorldMapFrameSizeDownButton.Text = WorldMapFrameSizeDownButton:CreateFontString(nil, 'OVERLAY')
	WorldMapFrameSizeDownButton.Text:SetFont('Interface\\AddOns\\AddOnSkins\\Media\\Fonts\\Arial.ttf', 12)
	WorldMapFrameSizeDownButton.Text:SetText('▼')
	WorldMapFrameSizeDownButton.Text:Point('CENTER', WorldMapFrameSizeUpButton)

	AS:StripTextures(WorldMapFrameSizeUpButton, true)
	WorldMapFrameSizeUpButton:SetNormalTexture('')
	WorldMapFrameSizeUpButton:SetPushedTexture('')
	WorldMapFrameSizeUpButton:SetHighlightTexture('')
	WorldMapFrameSizeUpButton.Text = WorldMapFrameSizeUpButton:CreateFontString(nil, 'OVERLAY')
	WorldMapFrameSizeUpButton.Text:SetFont('Interface\\AddOns\\AddOnSkins\\Media\\Fonts\\Arial.ttf', 12)
	WorldMapFrameSizeUpButton.Text:SetText('▲')
	WorldMapFrameSizeUpButton.Text:Point('CENTER', WorldMapFrameSizeUpButton)

	QuestMapFrame.DetailsFrame:DisableDrawLayer('BORDER')

	if not AS.ParchmentEnabled then
		AS:StripTextures(QuestMapFrame.DetailsFrame)
		AS:StripTextures(QuestMapFrame.DetailsFrame.RewardsFrame)
	end

	local rewardFrames = {
		['MoneyFrame'] = true,
		['XPFrame'] = true,
		['SpellFrame'] = true,
		['SkillPointFrame'] = true,
	}

	local function HandleReward(frame)
		frame.NameFrame:SetAlpha(0)
		frame.Icon:SetTexCoord(unpack(AS.TexCoords))
		AS:CreateBackdrop(frame)
		frame.Backdrop:SetOutside(frame.Icon)
		frame.Count:ClearAllPoints()
		frame.Count:SetPoint("BOTTOMRIGHT", frame.Icon, "BOTTOMRIGHT", 2, 0)
		if(frame.CircleBackground) then
			frame.CircleBackground:SetAlpha(0)
			frame.CircleBackgroundGlow:SetAlpha(0)
		end
	end

	for frame, _ in pairs(rewardFrames) do
		HandleReward(MapQuestInfoRewardsFrame[frame])
	end


	hooksecurefunc('QuestInfo_GetRewardButton', function(rewardsFrame, index)
		local button = MapQuestInfoRewardsFrame.RewardButtons[index]
		if (button) then
			HandleReward(button)
		end
	end)

	hooksecurefunc('NavBar_AddButton', function(self, buttonData)
		if self.navList then
			for i = 1, #self.navList do
				if not self.navList[i].isSkinned then
					self.navList[i].xoffset = 1
					AS:SkinButton(self.navList[i], true)
					if self.navList[i].MenuArrowButton then
						self.navList[i].MenuArrowButton.NormalTexture:SetAlpha(0);
						self.navList[i].MenuArrowButton.PushedTexture:SetAlpha(0);
						self.navList[i].MenuArrowButton:SetHighlightTexture('')
						self.navList[i].MenuArrowButton:SetScript('OnEnter', nil)
						self.navList[i].MenuArrowButton:SetScript('OnLeave', nil)
					end
					self.navList[i].isSkinned = true
				end
			end
		end
	end)

	AS:SkinFrame(WorldMapFrame.UIElementsFrame.OpenQuestPanelButton)
	WorldMapFrame.UIElementsFrame.OpenQuestPanelButton.Text = WorldMapFrame.UIElementsFrame.OpenQuestPanelButton:CreateFontString(nil, 'OVERLAY')
	WorldMapFrame.UIElementsFrame.OpenQuestPanelButton.Text:SetFont('Interface\\AddOns\\AddOnSkins\\Media\\Fonts\\Arial.ttf', 12)
	WorldMapFrame.UIElementsFrame.OpenQuestPanelButton.Text:SetText('►')
	WorldMapFrame.UIElementsFrame.OpenQuestPanelButton.Text:Point('CENTER', WorldMapFrame.UIElementsFrame.OpenQuestPanelButton)
	AS:SkinFrame(WorldMapFrame.UIElementsFrame.CloseQuestPanelButton)
	WorldMapFrame.UIElementsFrame.CloseQuestPanelButton.Text = WorldMapFrame.UIElementsFrame.CloseQuestPanelButton:CreateFontString(nil, 'OVERLAY')
	WorldMapFrame.UIElementsFrame.CloseQuestPanelButton.Text:SetFont('Interface\\AddOns\\AddOnSkins\\Media\\Fonts\\Arial.ttf', 12)
	WorldMapFrame.UIElementsFrame.CloseQuestPanelButton.Text:SetText('◄')
	WorldMapFrame.UIElementsFrame.CloseQuestPanelButton.Text:Point('CENTER', WorldMapFrame.UIElementsFrame.CloseQuestPanelButton)
end

AS:RegisterSkin('Blizzard_WorldMap', AS.Blizzard_WorldMap)