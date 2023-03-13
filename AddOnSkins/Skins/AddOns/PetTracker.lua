local AS, L, S, R = unpack(AddOnSkins)

function R:PetTracker(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		if not AS:CheckAddOn('Carbonite.Quests') then
			AS:Delay(1, function()
				local bar = PetTracker.Objectives.Anchor
				S:StripTextures(bar.Overlay)
				S:CreateBackdrop(bar.Overlay)
				bar.Overlay.backdrop:SetBackdropColor(0, 0, 0, 0)
				for i = 1, PetTracker.MaxQuality do
					bar.Bars[i]:SetStatusBarTexture(S.Media.StatusBar)
				end
			end)
		end

		AS:Delay(5, function()
			S:HandleTooltip(PetTracker.MapCanvas.Tip)
		end)
	end

	if addon == 'PetTracker_Battle' or IsAddOnLoaded('PetTracker_Battle') then
		AS:Delay(1, function()
			local regions = {PetBattleFrame.BottomFrame:GetChildren()}
			for _, region in ipairs(regions) do
				if region.Tag and region.Tag == 'PETTRACKER_' then
					for _, button in ipairs(region.Buttons) do
						S:HandleItemButton(button)
						S:HandleIcon(button.Icon)
					end
					break
				end
			end

			S:HandleFrame(PetTrackerSwitcher)
			S:HandleCloseButton(PetTrackerSwitcherCloseButton)
			S:StripTextures(PetTrackerSwitcher.Inset)

			for i = 1, PetTrackerSwitcher:GetNumChildren() do
				local Region = select(i, PetTrackerSwitcher:GetChildren())
				if Region and Region:IsObjectType('Frame') and Region.UpperSeparator then
					Region:Hide()
				end
			end

			for i = 1, 2 do
				for j = 1, 3 do
					local Slot = PetTrackerSwitcher[i .. j]
					S:SetTemplate(Slot)
					S:CreateBackdrop(Slot)
					Slot.Bg:Hide()
					S:HandleIcon(Slot.Icon)
					Slot.backdrop:SetFrameLevel(Slot.backdrop:GetFrameLevel()+1)
					Slot.backdrop:SetBackdropColor(0, 0, 0, 0)
					S:SetOutside(Slot.backdrop, Slot.Icon)
					Slot.IconBorder:Hide()
					Slot.Quality:Hide()
					S:StripTextures(Slot.Highlight)
					Slot.Highlight:HookScript('OnShow', function() Slot:SetBackdropBorderColor(1, .8, .1) end)
					Slot.Highlight:HookScript('OnHide', function() Slot:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
					S:HandleStatusBar(Slot.Health)
					S:HandleStatusBar(Slot.Xp)

					for _, Ability in ipairs(Slot.Abilities) do
						if not Ability.isSkinned then
							Ability:DisableDrawLayer("BACKGROUND")
							S:CreateBackdrop(Ability)
							S:HandleIcon(Ability.Icon)
							Ability.isSkinned = true
						end
					end
				end
			end
		end)
	end

	if addon == 'PetTracker_Journal' or IsAddOnLoaded('PetTracker_Journal') then
		S:HandleCheckBox(PetTrackerTrackToggle)

		if CollectionsJournalSecureTab0 then
			S:HandleTab(CollectionsJournalSecureTab0)
		else
			hooksecurefunc(PetTrackerRivalsJournal, 'OnEnable', function()
				S:HandleTab(CollectionsJournalSecureTab0)
			end)
		end

		hooksecurefunc(PetTrackerRivalsJournal, 'OnShow', function()
			S:StripTextures(CollectionsJournalCoverTab, true)

			PetTrackerRivalsJournal:HookScript("OnShow", function(self)
				AS:Delay(0, function() _G[CollectionsJournalCoverTab:GetParent():GetName()..'Text']:Hide() end)
			end)

			PetTrackerRivalsJournal:HookScript("OnHide", function(self)
				for i = 1, 5 do
					_G['CollectionsJournalTab'..i..'Text']:Show()
				end
			end)

			S:HandleFrame(PetTrackerRivalsJournal, 'Default')
			S:HandleCloseButton(PetTrackerRivalsJournal.CloseButton)
			S:HandleCheckBox(PetTrackerTrackToggle)
			S:HandleFrame(PetTrackerRivalsJournal.Card)
			S:StripTextures(PetTrackerRivalsJournal.Team)
			S:StripTextures(PetTrackerRivalsJournal.Team.Border)
			S:StripTextures(PetTrackerRivalsJournal.ListInset)
			PetTrackerRivalsJournalListButton11:SetFrameLevel(PetTrackerRivalsJournal:GetFrameLevel()-1)

			S:HandleEditBox(PetTrackerRivalsJournal.SearchBox)
			S:HandleFrame(PetTrackerRivalsJournal.Count)
			S:HandleScrollBar(PetTrackerRivalsJournalListScrollBar)

			for i = 1, 3 do
				local Slot = PetTrackerRivalsJournal.Slots[i]
				S:SetTemplate(Slot)
				Slot.Bg:Hide()
				Slot.Quality:Hide()
				S:Kill(Slot.Hover)
				S:HandleIcon(Slot.Icon)
				Slot.IconBorder:Hide()
				Slot.LevelBG:Hide()

				for _, Ability in ipairs(Slot.Abilities) do
					if not Ability.isSkinned then
						Ability:DisableDrawLayer("BACKGROUND")
						S:CreateBackdrop(Ability)
						S:HandleIcon(Ability.Icon)
						Ability.isSkinned = true
					end
				end

				S:HandleItemButton(PetTrackerRivalsJournal['Tab'..i])
			end

			for i = 1, 11 do
				local Button = _G["PetTrackerRivalsJournalListButton"..i]
				S:StripTextures(Button)
				S:CreateBackdrop(Button)
				S:SetInside(Button.backdrop, Button)
				Button.backdrop:SetBackdropColor(0, 0, 0, 0)
				Button.backdrop:SetFrameLevel(Button:GetFrameLevel() + 5)
				S:StyleButton(Button)
				S:HandleIcon(Button.icon, true)
				S:StyleButton(Button.dragButton)
				Button.dragButton.ActiveTexture:SetAlpha(0)

				Button.icon:SetPoint("LEFT", -41, 0)

				Button.model.quality:SetAlpha(0)
				Button.model.levelRing:SetAlpha(0)

				hooksecurefunc(Button.model.quality, 'SetVertexColor', function(self, r, g, b)
					Button.icon.backdrop:SetBackdropBorderColor(r, g, b)
				end)

				hooksecurefunc(Button.model.quality, 'Hide', function(self)
					Button.icon.backdrop:SetBackdropColor(unpack(S.Media.borderColor))
				end)
			end
		end)
	end
end

AS:RegisterSkin('PetTracker', nil, 'ADDON_LOADED')
