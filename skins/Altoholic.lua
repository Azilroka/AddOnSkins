if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Altoholic") then return end
local U = unpack(select(2,...))
local s = U.s
local c = U.c 
local name = "AltoholicSkin"
local function SkinAltoholic(self)
	LoadAddOn("Altoholic_Characters")
	AltoholicFrame.IsSkinned = "False"
	AltoTooltip:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
	AltoholicFramePortrait:Kill()
	U.SkinFrame(AltoholicFrame)
	AltoholicFrame:HookScript("OnShow", function(self) if AltoholicFrame.IsSkinned == "True" then return end
		AltoholicFrame.IsSkinned = "True"
		U.SkinFrame(AltoholicFrameSummary)
		U.SkinFrame(AltoholicFrameActivity)
		U.SkinFrame(AltoholicFrameBagUsage)
		U.SkinFrame(AltoholicFrameSkills)
		U.SkinFrame(AltoMsgBox)
		U.SkinFrame(AltoholicFrameContainers)
		U.SkinFrame(AltoholicFrameRecipes)
		U.SkinFrame(AltoholicFrameQuests)
		U.SkinFrame(AltoholicFrameGlyphs)
		U.SkinFrame(AltoholicFrameMail)
		U.SkinFrame(AltoholicFrameSpellbook)
		U.SkinFrame(AltoholicFramePets)
		U.SkinFrame(AltoholicFrameAuctions)
		U.SkinCloseButton(AltoholicFrameCloseButton)
		U.SkinDropDownBox(AltoholicTabSummary_SelectLocation)
		U.SkinEditBox(AltoholicFrame_SearchEditBox)
		U.SkinScrollBar(AltoholicFrameSummaryScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameBagUsageScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameSkillsScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameActivityScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameContainersScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameQuestsScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameRecipesScrollFrameScrollBar)
		U.SkinDropDownBox(AltoholicFrameTalents_SelectMember)
		U.SkinDropDownBox(AltoholicTabCharacters_SelectRealm)
		U.SkinNextPrevButton(AltoholicFrameSpellbookPrevPage)
		U.SkinNextPrevButton(AltoholicFrameSpellbookNextPage)
		U.SkinNextPrevButton(AltoholicFramePetsNormalPrevPage)
		U.SkinNextPrevButton(AltoholicFramePetsNormalNextPage)
		U.SkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateLeftButton)
		U.SkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateRightButton)
		U.SkinButton(AltoMsgBoxYesButton)
		U.SkinButton(AltoMsgBoxNoButton)
		U.SkinButton(AltoholicFrame_ResetButton)
		U.SkinButton(AltoholicFrame_SearchButton)
		U.SkinButton(AltoholicTabCharacters_Sort1)
		U.SkinButton(AltoholicTabCharacters_Sort2)
		U.SkinButton(AltoholicTabCharacters_Sort3)

		AltoholicFrameContainersScrollFrame:StripTextures(True)
		AltoholicFrameQuestsScrollFrame:StripTextures(True)
		AltoholicFrameSummaryScrollFrame:StripTextures(True)
		AltoholicFrameBagUsageScrollFrame:StripTextures(True)
		AltoholicFrameSkillsScrollFrame:StripTextures(True)
		AltoholicFrameActivityScrollFrame:StripTextures(True)
		AltoholicFrameRecipesScrollFrame:StripTextures(True)

		AltoholicFrame_ResetButton:Size(85, 24)
		AltoholicFrame_SearchButton:Size(85, 24)
		AltoholicFrame_SearchEditBox:Size(175, 15)
		AltoholicTabSummary_SelectLocation:Width(200)

		AltoholicFrameTab1:Point("TOPLEFT", AltoholicFrame, "BOTTOMLEFT", -5, 2)
		AltoholicFrame_ResetButton:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 25, -77)
		AltoholicFrame_SearchEditBox:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 37, -56)

		for i = 1, 4 do
			_G["AltoholicTabSummaryMenuItem"..i]:StripTextures(True)
			U.SkinButton(_G["AltoholicTabSummaryMenuItem"..i])
		end

		for i = 1, 8 do
			_G["AltoholicTabSummary_Sort"..i]:StripTextures(True)
			U.SkinButton(_G["AltoholicTabSummary_Sort"..i])
		end

		for i = 1, 7 do
			_G["AltoholicFrameTab"..i]:StripTextures(True)
			U.SkinTab(_G["AltoholicFrameTab"..i])
		end

		for i = 1, 14 do
			_G["AltoholicFrameContainersEntry1Item"..i]:StripTextures(True)
			_G["AltoholicFrameContainersEntry2Item"..i]:StripTextures(True)
			_G["AltoholicFrameContainersEntry3Item"..i]:StripTextures(True)
			_G["AltoholicFrameContainersEntry4Item"..i]:StripTextures(True)
			_G["AltoholicFrameContainersEntry5Item"..i]:StripTextures(True)
			_G["AltoholicFrameContainersEntry6Item"..i]:StripTextures(True)
			_G["AltoholicFrameContainersEntry7Item"..i]:StripTextures(True)
		end
	end)

	local function LoadSkinAchievements()

		AltoholicFrameAchievements:StripTextures(True)
		AltoholicFrameAchievements:CreateBackdrop("Transparent")
		AltoholicFrameAchievementsScrollFrame:StripTextures(True)
		AltoholicAchievementsMenuScrollFrame:StripTextures(True)
		U.SkinScrollBar(AltoholicFrameAchievementsScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicAchievementsMenuScrollFrameScrollBar)
		U.SkinDropDownBox(AltoholicTabAchievements_SelectRealm)
		AltoholicTabAchievements_SelectRealm:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 205, -57)

		for i = 1, 15 do
			_G["AltoholicTabAchievementsMenuItem"..i]:StripTextures(True)
			U.SkinButton(_G["AltoholicTabAchievementsMenuItem"..i])
		end

		for i = 1, 10 do
			_G["AltoholicFrameAchievementsEntry1Item"..i]:StripTextures(True)
			_G["AltoholicFrameAchievementsEntry2Item"..i]:StripTextures(True)
			_G["AltoholicFrameAchievementsEntry3Item"..i]:StripTextures(True)
			_G["AltoholicFrameAchievementsEntry4Item"..i]:StripTextures(True)
			_G["AltoholicFrameAchievementsEntry5Item"..i]:StripTextures(True)
			_G["AltoholicFrameAchievementsEntry6Item"..i]:StripTextures(True)
			_G["AltoholicFrameAchievementsEntry7Item"..i]:StripTextures(True)
			_G["AltoholicFrameAchievementsEntry8Item"..i]:StripTextures(True)
		end
	end


	local function LoadSkinAgenda()

		U.SkinFrame(AltoholicFrameCalendarScrollFrame)
		U.SkinFrame(AltoholicTabAgendaMenuItem1)
		U.SkinScrollBar(AltoholicFrameCalendarScrollFrameScrollBar)
		U.SkinNextPrevButton(AltoholicFrameCalendar_NextMonth)
		U.SkinNextPrevButton(AltoholicFrameCalendar_PrevMonth)
		AltoholicTabAgendaMenuItem1:SetTemplate("Transparent")

		for i = 1, 14 do
			_G["AltoholicFrameCalendarEntry"..i]:StripTextures(True)
			U.SkinFrame(_G["AltoholicFrameCalendarEntry"..i])
		end
	end

	local function LoadSkinGrids()

		AltoholicFrameGridsScrollFrame:StripTextures(True)
		AltoholicFrameGrids:CreateBackdrop("Transparent")
		U.SkinScrollBar(AltoholicFrameGridsScrollFrameScrollBar)
		U.SkinDropDownBox(AltoholicTabGrids_SelectRealm)
		U.SkinDropDownBox(AltoholicTabGrids_SelectView)

		for i = 1, 10 do
			_G["AltoholicFrameGridsEntry1Item"..i]:StripTextures(True)
			_G["AltoholicFrameGridsEntry2Item"..i]:StripTextures(True)
			_G["AltoholicFrameGridsEntry3Item"..i]:StripTextures(True)
			_G["AltoholicFrameGridsEntry4Item"..i]:StripTextures(True)
			_G["AltoholicFrameGridsEntry5Item"..i]:StripTextures(True)
			_G["AltoholicFrameGridsEntry6Item"..i]:StripTextures(True)
			_G["AltoholicFrameGridsEntry7Item"..i]:StripTextures(True)
			_G["AltoholicFrameGridsEntry8Item"..i]:StripTextures(True)
		end
	end

	local function LoadSkinGuild()

		U.SkinFrame(AltoholicFrameGuildMembers)
		U.SkinFrame(AltoholicFrameGuildBank)
		U.SkinScrollBar(AltoholicFrameGuildMembersScrollFrameScrollBar)
		AltoholicFrameGuildMembersScrollFrame:StripTextures(True)

		for i = 1, 2 do
			_G["AltoholicTabGuildMenuItem"..i]:StripTextures(True)
			U.SkinButton(_G["AltoholicTabGuildMenuItem"..i])
		end

		for i = 1, 14 do
			_G["AltoholicFrameGuildBankEntry1Item"..i]:StripTextures(True)
			_G["AltoholicFrameGuildBankEntry2Item"..i]:StripTextures(True)
			_G["AltoholicFrameGuildBankEntry3Item"..i]:StripTextures(True)
			_G["AltoholicFrameGuildBankEntry4Item"..i]:StripTextures(True)
			_G["AltoholicFrameGuildBankEntry5Item"..i]:StripTextures(True)
			_G["AltoholicFrameGuildBankEntry6Item"..i]:StripTextures(True)
			_G["AltoholicFrameGuildBankEntry7Item"..i]:StripTextures(True)
		end

		for i = 1, 19 do
			_G["AltoholicFrameGuildMembersItem"..i]:StripTextures(True)
		end

		for i = 1, 5 do
			_G["AltoholicTabGuild_Sort"..i]:StripTextures(True)
			U.SkinButton(_G["AltoholicTabGuild_Sort"..i])
		end
	end

	local function LoadSkinSearch()

		AltoholicFrameSearch:StripTextures(True)
		AltoholicFrameSearch:CreateBackdrop("Transparent")
		AltoholicFrameSearchScrollFrame:StripTextures(True)
		AltoholicSearchMenuScrollFrame:StripTextures(True)
		U.SkinScrollBar(AltoholicFrameSearchScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicSearchMenuScrollFrameScrollBar)
		U.SkinDropDownBox(AltoholicTabSearch_SelectRarity)
		U.SkinDropDownBox(AltoholicTabSearch_SelectSlot)
		U.SkinDropDownBox(AltoholicTabSearch_SelectLocation)
		AltoholicTabSearch_SelectRarity:Size(125, 32)
		AltoholicTabSearch_SelectSlot:Size(125, 32)
		AltoholicTabSearch_SelectLocation:Size(175, 32)
		U.SkinEditBox(_G["AltoholicTabSearch_MinLevel"])
		U.SkinEditBox(_G["AltoholicTabSearch_MaxLevel"])

		for i = 1, 15 do
			_G["AltoholicTabSearchMenuItem"..i]:StripTextures(True)
			U.SkinButton(_G["AltoholicTabSearchMenuItem"..i])
		end

		for i = 1, 8 do
			_G["AltoholicTabSearch_Sort"..i]:StripTextures(True)
			U.SkinButton(_G["AltoholicTabSearch_Sort"..i])
		end
	end

	if IsAddOnLoaded("Tukui") then 
		s.SkinFuncs["Altoholic_Achievements"] = LoadSkinAchievements
		s.SkinFuncs["Altoholic_Agenda"] = LoadSkinAgenda
		s.SkinFuncs["Altoholic_Grids"] = LoadSkinGrids
		s.SkinFuncs["Altoholic_Guild"] = LoadSkinGuild
		s.SkinFuncs["Altoholic_Search"] = LoadSkinSearch
	end
	if IsAddOnLoaded("ElvUI") then 
		c:GetModule('Skins')
		s:RegisterSkin('Altoholic_Achievements', LoadSkinAchievements)
		s:RegisterSkin('Altoholic_Agenda', LoadSkinAgenda)
		s:RegisterSkin('Altoholic_Grids', LoadSkinGrids)
		s:RegisterSkin('Altoholic_Guild', LoadSkinGuild)
		s:RegisterSkin('Altoholic_Search', LoadSkinSearch)
	end
end

U.RegisterSkin(name,SkinAltoholic)
