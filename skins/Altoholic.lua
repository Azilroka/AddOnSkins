local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "AltoholicSkin"
function AS:SkinAltoholic(event, addon)
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
		for i = 1, 14 do
			AS:SkinBackdropFrame(_G["AltoholicFrameContainersEntry1Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameContainersEntry2Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameContainersEntry3Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameContainersEntry4Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameContainersEntry5Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameContainersEntry6Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameContainersEntry7Item"..i])
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

		for i = 1, 10 do
			AS:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry1Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry2Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry3Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry4Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry5Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry6Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry7Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry8Item"..i])
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

		for i = 1, 10 do
			AS:SkinBackdropFrame(_G["AltoholicFrameGridsEntry1Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGridsEntry2Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGridsEntry3Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGridsEntry4Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGridsEntry5Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGridsEntry6Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGridsEntry7Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGridsEntry8Item"..i])
		end
	end

	if addon == "Altoholic_Guild" then
		AS:SkinFrame(AltoholicFrameGuildMembers)
		AS:SkinFrame(AltoholicFrameGuildBank)
		AS:SkinScrollBar(AltoholicFrameGuildMembersScrollFrameScrollBar)
		AltoholicFrameGuildMembersScrollFrame:StripTextures(true)

		for i = 1, 2 do
			AS:SkinButton(_G["AltoholicTabGuildMenuItem"..i])
		end

		for i = 1, 14 do
			AS:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry1Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry2Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry3Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry4Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry5Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry6Item"..i])
			AS:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry7Item"..i])
		end

		for i = 1, 19 do
			AS:SkinBackdropFrame(_G["AltoholicFrameGuildMembersItem"..i])
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