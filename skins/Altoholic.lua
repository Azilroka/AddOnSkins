if not IsAddOnLoaded("Altoholic") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "AltoholicSkin"
local function SkinAltoholic(self)
	LoadAddOn("Altoholic_Characters")
	AltoholicFrame.IsSkinned = "False"
	AltoTooltip:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
	AltoholicFramePortrait:Kill()
	AS:SkinFrame(AltoholicFrame)
	AltoholicFrame:HookScript("OnShow", function(self) if AltoholicFrame.IsSkinned == "True" then return end
		AltoholicFrame.IsSkinned = "True"
		AS:SkinFrame(AltoholicFrameSummary)
		AS:SkinFrame(AltoholicFrameActivity)
		AS:SkinFrame(AltoholicFrameBagUsage)
		AS:SkinFrame(AltoholicFrameSkills)
		AS:SkinFrame(AltoMsgBox)
		AS:SkinFrame(AltoholicFrameContainers)
		AS:SkinFrame(AltoholicFrameRecipes)
		AS:SkinFrame(AltoholicFrameQuests)
		AS:SkinFrame(AltoholicFrameGlyphs)
		AS:SkinFrame(AltoholicFrameMail)
		AS:SkinFrame(AltoholicFrameSpellbook)
		AS:SkinFrame(AltoholicFramePets)
		AS:SkinFrame(AltoholicFrameAuctions)
		AS:SkinCloseButton(AltoholicFrameCloseButton)
		AS:SkinDropDownBox(AltoholicTabSummary_SelectLocation)
		AS:SkinEditBox(AltoholicFrame_SearchEditBox)
		AS:SkinScrollBar(AltoholicFrameSummaryScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameBagUsageScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameSkillsScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameActivityScrollFrameScrollBar)
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
		AS:SkinButton(AltoMsgBoxYesButton)
		AS:SkinButton(AltoMsgBoxNoButton)
		AS:SkinButton(AltoholicFrame_ResetButton)
		AS:SkinButton(AltoholicFrame_SearchButton)
		AS:SkinButton(AltoholicTabCharacters_Sort1)
		AS:SkinButton(AltoholicTabCharacters_Sort2)
		AS:SkinButton(AltoholicTabCharacters_Sort3)

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
			AS:SkinButton(_G["AltoholicTabSummaryMenuItem"..i])
		end

		for i = 1, 8 do
			_G["AltoholicTabSummary_Sort"..i]:StripTextures(True)
			AS:SkinButton(_G["AltoholicTabSummary_Sort"..i])
		end

		for i = 1, 7 do
			_G["AltoholicFrameTab"..i]:StripTextures(True)
			AS:SkinTab(_G["AltoholicFrameTab"..i])
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
		AS:SkinScrollBar(AltoholicFrameAchievementsScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicAchievementsMenuScrollFrameScrollBar)
		AS:SkinDropDownBox(AltoholicTabAchievements_SelectRealm)
		AltoholicTabAchievements_SelectRealm:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 205, -57)

		for i = 1, 15 do
			_G["AltoholicTabAchievementsMenuItem"..i]:StripTextures(True)
			AS:SkinButton(_G["AltoholicTabAchievementsMenuItem"..i])
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

		AS:SkinFrame(AltoholicFrameCalendarScrollFrame)
		AS:SkinFrame(AltoholicTabAgendaMenuItem1)
		AS:SkinScrollBar(AltoholicFrameCalendarScrollFrameScrollBar)
		AS:SkinNextPrevButton(AltoholicFrameCalendar_NextMonth)
		AS:SkinNextPrevButton(AltoholicFrameCalendar_PrevMonth)
		AltoholicTabAgendaMenuItem1:SetTemplate("Transparent")

		for i = 1, 14 do
			_G["AltoholicFrameCalendarEntry"..i]:StripTextures(True)
			AS:SkinFrame(_G["AltoholicFrameCalendarEntry"..i])
		end
	end

	local function LoadSkinGrids()

		AltoholicFrameGridsScrollFrame:StripTextures(True)
		AltoholicFrameGrids:CreateBackdrop("Transparent")
		AS:SkinScrollBar(AltoholicFrameGridsScrollFrameScrollBar)
		AS:SkinDropDownBox(AltoholicTabGrids_SelectRealm)
		AS:SkinDropDownBox(AltoholicTabGrids_SelectView)

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

		AS:SkinFrame(AltoholicFrameGuildMembers)
		AS:SkinFrame(AltoholicFrameGuildBank)
		AS:SkinScrollBar(AltoholicFrameGuildMembersScrollFrameScrollBar)
		AltoholicFrameGuildMembersScrollFrame:StripTextures(True)

		for i = 1, 2 do
			_G["AltoholicTabGuildMenuItem"..i]:StripTextures(True)
			AS:SkinButton(_G["AltoholicTabGuildMenuItem"..i])
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
			AS:SkinButton(_G["AltoholicTabGuild_Sort"..i])
		end
	end

	local function LoadSkinSearch()

		AltoholicFrameSearch:StripTextures(True)
		AltoholicFrameSearch:CreateBackdrop("Transparent")
		AltoholicFrameSearchScrollFrame:StripTextures(True)
		AltoholicSearchMenuScrollFrame:StripTextures(True)
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
			_G["AltoholicTabSearchMenuItem"..i]:StripTextures(True)
			AS:SkinButton(_G["AltoholicTabSearchMenuItem"..i])
		end

		for i = 1, 8 do
			_G["AltoholicTabSearch_Sort"..i]:StripTextures(True)
			AS:SkinButton(_G["AltoholicTabSearch_Sort"..i])
		end
	end

	local S = E:GetModule('Skins')
	S:RegisterSkin('Altoholic_Achievements', LoadSkinAchievements)
	S:RegisterSkin('Altoholic_Agenda', LoadSkinAgenda)
	S:RegisterSkin('Altoholic_Grids', LoadSkinGrids)
	S:RegisterSkin('Altoholic_Guild', LoadSkinGuild)
	S:RegisterSkin('Altoholic_Search', LoadSkinSearch)
end

AS:RegisterSkin(name,SkinAltoholic)
