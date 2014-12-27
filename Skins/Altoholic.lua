local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Altoholic') then return end

function AS:Altoholic(event, addon)

	local function ColorAltoBorder(self)
		if self.id then
			local quality = select(3, GetItemInfo(self.id))
			if quality and quality > 1 then
				local r, g, b = GetItemQualityColor(quality)
				self.Backdrop:SetBackdropBorderColor(r, g, b, 1)
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		else
			self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
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
		AS:SkinFrame(AltoholicFrameCurrencies)
		AS:SkinFrame(AltoholicFrameGarrisonFollowers)

		AS:StripTextures(AltoholicFrameCurrenciesScrollFrame)
		AS:StripTextures(AltoholicFrameGarrisonFollowersScrollFrame)

		AS:SkinScrollBar(AltoholicFrameSummaryScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameBagUsageScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameSkillsScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameActivityScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameCurrenciesScrollFrameScrollBar)
		AS:SkinScrollBar(AltoholicFrameGarrisonFollowersScrollFrameScrollBar)
		AS:SkinDropDownBox(AltoholicTabSummary_SelectLocation)
		AltoholicTabSummary_SelectLocation:Width(200)
		AS:StripTextures(AltoholicFrameSummaryScrollFrame, true)
		AS:StripTextures(AltoholicFrameBagUsageScrollFrame, true)
		AS:StripTextures(AltoholicFrameSkillsScrollFrame, true)
		AS:StripTextures(AltoholicFrameActivityScrollFrame, true)

		AS:SkinTexture(AltoholicTabSummary_RequestSharingIconTexture)
		AS:StyleButton(AltoholicTabSummary_RequestSharing)
		AS:CreateBackdrop(AltoholicTabSummary_RequestSharing)
		AS:SkinTexture(AltoholicTabSummary_OptionsIconTexture)
		AS:StyleButton(AltoholicTabSummary_Options)
		AS:CreateBackdrop(AltoholicTabSummary_Options)
		AS:SkinTexture(AltoholicTabSummary_OptionsDataStoreIconTexture)
		AS:StyleButton(AltoholicTabSummary_OptionsDataStore)
		AS:CreateBackdrop(AltoholicTabSummary_OptionsDataStore)

		for i = 1, 6 do
			AS:SkinButton(_G["AltoholicTabSummaryMenuItem"..i], true)
		end
		for i = 1, 9 do
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
		AS:StripTextures(AltoholicFrameContainersScrollFrame, true)
		AS:StripTextures(AltoholicFrameQuestsScrollFrame, true)
		AS:StripTextures(AltoholicFrameRecipesScrollFrame, true)

		local Buttons = {
			'AltoholicTabCharacters_Characters',
			'AltoholicTabCharacters_CharactersIcon',
			'AltoholicTabCharacters_BagsIcon',
			'AltoholicTabCharacters_QuestsIcon',
			'AltoholicTabCharacters_TalentsIcon',
			'AltoholicTabCharacters_AuctionIcon',
			'AltoholicTabCharacters_MailIcon',
			'AltoholicTabCharacters_SpellbookIcon',
			'AltoholicTabCharacters_ProfessionsIcon',
		}

		for _, object in pairs(Buttons) do
			AS:SkinTexture(_G[object..'IconTexture'])
			AS:StyleButton(_G[object])
			AS:CreateBackdrop(_G[object])
		end

		for i = 1, 7 do
			for j = 1, 14 do
				AS:SkinIconButton(_G["AltoholicFrameContainersEntry"..i.."Item"..j])
				_G["AltoholicFrameContainersEntry"..i.."Item"..j]:HookScript('OnUpdate', ColorAltoBorder)
			end
		end
	end

	if addon == "Altoholic_Achievements" then
		AS:SkinBackdropFrame(AltoholicFrameAchievements)
		AS:StripTextures(AltoholicFrameAchievementsScrollFrame, true)
		AS:StripTextures(AltoholicAchievementsMenuScrollFrame, true)
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
				_G["AltoholicFrameAchievementsEntry"..i.."Item"..j..'_Background']:SetInside(_G["AltoholicFrameAchievementsEntry"..i.."Item"..j].Backdrop)
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
		AS:StripTextures(AltoholicFrameGridsScrollFrame, true)
		AS:SkinBackdropFrame(AltoholicFrameGrids)
		AS:SkinScrollBar(AltoholicFrameGridsScrollFrameScrollBar)
		AS:SkinDropDownBox(AltoholicTabGrids_SelectRealm)
		AS:SkinDropDownBox(AltoholicTabGrids_SelectView)

		for i = 1, 8 do
			for j = 1, 10 do
				AS:SkinBackdropFrame(_G["AltoholicFrameGridsEntry"..i.."Item"..j], nil, nil, nil, true)
				_G["AltoholicFrameGridsEntry"..i.."Item"..j]:HookScript('OnUpdate', ColorAltoBorder)
			end
		end

		AltoholicFrameGrids:HookScript('OnUpdate', function()
			for i = 1, 10 do
				for j = 1, 10 do
					if _G["AltoholicFrameGridsEntry"..i.."Item"..j.."_Background"] then
						AS:SkinTexture(_G["AltoholicFrameGridsEntry"..i.."Item"..j.."_Background"])
					end
				end
			end
		end)

	end

	if addon == "Altoholic_Guild" then
		AS:SkinFrame(AltoholicFrameGuildMembers)
		AS:SkinFrame(AltoholicFrameGuildBank)
		AS:SkinScrollBar(AltoholicFrameGuildMembersScrollFrameScrollBar)
		AS:StripTextures(AltoholicFrameGuildMembersScrollFrame, true)

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
		AS:StripTextures(AltoholicFrameSearchScrollFrame, true)
		AS:StripTextures(AltoholicSearchMenuScrollFrame, true)
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

AS:RegisterSkin('Altoholic', AS.Altoholic, "ADDON_LOADED")