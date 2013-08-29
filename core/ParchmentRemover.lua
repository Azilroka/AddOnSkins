local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = 'ParchmentRemover'
function AS:ParchmentRemover(event, addon)
	if E.private.skins.blizzard.enable ~= true then return end
	if addon == 'Blizzard_ArchaeologyUI' and E.private.skins.blizzard.archaeology == true then
		ArchaeologyFrame:StripTextures(true)
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
	if addon == 'Blizzard_Calendar' and E.private.skins.blizzard.calendar == true then
	 	for i = 1, 42 do
			_G['CalendarDayButton'..i]:SetFrameLevel(_G['CalendarDayButton'..i]:GetFrameLevel() + 1)
			_G['CalendarDayButton'..i]:StripTextures()
			_G['CalendarDayButton'..i]:SetTemplate('Default')
			_G['CalendarDayButton'..i..'OverlayFrame']:SetAlpha(1)
			_G['CalendarDayButton'..i..'DarkFrame']:StripTextures()
			_G['CalendarDayButton'..i..'EventTexture']:SetAlpha(1)
			for j = 1, 4 do
				local b = _G['CalendarDayButton'..i..'EventButton'..j]
				b:StripTextures()
				b:StyleButton(true)
			end
		end
	end
	if addon == 'Blizzard_GlyphUI' and E.private.skins.blizzard.talent == true then
		GlyphFrame.background:Hide()
		GlyphFrame.background.Show = function() end
		GlyphFrame.background.Hide = function() end
		GlyphFrame:StripTextures()
		GlyphFrame:CreateBackdrop('Transparent')
		SetPortraitToTexture(GlyphFrame.specIcon, icon)
		GlyphFrame.specIcon:SetTexCoord(unpack(E.TexCoords))
		GlyphFrame.specIcon:SetDrawLayer('OVERLAY')

		hooksecurefunc(_G, 'GlyphFrame_Update', function(self)
			local specialization = GetSpecialization(false, false, PlayerTalentFrame.talentGroup)
			local _, _, _, icon = GetSpecializationInfo(specialization, false, false)
			local isActiveTalentGroup = PlayerTalentFrame and PlayerTalentFrame.talentGroup == GetActiveSpecGroup()
			GlyphFrame.specIcon:SetDesaturated(not isActiveTalentGroup)
		end)
		
		hooksecurefunc(_G, 'GlyphFrameGlyph_UpdateSlot', function(self)
			local id = self:GetID();
			local talentGroup = PlayerTalentFrame and PlayerTalentFrame.talentGroup;
			local enabled, glyphType, glyphTooltipIndex, glyphSpell, iconFilename = GetGlyphSocketInfo(id, talentGroup);
			if not glyphType then
				return;
			end
			self:SetTemplate('Default')
			self.ring:Hide()
			if id % 2 == 1 and not self.resized then
				self.resized = true
				self:Size(self:GetWidth() * .8, self:GetHeight() * .8)
			end
			self.glyph:SetTexCoord(unpack(E.TexCoords))
			self.glyph:ClearAllPoints()
			self.glyph:SetInside(self)
			self.glyph:SetDrawLayer('OVERLAY')
		end)
	end
	if event == 'PLAYER_ENTERING_WORLD' then
		if E.private.skins.blizzard.gossip == true then
			GossipGreetingScrollFrame.spellTex:Hide()
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
		if E.private.skins.blizzard.quest == true then
			QuestLogScrollFrame:HookScript('OnUpdate', function(self)
				if self.spellTex and self.spellTex2 then
					self.spellTex:Hide()
					self.spellTex2:Hide()
				end
			end)
			QuestLogDetailScrollFrame:HookScript('OnUpdate', function(self)
				self.spellTex:Hide()
			end)
			QuestRewardScrollFrame:HookScript('OnUpdate', function(self)
				self.spellTex:Hide()
			end)

			QuestDetailScrollFrame.spellTex:Hide()
			QuestProgressScrollFrame.spellTex:Hide()
			QuestGreetingScrollFrame.spellTex:Hide()

			hooksecurefunc('QuestInfoItem_OnClick', function(self)
				QuestInfoItemHighlight:ClearAllPoints()
				QuestInfoItemHighlight:SetAllPoints(self)
			end)

			hooksecurefunc('QuestFrameProgressItems_Update', function()
				QuestProgressTitleText:SetTextColor(1, 1, 0)
				QuestProgressText:SetTextColor(1, 1, 1)
				QuestProgressRequiredItemsText:SetTextColor(1, 1, 0)
				QuestProgressRequiredMoneyText:SetTextColor(1, 1, 0)
			end)

			QuestFrameGreetingPanel:StripTextures()
			QuestGreetingScrollFrame:StripTextures()
			QuestGreetingFrameHorizontalBreak:Kill()
			GreetingText:SetTextColor(1, 1, 1)
			GreetingText.SetTextColor = E.noop
			CurrentQuestsText:SetTextColor(1, 1, 0)
			CurrentQuestsText.SetTextColor = E.noop
			AvailableQuestsText:SetTextColor(1, 1, 0)
			AvailableQuestsText.SetTextColor = E.noop
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

			local function QuestObjectiveText()
				local numObjectives = GetNumQuestLeaderBoards()
				local objective
				local numVisibleObjectives = 0
				for i = 1, numObjectives do
					local _, type, finished = GetQuestLogLeaderBoard(i)
					if type ~= 'spell' then
						numVisibleObjectives = numVisibleObjectives+1
						objective = _G['QuestInfoObjective'..numVisibleObjectives]
						if finished then
							objective:SetTextColor(1, 1, 0)
						else
							objective:SetTextColor(0.6, 0.6, 0.6)
						end
					end
				end			
			end

			hooksecurefunc('QuestInfo_Display', function(template, parentFrame, acceptButton, material)
				QuestInfoTitleHeader:SetTextColor(1, 1, 0)
				QuestInfoDescriptionHeader:SetTextColor(1, 1, 0)
				QuestInfoObjectivesHeader:SetTextColor(1, 1, 0)
				QuestInfoRewardsHeader:SetTextColor(1, 1, 0)
				QuestInfoDescriptionText:SetTextColor(1, 1, 1)
				QuestInfoObjectivesText:SetTextColor(1, 1, 1)
				QuestInfoGroupSize:SetTextColor(1, 1, 1)
				QuestInfoRewardText:SetTextColor(1, 1, 1)
				QuestInfoItemChooseText:SetTextColor(1, 1, 1)
				QuestInfoItemReceiveText:SetTextColor(1, 1, 1)
				QuestInfoSpellLearnText:SetTextColor(1, 1, 1)
				QuestInfoXPFrameReceiveText:SetTextColor(1, 1, 1)	
				QuestObjectiveText()
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

			QuestLogFrame:HookScript('OnShow', function()
				QuestLogDetailScrollFrame:Height(QuestLogScrollFrame:GetHeight()-4)
			end)
			QuestLogDetailFrameInset:StripTextures()
		end
		if E.private.skins.blizzard.spellbook == true then
			SpellBookPage1:Kill()
			SpellBookPage2:Kill()
			SpellBookPageText:SetTextColor(0.6, 0.6, 0.6)

			local professionheaders = {
				"PrimaryProfession1",
				"PrimaryProfession2",
				"SecondaryProfession1",
				"SecondaryProfession2",
				"SecondaryProfession3",
				"SecondaryProfession4"
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

			hooksecurefunc("SpellBook_UpdateCoreAbilitiesTab", function()
				for i = 1, #SpellBookCoreAbilitiesFrame.Abilities do
					local button = SpellBookCoreAbilitiesFrame.Abilities[i]
					if button and button.isSkinned ~= true then
						button:SetTemplate()

						button.EmptySlot:SetAlpha(0)
						button.ActiveTexture:SetAlpha(0)
						button.FutureTexture:SetAlpha(0)

						button.iconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
						button.iconTexture:SetInside()

						if button.FutureTexture:IsShown() then
							button.iconTexture:SetDesaturated(true)
							button.Name:SetTextColor(0.6, 0.6, 0.6)
							button.InfoText:SetTextColor(0.6, 0.6, 0.6)
						else
							button.Name:SetTextColor(1, 0.82, 0)
							button.InfoText:SetTextColor(0.8, 0.8, 0.8)
						end
						
						button:StyleButton()
						button.isSkinned = true
					end
				end
			end)

			hooksecurefunc("SpellBook_UpdateWhatHasChangedTab", function()
				for i = 1, #SpellBookWhatHasChanged.ChangedItems do
					local button = SpellBook_GetWhatChangedItem(i)
					button.Ring:Hide()
					select(2, button:GetRegions()):Hide()
					button:SetTextColor(0.8, 0.8, 0.8)
					button.Title:SetTextColor(1, 0.82, 0)
				end
			end)
		end
		if E.private.skins.blizzard.worldmap == true then
			local function FixSkin()
				if not E.db.general.tinyWorldMap then
					BlackoutWorld:SetTexture(0, 0, 0, 0)
				end
				WorldMapFrameAreaPetLevels:FontTemplate(nil, 25, 'OUTLINE')
			end

			local function QuestSkin()
				WorldMapQuestDetailScrollFrame.spellTex:Hide()
				WorldMapQuestRewardScrollFrame.spellTex:Hide()
				WorldMapQuestScrollFrame.spellTex:Hide()
			end

			WorldMapFrame:HookScript("OnShow", FixSkin)
			hooksecurefunc("WorldMapFrame_SetQuestMapView", QuestSkin)
		end
	end
end

AS:RegisterSkin(name, AS.ParchmentRemover, 'ADDON_LOADED')