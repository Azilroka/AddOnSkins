if AddOnSkins.Classic then return end
 local AS = unpack(AddOnSkins)

function AS:Blizzard_EncounterJournal(event, addon)
	if addon ~= 'Blizzard_EncounterJournal' then return end

	AS:SkinBackdropFrame(EncounterJournal)

	AS:SkinBackdropFrame(EncounterJournal.navBar, nil, nil, true)
	EncounterJournal.navBar.Backdrop:SetPoint("TOPLEFT", -2, 0)
	EncounterJournal.navBar.Backdrop:SetPoint("BOTTOMRIGHT")

	AS:StripTextures(EncounterJournal.navBar.overlay, true)
	AS:SkinButton(EncounterJournal.navBar.homeButton, true)
	EncounterJournal.navBar.homeButton.xoffset = 1

	AS:SkinEditBox(EncounterJournal.searchBox)
	AS:SkinCloseButton(EncounterJournal.CloseButton)

	AS:CreateBackdrop(EncounterJournal.encounter.info)

	for _, Tab in pairs({ EncounterJournal.encounter.info.bossTab, EncounterJournal.encounter.info.lootTab, EncounterJournal.encounter.info.modelTab, EncounterJournal.encounter.info.overviewTab }) do
		Tab:GetNormalTexture():SetTexture()
		Tab:GetPushedTexture():SetTexture()
		Tab:GetDisabledTexture():SetTexture()
		Tab:GetHighlightTexture():SetTexture()
		AS:SkinBackdropFrame(Tab, nil, true)
		Tab.Backdrop:SetPoint('TOPLEFT', 11, -8)
		Tab.Backdrop:SetPoint('BOTTOMRIGHT', -6, 8)
		Tab:HookScript('OnEnter', function(self) self.Backdrop:SetBackdropBorderColor(unpack(AS.Color)) end)
		Tab:HookScript('OnLeave', function(self) self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
	end

	EncounterJournal.encounter.info.overviewTab:SetPoint('TOPLEFT', EncounterJournal.encounter.info, 'TOPRIGHT', AS:AdjustForTheme(-2), -35)
	EncounterJournal.encounter.info.overviewTab.SetPoint = AS.Noop

	AS:StripTextures(EncounterJournal.instanceSelect)
	AS:SkinFrame(EncounterJournal.suggestFrame)
	AS:SkinFrame(EncounterJournal.instanceSelect.scroll)

	AS:SkinScrollBar(EncounterJournal.instanceSelect.scroll.ScrollBar)

	AS:SkinButton(EncounterJournal.instanceSelect.dungeonsTab, true)
	AS:SkinButton(EncounterJournal.instanceSelect.raidsTab, true)
	AS:SkinButton(EncounterJournal.instanceSelect.suggestTab, true)
	AS:SkinButton(EncounterJournal.instanceSelect.LootJournalTab, true)

	AS:SkinScrollBar(EncounterJournal.encounter.info.lootScroll.scrollBar)
	AS:SkinScrollBar(EncounterJournal.encounter.info.detailsScroll.ScrollBar)
	AS:SkinScrollBar(EncounterJournal.encounter.info.bossesScroll.ScrollBar)
	AS:SkinScrollBar(EncounterJournal.encounter.instance.loreScroll.ScrollBar)

	AS:StripTextures(EncounterJournal.encounter.info)

	EncounterJournal.encounter.instance.loreScroll.child.lore:SetTextColor(1, 1, 1)
	EncounterJournal.encounter.info.detailsScroll.child.description:SetTextColor(1, 1, 1)
	EncounterJournal.encounter.info.overviewScroll.child.loreDescription:SetTextColor(1, 1, 1)
	EncounterJournal.encounter.info.overviewScroll.child.header:Hide()

	_G.EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetFontObject("GameFontNormalLarge")
	_G.EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetTextColor(1, 1, 1)

	EncounterJournal.instanceSelect.suggestTab:SetPoint('BOTTOMLEFT', '$parent', 'TOPLEFT', 25, -49)
	EncounterJournal.encounter.info.overviewScroll.child.overviewDescription.Text:SetTextColor(1, 1, 1)

	AS:SkinFrame(EncounterJournal.LootJournal)

	EncounterJournal.instanceSelect.bg:SetAlpha(0)

	AS:Delay(0, function() AS:SkinDropDownBox(EncounterJournalInstanceSelectTierDropDown) end) -- Apparently Spawned but not all elements until the frame is shown.

	for i = 1, AJ_MAX_NUM_SUGGESTIONS do
		local suggestion = EncounterJournal.suggestFrame["Suggestion"..i]
		local centerDisplay = suggestion.centerDisplay
		local reward = suggestion.reward

		suggestion.bg:SetAlpha(0)
		AS:CreateBackdrop(suggestion.bg)

		AS:CreateBackdrop(suggestion.icon)

		centerDisplay.title.text:SetTextColor(1, 1, 1)
		centerDisplay.description.text:SetTextColor(.9, .9, .9)

		AS:CreateBackdrop(reward.icon)
		reward.iconRing:Hide()
		reward.iconRingHighlight:SetTexture("")

		if i == 1 then
			reward.text:SetTextColor(.9, .9, .9)

			suggestion.icon:SetPoint("TOPLEFT", 135, -15)

			AS:SkinButton(suggestion.button)
			AS:SkinArrowButton(suggestion.prevButton)
			AS:SkinArrowButton(suggestion.nextButton)
		else
			reward:SetFrameLevel(suggestion:GetFrameLevel() + 3)
			AS:SkinButton(suggestion.centerDisplay.button)
			suggestion.bg:SetPoint('TOPLEFT', -16, 4)
		end
	end

	AS:SkinButton(EncounterJournal.encounter.info.lootScroll.lootSlotFilter, true)
	AS:SkinButton(EncounterJournal.encounter.info.lootScroll.filter, true)
	AS:SkinButton(EncounterJournal.encounter.info.lootScroll.slotFilter, true)
	AS:StripTextures(EncounterJournal.encounter.info.lootScroll.classClearFilter, true)
	EncounterJournal.encounter.info.lootScroll.classClearFilter.text:SetTextColor(1, 1, 1)
	AS:SkinButton(EncounterJournal.encounter.info.reset)
	AS:SkinButton(EncounterJournal.encounter.info.difficulty, true)

	for i, Button in pairs(EncounterJournal.encounter.info.lootScroll.buttons) do
		Button.bossTexture:SetAlpha(0)
		Button.bosslessTexture:SetAlpha(0)

		Button.icon:SetSize(32, 32)
		Button.icon:SetPoint("TOPLEFT", AS:AdjustForTheme(3), AS:AdjustForTheme(-7))
		AS:SkinTexture(Button.icon, true)

		Button.name:SetPoint("TOPLEFT", Button.icon, "TOPRIGHT", 6, -2)
		Button.boss:SetTextColor(1, 1, 1)
		Button.boss:SetPoint("BOTTOMLEFT", 4, 6)
		Button.slot:SetPoint("TOPLEFT", Button.name, "BOTTOMLEFT", 0, -3)
		Button.slot:SetTextColor(1, 1, 1)
		Button.armorType:SetTextColor(1, 1, 1)
		Button.armorType:SetPoint("RIGHT", Button, "RIGHT", -10, 0)

		hooksecurefunc(Button.IconBorder, "SetVertexColor", function(self, r, g, b)
			self:GetParent().icon.Backdrop:SetBackdropBorderColor(r, g, b)
			self:SetTexture("")
		end)

		AS:CreateBackdrop(Button)
		Button.Backdrop:SetPoint("TOPLEFT", 0, -4)
		Button.Backdrop:SetPoint("BOTTOMRIGHT", 0, AS.PixelMode and 3 or 0)

		if i == 1 then
			Button:ClearAllPoints()
			Button:SetPoint("TOPLEFT", EncounterJournal.encounter.info.lootScroll.scrollChild, "TOPLEFT", 5, 0)
		end
	end

	AS:SkinTooltip(EncounterJournalTooltip)

	hooksecurefunc('AdventureJournal_Reward_OnEnter', function(self)
		local rewardData = self.data
		if ( rewardData ) then
			local frame = EncounterJournalTooltip
			if ( rewardData.itemLink or rewardData.currencyType ) then
				local _, _, quality = GetItemInfo(rewardData.itemLink)
				AS:SkinTexture(frame.Item1.icon, true)
				frame.Item1.icon.Backdrop:SetBackdropBorderColor(GetItemQualityColor(quality))
				frame.Item1.IconBorder:SetAlpha(0)
				frame.Item1.tooltip:SetBackdrop(nil)
			end
		end
	end)

	hooksecurefunc("EncounterJournal_ListInstances", function()
		local instanceSelect = EncounterJournal.instanceSelect
		local scrollFrame = instanceSelect.scroll.child
		local index = 1
		local Button = scrollFrame["instance"..index]

		while Button do
			AS:SkinButton(Button)
			scrollFrame["instance"..index].bgImage:SetTexCoord(.08, .6, .08, .6)
			scrollFrame["instance"..index].bgImage:SetDrawLayer('ARTWORK')
			AS:SetInside(scrollFrame["instance"..index].bgImage)
			index = index + 1
			Button = scrollFrame["instance"..index]
		end
	end)

	hooksecurefunc("EncounterJournal_DisplayInstance", function()
		local bossIndex = 1
		local bossButton = _G["EncounterJournalBossButton"..bossIndex]

		while bossButton do
			AS:SkinButton(bossButton)
			bossButton.creature:ClearAllPoints()
			bossButton.creature:SetPoint("TOPLEFT", 1, -4)

			bossIndex = bossIndex + 1
			bossButton = _G["EncounterJournalBossButton"..bossIndex]
		end
	end)

	hooksecurefunc("EncounterJournal_SetUpOverview", function(self, _, index)
		local header = self.overviews[index]
		if not header.isSkinned then

			header.descriptionBG:SetAlpha(0)
			AS:CreateBackdrop(header.descriptionBG)
			header.descriptionBG.Backdrop:SetAllPoints()
			header.descriptionBGBottom:SetAlpha(0)

			for i = 4, 18 do
				select(i, header.button:GetRegions()):SetTexture("")
			end

			AS:SkinButton(header.button)

			header.button.title:SetTextColor(unpack(AS.Color))
			header.button.title.SetTextColor = AS.Noop
			header.button.expandedIcon:SetTextColor(1, 1, 1)
			header.button.expandedIcon.SetTextColor = AS.Noop

			header.isSkinned = true
		end
	end)

	hooksecurefunc("EncounterJournal_SetBullets", function(object)
		local parent = object:GetParent()

		if parent.Bullets then
			for _, bullet in pairs(parent.Bullets) do
				if not bullet.styled then
					bullet.Text:SetTextColor(1, 1, 1)
					bullet.styled = true
				end
			end
		end
	end)

	hooksecurefunc("EncounterJournal_ToggleHeaders", function()
		local index = 1
		local header = _G["EncounterJournalInfoHeader"..index]
		while header do
			if not header.isSkinned then
				header.flashAnim.Play = AS.Noop

				header.descriptionBG:SetAlpha(0)
				header.descriptionBGBottom:SetAlpha(0)

				for i = 4, 18 do
					select(i, header.button:GetRegions()):SetTexture("")
				end

				header.description:SetTextColor(1, 1, 1)
				header.button.title:SetTextColor(unpack(AS.Color))
				header.button.title.SetTextColor = AS.Noop
				header.button.expandedIcon:SetTextColor(1, 1, 1)
				header.button.expandedIcon.SetTextColor = AS.Noop

				AS:SkinButton(header.button)

				AS:SkinTexture(header.button.abilityIcon, true)

				header.isSkinned = true
			end

			index = index + 1
			header = _G["EncounterJournalInfoHeader"..index]
		end
	end)

	hooksecurefunc("EJSuggestFrame_RefreshDisplay", function()
		for i = 1, 3 do
			local Suggestion = EncounterJournal.suggestFrame['Suggestion'..i]
			local Data = EncounterJournal.suggestFrame.suggestions[i]
			if Suggestion and Data then
				Suggestion.iconRing:Hide()
				Suggestion.icon:SetMask("")
				Suggestion.icon:SetTexture(Data.iconPath or QUESTION_MARK_ICON)
				AS:SkinTexture(Suggestion.icon)
			end
		end
	end)

	hooksecurefunc("EJSuggestFrame_UpdateRewards", function(suggestion)
		local rewardData = suggestion.reward.data
		if rewardData then
			local texture = rewardData.itemIcon or rewardData.currencyIcon or [[Interface\Icons\achievement_guildperk_mobilebanking]]
			suggestion.reward.icon:SetMask("")
			suggestion.reward.icon:SetTexture(texture)
			AS:SkinTexture(suggestion.reward.icon)
			local r, g, b = unpack(AS.BorderColor)
			if rewardData.itemID then
				local quality = select(3, GetItemInfo(rewardData.itemID))
				if quality and quality > 1 then
					r, g, b = GetItemQualityColor(quality)
				end
			end
			suggestion.reward.icon.Backdrop:SetBackdropBorderColor(r, g, b)
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_EncounterJournal", AS.Blizzard_EncounterJournal, 'ADDON_LOADED')
