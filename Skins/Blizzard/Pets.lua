local AS = unpack(AddOnSkins)

function AS:Blizzard_PetJournal(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		AS:StripTextures(PetStableFrame)
		AS:SkinFrame(PetStableFrame)
		PetStableFrame:CreateShadow()
		AS:StripTextures(PetStableFrameInset)
		AS:StripTextures(PetStableLeftInset)
		AS:StripTextures(PetStableBottomInset)
		AS:SkinCloseButton(PetStableFrameCloseButton)
		AS:SkinNextPrevButton(PetStablePrevPageButton)
		AS:SkinNextPrevButton(PetStableNextPageButton)

		AS:CreateBackdrop(PetStableModel)
		AS:CreateBackdrop(PetStablePetInfo)
		PetStablePetInfo.Backdrop:SetOutside(PetStableSelectedPetIcon)
		AS:SkinTexture(PetStableSelectedPetIcon)
		PetStableSelectedPetIcon:Size(36)

		for i = 1, 5 do
			local Button = _G["PetStableActivePet"..i]
			local Icon = _G["PetStableActivePet"..i..'IconTexture']
			AS:SkinTexture(Icon)
			Icon:SetInside()
			Button.Border:Hide()
			Button.Background:Hide()
			AS:SetTemplate(Button)
			AS:StyleButton(Button)
			Button.Checked:SetAlpha(0)
			hooksecurefunc(Button.Checked, 'Show', function()
				Button:SetBackdropBorderColor(0, 0.44, .87)
			end)
			hooksecurefunc(Button.Checked, 'Hide', function()
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end)
		end
		
		for i = 1, 10 do
			local Button = _G["PetStableStabledPet"..i]
			local Icon = _G["PetStableStabledPet"..i..'IconTexture']
			AS:SkinTexture(Icon)
			Icon:SetInside()
			Button.Background:Hide()
			AS:SetTemplate(Button)
			AS:StyleButton(Button)
			Button.Checked:SetAlpha(0)
			hooksecurefunc(Button.Checked, 'Show', function()
				Button:SetBackdropBorderColor(0, 0.44, .87)
			end)
			hooksecurefunc(Button.Checked, 'Hide', function()
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end)
		end
	end
	if event == 'PLAYER_ENTERING_WORLD' and IsAddOnLoaded('Blizzard_PetJournal') or addon == 'Blizzard_PetJournal' then
		if PetJournalParent.IsSkinned then return end
		AS:UnregisterSkinEvent('Blizzard_PetJournal', 'ADDON_LOADED')
		AS:SkinFrame(PetJournalParent)
		PetJournalParent.IsSkinned = true
		PetJournalParentPortrait:Hide()

		for i = 1, 3 do
			AS:SkinTab(_G["PetJournalParentTab"..i])
		end

		AS:SkinCloseButton(PetJournalParentCloseButton)

		AS:StripTextures(MountJournal)
		AS:StripTextures(MountJournal.LeftInset)
		AS:StripTextures(MountJournal.RightInset)
		AS:StripTextures(MountJournal.MountDisplay)
		AS:StripTextures(MountJournal.MountDisplay.ShadowOverlay)
		AS:StripTextures(MountJournal.MountCount)
		AS:SkinButton(MountJournalMountButton, true)
		AS:StripTextures(MountJournalFilterButton, true)
		AS:SkinButton(MountJournalFilterButton)
		AS:SkinScrollBar(MountJournalListScrollFrameScrollBar)
		AS:SkinRotateButton(MountJournal.MountDisplay.ModelFrame.RotateLeftButton)
		AS:SkinRotateButton(MountJournal.MountDisplay.ModelFrame.RotateRightButton)
		AS:SkinTexture(MountJournal.MountDisplay.InfoButton.Icon)
		AS:CreateBackdrop(MountJournal.MountDisplay.InfoButton)
		MountJournal.MountDisplay.InfoButton.Backdrop:SetOutside(MountJournal.MountDisplay.InfoButton.Icon)
		AS:SkinEditBox(MountJournalSearchBox)
		MountJournalSearchBox:SetPoint("TOPLEFT", MountJournal.LeftInset, 5, -9)

		AS:SkinButton(MountJournal.SummonRandomFavoriteButton)
		AS:StyleButton(MountJournal.SummonRandomFavoriteButton)
		AS:SkinTexture(MountJournal.SummonRandomFavoriteButton.texture)
		MountJournal.SummonRandomFavoriteButton.texture:SetInside()
		MountJournalSummonRandomFavoriteButtonBorder:SetTexture(nil)

		for i = 1, #MountJournal.ListScrollFrame.buttons do
			local Button = _G["MountJournalListScrollFrameButton"..i]
			AS:CreateBackdrop(Button)
			AS:SkinFrame(Button.Backdrop)
			Button.Backdrop:SetInside(Button)
			AS:HideInset(Button.Backdrop)
			Button.Backdrop:SetBackdropBorderColor(0,0,0,0)

			Button.icon:SetPoint("LEFT", -41, 0)

			Button.background:SetAtlas(nil)
			Button.selectedTexture:SetAlpha(0)
			Button.factionIcon:SetDrawLayer('OVERLAY')

			AS:StyleButton(Button)
			AS:SkinTexture(Button.icon)
			AS:StyleButton(Button.DragButton)

			Button.DragButton.hover:SetAllPoints(Button.DragButton)
			Button.DragButton.ActiveTexture:SetAlpha(0)
			Button.iconbg = CreateFrame('Frame', nil, Button)
			AS:SetTemplate(Button.iconbg)
			Button.iconbg:SetFrameLevel(Button.DragButton:GetFrameLevel() - 2)
			Button.iconbg:SetOutside(Button.icon)
			Button.icon:SetDrawLayer('ARTWORK')
		end

		local function ColorSelectedMount()
			for i = 1, #MountJournal.ListScrollFrame.buttons do
				local Button = _G["MountJournalListScrollFrameButton"..i]
				if Button.iconbg then
					Button.name:SetTextColor(1, 1, 1)
					Button.iconbg:SetBackdropBorderColor(unpack(AS.BorderColor))
					if Button.selectedTexture:IsShown() then
						Button.name:SetTextColor(1, 1, 0)
						Button.iconbg:SetBackdropBorderColor(1, 1, 0)
					elseif Button.DragButton.ActiveTexture:IsShown() then
						Button.name:SetTextColor(0, 0.44, .87)
						Button.iconbg:SetBackdropBorderColor(0, 0.44, .87)
					end
				end
			end
		end
		hooksecurefunc("MountJournal_UpdateMountList", ColorSelectedMount)

		MountJournalListScrollFrame:HookScript("OnVerticalScroll", ColorSelectedMount)
		MountJournalListScrollFrame:HookScript("OnMouseWheel", ColorSelectedMount)

		AS:StripTextures(PetJournalSummonButton)
		AS:StripTextures(PetJournalFindBattle)
		AS:SkinButton(PetJournalSummonButton)
		AS:SkinButton(PetJournalFindBattle)
		AS:StripTextures(PetJournalRightInset)
		AS:StripTextures(PetJournalLeftInset)

		AS:StripTextures(PetJournal.PetCount)
		AS:SkinEditBox(PetJournalSearchBox)
		PetJournalSearchBox:SetPoint("TOPLEFT", PetJournal.LeftInset, 5, -9)
		AS:StripTextures(PetJournalFilterButton, true)
		AS:SkinButton(PetJournalFilterButton)
		AS:StripTextures(PetJournalListScrollFrame)
		AS:SkinScrollBar(PetJournalListScrollFrameScrollBar)
		
		for i = 1, #PetJournal.listScroll.buttons do
			local Button = _G["PetJournalListScrollFrameButton"..i]
			local LevelBG = _G["PetJournalListScrollFrameButton"..i.."LevelBG"]
			AS:StripTextures(Button)
			AS:CreateBackdrop(Button)
			AS:SkinFrame(Button.Backdrop)
			Button.Backdrop:SetInside(Button)
			AS:HideInset(Button.Backdrop)
			Button.Backdrop:SetBackdropBorderColor(0,0,0,0)
			AS:StyleButton(Button)
			AS:SkinTexture(Button.icon)
			AS:StyleButton(Button.dragButton)
			Button.dragButton.hover:SetAllPoints(Button.dragButton)
			Button.dragButton.ActiveTexture:SetAlpha(0)

			Button.iconbg = CreateFrame('Frame', nil, Button)
			AS:SetTemplate(Button.iconbg)
			Button.iconbg:SetFrameLevel(Button.dragButton:GetFrameLevel() - 2)
			Button.iconbg:SetOutside(Button.icon)
	
			Button.icon:SetPoint("LEFT", -41, 0)
			Button.icon:SetDrawLayer('ARTWORK')
			LevelBG:SetTexture(nil)

			hooksecurefunc(Button.iconBorder, 'SetVertexColor', function(self, r, g, b, a)
				Button.iconbg:SetBackdropBorderColor(r, g, b)
			end)

			hooksecurefunc(Button.iconBorder, 'Hide', function(self)
				Button.iconbg:SetBackdropColor(unpack(AS.BorderColor))
			end)
		end

		PetJournalAchievementStatus:DisableDrawLayer("BACKGROUND")

		AS:SkinButton(PetJournalHealPetButton)
		AS:StyleButton(PetJournalHealPetButton)
		AS:SkinTexture(PetJournalHealPetButton.texture)
		PetJournalHealPetButton.texture:SetInside()
		PetJournalHealPetButtonBorder:SetTexture(nil)
		AS:StripTextures(PetJournalLoadoutBorder)

		for i = 1, 3 do
			local Pet = _G["PetJournalLoadoutPet"..i]
			AS:StripTextures(Pet.helpFrame)
			AS:SkinFrame(Pet)
			Pet.petTypeIcon:SetPoint("BOTTOMLEFT", 2, 2)

			AS:SkinTexture(Pet.icon)
			AS:StyleButton(Pet.dragButton)
			AS:CreateBackdrop(Pet.dragButton)
			Pet.dragButton.Backdrop:SetOutside(Pet.icon)

			AS:StripTextures(Pet.setButton)
			AS:SkinStatusBar(Pet.healthFrame.healthBar)
			AS:SkinStatusBar(Pet.xpBar)

			for index = 1, 3 do
				local Spell = _G["PetJournalLoadoutPet"..i.."Spell"..index]
				AS:SkinIconButton(Spell)
				Spell.FlyoutArrow:SetTexture([[Interface\Buttons\ActionBarFlyoutButton]])
				_G["PetJournalLoadoutPet"..i.."Spell"..index.."Icon"]:SetInside(Spell)
			end
		end

		AS:StripTextures(PetJournalSpellSelect)
		for i = 1, 2 do
			local btn = _G["PetJournalSpellSelectSpell"..i]
			AS:SkinButton(btn)
			_G["PetJournalSpellSelectSpell"..i.."Icon"]:SetInside(btn)
			_G["PetJournalSpellSelectSpell"..i.."Icon"]:SetDrawLayer("BORDER")
		end

		AS:SkinFrame(PetJournalPetCard)
		AS:StripTextures(PetJournalPetCardInset)

		PetJournalTutorialButton.Ring:SetAlpha(0)
		PetJournalTutorialButton:ClearAllPoints()
		PetJournalTutorialButton:SetPoint("TOPLEFT", PetJournalParent, 0, 0)

		PetJournalPetCardPetInfo.levelBG:SetTexture(nil)
		AS:SkinTexture(PetJournalPetCardPetInfoIcon)
		AS:CreateBackdrop(PetJournalPetCardPetInfo)
		PetJournalPetCardPetInfo.Backdrop:SetOutside(PetJournalPetCardPetInfoIcon)

		local tt = PetJournalPrimaryAbilityTooltip
		tt.Background:SetTexture(nil)
		if tt.Delimiter1 then
			tt.Delimiter1:SetTexture(nil)
			tt.Delimiter2:SetTexture(nil)
		end
		tt.BorderTop:SetTexture(nil)
		tt.BorderTopLeft:SetTexture(nil)
		tt.BorderTopRight:SetTexture(nil)
		tt.BorderLeft:SetTexture(nil)
		tt.BorderRight:SetTexture(nil)
		tt.BorderBottom:SetTexture(nil)
		tt.BorderBottomRight:SetTexture(nil)
		tt.BorderBottomLeft:SetTexture(nil)
		AS:SetTemplate(tt, 'Transparent')

		for i = 1, 6 do
			local frame = _G["PetJournalPetCardSpell"..i]
			frame:SetFrameLevel(frame:GetFrameLevel() + 2)
			frame:DisableDrawLayer("BACKGROUND")
			AS:CreateBackdrop(frame, 'Default')
			frame.Backdrop:SetAllPoints()
			AS:SkinTexture(frame.icon)
			frame.icon:SetInside(frame.Backdrop)
		end

		AS:SkinStatusBar(PetJournalPetCardHealthFrame.healthBar)
		AS:SkinStatusBar(PetJournalPetCardXPBar)
		PetJournalLoadoutBorder:Height(350)

		AS:StripTextures(ToyBoxFilterButton, true)
		AS:SkinButton(ToyBoxFilterButton)
		AS:SkinEditBox(ToyBoxSearchBox)

		ToyBoxSearchBox:SetPoint("TOPRIGHT", ToyBox, "TOPRIGHT", -117, -34)

		AS:SkinNextPrevButton(ToyBoxNextPageButton)
		AS:SkinNextPrevButton(ToyBoxPrevPageButton)

		AS:StripTextures(ToyBoxIconsFrame)

		for i = 1, 18 do
			local Button = _G["ToySpellButton"..i]
			local Icon = _G["ToySpellButton"..i.."IconTexture"]
			AS:SkinTexture(Icon)
			Icon:SetInside()
			AS:SkinFrame(Button)
			AS:StyleButton(Button)
			Button.hover:SetAllPoints(Icon)
			Button.checked:SetAllPoints(Icon)
			Button.pushed:SetAllPoints(Icon)
			_G["ToySpellButton"..i.."Cooldown"]:SetAllPoints(Icon)
		end

		hooksecurefunc("ToySpellButton_UpdateButton", function(self)
			if (PlayerHasToy(self.itemID)) then
				local quality = select(3, GetItemInfo(self.itemID))
				local r, g, b = GetItemQualityColor(quality)
				_G[self:GetName()]:SetBackdropBorderColor(r, g, b)
				_G[self:GetName().."ToyName"]:SetTextColor(r, g, b)
			else
				_G[self:GetName()]:SetBackdropBorderColor(unpack(AS.BorderColor))
				_G[self:GetName().."ToyName"]:SetTextColor(0.6, 0.6, 0.6)
			end
		end)

		AS:SkinStatusBar(ToyBoxProgressBar)
	end
end

AS:RegisterSkin("Blizzard_PetJournal", AS.Blizzard_PetJournal, 'ADDON_LOADED')