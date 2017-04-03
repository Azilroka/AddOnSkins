local AS = unpack(AddOnSkins)

function AS:Blizzard_Quest()
	AS:SkinFrame(QuestFrame, nil, nil, true)
	AS:StripTextures(QuestFrameInset)
	AS:StripTextures(QuestFrameDetailPanel, true)
	AS:StripTextures(QuestDetailScrollChildFrame, true)
	AS:StripTextures(QuestFrameProgressPanel, true)
	AS:StripTextures(QuestFrameGreetingPanel, true)
	AS:StripTextures(QuestFrameRewardPanel, true)
	AS:SkinFrame(QuestProgressScrollFrame)
	AS:SkinFrame(QuestRewardScrollFrame)
	AS:SkinFrame(QuestDetailScrollFrame)
	AS:SkinFrame(QuestGreetingScrollFrame)

	AS:SkinScrollBar(QuestDetailScrollFrameScrollBar)
	AS:SkinScrollBar(QuestNPCModelTextScrollFrameScrollBar)
	AS:SkinScrollBar(QuestGreetingScrollFrameScrollBar)
	AS:SkinScrollBar(QuestProgressScrollFrameScrollBar)
	AS:SkinScrollBar(QuestRewardScrollFrameScrollBar)

	AS:SkinButton(QuestFrameAcceptButton, true)
	AS:SkinButton(QuestFrameDeclineButton, true)
	AS:SkinButton(QuestFrameCompleteButton, true)
	AS:SkinButton(QuestFrameGoodbyeButton, true)
	AS:SkinButton(QuestFrameGreetingGoodbyeButton, true)
	AS:SkinButton(QuestFrameCompleteQuestButton, true)

	AS:SkinCloseButton(QuestFrameCloseButton)
	QuestInfoItemHighlight:StripTextures()
	QuestFrame:SetHeight(500)

	AS:StripTextures(QuestInfoRewardsFrame.SkillPointFrame)
	AS:SkinTexture(QuestInfoRewardsFrame.SkillPointFrame.Icon)
	QuestInfoRewardsFrame.SkillPointFrame.Icon:SetSize(QuestInfoRewardsFrame.SkillPointFrame.Icon:GetSize() - 4, QuestInfoRewardsFrame.SkillPointFrame.Icon:GetSize() - 4)
	AS:CreateBackdrop(QuestInfoRewardsFrame.SkillPointFrame)
	QuestInfoRewardsFrame.SkillPointFrame.Backdrop:SetPoint('TOPLEFT', QuestInfoRewardsFrame.SkillPointFrame.Icon, 'TOPRIGHT', 0, 0)
	QuestInfoRewardsFrame.SkillPointFrame.Backdrop:SetPoint('BOTTOMLEFT', QuestInfoRewardsFrame.SkillPointFrame.Icon, 'BOTTOMRIGHT', 0, 0)
	QuestInfoRewardsFrame.SkillPointFrame.Backdrop:SetPoint('RIGHT', QuestInfoRewardsFrame.SkillPointFrame.NameFrame, 'RIGHT', -12, 0)
	QuestInfoRewardsFrame.SkillPointFrame.Icon.Backdrop = CreateFrame('Frame', nil, QuestInfoRewardsFrame.SkillPointFrame)
	QuestInfoRewardsFrame.SkillPointFrame.Icon.Backdrop:SetFrameLevel(QuestInfoRewardsFrame.SkillPointFrame:GetFrameLevel())
	AS:SetTemplate(QuestInfoRewardsFrame.SkillPointFrame.Icon.Backdrop)
	QuestInfoRewardsFrame.SkillPointFrame.Icon.Backdrop:SetBackdropColor(0, 0, 0, 0)
	QuestInfoRewardsFrame.SkillPointFrame.Icon.Backdrop:SetOutside(QuestInfoRewardsFrame.SkillPointFrame.Icon)
	QuestInfoRewardsFrame.SkillPointFrame:SetWidth(QuestInfoRewardsFrame.SkillPointFrame.Icon:GetWidth() - 4)
	QuestInfoRewardsFrame.SkillPointFrame.ValueText:SetDrawLayer('OVERLAY', 7)

	for i = 1, 6 do
		local Button = _G["QuestProgressItem"..i]
		AS:StripTextures(Button)
		AS:SkinTexture(Button.Icon)
		Button.Icon:SetSize(Button.Icon:GetSize() - 4, Button.Icon:GetSize() - 4)
		AS:CreateBackdrop(Button)
		Button.Backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 0, 0)
		Button.Backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 0, 0)
		Button.Backdrop:SetPoint('RIGHT', Button, 'RIGHT', -5, 0)
		Button.Icon.Backdrop = CreateFrame('Frame', nil, Button)
		AS:SetTemplate(Button.Icon.Backdrop)
		Button.Icon.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Button.Icon.Backdrop:SetOutside(Button.Icon)
		Button:SetWidth(_G["QuestProgressItem"..i]:GetWidth() - 4)
	end

    hooksecurefunc("QuestInfo_GetRewardButton", function(rewardsFrame, index)
    	local RewardButton = rewardsFrame.RewardButtons[index];
    	if (not RewardButton.skinned) then
    		RewardButton.NameFrame:Hide()
			AS:CreateBackdrop(RewardButton)
			RewardButton.Backdrop:SetPoint('TOPLEFT', RewardButton.Icon, 'TOPRIGHT', 0, 0)
			RewardButton.Backdrop:SetPoint('BOTTOMLEFT', RewardButton.Icon, 'BOTTOMRIGHT', 0, 0)
			RewardButton.Backdrop:SetPoint('RIGHT', RewardButton, 'RIGHT', -5, 0)
    		AS:SkinTexture(RewardButton.Icon)
			RewardButton.Icon:SetSize(RewardButton.Icon:GetSize() - 4, RewardButton.Icon:GetSize() - 4)
			RewardButton.Icon.Backdrop = CreateFrame('Frame', nil, RewardButton)
			AS:SetTemplate(RewardButton.Icon.Backdrop)
			RewardButton.Icon.Backdrop:SetBackdropColor(0, 0, 0, 0)
			RewardButton.Icon.Backdrop:SetOutside(RewardButton.Icon)
			RewardButton.Icon.Backdrop:SetScript('OnUpdate', function(self)
				if RewardButton:GetID() == 0 then return end
				local quality = 0
				if (QuestInfoFrame.questLog) then
					quality = select(4, GetQuestLogChoiceInfo(RewardButton:GetID()))
				else
					quality = select(4, GetQuestItemInfo(RewardButton.type, RewardButton:GetID()))
				end
				if quality and quality > 1 then
					local r, g, b = GetItemQualityColor(quality)
					self:SetBackdropBorderColor(r, g, b, 1)
				else
					self:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
			RewardButton:HookScript('OnUpdate', function(self)
				if QuestInfoItemHighlight:IsShown() and self:GetID() == QuestInfoFrame.itemChoice then
					self.Backdrop:SetBackdropBorderColor(1, 1, 0)
					self.Name:SetTextColor(1, 1, 0)
				elseif QuestInfoItemHighlight:IsShown() then
					self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					self.Name:SetTextColor(1, 1, 1)
				else
					self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					self.Name:SetTextColor(1, 1, 1)
				end
			end)
			RewardButton.skinned = true
    	end
    end)

	AS:SkinFrame(QuestNPCModel)
	AS:SkinBackdropFrame(QuestNPCModelTextFrame)
	QuestNPCModelTextFrame.Backdrop:SetPoint("TOPLEFT", QuestNPCModel, "BOTTOMLEFT", 0, -2)
	QuestNPCModelTextFrame.Backdrop:SetPoint("TOPRIGHT", QuestNPCModel, "BOTTOMRIGHT", 0, -2)

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

	hooksecurefunc("QuestFrame_ShowQuestPortrait", function(parentFrame, portrait, text, name, x, y)
		QuestNPCModel:ClearAllPoints();
		QuestNPCModel:SetPoint("TOPLEFT", parentFrame, "TOPRIGHT", x + 18, y);			
	end)

	if AS.ParchmentEnabled then
		QuestDetailScrollFrame.Background = QuestDetailScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestDetailScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		QuestDetailScrollFrame.Background:SetInside()
		QuestDetailScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestGreetingScrollFrame.Background = QuestGreetingScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestGreetingScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		QuestGreetingScrollFrame.Background:SetInside()
		QuestGreetingScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestProgressScrollFrame.Background = QuestProgressScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestProgressScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		QuestProgressScrollFrame.Background:SetInside()
		QuestProgressScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestRewardScrollFrame.Background = QuestRewardScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestRewardScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		QuestRewardScrollFrame.Background:SetInside()
		QuestRewardScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background = QuestLogPopupDetailFrameScrollFrame.Backdrop:CreateTexture(nil, 'ARTWORK')
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background:SetInside()
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background:SetTexCoord(0, .585, 0.02, .655)
	else
		GreetingText:SetTextColor(1, 1, 1)
		GreetingText.SetTextColor = AS.Noop
		CurrentQuestsText:SetTextColor(1, 1, 0)
		CurrentQuestsText.SetTextColor = AS.Noop
		AvailableQuestsText:SetTextColor(1, 1, 0)
		AvailableQuestsText.SetTextColor = AS.Noop
		for i = 1, MAX_NUM_QUESTS do
			local button = _G['QuestTitleButton'..i]
			if button then
				hooksecurefunc(button, 'SetFormattedText', function()
					if button:GetFontString() then
						if button:GetFontString():GetText() and button:GetFontString():GetText():find('|cff000000') then
							button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), '|cff000000', '|cffFFFF00'))
						end
					end
				end)
			end
		end

		hooksecurefunc('QuestInfo_Display', function(template, parentFrame, acceptButton, material)
			QuestInfoTitleHeader:SetTextColor(1, 1, 0)
			QuestInfoDescriptionHeader:SetTextColor(1, 1, 0)
			QuestInfoObjectivesHeader:SetTextColor(1, 1, 0)
			QuestInfoRewardsFrame.Header:SetTextColor(1, 1, 0)
			QuestInfoDescriptionText:SetTextColor(1, 1, 1)
			QuestInfoObjectivesText:SetTextColor(1, 1, 1)
			QuestInfoGroupSize:SetTextColor(1, 1, 1)
			QuestInfoRewardText:SetTextColor(1, 1, 1)
			QuestInfoRewardsFrame.ItemChooseText:SetTextColor(1, 1, 1);
			QuestInfoRewardsFrame.ItemReceiveText:SetTextColor(1, 1, 1);

			QuestInfoQuestType:SetTextColor(1, 1, 1)

			if QuestInfoRewardsFrame.SpellLearnText then
				QuestInfoRewardsFrame.SpellLearnText:SetTextColor(1, 1, 1);
			end

			QuestInfoRewardsFrame.spellHeaderPool.textR, QuestInfoRewardsFrame.spellHeaderPool.textG, QuestInfoRewardsFrame.spellHeaderPool.textB = 1, 1, 1

			QuestInfoRewardsFrame.PlayerTitleText:SetTextColor(1, 1, 1);
			QuestInfoRewardsFrame.XPFrame.ReceiveText:SetTextColor(1, 1, 1);
			local numObjectives = GetNumQuestLeaderBoards()
			local numVisibleObjectives = 0
			for i = 1, numObjectives do
				local _, type, finished = GetQuestLogLeaderBoard(i)
				if type ~= 'spell' then
					numVisibleObjectives = numVisibleObjectives + 1
					local objective = _G['QuestInfoObjective'..numVisibleObjectives]
					if objective then
						if finished then
							objective:SetTextColor(1, 1, 0)
						else
							objective:SetTextColor(0.6, 0.6, 0.6)
						end
					end
				end
			end
		end)

		hooksecurefunc('QuestInfo_ShowRequiredMoney', function()
			local requiredMoney = GetQuestLogRequiredMoney()
			if requiredMoney > 0 then
				if requiredMoney > GetMoney() then
					QuestInfoRequiredMoneyText:SetTextColor(0.6, 0.6, 0.6)
				else
					QuestInfoRequiredMoneyText:SetTextColor(1, 1, 0)
				end
			end
		end)

		hooksecurefunc("QuestFrameProgressItems_Update", function()
			QuestProgressTitleText:SetTextColor(1, 1, 0)
			QuestProgressText:SetTextColor(1, 1, 1)
			QuestProgressRequiredItemsText:SetTextColor(1, 1, 0)
			QuestProgressRequiredMoneyText:SetTextColor(1, 1, 0)
		end)
	end
end

AS:RegisterSkin('Blizzard_Quest', AS.Blizzard_Quest)