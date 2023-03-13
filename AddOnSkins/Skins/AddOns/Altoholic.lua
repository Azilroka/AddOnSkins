local AS, L, S, R = unpack(AddOnSkins)

local function SkinItemButton(obj, itemIDGetFunc)
	S:HandleIcon(obj.Icon)
	S:HandleFrame(obj)
	S:SetInside(obj.Icon)
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

function R:Altoholic(event, addon)
	if addon == "Altoholic_Summary" then
		if AltoTooltip then
			S:HandleTooltip(AltoTooltip)
		end

		S:HandleFrame(AltoholicFrame)
		S:Kill(AltoholicFramePortrait)

		S:HandleFrame(AltoMessageBox)
		S:HandleButton(AltoMessageBox.Button1)
		-- Bug in Altoholic currently
		S:HandleButton(AltoMessageBox.Button2)

		S:HandleCloseButton(AltoholicFrameCloseButton)
		S:HandleEditBox(AltoholicFrame.SearchBox, 175, 15)
		S:HandleButton(AltoholicFrame_ResetButton)
		S:HandleButton(AltoholicFrame_SearchButton)
		AltoholicFrameTab1:SetPoint("TOPLEFT", AltoholicFrame, "BOTTOMLEFT", -5, 2)
		AltoholicFrame_ResetButton:SetPoint("TOPLEFT", AltoholicFrame, "TOPLEFT", 25, -77)
		AltoholicFrame_SearchEditBox:SetPoint("TOPLEFT", AltoholicFrame, "TOPLEFT", 37, -56)
		AltoholicFrame_ResetButton:SetSize(85, 24)
		AltoholicFrame_SearchButton:SetSize(85, 24)

		S:HandleFrame(AltoholicFrameSummary)

		S:StripTextures(AltoholicFrameSummary.ScrollFrame)
		S:HandleScrollBar(AltoholicFrameSummary.ScrollFrame.ScrollBar)

		S:HandleItemButton(AltoholicTabSummary.RealmsIcon)
		S:HandleItemButton(AltoholicTabSummary.FactionIcon)
		S:HandleItemButton(AltoholicTabSummary.LevelIcon)
		S:HandleItemButton(AltoholicTabSummary.ProfessionsIcon)
		S:HandleItemButton(AltoholicTabSummary.ClassIcon)
		S:HandleItemButton(AltoholicTabSummary.RequestSharing)
		S:HandleItemButton(AltoholicTabSummary.AltoholicOptionsIcon)
		S:HandleItemButton(AltoholicTabSummary.DataStoreOptionsIcon)

		S:EnumObjects(function(index) return AltoholicTabSummary['MenuItem'..index] end, function(obj) S:HandleButton(obj, true) end)
		S:EnumObjects(function(index) return AltoholicTabSummary['SortButtons']['Sort'..index] end, function(obj) S:HandleButton(obj, true) end)
		S:EnumObjects(function(index) return _G["AltoholicFrameTab"..index] end, function(obj) S:HandleTab(obj, true) end)
	end

	if addon == "Altoholic_Characters" then
		S:HandleFrame(AltoholicFrameContainers)
		S:HandleScrollBar(AltoholicFrameContainersScrollFrame.ScrollBar)

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
				S:StyleButton(AltoholicTabCharacters_MenuIcons[Button])
				S:CreateBackdrop(AltoholicTabCharacters_MenuIcons[Button])
				S:HandleIcon(AltoholicTabCharacters_MenuIcons[Button].Icon)
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
		S:HandleFrame(AltoholicFrameSearch, true)
		S:StripTextures(AltoholicFrameSearch.ScrollFrame, true)
		S:StripTextures(AltoholicTabSearch.ScrollFrame, true)
		S:HandleScrollBar(AltoholicFrameSearch.ScrollFrame.ScrollBar)
		S:HandleScrollBar(AltoholicTabSearch.ScrollFrame.ScrollBar)
		S:HandleDropDownBox(AltoholicTabSearch_SelectRarity)
		S:HandleDropDownBox(AltoholicTabSearch_SelectSlot)
		S:HandleDropDownBox(AltoholicTabSearch_SelectLocation)
		AltoholicTabSearch_SelectRarity:SetSize(125, 32)
		AltoholicTabSearch_SelectSlot:SetSize(125, 32)
		AltoholicTabSearch_SelectLocation:SetSize(175, 32)
		S:HandleEditBox(AltoholicTabSearch.MinLevel)
		S:HandleEditBox(AltoholicTabSearch.MaxLevel)

		AS:EnumObjects(function(index) return AltoholicTabSearch['Entry'..index] end, function(obj) S:HandleButton(obj, true) end)
		AS:EnumObjects(function(index) return AltoholicTabSearch["SortButtons"]["Sort"..index] end, function(obj) S:HandleButton(obj) end)
		AS:EnumObjects(
			function(index) local obj = AltoholicFrameSearch['Entry'..index] return obj and obj.Item or nil end,
			function(obj) SkinItemButton(obj, function(self) if (self:GetID()) then return Altoholic.Search:GetResult((self:GetID())).id else return nil end end) end
		)
	end

	if addon == "Altoholic_Guild" then
		S:HandleFrame(AltoholicTabGuild.Members)
		if AltoholicTabGuild.Bank then S:HandleFrame(AltoholicTabGuild.Bank) end
		S:HandleScrollBar(AltoholicTabGuild.Members.ScrollFrame.ScrollBar)
		S:StripTextures(AltoholicTabGuild.Members.ScrollFrame, true)

		AS:EnumObjects(function(index) return AltoholicTabGuild['MenuItem'..index] end, function(obj) S:HandleButton(obj, true) end)
		AS:EnumObjects({ function(index) return AS.Retail and AltoholicTabGuild.Bank['Entry'..index] end, function(obj, index) return obj['Item'..index] end }, function(obj) SkinItemButton(obj) end)

		AS:EnumObjects(function(index) return AltoholicTabGuild.Members['Item'..index] end, function(obj) SkinItemButton(obj) end)
		AS:EnumObjects(function(index) return AltoholicTabGuild["SortButtons"]["Sort"..index] end, function(obj) S:HandleButton(obj) end)
	end

	if addon == "Altoholic_Achievements" then
		S:StripTextures(AltoholicTabAchievements.Achievements.ScrollFrame, true)
		S:StripTextures(AltoholicTabAchievements.ScrollFrame, true)
		S:HandleScrollBar(AltoholicTabAchievements.Achievements.ScrollFrame.ScrollBar)
		S:HandleScrollBar(AltoholicTabAchievements.ScrollFrame.ScrollBar)

		AS:EnumObjects(function(index) return AltoholicTabAchievements['Entry'..index] end, function(obj) return S:HandleButton(obj, true) end)
		AS:EnumObjects(
			{
				function(index) return AltoholicTabAchievements.Achievements['Entry'..index] end,
				function(obj, index) return obj['Item'..index] end,
			},
			function(obj)
				S:SetTemplate(obj)
				obj.IconBorder:SetTexture('')
				S:HandleIcon(obj.Background)
				S:SetInside(obj.Background)
			end
		)
	end

	if addon == "Altoholic_Agenda" then
		--S:HandleFrame(AltoholicFrameCalendarScrollFrame)
		--S:HandleScrollBar(AltoholicFrameCalendarScrollFrame.ScrollBar)
		S:HandleNextPrevButton(AltoholicTabAgenda.Calendar.NextMonth)
		S:HandleNextPrevButton(AltoholicTabAgenda.Calendar.PrevMonth)
		S:HandleButton(AltoholicTabAgenda.MenuItem1, true)

		AS:EnumObjects(function(index) return AltoholicTabAgenda.Calendar["Day"..index] end, function(obj) S:StripTextures(obj) end)
	end

	if addon == "Altoholic_Grids" then
		S:StripTextures(AltoholicFrameGrids.ScrollFrame, true)
		S:HandleFrame(AltoholicFrameGrids)
		S:HandleScrollBar(AltoholicFrameGrids.ScrollFrame.ScrollBar)

		AS:EnumObjects(
			{
				function(index) return AltoholicFrameGrids['Entry'..index] end,
				function(obj, index) return obj['Item'..index] end,
			},
			function(obj)
				S:SetTemplate(obj)
				obj.IconBorder:SetTexture('')
				S:HandleIcon(obj.Background)
				obj.Background.SetTexCoord = AS.Noop
				S:SetInside(obj.Background)
			end
		)
	end
end

AS:RegisterSkin('Altoholic', nil, "ADDON_LOADED")
