local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PetTracker') then return end

function AS:PetTracker(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		if not AS:CheckAddOn('Carbonite.Quests') then
			--AS:CreateBackdrop(PetTrackerProgressBar)
			AS:Delay(1, function()
				AS:StripTextures(PetTrackerProgressBar1.Overlay)
				AS:CreateBackdrop(PetTrackerProgressBar1.Overlay)
				PetTrackerProgressBar1.Overlay.Backdrop:SetBackdropColor(0,0,0,0)
				for i = 1, PetTracker.MaxQuality do
					PetTrackerProgressBar1.Bars[i]:SetStatusBarTexture(AS.NormTex)
				end
			end)
		end

		if AS:CheckAddOn('PetTracker_Switcher') then
			AS:SkinFrame(PetTrackerSwitcher)
			AS:SkinCloseButton(PetTrackerSwitcherCloseButton)
			AS:StripTextures(PetTrackerSwitcher.Inset)

			hooksecurefunc(PetTrackerSwitcher, 'Initialize', function()
				for i = 1, PetTrackerSwitcher:GetNumChildren() do
					local Region = select(i, PetTrackerSwitcher:GetChildren())
					if Region and Region:IsObjectType('Frame') and Region.UpperSeparator then
						Region:Hide()
					end
				end

				for i = 1, 6 do
					local Slot = _G['PetTrackerBattleSlot'..i]
					AS:SetTemplate(Slot)
					AS:CreateBackdrop(Slot)
					Slot.Bg:Hide()
					AS:SkinTexture(Slot.Icon)
					Slot.Backdrop:SetFrameLevel(Slot.Backdrop:GetFrameLevel()+1)
					Slot.Backdrop:SetBackdropColor(0, 0, 0, 0)
					Slot.Backdrop:SetOutside(Slot.Icon)
					Slot.IconBorder:Hide()
					Slot.Quality:Hide()
					AS:StripTextures(Slot.Highlight)
					Slot.Highlight:HookScript('OnShow', function() Slot:SetBackdropBorderColor(1, .8, .1) end)
					Slot.Highlight:HookScript('OnHide', function() Slot:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
					AS:SkinStatusBar(Slot.Health)
					AS:SkinStatusBar(Slot.Xp)
				end

				for i = 1, 45 do
					local Ability = _G['PetTrackerAbilityButton'..i]
					if Ability and not Ability.isSkinned then
						Ability:DisableDrawLayer("BACKGROUND")
						AS:CreateBackdrop(Ability)
						AS:SkinTexture(Ability.Icon)
						Ability.isSkinned = true
					end
				end
			end)
		end

		AS:Delay(5, function()
			AS:SkinTooltip(PetTracker.MapCanvas.tip)
			for i = 1, 6 do
				local button = _G["PetTrackerAbilityAction"..i]
				if button then
					AS:SkinIconButton(button)
					AS:SkinTexture(button.Icon)
				end
			end
		end)
	end

	if addon == 'PetTracker_Journal' then
		AS:SkinTab(CollectionsJournalSecureTab0)
		hooksecurefunc(PetTrackerRivalJournal, 'Startup', function()
			AS:StripTextures(CollectionsJournalCoverTab, true)

			PetTrackerRivalJournal:HookScript("OnShow", function(self)
				AS:Delay(0, function() _G[CollectionsJournalCoverTab:GetParent():GetName()..'Text']:Hide() end)
			end)

			PetTrackerRivalJournal:HookScript("OnHide", function(self)
				for i = 1, 5 do
					_G['CollectionsJournalTab'..i..'Text']:Show()
				end
			end)

			AS:SkinFrame(PetTrackerRivalJournal, 'Default')
			AS:SkinCloseButton(PetTrackerRivalJournal.CloseButton)
			AS:SkinCheckBox(PetTrackerTrackToggle)
			AS:SkinFrame(PetTrackerRivalJournal.Card)
			AS:StripTextures(PetTrackerRivalJournal.Team)
			AS:StripTextures(PetTrackerRivalJournal.Team.Border)
			AS:StripTextures(PetTrackerRivalJournal.ListInset)
			PetTrackerRivalJournalListButton11:SetFrameLevel(PetTrackerRivalJournal:GetFrameLevel()-1)

			AS:SkinEditBox(PetTrackerRivalJournal.SearchBox)
			AS:SkinFrame(PetTrackerRivalJournal.Count)
			AS:SkinScrollBar(PetTrackerRivalJournalListScrollBar)

			for i = 1, 3 do
				local Slot = _G['PetTrackerJournalSlot'..i]
				AS:SetTemplate(Slot)
				Slot.Bg:Hide()
				Slot.Quality:Hide()
				AS:Kill(Slot.Hover)
				--AS:Kill(_G['PetTrackerJournalSlot'..i..'Highlight'])
				AS:SkinTexture(Slot.Icon)
				Slot.IconBorder:Hide()
				Slot.LevelBG:Hide()

				AS:SkinIconButton(PetTrackerRivalJournal['Tab'..i])
			end

			for i = 1, 11 do
				local Button = _G["PetTrackerRivalJournalListButton"..i]
				AS:StripTextures(Button)
				AS:CreateBackdrop(Button)
				AS:SkinFrame(Button.Backdrop)
				Button.Backdrop:SetInside(Button)
				Button.Backdrop:SetBackdropColor(0, 0, 0, 0)
				Button.Backdrop:SetFrameLevel(Button:GetFrameLevel() + 5)
				AS:StyleButton(Button)
				AS:SkinTexture(Button.icon)
				AS:StyleButton(Button.dragButton)
				Button.dragButton.ActiveTexture:SetAlpha(0)

				Button.iconbg = CreateFrame('Frame', nil, Button)
				AS:SetTemplate(Button.iconbg)
				Button.iconbg:SetFrameLevel(Button.dragButton:GetFrameLevel() - 2)
				Button.iconbg:SetOutside(Button.icon)

				Button.icon:SetPoint("LEFT", -41, 0)
				Button.icon:SetDrawLayer('ARTWORK')

				Button.model.quality:SetAlpha(0)
				Button.model.levelRing:SetAlpha(0)

				hooksecurefunc(Button.model.quality, 'SetVertexColor', function(self, r, g, b, a)
					Button.iconbg:SetBackdropBorderColor(r, g, b)
				end)

				hooksecurefunc(Button.model.quality, 'Hide', function(self)
					Button.iconbg:SetBackdropColor(unpack(AS.BorderColor))
				end)
			end

			for i = 1, 45 do
				local Ability = _G['PetTrackerAbilityButton'..i]
				if Ability and not Ability.isSkinned then
					Ability:DisableDrawLayer("BACKGROUND")
					AS:CreateBackdrop(Ability)
					AS:SkinTexture(Ability.Icon)
					Ability.isSkinned = true
				end
			end
		end)
	end
end

AS:RegisterSkin('PetTracker', AS.PetTracker, 'ADDON_LOADED')
