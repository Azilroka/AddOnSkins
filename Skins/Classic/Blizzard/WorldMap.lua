if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_Gossip()
	AS:SkinBackdropFrame(GossipFrame)
	GossipFrame.Backdrop:SetPoint('TOPLEFT', 11, -12)
	GossipFrame.Backdrop:SetPoint('BOTTOMRIGHT', -26, 66)

	AS:SkinCloseButton(GossipFrameCloseButton)
	GossipFramePortrait:SetAlpha(0)

	AS:StripTextures(GossipFrameGreetingPanel)
	AS:SkinButton(GossipFrameGreetingGoodbyeButton)

	AS:SkinFrame(GossipGreetingScrollFrame)
	AS:SkinScrollBar(GossipGreetingScrollFrameScrollBar)

	for i = 1, _G.NUMGOSSIPBUTTONS do
		_G['GossipTitleButton'..i..'GossipIcon']:SetSize(16, 16)
		_G['GossipTitleButton'..i..'GossipIcon']:SetPoint('TOPLEFT', 3, 1)
	end

	if AS.ParchmentEnabled then
		GossipGreetingScrollFrame.Background = GossipGreetingScrollFrame:CreateTexture(nil, 'ARTWORK')
		GossipGreetingScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		AS:SetInside(GossipGreetingScrollFrame.Background)
		GossipGreetingScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
	else
		_G.GossipGreetingText:SetTextColor(1, 1, 1)

		hooksecurefunc('GossipFrameUpdate', function()
			for i = 1, _G.NUMGOSSIPBUTTONS do
				local button = _G['GossipTitleButton'..i]
				local icon = _G['GossipTitleButton'..i..'GossipIcon']
				local text = button:GetFontString()

				if text and text:GetText() then
					local textString = gsub(text:GetText(), "|c[Ff][Ff]%x%x%x%x%x%x(.+)|r", "%1")

					button:SetText(textString)
					text:SetTextColor(1, 1, 1)

					if button.type == 'Available' or button.type == 'Active' then
						if button.type == 'Active' then
							icon:SetDesaturation(1)
							text:SetTextColor(.6, .6, .6)
						else
							icon:SetDesaturation(0)
							text:SetTextColor(1, .8, .1)
						end

						local numEntries = GetNumQuestLogEntries()
						for k = 1, numEntries, 1 do
							local questLogTitleText, _, _, _, _, isComplete, _, questId = GetQuestLogTitle(k)
							if strmatch(questLogTitleText, textString) then
								if (isComplete == 1 or IsQuestComplete(questId)) then
									icon:SetDesaturation(0)
									button:GetFontString():SetTextColor(1, .8, .1)
									break
								end
							end
						end
					end
				end
			end
		end)
	end

	AS:SkinStatusBar(NPCFriendshipStatusBar)
end

