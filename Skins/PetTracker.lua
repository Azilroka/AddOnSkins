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
					AS:SetTemplate(Slot, 'Transparent')
					AS:CreateBackdrop(Slot)
					Slot.Bg:Hide()
					AS:SkinTexture(Slot.Icon)
					Slot.Backdrop:SetFrameLevel(Slot.Backdrop:GetFrameLevel()+1)
					Slot.Backdrop:SetBackdropColor(0, 0, 0, 0)
					Slot.Backdrop:SetOutside(Slot.Icon)
					Slot.IconBorder:Hide()
					Slot.Quality:Hide()
					AS:StripTextures(Slot.Highlight)
					Slot.Highlight:HookScript('OnShow', function() Slot:SetBackdropBorderColor(1, 1, 0) end)
					Slot.Highlight:HookScript('OnHide', function() Slot:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
					AS:SkinStatusBar(Slot.Health)
					AS:SkinStatusBar(Slot.Xp)
				end

				for i = 1, 45 do
					local Ability = _G['PetTrackerAbilityButton'..i]
					if Ability then
						Ability:DisableDrawLayer("BACKGROUND")
						AS:CreateBackdrop(Ability)
						AS:SkinTexture(Ability.Icon)
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
		hooksecurefunc(PetTrackerRivalJournal, 'Startup', function(self)
			AS:SkinFrame(PetTrackerRivalJournal)
			AS:SkinTab(CollectionsJournalTab5)
			AS:SkinCheckBox(PetTrackerTrackToggle)
			for i = 1, 3 do
				if _G['PetTrackerJournalSlot'..i] then
					AS:SetTemplate(_G['PetTrackerJournalSlot'..i], 'Transparent')
					_G['PetTrackerJournalSlot'..i].Bg:Hide()
					_G['PetTrackerJournalSlot'..i].Quality:Hide()
					_G['PetTrackerJournalSlot'..i].Hover:Kill()
					--_G['PetTrackerJournalSlot'..i..'Highlight']:Kill()
					AS:SkinTexture(_G['PetTrackerJournalSlot'..i].Icon)
					_G['PetTrackerJournalSlot'..i].IconBorder:Hide()
					_G['PetTrackerJournalSlot'..i].LevelBG:Hide()
					_G['PetTrackerJournalSlot'..i].IsSkinned = true
				end
			end
		end)
	end
end

AS:RegisterSkin('PetTracker', AS.PetTracker, 'ADDON_LOADED')
