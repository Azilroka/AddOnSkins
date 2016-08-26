local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Altoholic') then return end

function AS:Altoholic(event, addon)
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

		AS:StripTextures(AltoholicFrameSummary.ScrollFrame)
		AS:SkinScrollBar(AltoholicFrameSummary.ScrollFrame.ScrollBar)

		AS:SkinIconButton(AltoholicTabSummary.RealmsIcon)
		AS:SkinIconButton(AltoholicTabSummary.FactionIcon)
		AS:SkinIconButton(AltoholicTabSummary.LevelIcon)
		AS:SkinIconButton(AltoholicTabSummary.ProfessionsIcon)
		AS:SkinIconButton(AltoholicTabSummary.ClassIcon)
		AS:SkinIconButton(AltoholicTabSummary.RequestSharing)
		AS:SkinIconButton(AltoholicTabSummary.AltoholicOptionsIcon)
		AS:SkinIconButton(AltoholicTabSummary.DataStoreOptionsIcon)

		for i = 1, 6 do
			AS:SkinButton(AltoholicTabSummary['MenuItem'..i], true)
		end

		for i = 1, 9 do
			AS:SkinButton(AltoholicTabSummary["SortButtons"]["Sort"..i], true)
		end

		for i = 1, 7 do
			AS:SkinTab(_G["AltoholicFrameTab"..i], true)
		end
	end
	
	if addon == "Altoholic_Characters" then
		AS:SkinFrame(AltoholicFrameContainers)
		AS:SkinFrame(AltoholicFrameRecipes)
		AS:SkinFrame(AltoholicFrameQuests)
		AS:SkinFrame(AltoholicFrameMail)
		AS:SkinFrame(AltoholicFrameSpellbook)
		AS:SkinFrame(AltoholicFrameAuctions)
		AS:SkinScrollBar(AltoholicFrameContainersScrollFrame.ScrollBar)
		AS:SkinScrollBar(AltoholicFrameQuestsScrollFrame.ScrollBar)
		AS:SkinScrollBar(AltoholicFrameRecipesScrollFrame.ScrollBar)
		AS:SkinDropDownBox(AltoholicTabCharacters.SelectRealm)
		AS:SkinNextPrevButton(AltoholicFrameSpellbookPrevPage)
		AS:SkinNextPrevButton(AltoholicFrameSpellbookNextPage)
		AS:StripTextures(AltoholicFrameContainersScrollFrame, true)
		AS:StripTextures(AltoholicFrameQuestsScrollFrame, true)
		AS:StripTextures(AltoholicFrameRecipesScrollFrame, true)

		AS:StyleButton(AltoholicTabCharacters.Characters)
		AS:CreateBackdrop(AltoholicTabCharacters.Characters)
		AS:SkinTexture(AltoholicTabCharacters.Characters.Icon)

		local Buttons = {
			'CharactersIcon',
			'BagsIcon',
			'QuestsIcon',
			'TalentsIcon',
			'AuctionIcon',
			'MailIcon',
			'SpellbookIcon',
			'ProfessionsIcon',
			'GarrisonIcon'
		}

		for _, Button in pairs(Buttons) do
			AS:StyleButton(AltoholicTabCharacters_MenuIcons[Button])
			AS:CreateBackdrop(AltoholicTabCharacters_MenuIcons[Button])
			AS:SkinTexture(AltoholicTabCharacters_MenuIcons[Button].Icon)
		end

		for i = 1, 7 do
			for j = 1, 14 do
				local Button = AltoholicFrameContainers['Entry'..i]['Item'..j]
				AS:SkinTexture(Button.Icon)
				AS:SkinFrame(Button)
				Button.Icon:SetInside()
				hooksecurefunc(Button, 'Show', function(self)
					if self.id then
						local quality = select(3, GetItemInfo(self.id))
						if quality and quality > 1 then
							local r, g, b = GetItemQualityColor(quality)
							self:SetBackdropBorderColor(r, g, b, 1)
						else
							self:SetBackdropBorderColor(unpack(AS.BorderColor))
						end
					else
						self:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				end)
			end
		end
	end

	if addon == "Altoholic_Search" then
		AS:SkinBackdropFrame(AltoholicFrameSearch, true)
		AS:StripTextures(AltoholicFrameSearch.ScrollFrame, true)
		AS:StripTextures(AltoholicTabSearch.ScrollFrame, true)
		AS:SkinScrollBar(AltoholicFrameSearch.ScrollFrame.ScrollBar)
		AS:SkinScrollBar(AltoholicTabSearch.ScrollFrame.ScrollBar)
		AS:SkinDropDownBox(AltoholicTabSearch_SelectRarity)
		AS:SkinDropDownBox(AltoholicTabSearch_SelectSlot)
		AS:SkinDropDownBox(AltoholicTabSearch_SelectLocation)
		AltoholicTabSearch_SelectRarity:Size(125, 32)
		AltoholicTabSearch_SelectSlot:Size(125, 32)
		AltoholicTabSearch_SelectLocation:Size(175, 32)
		AS:SkinEditBox(AltoholicTabSearch.MinLevel)
		AS:SkinEditBox(AltoholicTabSearch.MaxLevel)

		for i = 1, 15 do
			AS:SkinButton(AltoholicTabSearch['Entry'..i], true)
		end

		for i = 1, 8 do
			AS:SkinButton(AltoholicTabSearch["SortButtons"]["Sort"..i])
		end

		for i = 1, 7 do
			local Button = AltoholicFrameSearch['Entry'..i].Item
			AS:SkinTexture(Button.Icon)
			AS:SkinFrame(Button)
			Button.Icon:SetInside()
			hooksecurefunc(Button:GetParent(), 'Show', function(self)
				if self:GetID() then
					local ItemID = Altoholic.Search:GetResult((self:GetID())).id
					if ItemID then
						local Quality = select(3, GetItemInfo(ItemID))
						if Quality and Quality > 1 then
							self.Item:SetBackdropBorderColor(GetItemQualityColor(Quality))
						else
							self.Item:SetBackdropBorderColor(unpack(AS.BorderColor))
						end
					end
				else
					self.Item:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
		end
	end

	if addon == "Altoholic_Guild" then
		AS:SkinFrame(AltoholicTabGuild.Members)
		AS:SkinFrame(AltoholicTabGuild.Bank)
		AS:SkinScrollBar(AltoholicTabGuild.Members.ScrollFrame.ScrollBar)
		AS:StripTextures(AltoholicTabGuild.Members.ScrollFrame, true)

		for i = 1, 2 do
			AS:SkinButton(AltoholicTabGuild['MenuItem'..i], true)
		end

		for i = 1, 7 do
			for j = 1, 14 do
				local Button = AltoholicTabGuild.Bank['Entry'..i]['Item'..j]
				AS:SkinTexture(Button.Icon)
				AS:SkinFrame(Button)
				Button.Icon:SetInside()
				hooksecurefunc(Button:GetParent(), 'Show', function(self)
					if self.id then
						local quality = select(3, GetItemInfo(self.id))
						if quality and quality > 1 then
							local r, g, b = GetItemQualityColor(quality)
							self:SetBackdropBorderColor(r, g, b, 1)
						else
							self:SetBackdropBorderColor(unpack(AS.BorderColor))
						end
					else
						self:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				end)
			end
		end

		for i = 1, 19 do
			local Button = AltoholicTabGuild.Members['Item'..i]
			AS:SkinTexture(Button.Icon)
			AS:SkinFrame(Button)
			Button.Icon:SetInside()
			hooksecurefunc(Button, 'Show', function(self)
				if self.id then
					local quality = select(3, GetItemInfo(self.id))
					if quality and quality > 1 then
						local r, g, b = GetItemQualityColor(quality)
						self:SetBackdropBorderColor(r, g, b, 1)
					else
						self:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				else
					self:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
		end

		for i = 1, 5 do
			AS:SkinButton(AltoholicTabGuild["SortButtons"]["Sort"..i])
		end
	end

	if addon == "Altoholic_Achievements" then
		AS:StripTextures(AltoholicFrameAchievements.ScrollFrame, true)
		AS:StripTextures(AltoholicTabAchievements.ScrollFrame, true)
		AS:SkinScrollBar(AltoholicFrameAchievements.ScrollFrame.ScrollBar)
		AS:SkinScrollBar(AltoholicTabAchievements.ScrollFrame.ScrollBar)
		AS:SkinDropDownBox(AltoholicTabAchievements.SelectRealm)
		AltoholicTabAchievements.SelectRealm:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 205, -57)

		for i = 1, 15 do
			AS:SkinButton(AltoholicTabAchievements['Entry'..i], true)
		end

		for i = 1, 8 do
			for j = 1, 10 do
				local Button = AltoholicFrameAchievements['Entry'..i]['Item'..j]
				AS:SetTemplate(Button)
				Button.IconBorder:SetTexture('')
				AS:SkinTexture(Button.Background)
				Button.Background:SetDrawLayer('ARTWORK')
				Button.Background:SetInside()
			end
		end
	end

	if addon == "Altoholic_Agenda" then
		AS:SkinFrame(AltoholicFrameCalendarScrollFrame)
		AS:SkinScrollBar(AltoholicFrameCalendarScrollFrame.ScrollBar)
		AS:SkinNextPrevButton(AltoholicFrameCalendar_NextMonth)
		AS:SkinNextPrevButton(AltoholicFrameCalendar_PrevMonth)
		AS:SkinButton(AltoholicTabAgenda.MenuItem1, true)

		for i = 1, 14 do
			AS:StripTextures(_G["AltoholicFrameCalendarEntry"..i])
		end
	end

	if addon == "Altoholic_Grids" then
		AS:StripTextures(AltoholicFrameGrids.ScrollFrame, true)
		AS:SkinBackdropFrame(AltoholicFrameGrids)
		AS:SkinScrollBar(AltoholicFrameGrids.ScrollFrame.ScrollBar)
		AS:SkinDropDownBox(AltoholicTabGrids.SelectRealm)

		for i = 1, 8 do
			for j = 1, 11 do
				local Button = AltoholicFrameGrids['Entry'..i]['Item'..j]
				AS:SetTemplate(Button)
				Button.IconBorder:SetTexture('')
				AS:SkinTexture(Button.Background)
				Button.Background.SetTexCoord = AS.Noop
				Button.Background:SetDrawLayer('ARTWORK')
				Button.Background:SetInside()
			end
		end
	end
end

AS:RegisterSkin('Altoholic', AS.Altoholic, "ADDON_LOADED")