function AS:Blizzard_Quest()
	AS:SkinBackdropFrame(QuestFrame)
	QuestFrame.Backdrop:SetPoint('TOPLEFT', 11, -12)
	QuestFrame.Backdrop:SetPoint('BOTTOMRIGHT', -26, 66)
	QuestFramePortrait:SetAlpha(0)

	AS:SkinBackdropFrame(QuestLogFrame)
	QuestLogFrame.Backdrop:SetPoint('TOPLEFT', 11, -12)
	QuestLogFrame.Backdrop:SetPoint('BOTTOMRIGHT', -32, 45)
	AS:SkinFrame(QuestLogListScrollFrame)
	AS:SkinFrame(QuestLogDetailScrollFrame)
	AS:SkinScrollBar(QuestLogDetailScrollFrameScrollBar)
	AS:SkinScrollBar(QuestLogListScrollFrameScrollBar)
	AS:SkinButton(QuestLogFrameAbandonButton)
	AS:SkinButton(QuestFramePushQuestButton)
	AS:SkinButton(QuestFrameExitButton)

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
	AS:SkinButton(QuestFrameCancelButton)
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

	for frame, numItems in pairs({['QuestLogItem'] = MAX_NUM_ITEMS, ['QuestProgressItem'] = MAX_REQUIRED_ITEMS}) do
		for i = 1, numItems do
			local Button = _G[frame..i]

			AS:SkinBackdropFrame(Button)

			if Button.Icon then
				AS:SkinTexture(Button.Icon, true)
				Button.Backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 0, 0)
				Button.Backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 0, 0)
				Button.Backdrop:SetPoint('RIGHT', Button, 'RIGHT', -5, 0)
			end
		end
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

	local function QuestQualityColors(frame, text, link, quality)
		local r, g, b
		if link and not quality then
			quality = select(3, GetItemInfo(link))
			r, g, b = GetItemQualityColor(quality)
		end

		if quality and quality > 1 then
			if frame and frame.Icon and frame.Icon.backdrop then
				frame.Icon.backdrop:SetBackdropBorderColor(r, g, b)
			end
			text:SetTextColor(r, g, b)
		else
			if frame and frame.Icon and frame.Icon.backdrop then
				frame.Icon.backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
			if text then
				text:SetTextColor(1, 1, 1)
			end
		end
	end

	for _, frame in pairs({ 'MoneyFrame', 'HonorFrame', 'XPFrame', 'SpellFrame', 'SkillPointFrame' }) do
		HandleReward(_G.MapQuestInfoRewardsFrame[frame])
		HandleReward(_G.QuestInfoRewardsFrame[frame])
	end

	for i = 1, _G.QUESTS_DISPLAYED do
		local questLogTitle = _G['QuestLogTitle'..i]

		questLogTitle:SetNormalTexture(AS.Media.Textures.Plus)
		questLogTitle.SetNormalTexture = AS.Noop

		questLogTitle:GetNormalTexture():SetSize(16, 16)
		questLogTitle:GetNormalTexture():SetPoint('LEFT', 5, 0)

		questLogTitle:SetHighlightTexture('')
		questLogTitle.SetHighlightTexture = AS.Noop

		questLogTitle:SetWidth(300)

		_G['QuestLogTitle'..i..'Highlight']:SetAlpha(0)

		_G['QuestLogTitle'..i..'Tag']:SetPoint('RIGHT', -30, 0)

		hooksecurefunc(questLogTitle, 'SetNormalTexture', function(self, texture)
			local tex = self:GetNormalTexture()

			if strfind(texture, 'MinusButton') then
				tex:SetTexture(AS.Media.Textures.Minus)
			elseif strfind(texture, 'PlusButton') then
				tex:SetTexture(AS.Media.Textures.Plus)
			else
				tex:SetTexture()
			end
		end)
	end

	hooksecurefunc("QuestInfo_GetRewardButton", function(rewardsFrame, index)
		local RewardButton = rewardsFrame.RewardButtons[index]

		if (not RewardButton.Backdrop) then
			HandleReward(RewardButton)

			RewardButton.NameFrame:Hide()
		else
			RewardButton.Name:SetTextColor(1, 1, 1)
		end
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

	local QuestLogCollapseAllButton = _G.QuestLogCollapseAllButton
	AS:StripTextures(QuestLogCollapseAllButton)

	QuestLogCollapseAllButton:SetNormalTexture(AS.Media.Textures.Plus)
	QuestLogCollapseAllButton.SetNormalTexture = AS.Noop
	QuestLogCollapseAllButton:GetNormalTexture():SetSize(16, 16)

	QuestLogCollapseAllButton:SetHighlightTexture('')
	QuestLogCollapseAllButton.SetHighlightTexture = AS.Noop

	QuestLogCollapseAllButton:SetDisabledTexture(AS.Media.Textures.Plus)
	QuestLogCollapseAllButton.SetDisabledTexture = AS.Noop
	QuestLogCollapseAllButton:GetDisabledTexture():SetSize(16, 16)
	QuestLogCollapseAllButton:GetDisabledTexture():SetTexture(AS.Media.Textures.Plus)
	QuestLogCollapseAllButton:GetDisabledTexture():SetDesaturated(true)

	hooksecurefunc(_G.QuestLogCollapseAllButton, 'SetNormalTexture', function(self, texture)
		local tex = self:GetNormalTexture()

		if strfind(texture, 'MinusButton') then
			tex:SetTexture(AS.Media.Textures.Minus)
		else
			tex:SetTexture(AS.Media.Textures.Plus)
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
		for i = 1, MAX_NUM_QUESTS do
			_G["QuestTitleButton"..i.."QuestIcon"]:SetPoint('TOPLEFT', 4, 2)
			_G["QuestTitleButton"..i.."QuestIcon"]:SetSize(16, 16)
		end

		local function UpdateGreetingFrame()
			_G.GreetingText:SetTextColor(1, 1, 1)
			_G.CurrentQuestsText:SetTextColor(1, 0.80, 0.10)
			_G.AvailableQuestsText:SetTextColor(1, 0.80, 0.10)

			local i = 1
			while _G["QuestTitleButton"..i]:IsVisible() do
				local title = _G["QuestTitleButton"..i]
				local icon = _G["QuestTitleButton"..i.."QuestIcon"]
				local text = title:GetFontString()
				local textString = gsub(title:GetText(), "|c[Ff][Ff]%x%x%x%x%x%x(.+)|r", "%1")

				title:SetText(textString)

				if (title.isActive == 1) then
					icon:SetTexture(132048)
					icon:SetDesaturation(1)
					text:SetTextColor(.6, .6, .6)
				else
					icon:SetTexture(132049)
					icon:SetDesaturation(0)
					text:SetTextColor(1, .8, .1)
				end

				local numEntries = GetNumQuestLogEntries()
				for k = 1, numEntries, 1 do
					local questLogTitleText, _, _, _, _, isComplete, _, questId = GetQuestLogTitle(k)
					if strmatch(questLogTitleText, textString) then
						if (isComplete == 1 or IsQuestComplete(questId)) then
							icon:SetDesaturation(0)
							text:SetTextColor(1, .8, .1)
							break
						end
					end
				end

				i = i + 1
			end
		end

		QuestFrameGreetingPanel:HookScript('OnShow', UpdateGreetingFrame)
		hooksecurefunc("QuestFrameGreetingPanel_OnShow", UpdateGreetingFrame)

		local textColor = {1, 1, 1}
		local titleTextColor = {1, .8, .1}

		hooksecurefunc(_G, 'QuestLog_UpdateQuestDetails', function()
			_G.QuestLogDescriptionTitle:SetTextColor(unpack(titleTextColor))
			_G.QuestLogQuestTitle:SetTextColor(unpack(titleTextColor))
			_G.QuestLogRewardTitleText:SetTextColor(unpack(titleTextColor))

			_G.QuestLogItemChooseText:SetTextColor(unpack(textColor))
			_G.QuestLogItemReceiveText:SetTextColor(unpack(textColor))
			_G.QuestLogObjectivesText:SetTextColor(unpack(textColor))
			_G.QuestLogQuestDescription:SetTextColor(unpack(textColor))
			_G.QuestLogSpellLearnText:SetTextColor(unpack(textColor))

			local numObjectives, numVisibleObjectives = GetNumQuestLeaderBoards(), 0

			for i = 1, numObjectives do
				local _, _, finished = GetQuestLogLeaderBoard(i)
				if (type ~= 'spell' and type ~= 'log' and numVisibleObjectives < _G.MAX_OBJECTIVES) then
					numVisibleObjectives = numVisibleObjectives + 1
					local objective = _G['QuestLogObjective'..numVisibleObjectives]
					if objective then
						if finished then
							objective:SetTextColor(1, .8, .1)
						else
							objective:SetTextColor(.63, .09, .09)
						end
					end
				end
			end

			if _G.QuestLogRequiredMoneyText:GetTextColor() == 0 then
				_G.QuestLogRequiredMoneyText:SetTextColor(.63, .09, .09)
			else
				_G.QuestLogRequiredMoneyText:SetTextColor(1, 0.8, 0.1)
			end
		end)

		hooksecurefunc('QuestInfo_Display', function()
			-- Headers
			_G.QuestInfoTitleHeader:SetTextColor(unpack(titleTextColor))
			_G.QuestInfoDescriptionHeader:SetTextColor(unpack(titleTextColor))
			_G.QuestInfoObjectivesHeader:SetTextColor(unpack(titleTextColor))
			_G.QuestInfoRewardsFrame.Header:SetTextColor(unpack(titleTextColor))
			-- Other text
			_G.QuestInfoDescriptionText:SetTextColor(unpack(textColor))
			_G.QuestInfoObjectivesText:SetTextColor(unpack(textColor))
			_G.QuestInfoGroupSize:SetTextColor(unpack(textColor))
			_G.QuestInfoRewardText:SetTextColor(unpack(textColor))
			-- Reward frame text
			_G.QuestInfoRewardsFrame.ItemChooseText:SetTextColor(unpack(textColor))
			_G.QuestInfoRewardsFrame.ItemReceiveText:SetTextColor(unpack(textColor))
			_G.QuestInfoRewardsFrame.PlayerTitleText:SetTextColor(unpack(textColor))
			_G.QuestInfoRewardsFrame.XPFrame.ReceiveText:SetTextColor(unpack(textColor))

			_G.QuestInfoRewardsFrame.spellHeaderPool.textR, _G.QuestInfoRewardsFrame.spellHeaderPool.textG, _G.QuestInfoRewardsFrame.spellHeaderPool.textB = unpack(textColor)

			if GetQuestLogRequiredMoney() > 0 then
				if GetQuestLogRequiredMoney() > GetMoney() then
					_G.QuestInfoRequiredMoneyText:SetTextColor(0.6, 0.6, 0.6)
				else
					_G.QuestInfoRequiredMoneyText:SetTextColor(1, 0.80, 0.10)
				end
			end

			for i = 1, _G.MAX_NUM_ITEMS do
				local item = _G["QuestInfoRewardsFrameQuestInfoItem"..i]
				if item then
					local link = item.type and (_G.QuestInfoFrame.questLog and GetQuestLogItemLink or GetQuestItemLink)(item.type, item:GetID())
					QuestQualityColors(item, item.Name, link)
				end
			end
		end)

		hooksecurefunc('QuestInfo_ShowRequiredMoney', function()
			local requiredMoney = GetQuestLogRequiredMoney()
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

	AS:SkinBackdropFrame(WorldMapFrame)
	AS:CreateShadow(WorldMapFrame.Backdrop)
	AS:SkinCloseButton(WorldMapFrameCloseButton)

	AS:SkinDropDownBox(WorldMapContinentDropDown)
	AS:SkinDropDownBox(WorldMapZoneDropDown)
	AS:SkinButton(WorldMapZoomOutButton)
end

AS:RegisterSkin('Blizzard_Gossip', AS.Blizzard_Gossip)
AS:RegisterSkin('Blizzard_Quest', AS.Blizzard_Quest)
AS:RegisterSkin('Blizzard_WorldMap', AS.Blizzard_WorldMap)
