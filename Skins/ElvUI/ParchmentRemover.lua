local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('ElvUI') then return end

function AS:ParchmentRemover(event, addon)
	if ElvUI[1].private.skins.blizzard.enable ~= true then return end
	if addon == 'Blizzard_ArchaeologyUI' and ElvUI[1].private.skins.blizzard.archaeology == true then
		AS:StripTextures(ArchaeologyFrame, true)
		for i = 1, ARCHAEOLOGY_MAX_COMPLETED_SHOWN do
			local artifact = _G["ArchaeologyFrameCompletedPageArtifact"..i]

			if artifact then
				_G["ArchaeologyFrameCompletedPageArtifact"..i.."ArtifactName"]:SetTextColor(1, 1, 0)
				_G["ArchaeologyFrameCompletedPageArtifact"..i.."ArtifactSubText"]:SetTextColor(0.6, 0.6, 0.6)
			end
		end

		for i = 1, ARCHAEOLOGY_MAX_RACES do
			local frame = _G['ArchaeologyFrameSummaryPageRace'..i]

			if frame then
				frame.raceName:SetTextColor(1, 1, 1)
			end
		end

		for i = 1, ArchaeologyFrameCompletedPage:GetNumRegions() do
			local region = select(i, ArchaeologyFrameCompletedPage:GetRegions())
			if region:GetObjectType() == 'FontString' then
				region:SetTextColor(1, 1, 0)
			end
		end

		for i = 1, ArchaeologyFrameSummaryPage:GetNumRegions() do
			local region = select(i, ArchaeologyFrameSummaryPage:GetRegions())
			if region:GetObjectType() == 'FontString' then
				region:SetTextColor(1, 1, 0)
			end
		end

		ArchaeologyFrameCompletedPage.infoText:SetTextColor(1, 1, 1)
		ArchaeologyFrameHelpPageTitle:SetTextColor(1, 1, 0)
		ArchaeologyFrameHelpPageDigTitle:SetTextColor(1, 1, 0)
		ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1, 1, 1)
		ArchaeologyFrameArtifactPageHistoryTitle:SetTextColor(1, 1, 0)
		ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1, 1, 1)
	end
	if addon == 'Blizzard_Calendar' and ElvUI[1].private.skins.blizzard.calendar == true then
		for i = 1, 42 do
			_G['CalendarDayButton'..i]:SetFrameLevel(_G['CalendarDayButton'..i]:GetFrameLevel() + 1)
			AS:StripTextures(_G['CalendarDayButton'..i])
			AS:SetTemplate(_G['CalendarDayButton'..i], 'Default')
			_G['CalendarDayButton'..i..'OverlayFrame']:SetAlpha(1)
			AS:StripTextures(_G['CalendarDayButton'..i..'DarkFrame'])
			_G['CalendarDayButton'..i..'EventTexture']:SetAlpha(1)
			for j = 1, 4 do
				local b = _G['CalendarDayButton'..i..'EventButton'..j]
				AS:StripTextures(b)
				AS:StyleButton(b)
			end
		end
	end
	if event == 'PLAYER_ENTERING_WORLD' then
		if ElvUI[1].private.skins.blizzard.gossip == true then
			GossipGreetingScrollFrame.spellTex:SetTexture('')
			for i = 1, NUMGOSSIPBUTTONS do
				obj = select(3, _G['GossipTitleButton'..i]:GetRegions())
				obj:SetTextColor(1,1,1)
			end

			GossipGreetingText:SetTextColor(1,1,1)

			hooksecurefunc('GossipFrameUpdate', function()
				for i = 1, NUMGOSSIPBUTTONS do
					local button = _G['GossipTitleButton'..i]
					if button:GetFontString() then
						if button:GetFontString():GetText() and button:GetFontString():GetText():find('|cff000000') then
							button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), '|cff000000', '|cffFFFF00'))
						end
					end
				end
			end)
		end
		if ElvUI[1].private.skins.blizzard.quest == true then
			QuestScrollFrame:HookScript('OnUpdate', function(self)
				if self.spellTex and self.spellTex2 then
					self.spellTex:SetTexture("")
					self.spellTex:SetTexture("")
				end
			end)
			QuestDetailScrollFrame:HookScript('OnUpdate', function(self)
				self.spellTex:SetTexture("")
			end)
			QuestRewardScrollFrame:HookScript('OnUpdate', function(self)
				self.spellTex:SetTexture("")
			end)
			QuestLogPopupDetailFrameScrollFrame:HookScript('OnUpdate', function(self)
				self.spellTex:SetTexture("")
			end)

			AS:StripTextures(QuestMapFrame.DetailsFrame, true)

			if QuestProgressScrollFrame.spellTex then
				QuestProgressScrollFrame.spellTex:SetTexture("")
			end

			if QuestGreetingScrollFrame.spellTex then
				QuestGreetingScrollFrame.spellTex:SetTexture("")
			end

			hooksecurefunc('QuestInfoItem_OnClick', function(self)
				QuestInfoItemHighlight:SetOutside(self.Icon)

				self.Name:SetTextColor(1, 1, 0)
				local parent = self:GetParent()
				for i=1, #parent.RewardButtons do
					local questItem = QuestInfoRewardsFrame.RewardButtons[i]
					if(questItem ~= self) then
						questItem.Name:SetTextColor(1, 1, 1)
					end
				end
			end)

			hooksecurefunc('QuestFrameProgressItems_Update', function()
				QuestProgressTitleText:SetTextColor(1, 1, 0)
				QuestProgressText:SetTextColor(1, 1, 1)
				QuestProgressRequiredItemsText:SetTextColor(1, 1, 0)
				QuestProgressRequiredMoneyText:SetTextColor(1, 1, 0)
			end)

			AS:StripTextures(QuestFrameGreetingPanel)
			AS:StripTextures(QuestGreetingScrollFrame)
			QuestGreetingFrameHorizontalBreak:Kill()
			GreetingText:SetTextColor(1, 1, 1)
			GreetingText.SetTextColor = AS.Noop
			CurrentQuestsText:SetTextColor(1, 1, 0)
			CurrentQuestsText.SetTextColor = AS.Noop
			AvailableQuestsText:SetTextColor(1, 1, 0)
			AvailableQuestsText.SetTextColor = AS.Noop

			for i = 1, C_QuestLog.GetMaxNumQuestsCanAccept() do
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

			hooksecurefunc('QuestInfo_Display', function(template, parentFrame, acceptButton, material)
				QuestInfoTitleHeader:SetTextColor(1, 1, 0)
				QuestInfoDescriptionHeader:SetTextColor(1, 1, 0)
				QuestInfoObjectivesHeader:SetTextColor(1, 1, 0)
				QuestInfoRewardsFrame.Header:SetTextColor(1, 1, 0)
				QuestInfoDescriptionText:SetTextColor(1, 1, 1)
				QuestInfoObjectivesText:SetTextColor(1, 1, 1)
				QuestInfoGroupSize:SetTextColor(1, 1, 1)
				QuestInfoRewardText:SetTextColor(1, 1, 1)
				QuestInfoQuestType:SetTextColor(1, 1, 1)
				QuestInfoRewardsFrame.ItemChooseText:SetTextColor(1, 1, 1)
				QuestInfoRewardsFrame.ItemReceiveText:SetTextColor(1, 1, 1)
				if (QuestInfoRewardsFrame.SpellLearnText) then
					QuestInfoRewardsFrame.SpellLearnText:SetTextColor(1, 1, 1)
				end
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

			AS:StripTextures(QuestFrameInset)
		end
		if ElvUI[1].private.skins.blizzard.spellbook == true then
			SpellBookPage1:Kill()
			SpellBookPage2:Kill()
			SpellBookPageText:SetTextColor(0.6, 0.6, 0.6)

			--First Aid is no more
			local professionheaders = {
				"PrimaryProfession1",
				"PrimaryProfession2",
				"SecondaryProfession1",
				"SecondaryProfession2",
				"SecondaryProfession3"
			}

			for _, header in pairs(professionheaders) do
				_G[header.."Missing"]:SetTextColor(1, 0.8, 0)
				_G[header.."Missing"]:SetShadowColor(0, 0, 0)
				_G[header.."Missing"]:SetShadowOffset(1, -1)
				_G[header].missingText:SetTextColor(0.6, 0.6, 0.6)
			end

			hooksecurefunc("SpellButton_UpdateButton", function(self, first)
				for i = 1, SPELLS_PER_PAGE do
					local r, g, b = _G["SpellButton"..i.."SpellName"]:GetTextColor()
					if r < 0.8 then
						_G["SpellButton"..i.."SpellName"]:SetTextColor(0.6, 0.6, 0.6)
					end
					_G["SpellButton"..i.."SubSpellName"]:SetTextColor(0.6, 0.6, 0.6)
					_G["SpellButton"..i.."RequiredLevelString"]:SetTextColor(0.6, 0.6, 0.6)
				end
			end)
		end
	end
end

AS:RegisterSkin('ParchmentRemover', AS.ParchmentRemover, 'ADDON_LOADED')