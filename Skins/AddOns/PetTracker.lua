local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PetTracker') then return end

function AS:PetTracker(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		if not AS:CheckAddOn('Carbonite.Quests') then
			AS:Delay(1, function()
				local bar = PetTracker.Objectives.Anchor
				AS:StripTextures(bar.Overlay)
				AS:CreateBackdrop(bar.Overlay)
				bar.Overlay.Backdrop:SetBackdropColor(0, 0, 0, 0)
				for i = 1, PetTracker.MaxQuality do
					bar.Bars[i]:SetStatusBarTexture(AS.NormTex)
				end
			end)
		end

		AS:Delay(5, function()
			AS:SkinTooltip(PetTracker.MapCanvas.Tip)
		end)
	end

	if addon == 'PetTracker_Battle' or IsAddOnLoaded('PetTracker_Battle') then
		AS:Delay(1, function()
			local regions = {PetBattleFrame.BottomFrame:GetChildren()}
			for _, region in ipairs(regions) do
				if region.Tag and region.Tag == 'PETTRACKER_' then
					for _, button in ipairs(region.Buttons) do
						AS:SkinIconButton(button)
						AS:SkinTexture(button.Icon)
					end
					break
				end
			end

			AS:SkinFrame(PetTrackerSwitcher)
			AS:SkinCloseButton(PetTrackerSwitcherCloseButton)
			AS:StripTextures(PetTrackerSwitcher.Inset)

			for i = 1, PetTrackerSwitcher:GetNumChildren() do
				local Region = select(i, PetTrackerSwitcher:GetChildren())
				if Region and Region:IsObjectType('Frame') and Region.UpperSeparator then
					Region:Hide()
				end
			end

			for i = 1, 2 do
				for j = 1, 3 do
					local Slot = PetTrackerSwitcher[i .. j]
					AS:SetTemplate(Slot)
					AS:CreateBackdrop(Slot)
					Slot.Bg:Hide()
					AS:SkinTexture(Slot.Icon)
					Slot.Backdrop:SetFrameLevel(Slot.Backdrop:GetFrameLevel()+1)
					Slot.Backdrop:SetBackdropColor(0, 0, 0, 0)
					AS:SetOutside(Slot.Backdrop, Slot.Icon)
					Slot.IconBorder:Hide()
					Slot.Quality:Hide()
					AS:StripTextures(Slot.Highlight)
					Slot.Highlight:HookScript('OnShow', function() Slot:SetBackdropBorderColor(1, .8, .1) end)
					Slot.Highlight:HookScript('OnHide', function() Slot:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
					AS:SkinStatusBar(Slot.Health)
					AS:SkinStatusBar(Slot.Xp)

					for _, Ability in ipairs(Slot.Abilities) do
						if not Ability.isSkinned then
							Ability:DisableDrawLayer("BACKGROUND")
							AS:CreateBackdrop(Ability)
							AS:SkinTexture(Ability.Icon)
							Ability.isSkinned = true
						end
					end
				end
			end
		end)
	end

	if addon == 'PetTracker_Journal' or IsAddOnLoaded('PetTracker_Journal') then
		AS:SkinCheckBox(PetTrackerTrackToggle)

		if CollectionsJournalSecureTab0 then
			AS:SkinTab(CollectionsJournalSecureTab0)
		else
			hooksecurefunc(PetTrackerRivalsJournal, 'OnEnable', function()
				AS:SkinTab(CollectionsJournalSecureTab0)
			end)
		end

		hooksecurefunc(PetTrackerRivalsJournal, 'OnShow', function()
			AS:StripTextures(CollectionsJournalCoverTab, true)

			PetTrackerRivalsJournal:HookScript("OnShow", function(self)
				AS:Delay(0, function() _G[CollectionsJournalCoverTab:GetParent():GetName()..'Text']:Hide() end)
			end)

			PetTrackerRivalsJournal:HookScript("OnHide", function(self)
				for i = 1, 5 do
					_G['CollectionsJournalTab'..i..'Text']:Show()
				end
			end)

			AS:SkinFrame(PetTrackerRivalsJournal, 'Default')
			AS:SkinCloseButton(PetTrackerRivalsJournal.CloseButton)
			AS:SkinCheckBox(PetTrackerTrackToggle)
			AS:SkinFrame(PetTrackerRivalsJournal.Card)
			AS:StripTextures(PetTrackerRivalsJournal.Team)
			AS:StripTextures(PetTrackerRivalsJournal.Team.Border)
			AS:StripTextures(PetTrackerRivalsJournal.ListInset)
			PetTrackerRivalsJournalListButton11:SetFrameLevel(PetTrackerRivalsJournal:GetFrameLevel()-1)

			AS:SkinEditBox(PetTrackerRivalsJournal.SearchBox)
			AS:SkinFrame(PetTrackerRivalsJournal.Count)
			AS:SkinScrollBar(PetTrackerRivalsJournalListScrollBar)

			for i = 1, 3 do
				local Slot = PetTrackerRivalsJournal.Slots[i]
				AS:SetTemplate(Slot)
				Slot.Bg:Hide()
				Slot.Quality:Hide()
				AS:Kill(Slot.Hover)
				AS:SkinTexture(Slot.Icon)
				Slot.IconBorder:Hide()
				Slot.LevelBG:Hide()

				for _, Ability in ipairs(Slot.Abilities) do
					if not Ability.isSkinned then
						Ability:DisableDrawLayer("BACKGROUND")
						AS:CreateBackdrop(Ability)
						AS:SkinTexture(Ability.Icon)
						Ability.isSkinned = true
					end
				end

				AS:SkinIconButton(PetTrackerRivalsJournal['Tab'..i])
			end

			for i = 1, 11 do
				local Button = _G["PetTrackerRivalsJournalListButton"..i]
				AS:StripTextures(Button)
				AS:CreateBackdrop(Button)
				AS:SetInside(Button.Backdrop, Button)
				Button.Backdrop:SetBackdropColor(0, 0, 0, 0)
				Button.Backdrop:SetFrameLevel(Button:GetFrameLevel() + 5)
				AS:StyleButton(Button)
				AS:SkinTexture(Button.icon, true)
				AS:StyleButton(Button.dragButton)
				Button.dragButton.ActiveTexture:SetAlpha(0)

				Button.icon:SetPoint("LEFT", -41, 0)

				Button.model.quality:SetAlpha(0)
				Button.model.levelRing:SetAlpha(0)

				hooksecurefunc(Button.model.quality, 'SetVertexColor', function(self, r, g, b)
					Button.icon.Backdrop:SetBackdropBorderColor(r, g, b)
				end)

				hooksecurefunc(Button.model.quality, 'Hide', function(self)
					Button.icon.Backdrop:SetBackdropColor(unpack(AS.BorderColor))
				end)
			end
		end)
	end
end

AS:RegisterSkin('PetTracker', AS.PetTracker, 'ADDON_LOADED')
