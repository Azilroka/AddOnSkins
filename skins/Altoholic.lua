local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "AltoholicSkin"
function AS:SkinAltoholic(event, addon)
	if event == "PLAYER_ENTERING_WORLD" then
		AS:SkinTooltip(AltoTooltip)
		AltoholicFramePortrait:Kill()
		AS:SkinFrame(AltoholicFrame)
		AS:SkinFrame(AltoMsgBox)
		S:HandleButton(AltoMsgBoxYesButton)
		S:HandleButton(AltoMsgBoxNoButton)
		S:HandleCloseButton(AltoholicFrameCloseButton)
		S:HandleEditBox(AltoholicFrame_SearchEditBox)
		S:HandleButton(AltoholicFrame_ResetButton)
		S:HandleButton(AltoholicFrame_SearchButton)
		AltoholicFrameTab1:Point("TOPLEFT", AltoholicFrame, "BOTTOMLEFT", -5, 2)
		AltoholicFrame_ResetButton:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 25, -77)
		AltoholicFrame_SearchEditBox:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 37, -56)
		AltoholicFrame_ResetButton:Size(85, 24)
		AltoholicFrame_SearchButton:Size(85, 24)
		AltoholicFrame_SearchEditBox:Size(175, 15)
	end

	if addon == "Altoholic_Summary" then
		AS:SkinFrame(AltoholicFrameSummary)
		AS:SkinFrame(AltoholicFrameBagUsage)
		AS:SkinFrame(AltoholicFrameSkills)
		AS:SkinFrame(AltoholicFrameActivity)
		S:HandleScrollBar(AltoholicFrameSummaryScrollFrameScrollBar)
		S:HandleScrollBar(AltoholicFrameBagUsageScrollFrameScrollBar)
		S:HandleScrollBar(AltoholicFrameSkillsScrollFrameScrollBar)
		S:HandleScrollBar(AltoholicFrameActivityScrollFrameScrollBar)
		S:HandleDropDownBox(AltoholicTabSummary_SelectLocation)
		AltoholicTabSummary_SelectLocation:Width(200)
		AltoholicFrameSummaryScrollFrame:StripTextures(true)
		AltoholicFrameBagUsageScrollFrame:StripTextures(true)
		AltoholicFrameSkillsScrollFrame:StripTextures(true)
		AltoholicFrameActivityScrollFrame:StripTextures(true)
		for i = 1, 4 do
			S:HandleButton(_G["AltoholicTabSummaryMenuItem"..i], true)
		end
		for i = 1, 8 do
			S:HandleButton(_G["AltoholicTabSummary_Sort"..i], true)
		end
		for i = 1, 7 do
			S:HandleTab(_G["AltoholicFrameTab"..i], true)
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
		S:HandleScrollBar(AltoholicFrameContainersScrollFrameScrollBar)
		S:HandleScrollBar(AltoholicFrameQuestsScrollFrameScrollBar)
		S:HandleScrollBar(AltoholicFrameRecipesScrollFrameScrollBar)
		S:HandleDropDownBox(AltoholicFrameTalents_SelectMember)
		S:HandleDropDownBox(AltoholicTabCharacters_SelectRealm)
		S:HandleNextPrevButton(AltoholicFrameSpellbookPrevPage)
		S:HandleNextPrevButton(AltoholicFrameSpellbookNextPage)
		S:HandleNextPrevButton(AltoholicFramePetsNormalPrevPage)
		S:HandleNextPrevButton(AltoholicFramePetsNormalNextPage)
		S:HandleRotateButton(AltoholicFramePetsNormal_ModelFrameRotateLeftButton)
		S:HandleRotateButton(AltoholicFramePetsNormal_ModelFrameRotateRightButton)
		S:HandleButton(AltoholicTabCharacters_Sort1)
		S:HandleButton(AltoholicTabCharacters_Sort2)
		S:HandleButton(AltoholicTabCharacters_Sort3)
		AltoholicFrameContainersScrollFrame:StripTextures(true)
		AltoholicFrameQuestsScrollFrame:StripTextures(true)
		AltoholicFrameRecipesScrollFrame:StripTextures(true)
		for i = 1, 14 do
			_G["AltoholicFrameContainersEntry1Item"..i]:StripTextures()
			_G["AltoholicFrameContainersEntry2Item"..i]:StripTextures()
			_G["AltoholicFrameContainersEntry3Item"..i]:StripTextures()
			_G["AltoholicFrameContainersEntry4Item"..i]:StripTextures()
			_G["AltoholicFrameContainersEntry5Item"..i]:StripTextures()
			_G["AltoholicFrameContainersEntry6Item"..i]:StripTextures()
			_G["AltoholicFrameContainersEntry7Item"..i]:StripTextures()
		end
	end

	if addon == "Altoholic_Achievements" then
		AS:SkinBackdropFrame(AltoholicFrameAchievements, true)
		AltoholicFrameAchievementsScrollFrame:StripTextures(true)
		AltoholicAchievementsMenuScrollFrame:StripTextures(true)
		S:HandleScrollBar(AltoholicFrameAchievementsScrollFrameScrollBar)
		S:HandleScrollBar(AltoholicAchievementsMenuScrollFrameScrollBar)
		S:HandleDropDownBox(AltoholicTabAchievements_SelectRealm)
		AltoholicTabAchievements_SelectRealm:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 205, -57)

		for i = 1, 15 do
			S:HandleButton(_G["AltoholicTabAchievementsMenuItem"..i], true)
		end

		for i = 1, 10 do
			_G["AltoholicFrameAchievementsEntry1Item"..i]:StripTextures()
			_G["AltoholicFrameAchievementsEntry2Item"..i]:StripTextures()
			_G["AltoholicFrameAchievementsEntry3Item"..i]:StripTextures()
			_G["AltoholicFrameAchievementsEntry4Item"..i]:StripTextures()
			_G["AltoholicFrameAchievementsEntry5Item"..i]:StripTextures()
			_G["AltoholicFrameAchievementsEntry6Item"..i]:StripTextures()
			_G["AltoholicFrameAchievementsEntry7Item"..i]:StripTextures()
			_G["AltoholicFrameAchievementsEntry8Item"..i]:StripTextures()
		end
	end

	if addon == "Altoholic_Agenda" then
		AS:SkinFrame(AltoholicFrameCalendarScrollFrame)
		AS:SkinFrame(AltoholicTabAgendaMenuItem1)
		S:HandleScrollBar(AltoholicFrameCalendarScrollFrameScrollBar)
		S:HandleNextPrevButton(AltoholicFrameCalendar_NextMonth)
		S:HandleNextPrevButton(AltoholicFrameCalendar_PrevMonth)
		S:HandleButton(AltoholicTabAgendaMenuItem1, true)

		for i = 1, 14 do
			AS:SkinFrame(_G["AltoholicFrameCalendarEntry"..i])
		end
	end

	if addon == "Altoholic_Grids" then
		AltoholicFrameGridsScrollFrame:StripTextures(true)
		AS:SkinBackdropFrame(AltoholicFrameGrids)
		S:HandleScrollBar(AltoholicFrameGridsScrollFrameScrollBar)
		S:HandleDropDownBox(AltoholicTabGrids_SelectRealm)
		S:HandleDropDownBox(AltoholicTabGrids_SelectView)

		for i = 1, 10 do
			_G["AltoholicFrameGridsEntry1Item"..i]:StripTextures()
			_G["AltoholicFrameGridsEntry2Item"..i]:StripTextures()
			_G["AltoholicFrameGridsEntry3Item"..i]:StripTextures()
			_G["AltoholicFrameGridsEntry4Item"..i]:StripTextures()
			_G["AltoholicFrameGridsEntry5Item"..i]:StripTextures()
			_G["AltoholicFrameGridsEntry6Item"..i]:StripTextures()
			_G["AltoholicFrameGridsEntry7Item"..i]:StripTextures()
			_G["AltoholicFrameGridsEntry8Item"..i]:StripTextures()
		end
	end

	if addon == "Altoholic_Guild" then
		AS:SkinFrame(AltoholicFrameGuildMembers)
		AS:SkinFrame(AltoholicFrameGuildBank)
		S:HandleScrollBar(AltoholicFrameGuildMembersScrollFrameScrollBar)
		AltoholicFrameGuildMembersScrollFrame:StripTextures(true)

		for i = 1, 2 do
			_G["AltoholicTabGuildMenuItem"..i]:StripTextures()
			S:HandleButton(_G["AltoholicTabGuildMenuItem"..i])
		end

		for i = 1, 14 do
			_G["AltoholicFrameGuildBankEntry1Item"..i]:StripTextures()
			_G["AltoholicFrameGuildBankEntry2Item"..i]:StripTextures()
			_G["AltoholicFrameGuildBankEntry3Item"..i]:StripTextures()
			_G["AltoholicFrameGuildBankEntry4Item"..i]:StripTextures()
			_G["AltoholicFrameGuildBankEntry5Item"..i]:StripTextures()
			_G["AltoholicFrameGuildBankEntry6Item"..i]:StripTextures()
			_G["AltoholicFrameGuildBankEntry7Item"..i]:StripTextures()
		end

		for i = 1, 19 do
			_G["AltoholicFrameGuildMembersItem"..i]:StripTextures()
		end

		for i = 1, 5 do
			_G["AltoholicTabGuild_Sort"..i]:StripTextures()
			S:HandleButton(_G["AltoholicTabGuild_Sort"..i])
		end
	end

	if addon == "Altoholic_Search" then
		AS:SkinBackdropFrame(AltoholicFrameSearch, true)
		AltoholicFrameSearchScrollFrame:StripTextures(true)
		AltoholicSearchMenuScrollFrame:StripTextures(true)
		S:HandleScrollBar(AltoholicFrameSearchScrollFrameScrollBar)
		S:HandleScrollBar(AltoholicSearchMenuScrollFrameScrollBar)
		S:HandleDropDownBox(AltoholicTabSearch_SelectRarity)
		S:HandleDropDownBox(AltoholicTabSearch_SelectSlot)
		S:HandleDropDownBox(AltoholicTabSearch_SelectLocation)
		AltoholicTabSearch_SelectRarity:Size(125, 32)
		AltoholicTabSearch_SelectSlot:Size(125, 32)
		AltoholicTabSearch_SelectLocation:Size(175, 32)
		S:HandleEditBox(_G["AltoholicTabSearch_MinLevel"])
		S:HandleEditBox(_G["AltoholicTabSearch_MaxLevel"])

		for i = 1, 15 do
			S:HandleButton(_G["AltoholicTabSearchMenuItem"..i])
		end

		for i = 1, 8 do
			S:HandleButton(_G["AltoholicTabSearch_Sort"..i])
		end
	end
end

AS:RegisterSkin(name, AS.SkinAltoholic, "ADDON_LOADED")