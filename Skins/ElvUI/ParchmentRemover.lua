local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('ElvUI') then return end

local name = 'ParchmentRemover'
function AS:ParchmentRemover(event, addon)
	if ElvUI[1].private.skins.blizzard.enable ~= true then return end
	if addon == 'Blizzard_ArchaeologyUI' and ElvUI[1].private.skins.blizzard.archaeology == true then
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
	if addon == 'Blizzard_Calendar' and ElvUI[1].private.skins.blizzard.calendar == true then
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
	if addon == 'Blizzard_GlyphUI' and ElvUI[1].private.skins.blizzard.talent == true then
		GlyphFrame.background:Hide()
		GlyphFrame.background.Show = function() end
		GlyphFrame.background.Hide = function() end
		GlyphFrame:StripTextures()
		GlyphFrame:CreateBackdrop('Transparent')
		SetPortraitToTexture(GlyphFrame.specIcon, icon)
		GlyphFrame.specIcon:SetTexCoord(unpack(AS.TexCoords))
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
			self.glyph:SetTexCoord(unpack(AS.TexCoords))
			self.glyph:ClearAllPoints()
			self.glyph:SetInside(self)
			self.glyph:SetDrawLayer('OVERLAY')
		end)
	end
	if event == 'PLAYER_ENTERING_WORLD' then
		if ElvUI[1].private.skins.blizzard.gossip == true then
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
		if ElvUI[1].private.skins.blizzard.spellbook == true then
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
		end
	end
end

AS:RegisterSkin(name, AS.ParchmentRemover, 'ADDON_LOADED')