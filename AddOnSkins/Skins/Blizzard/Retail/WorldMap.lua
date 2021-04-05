if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_AlliedRacesUI(event, addon)
	if addon ~= 'Blizzard_AlliedRacesUI' then return end

	AS:SkinBackdropFrame(AlliedRacesFrame)
	AlliedRacesFrame.Bg:Hide()

	AlliedRacesFrame.portrait:Hide()
	AlliedRacesFrame.TitleBg:Hide()

	AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.Border:Hide()
	AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.ScrollUpBorder:Hide()
	AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.ScrollDownBorder:Hide()
	AS:StripTextures(AlliedRacesFrame.ModelFrame)

	AS:SkinCloseButton(AlliedRacesFrameCloseButton)
	AS:SkinScrollBar(AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar)

	AS:SkinFrame(AlliedRacesFrame.RaceInfoFrame.ScrollFrame.Child.ObjectivesFrame)

	AlliedRacesFrame.RaceInfoFrame.AlliedRacesRaceName:SetTextColor(1, .8, 0)
	AlliedRacesFrame.RaceInfoFrame.ScrollFrame.Child.RaceDescriptionText:SetTextColor(1, 1, 1)
	AlliedRacesFrame.RaceInfoFrame.ScrollFrame.Child.RacialTraitsLabel:SetTextColor(1, .8, 0)

	AlliedRacesFrame:HookScript("OnShow", function(self)
		for button in self.abilityPool:EnumerateActive() do
			select(3, button:GetRegions()):Hide()
			AS:SkinTexture(button.Icon, true)
			button.Text:SetTextColor(1, 1, 1)
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_Gossip()
	AS:SkinFrame(GossipFrame)
	GossipFrame:SetHeight(500)

	AS:SkinCloseButton(GossipFrame.CloseButton)
	GossipFramePortrait:SetAlpha(0)

	AS:StripTextures(GossipFrameGreetingPanel)
	AS:SkinButton(GossipFrameGreetingGoodbyeButton)

	AS:SkinFrame(GossipGreetingScrollFrame)
	AS:SkinScrollBar(GossipGreetingScrollFrame.ScrollBar)

	if AS.ParchmentEnabled then
		GossipGreetingScrollFrame.Background = GossipGreetingScrollFrame:CreateTexture(nil, 'ARTWORK')
		GossipGreetingScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		AS:SetInside(GossipGreetingScrollFrame.Background)
		GossipGreetingScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
	else
		local r, g, b = unpack(AS.ClassColor)

		--for i = 1, NUMGOSSIPBUTTONS do
		--	_G["GossipTitleButton"..i]:GetFontString():SetTextColor(1, 1, 1)
		--	_G["GossipTitleButton"..i]:GetHighlightTexture():SetColorTexture(r, g, b, .3)
		--	AS:SetInside(_G["GossipTitleButton"..i]:GetHighlightTexture(), _G["GossipTitleButton"..i], 2, 0)
		--end

		--GossipGreetingText:SetTextColor(1, 1, 1)

		--hooksecurefunc("GossipFrameUpdate", function()
		--	for i = 1, NUMGOSSIPBUTTONS do
		--		local button = _G["GossipTitleButton"..i]
		--		if button:GetFontString() then
		--			local Text = button:GetFontString():GetText()
		--			if Text and Text.GetText and strmatch(Text:GetText(), '|c[Ff][Ff]%x%x%x%x%x%x') then
		--				button:GetFontString():SetText(gsub(Text, '|c[Ff][Ff]%x%x%x%x%x%x', '|cffffe519'))
		--			end
		--		end
		--	end
		--end)
	end

	AS:SkinStatusBar(NPCFriendshipStatusBar)
end

function AS:Blizzard_Quest()
	AS:SkinFrame(QuestFrame)
	QuestFrame.portrait:SetAlpha(0)
	QuestFrame:SetHeight(500)

	AS:SkinCloseButton(QuestFrame.CloseButton)

	AS:StripTextures(QuestFrameDetailPanel, true)
	AS:StripTextures(QuestDetailScrollChildFrame, true)
	AS:StripTextures(QuestFrameProgressPanel, true)
	AS:StripTextures(QuestFrameGreetingPanel, true)
	AS:StripTextures(QuestFrameRewardPanel, true)
	AS:SkinFrame(QuestProgressScrollFrame)
	AS:SkinFrame(QuestRewardScrollFrame)
	AS:SkinBackdropFrame(QuestDetailScrollFrame, nil, nil, true)
	QuestDetailScrollFrame.Backdrop:SetPoint("TOPLEFT", 0, 0)
	QuestDetailScrollFrame.Backdrop:SetPoint("BOTTOMRIGHT", 4, 0)
	AS:SkinFrame(QuestGreetingScrollFrame)

	AS:SkinScrollBar(QuestDetailScrollFrameScrollBar)
	AS:SkinScrollBar(QuestNPCModelTextScrollFrameScrollBar)
	AS:SkinScrollBar(QuestGreetingScrollFrameScrollBar)
	AS:SkinScrollBar(QuestProgressScrollFrameScrollBar)
	AS:SkinScrollBar(QuestRewardScrollFrameScrollBar)

	AS:SkinButton(QuestFrameAcceptButton)
	AS:SkinButton(QuestFrameDeclineButton)
	AS:SkinButton(QuestFrameCompleteButton)
	AS:SkinButton(QuestFrameGoodbyeButton)
	AS:SkinButton(QuestFrameGreetingGoodbyeButton)
	AS:SkinButton(QuestFrameCompleteQuestButton)

	AS:StripTextures(QuestInfoItemHighlight)

	hooksecurefunc("QuestInfoItem_OnClick", function(self)
		for _, Button in ipairs(QuestInfoRewardsFrame.RewardButtons) do
			Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			Button.Name:SetTextColor(1, 1, 1)
		end

		self.Backdrop:SetBackdropBorderColor(1,.9,.1)
		self.Name:SetTextColor(1, .8, .1)
	end)

	AS:SkinBackdropFrame(QuestInfoRewardsFrame.SkillPointFrame)
	AS:SkinTexture(QuestInfoRewardsFrame.SkillPointFrame.Icon, true)

	QuestInfoRewardsFrame.SkillPointFrame.Backdrop:SetPoint('TOPLEFT', QuestInfoRewardsFrame.SkillPointFrame.Icon, 'TOPRIGHT', 0, 0)
	QuestInfoRewardsFrame.SkillPointFrame.Backdrop:SetPoint('BOTTOMLEFT', QuestInfoRewardsFrame.SkillPointFrame.Icon, 'BOTTOMRIGHT', 0, 0)
	QuestInfoRewardsFrame.SkillPointFrame.Backdrop:SetPoint('RIGHT', QuestInfoRewardsFrame.SkillPointFrame.NameFrame, 'RIGHT', -12, 0)

	QuestInfoRewardsFrame.SkillPointFrame.ValueText:SetDrawLayer('OVERLAY', 7)

	for i = 1, 6 do
		local Button = _G["QuestProgressItem"..i]
		AS:SkinBackdropFrame(Button)
		AS:SkinTexture(Button.Icon, true)

		Button.Backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 0, 0)
		Button.Backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 0, 0)
		Button.Backdrop:SetPoint('RIGHT', Button, 'RIGHT', -5, 0)
	end

	local function HandleReward(frame)
		if (not frame) then return end

		if frame.Icon then
			AS:SkinTexture(frame.Icon, true)

			AS:CreateBackdrop(frame)
			frame.Backdrop:SetPoint('TOPLEFT', frame.Icon, 'TOPRIGHT', -1, 0)
			frame.Backdrop:SetPoint('BOTTOMLEFT', frame.Icon, 'BOTTOMRIGHT', -1, 0)
			frame.Backdrop:SetPoint('RIGHT', frame, 'RIGHT', -5, 0)

			frame.Count:ClearAllPoints()
			frame.Count:SetPoint("BOTTOMRIGHT", frame.Icon, "BOTTOMRIGHT", 2, 0)
		end

		if frame.NameFrame then
			frame.NameFrame:SetAlpha(0)
		end

		if (frame.CircleBackground) then
			frame.CircleBackground:SetAlpha(0)
			frame.CircleBackgroundGlow:SetAlpha(0)
		end
	end

	local Rewards = { 'MoneyFrame', 'HonorFrame', 'XPFrame', 'SpellFrame', 'SkillPointFrame' }

	for _, frame in pairs(Rewards) do
		HandleReward(_G.MapQuestInfoRewardsFrame[frame])
		HandleReward(_G.QuestInfoRewardsFrame[frame])
	end

	hooksecurefunc("QuestInfo_GetRewardButton", function(rewardsFrame, index)
		local RewardButton = rewardsFrame.RewardButtons[index]

		if (not RewardButton.Backdrop) then
			HandleReward(RewardButton)

			RewardButton.IconBorder:SetAlpha(0)
			RewardButton.NameFrame:Hide()

			hooksecurefunc(RewardButton.IconBorder, 'SetVertexColor', function(self, r, g, b) RewardButton.Icon.Backdrop:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(RewardButton.IconBorder, 'Hide', function(self) RewardButton.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		else
			RewardButton.Name:SetTextColor(1, 1, 1)
		end
	end)

	AS:SkinFrame(QuestModelScene)

	AS:SkinFrame(QuestLogPopupDetailFrame)
	AS:SkinButton(QuestLogPopupDetailFrameAbandonButton)
	AS:SkinButton(QuestLogPopupDetailFrameShareButton)
	AS:SkinButton(QuestLogPopupDetailFrameTrackButton)
	AS:StripTextures(QuestLogPopupDetailFrameInset)
	AS:SkinBackdropFrame(QuestLogPopupDetailFrameScrollFrame)
	QuestLogPopupDetailFrameScrollFrame.Backdrop:SetPoint('BOTTOMRIGHT', 2, 0)
	AS:SkinScrollBar(QuestLogPopupDetailFrameScrollFrameScrollBar)
	AS:SkinCloseButton(QuestLogPopupDetailFrameCloseButton)

	AS:StripTextures(QuestLogPopupDetailFrame.ShowMapButton)
	AS:SkinButton(QuestLogPopupDetailFrame.ShowMapButton)
	QuestLogPopupDetailFrame.ShowMapButton.Text:ClearAllPoints()
	QuestLogPopupDetailFrame.ShowMapButton.Text:SetPoint("CENTER", AS.Mult, 0)
	QuestLogPopupDetailFrame.ShowMapButton:SetSize(QuestLogPopupDetailFrame.ShowMapButton:GetWidth() - 30, QuestLogPopupDetailFrame.ShowMapButton:GetHeight() - 5)

	hooksecurefunc("QuestFrame_ShowQuestPortrait", function(QuestFrame, parentFrame, portrait, text, name, x, y)
		QuestModelScene:ClearAllPoints()
		QuestModelScene:SetPoint("TOPLEFT", QuestFrame, "TOPRIGHT", x + 10, y)
	end)

	--Spell Rewards
	local spellRewards = {QuestInfoRewardsFrame, MapQuestInfoRewardsFrame}
	for _, rewardFrame in pairs(spellRewards) do
		local spellRewardFrame = rewardFrame.spellRewardPool:Acquire()
		local icon = spellRewardFrame.Icon
		local nameFrame = spellRewardFrame.NameFrame

		AS:StripTextures(spellRewardFrame)
		AS:SkinTexture(icon, true)
		nameFrame:Hide()

--		bg:SetPoint("TOPLEFT", icon, "TOPRIGHT", 0, 2)
--		bg:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 101, -1)
	end

	-- Title Reward
	do
		local frame = QuestInfoPlayerTitleFrame
		local icon = frame.Icon

		AS:SkinTexture(icon, true)

		for i = 2, 4 do
			select(i, frame:GetRegions()):Hide()
		end

--		bg:SetPoint("TOPLEFT", icon, "TOPRIGHT", 0, 2)
--		bg:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 220, -1)
	end

	-- Follower Rewards
	hooksecurefunc("QuestInfo_Display", function(template, parentFrame, acceptButton, material, mapView)
		local rewardsFrame = QuestInfoFrame.rewardsFrame
		local isQuestLog = QuestInfoFrame.questLog ~= nil
		local isMapQuest = rewardsFrame == MapQuestInfoRewardsFrame
		local numSpellRewards = isQuestLog and GetNumQuestLogRewardSpells() or GetNumRewardSpells()

		if (template.canHaveSealMaterial) then
			local questFrame = parentFrame:GetParent():GetParent()
			questFrame.SealMaterialBG:Hide()
		end

		if numSpellRewards > 0 then
			for reward in rewardsFrame.followerRewardPool:EnumerateActive() do
				local portrait = reward.PortraitFrame
				if not reward.styled then
					portrait:ClearAllPoints()
					portrait:SetPoint("TOPLEFT", 2, -5)
					reward.BG:Hide()
					--bg:SetPoint("TOPLEFT", 0, -3)
					--bg:SetPoint("BOTTOMRIGHT", 2, 7)
					reward.styled = true
				end
				if portrait then
					--portrait.squareBG:SetBackdropBorderColor(GetItemQualityColor(portrait.quality or 1))
				end
			end
		end
	end)

	if AS.ParchmentEnabled then
		QuestDetailScrollFrame.Background = QuestDetailScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestDetailScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		AS:SetInside(QuestDetailScrollFrame.Background)
		QuestDetailScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestGreetingScrollFrame.Background = QuestGreetingScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestGreetingScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		AS:SetInside(QuestGreetingScrollFrame.Background)
		QuestGreetingScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestProgressScrollFrame.Background = QuestProgressScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestProgressScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		AS:SetInside(QuestProgressScrollFrame.Background)
		QuestProgressScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestRewardScrollFrame.Background = QuestRewardScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestRewardScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		AS:SetInside(QuestRewardScrollFrame.Background)
		QuestRewardScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background = QuestLogPopupDetailFrameScrollFrame.Backdrop:CreateTexture(nil, 'ARTWORK')
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		AS:SetInside(QuestLogPopupDetailFrameScrollFrame.Backdrop.Background)
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background:SetTexCoord(0, .585, 0.02, .655)
	else
		hooksecurefunc('QuestFrameProgressItems_Update', function()
			QuestProgressRequiredItemsText:SetTextColor(1, .8, .1)
		end)

		hooksecurefunc("QuestFrame_SetTitleTextColor", function(fontString)
			fontString:SetTextColor(1, .8, .1)
		end)

		hooksecurefunc("QuestFrame_SetTextColor", function(fontString)
			fontString:SetTextColor(1, 1, 1)
		end)

		local function TitleButtonPool()
			for Button in QuestFrameGreetingPanel.titleButtonPool:EnumerateActive() do
				local String = Button:GetFontString()
				local Text = String:GetText()
				if Text and strmatch(Text, '|c[Ff][Ff]%x%x%x%x%x%x') then
					String:SetText(gsub(Text, '|c[Ff][Ff]%x%x%x%x%x%x', '|cffffe519'))
				end
			end
		end

		QuestFrameGreetingPanel:HookScript('OnShow', TitleButtonPool)
		hooksecurefunc("QuestFrameGreetingPanel_OnShow", TitleButtonPool)

		hooksecurefunc('QuestInfo_Display', function(template, parentFrame, acceptButton, material)
			QuestInfoTitleHeader:SetTextColor(1, .8, .1)
			QuestInfoDescriptionHeader:SetTextColor(1, .8, .1)
			QuestInfoObjectivesHeader:SetTextColor(1, .8, .1)
			QuestInfoRewardsFrame.Header:SetTextColor(1, .8, .1)
			QuestInfoDescriptionText:SetTextColor(1, 1, 1)
			QuestInfoObjectivesText:SetTextColor(1, 1, 1)
			QuestInfoGroupSize:SetTextColor(1, 1, 1)
			QuestInfoRewardText:SetTextColor(1, 1, 1)
			QuestInfoRewardsFrame.ItemChooseText:SetTextColor(1, 1, 1)
			QuestInfoRewardsFrame.ItemReceiveText:SetTextColor(1, 1, 1)

			QuestInfoQuestType:SetTextColor(1, 1, 1)

			if QuestInfoRewardsFrame.SpellLearnText then
				QuestInfoRewardsFrame.SpellLearnText:SetTextColor(1, 1, 1)
			end

			QuestInfoRewardsFrame.spellHeaderPool.textR, QuestInfoRewardsFrame.spellHeaderPool.textG, QuestInfoRewardsFrame.spellHeaderPool.textB = 1, 1, 1

			QuestInfoRewardsFrame.PlayerTitleText:SetTextColor(1, 1, 1)
			QuestInfoRewardsFrame.XPFrame.ReceiveText:SetTextColor(1, 1, 1)
			local numObjectives = GetNumQuestLeaderBoards()
			local numVisibleObjectives = 0
			for i = 1, numObjectives do
				local _, type, finished = GetQuestLogLeaderBoard(i)
				if type ~= 'spell' then
					numVisibleObjectives = numVisibleObjectives + 1
					local objective = _G['QuestInfoObjective'..numVisibleObjectives]
					if objective then
						if finished then
							objective:SetTextColor(1, .8, .1)
						else
							objective:SetTextColor(.63, .09, .09)
						end
					end
				end
			end

			QuestInfo_ShowRequiredMoney()
		end)

		hooksecurefunc('QuestInfo_ShowRequiredMoney', function()
			local requiredMoney = C_QuestLog.GetRequiredMoney()
			if requiredMoney > 0 then
				if requiredMoney > GetMoney() then
					QuestInfoRequiredMoneyText:SetTextColor(0.6, 0.6, 0.6)
				else
					QuestInfoRequiredMoneyText:SetTextColor(1, .8, .1)
				end
			end
		end)

		hooksecurefunc("QuestFrameProgressItems_Update", function()
			QuestProgressTitleText:SetTextColor(1, .8, .1)
			QuestProgressText:SetTextColor(1, 1, 1)
			QuestProgressRequiredItemsText:SetTextColor(1, .8, .1)
			QuestProgressRequiredMoneyText:SetTextColor(1, .8, .1)
		end)

		for i = 1, C_QuestLog.GetMaxNumQuestsCanAccept() do
			local button = _G['QuestTitleButton'..i]
			if button then
				hooksecurefunc(button, 'SetFormattedText', function()
					if button:GetFontString() then
						if button:GetFontString():GetText() and button:GetFontString():GetText():find('|cff000000') then
							button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), '|cff000000', '|cffffe519'))
						end
					end
				end)
			end
		end

		if (QuestInfoRewardsFrame.spellHeaderPool) then
			for _, pool in pairs({"followerRewardPool", "spellRewardPool"}) do
				QuestInfoRewardsFrame[pool]._acquire = QuestInfoRewardsFrame[pool].Acquire
				QuestInfoRewardsFrame[pool].Acquire = function(self)
					local frame = QuestInfoRewardsFrame[pool]:_acquire()
					frame.Name:SetTextColor(1, 1, 1)
					return frame
				end
			end
			QuestInfoRewardsFrame.spellHeaderPool._acquire = QuestInfoRewardsFrame.spellHeaderPool.Acquire
			QuestInfoRewardsFrame.spellHeaderPool.Acquire = function(self)
				local frame = self:_acquire()
				frame:SetTextColor(1, 1, 1)
				return frame
			end
		end
	end
