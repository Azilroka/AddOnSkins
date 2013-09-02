local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "AltoholicSkin"
function AS:SkinAltoholic(event, addon)

	local function ColorAltoBorder(self)
		if self.border then
			local r, g, b = self.border:GetVertexColor()
			self.backdrop:SetBackdropBorderColor(r, g, b, 1)
		end
	end

	if event == "PLAYER_ENTERING_WORLD" then
		AS:SkinTooltip(AltoTooltip)
		AltoholicFramePortrait:Kill()
		AS:SkinFrame(AltoholicFrame)
		AS:SkinFrame(AltoMsgBox)
		AS:SkinButton(AltoMsgBoxYesButton)
		AS:SkinButton(AltoMsgBoxNoButton)
		AS:SkinCloseButton(AltoholicFrameCloseButton)
		AS:SkinEditBox(AltoholicFrame_SearchEditBox, 175, 15)
		AS:SkinButton(AltoholicFrame_ResetButton)
		AS:SkinButton(AltoholicFrame_SearchButton)
		AltoholicFrameTab1:Point("TOPLEFT", AltoholicFrame, "BOTTOMLEFT", -5, 2)
		AltoholicFrame_ResetButton:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 25, -77)
		AltoholicFrame_SearchEditBox:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 37, -56)
		AltoholicFrame_ResetButton:Size(85, 24)
		AltoholicFrame_SearchButton:Size(85, 24)
	end

	if addon == "Altoholic_Summary" then
		AS:SkinFrame(AltoholicFrameSummary)
		AS:SkinFrame(AltoholicFrameBagUsage)
		AS:SkinFrame(AltoholicFrameSkills)
		AS:SkinFrame(AltoholicFrameActivity)
		AS:SkinScrollBar(AltoholicFrameSummaryScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameBagUsageScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameSkillsScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameActivityScrollFrameScrollBar)
		AS:SkinDropDownBox(AltoholicTabSummary_SelectLocation)
		AltoholicTabSummary_SelectLocation:Width(200)
		AltoholicFrameSummaryScrollFrame:StripTextures(true)
		AltoholicFrameBagUsageScrollFrame:StripTextures(true)
		AltoholicFrameSkillsScrollFrame:StripTextures(true)
		AltoholicFrameActivityScrollFrame:StripTextures(true)

		AS:SkinTexture(AltoholicTabSummary_RequestSharingIconTexture)
		AltoholicTabSummary_RequestSharing:StyleButton()
		AltoholicTabSummary_RequestSharing:CreateBackdrop()
		AS:SkinTexture(AltoholicTabSummary_OptionsIconTexture)
		AltoholicTabSummary_Options:StyleButton()
		AltoholicTabSummary_Options:CreateBackdrop()
		AS:SkinTexture(AltoholicTabSummary_OptionsDataStoreIconTexture)
		AltoholicTabSummary_OptionsDataStore:StyleButton()
		AltoholicTabSummary_OptionsDataStore:CreateBackdrop()

		for i = 1, 4 do
			AS:SkinButton(_G["AltoholicTabSummaryMenuItem"..i], true)
		end
		for i = 1, 8 do
			AS:SkinButton(_G["AltoholicTabSummary_Sort"..i], true)
		end
		for i = 1, 7 do
			AS:SkinTab(_G["AltoholicFrameTab"..i], true)
		end
	end
	
	if addon == "Altoholic_Characters" then
		AS:SkinFrame(AltoholicFrameContainers)
		AS:SkinFrame(AltoholicFrameRecipes)
		AS:SkinFrame(AltoholicFrameQuests)
		AS:SkinFrame(AltoholicFrameGlyphs)
		AS:SkinFrame(AltoholicFrameMail)
		AS:SkinFrame(AltoholicFrameSpellbook)
		AS:SkinFrame(AltoholicFramePets)
		AS:SkinFrame(AltoholicFrameAuctions)
		AS:SkinScrollBar(AltoholicFrameContainersScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameQuestsScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameRecipesScrollFrameScrollBar)
		AS:SkinDropDownBox(AltoholicFrameTalents_SelectMember)
		AS:SkinDropDownBox(AltoholicTabCharacters_SelectRealm)
		AS:SkinNextPrevButton(AltoholicFrameSpellbookPrevPage)
		AS:SkinNextPrevButton(AltoholicFrameSpellbookNextPage)
		AS:SkinNextPrevButton(AltoholicFramePetsNormalPrevPage)
		AS:SkinNextPrevButton(AltoholicFramePetsNormalNextPage)
		AS:SkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateLeftButton)
		AS:SkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateRightButton)
		AS:SkinButton(AltoholicTabCharacters_Sort1)
		AS:SkinButton(AltoholicTabCharacters_Sort2)
		AS:SkinButton(AltoholicTabCharacters_Sort3)
		AltoholicFrameContainersScrollFrame:StripTextures(true)
		AltoholicFrameQuestsScrollFrame:StripTextures(true)
		AltoholicFrameRecipesScrollFrame:StripTextures(true)

		AS:SkinTexture(AltoholicTabCharacters_CharactersIconTexture)
		AltoholicTabCharacters_Characters:StyleButton()
		AltoholicTabCharacters_Characters:CreateBackdrop()
		AS:SkinTexture(AltoholicTabCharacters_CharactersIconIconTexture)
		AltoholicTabCharacters_CharactersIcon:StyleButton()
		AltoholicTabCharacters_CharactersIcon:CreateBackdrop()
		AS:SkinTexture(AltoholicTabCharacters_BagsIconIconTexture)
		AltoholicTabCharacters_BagsIcon:StyleButton()
		AltoholicTabCharacters_BagsIcon:CreateBackdrop()
		AS:SkinTexture(AltoholicTabCharacters_QuestsIconIconTexture)
		AltoholicTabCharacters_QuestsIcon:StyleButton()
		AltoholicTabCharacters_QuestsIcon:CreateBackdrop()
		AS:SkinTexture(AltoholicTabCharacters_TalentsIconIconTexture)
		AltoholicTabCharacters_TalentsIcon:StyleButton()
		AltoholicTabCharacters_TalentsIcon:CreateBackdrop()
		AS:SkinTexture(AltoholicTabCharacters_AuctionIconIconTexture)
		AltoholicTabCharacters_AuctionIcon:StyleButton()
		AltoholicTabCharacters_AuctionIcon:CreateBackdrop()
		AS:SkinTexture(AltoholicTabCharacters_MailIconIconTexture)
		AltoholicTabCharacters_MailIcon:StyleButton()
		AltoholicTabCharacters_MailIcon:CreateBackdrop()
		AS:SkinTexture(AltoholicTabCharacters_SpellbookIconIconTexture)
		AltoholicTabCharacters_SpellbookIcon:StyleButton()
		AltoholicTabCharacters_SpellbookIcon:CreateBackdrop()
		AS:SkinTexture(AltoholicTabCharacters_ProfessionsIconIconTexture)
		AltoholicTabCharacters_ProfessionsIcon:StyleButton()
		AltoholicTabCharacters_ProfessionsIcon:CreateBackdrop()

		for i = 1, 7 do
			for j = 1, 14 do
				AS:SkinIconButton(_G["AltoholicFrameContainersEntry"..i.."Item"..j])
				_G["AltoholicFrameContainersEntry"..i.."Item"..j]:HookScript('OnShow', ColorAltoBorder)
			end
		end
	end

	if addon == "Altoholic_Achievements" then
		AS:SkinBackdropFrame(AltoholicFrameAchievements)
		AltoholicFrameAchievementsScrollFrame:StripTextures(true)
		AltoholicAchievementsMenuScrollFrame:StripTextures(true)
		AS:SkinScrollBar(AltoholicFrameAchievementsScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicAchievementsMenuScrollFrameScrollBar)
		AS:SkinDropDownBox(AltoholicTabAchievements_SelectRealm)
		AltoholicTabAchievements_SelectRealm:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 205, -57)

		for i = 1, 15 do
			AS:SkinButton(_G["AltoholicTabAchievementsMenuItem"..i], true)
		end

		for i = 1, 8 do
			for j = 1, 10 do
				AS:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry"..i.."Item"..j])
				AS:SkinTexture(_G["AltoholicFrameAchievementsEntry"..i.."Item"..j..'_Background'])
				_G["AltoholicFrameAchievementsEntry"..i.."Item"..j..'_Background']:SetInside(_G["AltoholicFrameAchievementsEntry"..i.."Item"..j].backdrop)
			end
		end
	end

	if addon == "Altoholic_Agenda" then
		AS:SkinFrame(AltoholicFrameCalendarScrollFrame)
		AS:SkinFrame(AltoholicTabAgendaMenuItem1)
		AS:SkinScrollBar(AltoholicFrameCalendarScrollFrameScrollBar)
		AS:SkinNextPrevButton(AltoholicFrameCalendar_NextMonth)
		AS:SkinNextPrevButton(AltoholicFrameCalendar_PrevMonth)
		AS:SkinButton(AltoholicTabAgendaMenuItem1, true)

		for i = 1, 14 do
			AS:SkinFrame(_G["AltoholicFrameCalendarEntry"..i])
		end
	end

	if addon == "Altoholic_Grids" then
		AltoholicFrameGridsScrollFrame:StripTextures(true)
		AS:SkinBackdropFrame(AltoholicFrameGrids)
		AS:SkinScrollBar(AltoholicFrameGridsScrollFrameScrollBar)
		AS:SkinDropDownBox(AltoholicTabGrids_SelectRealm)
		AS:SkinDropDownBox(AltoholicTabGrids_SelectView)

		for i = 1, 8 do
			for j = 1, 10 do
				AS:SkinBackdropFrame(_G["AltoholicFrameGridsEntry"..i.."Item"..j], nil, nil, nil, true)
				_G["AltoholicFrameGridsEntry"..i.."Item"..j]:HookScript('OnShow', ColorAltoBorder)
			end
		end

		AltoholicFrameGrids:HookScript('OnUpdate', function()
			for i = 1, 10 do
				for j = 1, 10 do
					if _G["AltoholicFrameGridsEntry"..i.."Item"..j.."_Background"] then
						_G["AltoholicFrameGridsEntry"..i.."Item"..j.."_Background"]:SetTexCoord(.08, .92, .08, .82)
					end
				end
			end
		end)

	end

	if addon == "Altoholic_Guild" then
		AS:SkinFrame(AltoholicFrameGuildMembers)
		AS:SkinFrame(AltoholicFrameGuildBank)
		AS:SkinScrollBar(AltoholicFrameGuildMembersScrollFrameScrollBar)
		AltoholicFrameGuildMembersScrollFrame:StripTextures(true)

		for i = 1, 2 do
			AS:SkinButton(_G["AltoholicTabGuildMenuItem"..i])
		end

		for i = 1, 7 do
			for j = 1, 14 do
				AS:SkinIconButton(_G["AltoholicFrameGuildBankEntry"..i.."Item"..j])
			end
		end

		for i = 1, 19 do
			AS:SkinIconButton(_G["AltoholicFrameGuildMembersItem"..i])
		end

		for i = 1, 5 do
			AS:SkinButton(_G["AltoholicTabGuild_Sort"..i])
		end
	end

	if addon == "Altoholic_Search" then
		AS:SkinBackdropFrame(AltoholicFrameSearch, true)
		AltoholicFrameSearchScrollFrame:StripTextures(true)
		AltoholicSearchMenuScrollFrame:StripTextures(true)
		AS:SkinScrollBar(AltoholicFrameSearchScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicSearchMenuScrollFrameScrollBar)
		AS:SkinDropDownBox(AltoholicTabSearch_SelectRarity)
		AS:SkinDropDownBox(AltoholicTabSearch_SelectSlot)
		AS:SkinDropDownBox(AltoholicTabSearch_SelectLocation)
		AltoholicTabSearch_SelectRarity:Size(125, 32)
		AltoholicTabSearch_SelectSlot:Size(125, 32)
		AltoholicTabSearch_SelectLocation:Size(175, 32)
		AS:SkinEditBox(_G["AltoholicTabSearch_MinLevel"])
		AS:SkinEditBox(_G["AltoholicTabSearch_MaxLevel"])

		for i = 1, 15 do
			AS:SkinButton(_G["AltoholicTabSearchMenuItem"..i])
		end

		for i = 1, 8 do
			AS:SkinButton(_G["AltoholicTabSearch_Sort"..i])
		end
	end
end

AS:RegisterSkin(name, AS.SkinAltoholic, "ADDON_LOADED")