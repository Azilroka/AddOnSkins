if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Altoholic") then return end
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
AltoholicFrame.IsSkinned = "False"
local SkinAltoholic = CreateFrame("Frame")
SkinAltoholic:RegisterEvent("PLAYER_ENTERING_WORLD")
SkinAltoholic:SetScript("OnEvent", function(self)
if (UISkinOptions.AltoholicSkin ~= "Enabled") then return end
LoadAddOn("Altoholic_Characters")

	AltoTooltip:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
	AltoholicFramePortrait:Kill()
	cSkinFrame(AltoholicFrame)
	AltoholicFrame:HookScript("OnShow", function(self) if AltoholicFrame.IsSkinned == "True" then return end
	AltoholicFrame.IsSkinned = "True"
	cSkinFrame(AltoholicFrameSummary)
	cSkinFrame(AltoholicFrameActivity)
	cSkinFrame(AltoholicFrameBagUsage)
	cSkinFrame(AltoholicFrameSkills)
	cSkinFrame(AltoMsgBox)
	cSkinFrame(AltoholicFrameContainers)
	cSkinFrame(AltoholicFrameRecipes)
	cSkinFrame(AltoholicFrameQuests)
	cSkinFrame(AltoholicFrameGlyphs)
	cSkinFrame(AltoholicFrameMail)
	cSkinFrame(AltoholicFrameSpellbook)
	cSkinFrame(AltoholicFramePets)
	cSkinFrame(AltoholicFrameAuctions)
	cSkinCloseButton(AltoholicFrameCloseButton)
	cSkinDropDownBox(AltoholicTabSummary_SelectLocation)
	cSkinEditBox(AltoholicFrame_SearchEditBox)
	cSkinScrollBar(AltoholicFrameSummaryScrollFrameScrollBar)
	cSkinScrollBar(AltoholicFrameBagUsageScrollFrameScrollBar)
	cSkinScrollBar(AltoholicFrameSkillsScrollFrameScrollBar)
	cSkinScrollBar(AltoholicFrameActivityScrollFrameScrollBar)
	cSkinScrollBar(AltoholicFrameContainersScrollFrameScrollBar)
	cSkinScrollBar(AltoholicFrameQuestsScrollFrameScrollBar)
	cSkinScrollBar(AltoholicFrameRecipesScrollFrameScrollBar)
	cSkinDropDownBox(AltoholicFrameTalents_SelectMember)
	cSkinDropDownBox(AltoholicTabCharacters_SelectRealm)
	cSkinNextPrevButton(AltoholicFrameSpellbookPrevPage)
	cSkinNextPrevButton(AltoholicFrameSpellbookNextPage)
	cSkinNextPrevButton(AltoholicFramePetsNormalPrevPage)
	cSkinNextPrevButton(AltoholicFramePetsNormalNextPage)
	cSkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateLeftButton)
	cSkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateRightButton)
	cSkinButton(AltoMsgBoxYesButton)
	cSkinButton(AltoMsgBoxNoButton)
	cSkinButton(AltoholicFrame_ResetButton)
	cSkinButton(AltoholicFrame_SearchButton)
	cSkinButton(AltoholicTabCharacters_Sort1)
	cSkinButton(AltoholicTabCharacters_Sort2)
	cSkinButton(AltoholicTabCharacters_Sort3)

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
		cSkinButton(_G["AltoholicTabSummaryMenuItem"..i])
	end

	for i = 1, 8 do
		_G["AltoholicTabSummary_Sort"..i]:StripTextures(True)
		cSkinButton(_G["AltoholicTabSummary_Sort"..i])
	end

	for i = 1, 7 do
		_G["AltoholicFrameTab"..i]:StripTextures(True)
		cSkinTab(_G["AltoholicFrameTab"..i])
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
	cSkinScrollBar(AltoholicFrameAchievementsScrollFrameScrollBar)
	cSkinScrollBar(AltoholicAchievementsMenuScrollFrameScrollBar)
	cSkinDropDownBox(AltoholicTabAchievements_SelectRealm)
	AltoholicTabAchievements_SelectRealm:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 205, -57)

	for i = 1, 15 do
		_G["AltoholicTabAchievementsMenuItem"..i]:StripTextures(True)
		cSkinButton(_G["AltoholicTabAchievementsMenuItem"..i])
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

	cSkinFrame(AltoholicFrameCalendarScrollFrame)
	cSkinFrame(AltoholicTabAgendaMenuItem1)
	cSkinScrollBar(AltoholicFrameCalendarScrollFrameScrollBar)
	cSkinNextPrevButton(AltoholicFrameCalendar_NextMonth)
	cSkinNextPrevButton(AltoholicFrameCalendar_PrevMonth)
	AltoholicTabAgendaMenuItem1:SetTemplate("Transparent")

	for i = 1, 14 do
		_G["AltoholicFrameCalendarEntry"..i]:StripTextures(True)
		cSkinFrame(_G["AltoholicFrameCalendarEntry"..i])
	end
end

local function LoadSkinGrids()

	AltoholicFrameGridsScrollFrame:StripTextures(True)
	AltoholicFrameGrids:CreateBackdrop("Transparent")
	cSkinScrollBar(AltoholicFrameGridsScrollFrameScrollBar)
	cSkinDropDownBox(AltoholicTabGrids_SelectRealm)
	cSkinDropDownBox(AltoholicTabGrids_SelectView)

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

	cSkinFrame(AltoholicFrameGuildMembers)
	cSkinFrame(AltoholicFrameGuildBank)
	cSkinScrollBar(AltoholicFrameGuildMembersScrollFrameScrollBar)
	AltoholicFrameGuildMembersScrollFrame:StripTextures(True)

	for i = 1, 2 do
		_G["AltoholicTabGuildMenuItem"..i]:StripTextures(True)
		cSkinButton(_G["AltoholicTabGuildMenuItem"..i])
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
		cSkinButton(_G["AltoholicTabGuild_Sort"..i])
	end
end

local function LoadSkinSearch()

	AltoholicFrameSearch:StripTextures(True)
	AltoholicFrameSearch:CreateBackdrop("Transparent")
	AltoholicFrameSearchScrollFrame:StripTextures(True)
	AltoholicSearchMenuScrollFrame:StripTextures(True)
	cSkinScrollBar(AltoholicFrameSearchScrollFrameScrollBar)
	cSkinScrollBar(AltoholicSearchMenuScrollFrameScrollBar)
	cSkinDropDownBox(AltoholicTabSearch_SelectRarity)
	cSkinDropDownBox(AltoholicTabSearch_SelectSlot)
	cSkinDropDownBox(AltoholicTabSearch_SelectLocation)
	AltoholicTabSearch_SelectRarity:Size(125, 32)
	AltoholicTabSearch_SelectSlot:Size(125, 32)
	AltoholicTabSearch_SelectLocation:Size(175, 32)
	cSkinEditBox(_G["AltoholicTabSearch_MinLevel"])
	cSkinEditBox(_G["AltoholicTabSearch_MaxLevel"])

	for i = 1, 15 do
		_G["AltoholicTabSearchMenuItem"..i]:StripTextures(True)
		cSkinButton(_G["AltoholicTabSearchMenuItem"..i])
	end

	for i = 1, 8 do
		_G["AltoholicTabSearch_Sort"..i]:StripTextures(True)
		cSkinButton(_G["AltoholicTabSearch_Sort"..i])
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
end)