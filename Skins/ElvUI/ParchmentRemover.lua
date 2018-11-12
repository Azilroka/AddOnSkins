local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ElvUI') then return end

local function RemoveParchment(frame)
	if frame then
		if frame.spellTex then
			frame.spellTex:SetAlpha(0)
		end
		if frame.spellTex2 then
			frame.spellTex2:SetAlpha(0)
		end
	end
end

function AS:ParchmentRemover(event, addon)
	if ElvUI[1].private.skins.blizzard.enable ~= true then return end

	if addon == 'Blizzard_ArchaeologyUI' and ElvUI[1].private.skins.blizzard.archaeology == true then
		AS:StripTextures(ArchaeologyFrame, true)

		for i = 1, ARCHAEOLOGY_MAX_RACES do
			local frame = ArchaeologyFrame.summaryPage['race'..i]
			local artifact = ArchaeologyFrame.completedPage['artifact'..i]
			frame.raceName:SetTextColor(1, 1, 1)

			artifact.artifactName:SetTextColor(1, .8, .1)
			artifact.artifactSubText:SetTextColor(0.6, 0.6, 0.6)
		end

		for _, Frame in pairs({ ArchaeologyFrame.completedPage, ArchaeologyFrame.summaryPage }) do
			for i = 1, Frame:GetNumRegions() do
				local Region = select(i, Frame:GetRegions())
				if Region:IsObjectType("FontString") then
					Region:SetTextColor(1, .8, .1)
				end
			end
		end

		ArchaeologyFrame.completedPage.infoText:SetTextColor(1, 1, 1)

		ArchaeologyFrame.artifactPage.historyTitle:SetTextColor(1, .8, .1)

		ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1, 1, 1)

		ArchaeologyFrame.helpPage.titleText:SetTextColor(1, .8, .1)

		ArchaeologyFrameHelpPageDigTitle:SetTextColor(1, .8, .1)
		ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1, 1, 1)
	end

	if addon == 'Blizzard_Calendar' and ElvUI[1].private.skins.blizzard.calendar == true then
		for i = 1, 42 do
			local Button = _G["CalendarDayButton"..i]
			Button:SetFrameLevel(Button:GetFrameLevel() + 1)
			AS:SkinFrame(Button)
			Button:SetBackdropColor(0, 0, 0, 0)
			for j = 1, 4 do
				local EventButton = _G["CalendarDayButton"..i.."EventButton"..j]
				AS:StripTextures(EventButton)
				AS:StyleButton(EventButton)
			end
		end
	end

	if event == 'PLAYER_ENTERING_WORLD' then
		if ElvUI[1].private.skins.blizzard.gossip == true then
			RemoveParchment(GossipGreetingScrollFrame)

			for i = 1, NUMGOSSIPBUTTONS do
				_G["GossipTitleButton"..i]:GetFontString():SetTextColor(1, 1, 1)
			end

			GossipGreetingText:SetTextColor(1, 1, 1)

			hooksecurefunc("GossipFrameUpdate", function()
				for i = 1, NUMGOSSIPBUTTONS do
					local button = _G["GossipTitleButton"..i]
					if button:GetFontString() then
						local Text = button:GetFontString():GetText()
						if Text and strfind(Text, '|cff000000') then
							button:GetFontString():SetText(string.gsub(Text, '|cff000000', '|cffffe519'))
						end
					end
				end
			end)
		end

		if ElvUI[1].private.skins.blizzard.quest == true then
			AS:StripTextures(QuestFrameInset, true)

			AS:StripTextures(QuestMapFrame.DetailsFrame, true)

			RemoveParchment(QuestDetailScrollFrame)
			RemoveParchment(QuestProgressScrollFrame)
			RemoveParchment(QuestGreetingScrollFrame)

			QuestScrollFrame:HookScript('OnUpdate', function(self)
				RemoveParchment(self)
			end)
			QuestRewardScrollFrame:HookScript('OnUpdate', function(self)
				RemoveParchment(self)
			end)
			QuestLogPopupDetailFrameScrollFrame:HookScript('OnUpdate', function(self)
				RemoveParchment(self)
			end)

			AS:StripTextures(QuestMapFrame.DetailsFrame, true)

			hooksecurefunc('QuestInfoItem_OnClick', function(self)
				QuestInfoItemHighlight:SetOutside(self.Icon)

				self.Name:SetTextColor(1, .8, .1)
				local parent = self:GetParent()
				for i = 1, #parent.RewardButtons do
					local questItem = QuestInfoRewardsFrame.RewardButtons[i]
					if(questItem ~= self) then
						questItem.Name:SetTextColor(1, 1, 1)
					end
				end
			end)

			hooksecurefunc('QuestFrameProgressItems_Update', function()
				QuestProgressTitleText:SetTextColor(1, .8, .1)
				QuestProgressText:SetTextColor(1, 1, 1)
				QuestProgressRequiredItemsText:SetTextColor(1, .8, .1)
				QuestProgressRequiredMoneyText:SetTextColor(1, .8, .1)
			end)

			AS:StripTextures(QuestFrameGreetingPanel)
			AS:StripTextures(QuestGreetingScrollFrame)
			QuestGreetingFrameHorizontalBreak:Kill()
			GreetingText:SetTextColor(1, 1, 1)
			GreetingText.SetTextColor = AS.Noop
			CurrentQuestsText:SetTextColor(1, .8, .1)
			CurrentQuestsText.SetTextColor = AS.Noop
			AvailableQuestsText:SetTextColor(1, .8, .1)
			AvailableQuestsText.SetTextColor = AS.Noop

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

			hooksecurefunc('QuestInfo_Display', function(template, parentFrame, acceptButton, material)
				QuestInfoTitleHeader:SetTextColor(1, .8, .1)
				QuestInfoDescriptionHeader:SetTextColor(1, .8, .1)
				QuestInfoObjectivesHeader:SetTextColor(1, .8, .1)
				QuestInfoRewardsFrame.Header:SetTextColor(1, .8, .1)
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
								objective:SetTextColor(1, .8, .1)
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
						QuestInfoRequiredMoneyText:SetTextColor(1, .8, .1)
					end
				end
			end)
		end

		if ElvUI[1].private.skins.blizzard.spellbook == true then
			AS:StripTextures(SpellBookPage1, true)
			AS:StripTextures(SpellBookPage2, true)
			SpellBookPageText:SetTextColor(0.6, 0.6, 0.6)


			for _, Button in pairs({ PrimaryProfession1, PrimaryProfession2, SecondaryProfession1, SecondaryProfession2, SecondaryProfession3 }) do
				Button.missingHeader:SetTextColor(1, .82, 0)
				Button.missingText:SetTextColor(1, 1, 1)
			end

			hooksecurefunc("SpellButton_UpdateButton", function()
				for i = 1, SPELLS_PER_PAGE do
					local Button = _G["SpellButton"..i]
					Button:SetHighlightTexture('')
					local r = Button.SpellName:GetTextColor()
					if r < 0.8 then
						Button.SpellName:SetTextColor(0.6, 0.6, 0.6)
					else
						Button.SpellName:SetTextColor(1, 1, 1)
					end
					Button.SpellSubName:SetTextColor(0.6, 0.6, 0.6)
					Button.RequiredLevelString:SetTextColor(0.6, 0.6, 0.6)
				end
			end)
		end
	end
end

AS:RegisterSkin('ParchmentRemover', AS.ParchmentRemover, 'ADDON_LOADED')