end

function AS:Blizzard_WorldMap()
	local WorldMapFrame = _G.WorldMapFrame
	local QuestMapFrame = WorldMapFrame.QuestLog
	local QuestScrollFrame = QuestMapFrame.QuestsFrame

	AS:SkinBackdropFrame(WorldMapFrame)
	AS:CreateShadow(WorldMapFrame.Backdrop)

	AS:StripTextures(WorldMapFrame.BorderFrame, true)
	AS:SkinCloseButton(WorldMapFrame.BorderFrame.CloseButton)

	AS:Kill(WorldMapFrame.BorderFrame.Tutorial)

	AS:StripTextures(WorldMapFrame.NavBar)
	AS:StripTextures(WorldMapFrame.NavBar.overlay)

	AS:SkinButton(WorldMapFrame.NavBar.homeButton)
	WorldMapFrame.NavBar.homeButton.xoffset = 1
	WorldMapFrame.NavBar.homeButton.text:SetFont(AS.Font, 13)

	AS:SkinMaxMinFrame(WorldMapFrame.BorderFrame.MaximizeMinimizeFrame)
	AS:SkinArrowButton(WorldMapFrame.SidePanelToggle.CloseButton, 'left')
	AS:SkinArrowButton(WorldMapFrame.SidePanelToggle.OpenButton, 'right')

	QuestMapFrame.VerticalSeparator:Hide()

	AS:SkinScrollBar(QuestScrollFrame.ScrollBar)
	QuestScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", 1, -15)
	QuestScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", 6, 10)

	AS:SkinButton(QuestMapFrame.DetailsFrame.BackButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.AbandonButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.ShareButton, true)
	AS:SkinButton(QuestMapFrame.DetailsFrame.TrackButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.CompleteQuestFrame.CompleteButton, true)

	AS:StripTextures(QuestMapFrame.DetailsFrame.CompleteQuestFrame)

	AS:SetTemplate(QuestMapFrame.QuestsFrame.StoryTooltip, "Transparent")

	AS:SkinDropDownBox(WorldMapFrame.overlayFrames[1])

	AS:SkinBackdropFrame(QuestScrollFrame.DetailFrame)
	QuestScrollFrame.Contents.Separator.Divider:Hide()
	QuestScrollFrame.DetailFrame.Backdrop:SetFrameLevel(1)
	QuestScrollFrame.DetailFrame.Backdrop:SetPoint("TOPLEFT", QuestScrollFrame.DetailFrame, "TOPLEFT", 3, 1)
	QuestScrollFrame.DetailFrame.Backdrop:SetPoint("BOTTOMRIGHT", QuestScrollFrame.DetailFrame, "BOTTOMRIGHT", -2, -7)
	QuestScrollFrame.Contents.StoryHeader.Background:SetWidth(251)
	QuestScrollFrame.Contents.StoryHeader.Background:SetPoint("TOP", 0, -9)
	QuestScrollFrame.Contents.StoryHeader.Text:SetPoint("TOPLEFT", 18, -20)
	QuestScrollFrame.Contents.StoryHeader.HighlightTexture:SetAllPoints(QuestScrollFrame.Contents.StoryHeader.Background)
	QuestScrollFrame.Contents.StoryHeader.HighlightTexture:SetAlpha(0)

	if not AS.ParchmentEnabled then
		AS:SkinBackdropFrame(QuestMapFrame.DetailsFrame)
		QuestMapFrame.DetailsFrame.Backdrop:SetPoint('TOPLEFT', 0, 0)
		QuestMapFrame.DetailsFrame.Backdrop:SetPoint('BOTTOMRIGHT', QuestMapFrame.DetailsFrame.RewardsFrame, 'TOPRIGHT', 0, 1)
		AS:SkinFrame(QuestMapFrame.DetailsFrame.RewardsFrame)
		AS:SkinScrollBar(QuestMapFrame.DetailsFrame.ScrollFrame.ScrollBar)
	end
end

AS:RegisterSkin("Blizzard_AlliedRacesUI", AS.Blizzard_AlliedRacesUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_Gossip', AS.Blizzard_Gossip)
AS:RegisterSkin('Blizzard_Quest', AS.Blizzard_Quest)
AS:RegisterSkin('Blizzard_WorldMap', AS.Blizzard_WorldMap)
