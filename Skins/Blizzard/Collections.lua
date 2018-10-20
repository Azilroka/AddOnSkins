local AS = unpack(AddOnSkins)

function AS:Blizzard_Collections(event, addon)
	if addon ~= 'Blizzard_Collections' then return end

	AS:SkinFrame(CollectionsJournal)
	CollectionsJournal.portrait:SetAlpha(0)
	AS:SkinCloseButton(CollectionsJournal.CloseButton)

	for i = 1, 5 do
		AS:SkinTab(_G["CollectionsJournalTab"..i])
	end

	-- Mount Journal
	AS:StripTextures(MountJournal)

	AS:SkinBackdropFrame(MountJournal.MountDisplay)
	MountJournal.MountDisplay.Backdrop:SetPoint('BOTTOMRIGHT', 2, -2)
	MountJournal.MountDisplay.ShadowOverlay:Hide()
	MountJournal.MountDisplay.ShadowOverlay:SetPoint('BOTTOMRIGHT', 2, -2)

	AS:SkinFrame(MountJournal.MountCount)
	AS:SkinButton(MountJournalFilterButton)

	AS:SkinIconButton(MountJournal.SummonRandomFavoriteButton)

	AS:SkinEditBox(MountJournal.searchBox)
	MountJournal.searchBox:SetPoint("TOPLEFT", MountJournal.LeftInset, 5, -10)

	AS:SkinButton(MountJournal.MountButton, true)
	MountJournal.MountButton:SetPoint('BOTTOMLEFT', '$parent', 'BOTTOMLEFT', 6, 4)

	AS:CreateBackdrop(MountJournal.ListScrollFrame)
	MountJournal.ListScrollFrame.Backdrop:SetPoint('BOTTOMRIGHT', -3, -3)
	AS:SkinScrollBar(MountJournal.ListScrollFrame.scrollBar)

	AS:SkinTexture(MountJournal.MountDisplay.InfoButton.Icon)
	AS:SkinArrowButton(MountJournal.MountDisplay.ModelScene.RotateLeftButton, 'left')
	AS:SkinArrowButton(MountJournal.MountDisplay.ModelScene.RotateRightButton, 'right')

	AS:CreateBackdrop(MountJournal.MountDisplay.InfoButton)

	MountJournal.MountDisplay.InfoButton.Backdrop:SetOutside(MountJournal.MountDisplay.InfoButton.Icon)

	for _, Button in pairs(MountJournal.ListScrollFrame.buttons) do
		AS:CreateBackdrop(Button)
		Button:SetHighlightTexture(nil)
		Button.Backdrop:SetFrameLevel(Button:GetFrameLevel())
		Button.Backdrop:SetInside(Button, 3, 3)

		Button:HookScript("OnEnter", function(self)
			self.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
		end)

		Button:HookScript("OnLeave", function(self)
			if self.selected then
				self.Backdrop:SetBackdropBorderColor(1, .8, .1)
				self.icon.Backdrop:SetBackdropBorderColor(1, .8, .1)
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)

		hooksecurefunc(Button.unusable, 'Show', function() Button.icon:SetVertexColor(.4, .1, .1) Button.Backdrop:SetBackdropColor(.4, .1, .1) end)
		hooksecurefunc(Button.unusable, 'Hide', function() Button.icon:SetVertexColor(1, 1, 1) Button.Backdrop:SetBackdropColor(unpack(AS.BackdropColor)) end)

		hooksecurefunc(Button.selectedTexture, 'Show', function()
			Button.name:SetTextColor(1, .8, .1)
			Button.Backdrop:SetBackdropBorderColor(1, .8, .1)
			Button.icon.Backdrop:SetBackdropBorderColor(1, .8, .1)
		end)

		hooksecurefunc(Button.selectedTexture, 'Hide', function()
			Button.name:SetTextColor(1, 1, 1)
			Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)

		Button.factionIcon:SetPoint('TOPRIGHT', -1, -4)
		Button.factionIcon:SetPoint('BOTTOMRIGHT', -1, 4)

		Button.icon:SetPoint("LEFT", -37, 0)
		Button.unusable:SetAlpha(0)
		Button.iconBorder:SetTexture('')
		Button.background:SetTexture('')
		Button.selectedTexture:SetTexture('')
		Button.factionIcon:SetDrawLayer('OVERLAY')

		AS:SkinTexture(Button.icon, true)
		AS:StyleButton(Button.DragButton)
	end

	-- Pet Journal
	AS:SkinFrame(PetJournal.PetCount)

	for _, Button in pairs({ 'HealPetButton', 'SummonRandomFavoritePetButton'}) do
		AS:SkinIconButton(PetJournal[Button])
	end

	AS:SkinButton(PetJournal.SummonButton, true)
	PetJournal.SummonButton:SetPoint('BOTTOMLEFT', PetJournal, 'BOTTOMLEFT', 6, 4)
	AS:SkinButton(PetJournal.FindBattleButton, true)
	AS:StripTextures(PetJournal.RightInset)
	AS:StripTextures(PetJournal.LeftInset)

	AS:SkinEditBox(PetJournal.searchBox)
	PetJournal.searchBox:SetPoint("TOPLEFT", PetJournal.LeftInset, 5, -10)

	AS:SkinButton(PetJournalFilterButton)
	AS:SkinBackdropFrame(PetJournal.listScroll)
	PetJournal.listScroll.Backdrop:SetPoint('BOTTOMRIGHT', -3, -3)

	AS:SkinScrollBar(PetJournal.listScroll.scrollBar)

	PetJournal.AchievementStatus:DisableDrawLayer("BACKGROUND")

	AS:StripTextures(PetJournal.SpellSelect)

	for _, Button in pairs(PetJournal.listScroll.buttons) do
		AS:SkinBackdropFrame(Button)
		Button:SetHighlightTexture(nil)
		Button.Backdrop:SetFrameLevel(Button:GetFrameLevel())
		Button.Backdrop:SetInside(Button, 3, 3)
		Button.name:SetPoint("TOPLEFT", Button.icon, "TOPRIGHT", 10, 2)
		Button:HookScript("OnEnter", function(self)
			self.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
		end)

		Button:HookScript("OnLeave", function(self)
			if self.selected then
				self.Backdrop:SetBackdropBorderColor(1, .8, .1)
				self.icon.Backdrop:SetBackdropBorderColor(1, .8, .1)
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)

		hooksecurefunc(Button.selectedTexture, 'Show', function()
			Button.name:SetTextColor(1, .8, .1)
			Button.Backdrop:SetBackdropBorderColor(1, .8, .1)
			Button.icon.Backdrop:SetBackdropBorderColor(1, .8, .1)
		end)

		hooksecurefunc(Button.selectedTexture, 'Hide', function()
			Button.name:SetTextColor(1, 1, 1)
			Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)

		AS:SkinTexture(Button.icon, true)
		AS:StyleButton(Button.dragButton)
		Button.dragButton.ActiveTexture:SetAlpha(0)
		Button.dragButton.levelBG:SetTexture(nil)

		Button.dragButton.level:ClearAllPoints()
		Button.dragButton.level:SetPoint("TOPLEFT", Button.name, "BOTTOMLEFT", 1, 5)

		hooksecurefunc(Button, 'Show', function(self)
			if self.dragButton.level:GetText() then
				self.dragButton.level:SetText(LEVEL..' '..self.dragButton.level:GetText(), true)
			end
		end)

		Button.petTypeIcon:SetPoint('TOPRIGHT', -4, -4)
		Button.petTypeIcon:SetPoint('BOTTOMRIGHT', -4, 4)

		Button.icon:SetPoint("LEFT", -37, 0)

		hooksecurefunc(Button.iconBorder, 'SetVertexColor', function(self, r, g, b)
			Button.icon.Backdrop:SetBackdropBorderColor(r, g, b)
		end)

		hooksecurefunc(Button.iconBorder, 'Hide', function(self)
			Button.icon.Backdrop:SetBackdropColor(unpack(AS.BorderColor))
		end)
	end

	AS:StripTextures(PetJournal.loadoutBorder)

	for i = 1, 3 do
		local Pet = PetJournal.Loadout['Pet'..i]
		AS:SkinFrame(Pet.helpFrame)
		AS:SkinFrame(Pet)
		Pet.petTypeIcon:SetPoint("BOTTOMLEFT", 2, 2)

		AS:SkinTexture(Pet.icon)
		AS:StyleButton(Pet.dragButton)
		AS:CreateBackdrop(Pet.dragButton)
		Pet.dragButton.Backdrop:SetOutside(Pet.icon)

		AS:StripTextures(Pet.setButton)
		AS:SkinStatusBar(Pet.healthFrame.healthBar)
		AS:SkinStatusBar(Pet.xpBar)

		hooksecurefunc(Pet.qualityBorder, 'SetVertexColor', function(self, r, g, b)
			Pet.dragButton.Backdrop:SetBackdropBorderColor(r, g, b)
		end)

		for index = 1, 3 do
			local Spell = PetJournal.Loadout['Pet'..i]["spell"..index]
			AS:SkinIconButton(Spell)
			Spell.FlyoutArrow:SetPoint("BOTTOM", '$parent', "BOTTOM", 0, -5)
			Spell.FlyoutArrow:SetTexture([[Interface\Buttons\ActionBarFlyoutButton]])
		end
	end

	for i = 1, 2 do
		local btn = PetJournal.SpellSelect["Spell"..i]
		AS:SkinFrame(btn)
		btn.icon:SetInside(btn)
		btn.icon:SetDrawLayer("BORDER")
		hooksecurefunc(btn, 'SetChecked', function(self, value)
			if value == true then
				btn:SetBackdropBorderColor(1, .92, 0)
			else
				btn:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	AS:SkinFrame(PetJournal.PetCard)
	AS:StripTextures(PetJournal.PetCardInset)

	--PetJournal.PetCard.PetInfo.levelBG:SetTexture(nil)
	AS:SkinTexture(PetJournal.PetCard.PetInfo.icon)
	AS:CreateBackdrop(PetJournal.PetCard.PetInfo)
	PetJournal.PetCard.PetInfo.Backdrop:SetOutside(PetJournal.PetCard.PetInfo.icon)
	PetJournal.PetCard.PetInfo.qualityBorder:SetAlpha(0)
	hooksecurefunc(PetJournal.PetCard.PetInfo.qualityBorder, 'SetVertexColor', function(self, r, g, b)
		PetJournal.PetCard.PetInfo.Backdrop:SetBackdropBorderColor(r, g, b)
	end)

	AS:SkinTooltip(PetJournalPrimaryAbilityTooltip)

	for i = 1, 6 do
		local spell = PetJournal.PetCard["spell"..i]
		AS:SkinIconButton(spell)
	end

	AS:SkinStatusBar(PetJournal.PetCard.HealthFrame.healthBar)
	AS:SkinStatusBar(PetJournal.PetCard.xpBar)
	PetJournal.loadoutBorder:SetHeight(350)

	-- Toy Box
	AS:SkinButton(ToyBoxFilterButton)

	AS:SkinEditBox(ToyBox.searchBox)

	ToyBox.searchBox:SetPoint("TOPRIGHT", ToyBox, "TOPRIGHT", -107, -35)

	AS:SkinArrowButton(ToyBox.PagingFrame.NextPageButton, 'right')
	AS:SkinArrowButton(ToyBox.PagingFrame.PrevPageButton, 'left')
	AS:StripTextures(ToyBox.iconsFrame)

	for i = 1, 18 do
		local Button = ToyBox.iconsFrame['spellButton'..i]
		AS:SkinFrame(Button)
		AS:StyleButton(Button)
		AS:SkinTexture(Button.iconTexture)
		AS:SkinTexture(Button.iconTextureUncollected)
		Button.iconTexture:SetInside()
		Button.iconTextureUncollected:SetInside()
		AS:CreateBackdrop(Button)
		Button.name:SetPoint('LEFT', Button, 'RIGHT', 9, 0)
		Button.Backdrop:SetPoint('TOPLEFT', Button, 'TOPRIGHT', 0, -2)
		Button.Backdrop:SetPoint('BOTTOMLEFT', Button, 'BOTTOMRIGHT', 0, 2)
		Button.Backdrop:SetPoint('RIGHT', Button.name, 'RIGHT', 0, 0)
	end

	hooksecurefunc("ToySpellButton_UpdateButton", function(self)
		self.name.SetTextColor = nil
		if (PlayerHasToy(self.itemID)) then
			local quality = select(3, GetItemInfo(self.itemID))
			local r, g, b = 1, 1, 1
			if quality then
				r, g, b = GetItemQualityColor(quality)
			end
			self:SetBackdropBorderColor(r, g, b)
			self.name:SetTextColor(r, g, b)
		else
			self:SetBackdropBorderColor(unpack(AS.BorderColor))
			self.name:SetTextColor(.6, .6, .6)
		end
		self.name.SetTextColor = AS.Noop
	end)

	AS:SkinStatusBar(ToyBox.progressBar)

	-- Heirlooms
	AS:SkinStatusBar(HeirloomsJournal.progressBar)

	AS:SkinEditBox(HeirloomsJournal.SearchBox)
	HeirloomsJournal.SearchBox:SetPoint("TOPRIGHT", HeirloomsJournal, "TOPRIGHT", -107, -35)

	AS:SkinButton(HeirloomsJournalFilterButton)

	AS:SkinDropDownBox(HeirloomsJournal.filterDropDown)
	AS:SkinDropDownBox(HeirloomsJournal.classDropDown)

	AS:StripTextures(HeirloomsJournal.iconsFrame)

	AS:SkinArrowButton(HeirloomsJournal.PagingFrame.NextPageButton, 'right')
	AS:SkinArrowButton(HeirloomsJournal.PagingFrame.PrevPageButton, 'left')

	hooksecurefunc(HeirloomsJournal, 'UpdateButton', function(_, Button)
		if not Button.Backdrop then
			AS:SetTemplate(Button)
			AS:StyleButton(Button)
			AS:SkinTexture(Button.iconTexture)
			Button.iconTexture:SetDrawLayer("ARTWORK")
			AS:SkinTexture(Button.iconTextureUncollected)
			Button.iconTexture:SetInside()
			Button.iconTextureUncollected:SetInside()
			AS:CreateBackdrop(Button)
			Button.Backdrop:SetPoint('TOPLEFT', Button, 'TOPRIGHT', 0, -2)
			Button.Backdrop:SetPoint('BOTTOMLEFT', Button, 'BOTTOMRIGHT', 0, 2)
			Button.Backdrop:SetPoint('RIGHT', Button.name, 'RIGHT', 2, 0)
			Button.slotFrameCollected:SetAlpha(0)
			Button.slotFrameUncollected:SetAlpha(0)
		end

		Button.levelBackground:SetTexture(nil)

		Button.SetTextColor = nil
		if C_Heirloom.PlayerHasHeirloom(Button.itemID) then
			Button.name:SetTextColor(1, 1, 1)
			Button.special:SetTextColor(1, .82, 0)
			Button:SetBackdropBorderColor(GetItemQualityColor(7))
		else
			Button:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
		Button.SetTextColor = AS.Noop
	end)

	-- Wardrobe Collections

	AS:SkinStatusBar(WardrobeCollectionFrame.progressBar)

	AS:SkinButton(WardrobeCollectionFrame.SetsTab)
	AS:SkinButton(WardrobeCollectionFrame.ItemsTab)

	AS:SkinEditBox(WardrobeCollectionFrame.searchBox)
	AS:SkinButton(WardrobeCollectionFrame.FilterButton)
	WardrobeCollectionFrame.FilterButton:SetPoint('LEFT', WardrobeCollectionFrame.searchBox, 'RIGHT', 2, 0)

	for _, Frame in ipairs(WardrobeCollectionFrame.ContentFrames) do
		AS:SkinFrame(Frame)
		if Frame.Models then
			for _, Model in pairs(Frame.Models) do
				AS:SkinBackdropFrame(Model)
				Model:SetFrameLevel(Model:GetFrameLevel() + 2)
				Model.Backdrop:SetPoint('BOTTOMRIGHT', 2, -1)
				Model.Border:Kill()
				hooksecurefunc(Model.Border, 'SetAtlas', function(self, texture)
					local r, g, b
					if texture == "transmog-wardrobe-border-uncollected" then
						r, g, b = 1, 1, 0
					elseif texture == "transmog-wardrobe-border-unusable" then
						r, g, b =  1, 0, 0
					else
						r, g, b = unpack(AS.BorderColor)
					end
					Model.Backdrop:SetBackdropBorderColor(r, g, b)
				end)
			end
		end
		if Frame.PagingFrame then
			AS:SkinArrowButton(Frame.PagingFrame.NextPageButton, 'right')
			AS:SkinArrowButton(Frame.PagingFrame.PrevPageButton, 'left')
		end
	end

	AS:SkinDropDownBox(WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropDown)

	AS:StripTextures(WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame)
	AS:SkinScrollBar(WardrobeCollectionFrame.SetsCollectionFrame.ScrollFrame.scrollBar)
	AS:SkinButton(WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsButton)

	-- Transmog Frame
	AS:SkinFrame(WardrobeFrame)
	AS:SkinCloseButton(WardrobeFrame.CloseButton)
	AS:SkinDropDownBox(WardrobeTransmogFrame.OutfitDropDown)
	AS:SkinButton(WardrobeTransmogFrame.OutfitDropDown.SaveButton)
	WardrobeTransmogFrame.OutfitDropDown.SaveButton:SetHeight(20)
	WardrobeTransmogFrame.OutfitDropDown.SaveButton:SetPoint("LEFT", WardrobeTransmogFrame.OutfitDropDown, "RIGHT", -11, -5)
	AS:SkinBackdropFrame(WardrobeOutfitFrame)
	WardrobeOutfitFrame.Backdrop:SetInside(WardrobeOutfitFrame, 8, 8)

	AS:SkinFrame(WardrobeTransmogFrame)
	AS:CreateBackdrop(WardrobeTransmogFrame.MoneyMiddle)

	for _, Button in pairs(WardrobeTransmogFrame.Model.SlotButtons) do
		AS:SkinBackdropFrame(Button)
		AS:SkinTexture(Button.Icon)
		Button.Icon:SetAllPoints()
		Button.StatusBorder:SetOutside(Button, 4, 4)
		Button.PendingFrame.Ants:SetOutside(Button, 4, 4)
		Button.PendingFrame.Glow:SetOutside(Button, 12, 12)
		Button:SetFrameLevel(Button:GetFrameLevel() + 2)
		Button.Border:Kill()
		Button.NoItemTexture:SetTexture([[Interface\Transmogrify\Textures]])
	end

	AS:SkinButton(WardrobeTransmogFrame.SpecButton)
	AS:SkinButton(WardrobeTransmogFrame.ApplyButton)

	WardrobeTransmogFrame.SpecButton:SetPoint("RIGHT", WardrobeTransmogFrame.ApplyButton, "LEFT", -2, 0)
	WardrobeTransmogFrame.ApplyButton:SetPoint('BOTTOMRIGHT', WardrobeTransmogFrame, 'BOTTOMRIGHT', 0, -23)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_Collections", AS.Blizzard_Collections, 'ADDON_LOADED')