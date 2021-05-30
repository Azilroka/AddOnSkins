local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Altoholic') then return end

local function SkinItemButton(obj, itemIDGetFunc)
	AS:SkinTexture(obj.Icon)
	AS:SkinFrame(obj)
	AS:SetInside(obj.Icon)
	hooksecurefunc(obj:GetParent(), 'Show', function(self)
		if self:GetID() then
			local ItemID = itemIDGetFunc and itemIDGetFunc(self) or self.id
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

function AS:Altoholic(event, addon)
	if addon == "Altoholic_Summary" then
		if AltoTooltip then
			AS:SkinTooltip(AltoTooltip)
		end

		AS:SkinFrame(AltoholicFrame)
		AS:Kill(AltoholicFramePortrait)

		AS:SkinFrame(AltoMessageBox)
		AS:SkinButton(AltoMessageBox.ButtonYes)
		-- Bug in Altoholic currently
		AS:SkinButton(_G["ButtonNo"] or AltoMessageBox.ButtonNo)

		AS:SkinCloseButton(AltoholicFrameCloseButton)
		AS:SkinEditBox(AltoholicFrame_SearchEditBox, 175, 15)
		AS:SkinButton(AltoholicFrame_ResetButton)
		AS:SkinButton(AltoholicFrame_SearchButton)
		AltoholicFrameTab1:SetPoint("TOPLEFT", AltoholicFrame, "BOTTOMLEFT", -5, 2)
		AltoholicFrame_ResetButton:SetPoint("TOPLEFT", AltoholicFrame, "TOPLEFT", 25, -77)
		AltoholicFrame_SearchEditBox:SetPoint("TOPLEFT", AltoholicFrame, "TOPLEFT", 37, -56)
		AltoholicFrame_ResetButton:SetSize(85, 24)
		AltoholicFrame_SearchButton:SetSize(85, 24)

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

		AS:EnumObjects(function(index) return AltoholicTabSummary['MenuItem'..index] end, function(obj) AS:SkinButton(obj, true) end)
		AS:EnumObjects(function(index) return AltoholicTabSummary['SortButtons']['Sort'..index] end, function(obj) AS:SkinButton(obj, true) end)
		AS:EnumObjects(function(index) return _G["AltoholicFrameTab"..index] end, function(obj) AS:SkinTab(obj, true) end)
	end

	if addon == "Altoholic_Characters" then
		AS:SkinFrame(AltoholicFrameContainers)
		AS:SkinScrollBar(AltoholicFrameContainersScrollFrame.ScrollBar)

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
			if AltoholicTabCharacters_MenuIcons[Button] then
				AS:StyleButton(AltoholicTabCharacters_MenuIcons[Button])
				AS:CreateBackdrop(AltoholicTabCharacters_MenuIcons[Button])
				AS:SkinTexture(AltoholicTabCharacters_MenuIcons[Button].Icon)
			end
		end

		AS:EnumObjects(
			{
				function(index) return AltoholicFrameContainers['Entry'..index] end,
				function(obj, index) return obj['Item'..index] end
			},
			function(obj) SkinItemButton(obj) end
		)
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
		AltoholicTabSearch_SelectRarity:SetSize(125, 32)
		AltoholicTabSearch_SelectSlot:SetSize(125, 32)
		AltoholicTabSearch_SelectLocation:SetSize(175, 32)
		AS:SkinEditBox(AltoholicTabSearch.MinLevel)
		AS:SkinEditBox(AltoholicTabSearch.MaxLevel)

		AS:EnumObjects(function(index) return AltoholicTabSearch['Entry'..index] end, function(obj) AS:SkinButton(obj, true) end)
		AS:EnumObjects(function(index) return AltoholicTabSearch["SortButtons"]["Sort"..index] end, function(obj) AS:SkinButton(obj) end)
		AS:EnumObjects(
			function(index) local obj = AltoholicFrameSearch['Entry'..index] return obj and obj.Item or nil end,
			function(obj) SkinItemButton(obj, function(self) if (self:GetID()) then return Altoholic.Search:GetResult((self:GetID())).id else return nil end end) end
		)
	end

	if addon == "Altoholic_Guild" then
		AS:SkinFrame(AltoholicTabGuild.Members)
		if AltoholicTabGuild.Bank then AS:SkinFrame(AltoholicTabGuild.Bank) end
		AS:SkinScrollBar(AltoholicTabGuild.Members.ScrollFrame.ScrollBar)
		AS:StripTextures(AltoholicTabGuild.Members.ScrollFrame, true)

		AS:EnumObjects(function(index) return AltoholicTabGuild['MenuItem'..index] end, function(obj) AS:SkinButton(obj, true) end)
		AS:EnumObjects({ function(index) return AS.Retail and AltoholicTabGuild.Bank['Entry'..index] end, function(obj, index) return obj['Item'..index] end }, function(obj) SkinItemButton(obj) end)

		AS:EnumObjects(function(index) return AltoholicTabGuild.Members['Item'..index] end, function(obj) SkinItemButton(obj) end)
		AS:EnumObjects(function(index) return AltoholicTabGuild["SortButtons"]["Sort"..index] end, function(obj) AS:SkinButton(obj) end)
	end

	if addon == "Altoholic_Achievements" then
		AS:StripTextures(AltoholicTabAchievements.Achievements.ScrollFrame, true)
		AS:StripTextures(AltoholicTabAchievements.ScrollFrame, true)
		AS:SkinScrollBar(AltoholicTabAchievements.Achievements.ScrollFrame.ScrollBar)
		AS:SkinScrollBar(AltoholicTabAchievements.ScrollFrame.ScrollBar)

		AS:EnumObjects(function(index) return AltoholicTabAchievements['Entry'..index] end, function(obj) return AS:SkinButton(obj, true) end)
		AS:EnumObjects(
			{
				function(index) return AltoholicTabAchievements.Achievements['Entry'..index] end,
				function(obj, index) return obj['Item'..index] end,
			},
			function(obj)
				AS:SetTemplate(obj)
				obj.IconBorder:SetTexture('')
				AS:SkinTexture(obj.Background)
				AS:SetInside(obj.Background)
			end
		)
	end

	if addon == "Altoholic_Agenda" then
		--AS:SkinFrame(AltoholicFrameCalendarScrollFrame)
		--AS:SkinScrollBar(AltoholicFrameCalendarScrollFrame.ScrollBar)
		AS:SkinArrowButton(AltoholicTabAgenda.Calendar.NextMonth)
		AS:SkinArrowButton(AltoholicTabAgenda.Calendar.PrevMonth)
		AS:SkinButton(AltoholicTabAgenda.MenuItem1, true)

		AS:EnumObjects(function(index) return AltoholicTabAgenda.Calendar["Day"..index] end, function(obj) AS:StripTextures(obj) end)
	end

	if addon == "Altoholic_Grids" then
		AS:StripTextures(AltoholicFrameGrids.ScrollFrame, true)
		AS:SkinBackdropFrame(AltoholicFrameGrids)
		AS:SkinScrollBar(AltoholicFrameGrids.ScrollFrame.ScrollBar)

		AS:EnumObjects(
			{
				function(index) return AltoholicFrameGrids['Entry'..index] end,
				function(obj, index) return obj['Item'..index] end,
			},
			function(obj)
				AS:SetTemplate(obj)
				obj.IconBorder:SetTexture('')
				AS:SkinTexture(obj.Background)
				obj.Background.SetTexCoord = AS.Noop
				AS:SetInside(obj.Background)
			end
		)
	end
end

AS:RegisterSkin('Altoholic', AS.Altoholic, "ADDON_LOADED")
