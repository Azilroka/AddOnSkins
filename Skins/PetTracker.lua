local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PetTracker') then return end

function AS:PetTracker()
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

	AS:StripTextures(PetTrackerMapFilter, true)
	AS:SkinEditBox(PetTrackerMapFilter)

	WorldMapFrame.UIElementsFrame.TrackingOptionsButton.Button:HookScript('OnMouseDown', function(self)
		if SushiDropdownFrame1 then
			SushiDropdownFrame1:ClearAllPoints()
			SushiDropdownFrame1:SetPoint('BOTTOMRIGHT', self, 'TOPRIGHT', 0, 4)
			if SushiDropdownFrame1.IsDone then return end
			for i = 1, SushiDropdownFrame1:GetNumChildren() do
				local Region = select(i, SushiDropdownFrame1:GetChildren())
				if Region:IsObjectType('Frame') then
					Region:SetBackdrop(nil)
					Region.SetBackdrop = AS.Noop
					AS:CreateBackdrop(SushiDropdownFrame1)
					SushiDropdownFrame1.IsDone = true
				end
			end
		end
	end)

	if AS:CheckAddOn('PetTracker_Switcher') then
		PetTrackerSwap:HookScript('OnUpdate', function(self)
			if not self.IsSkinned then
				AS:SkinFrame(self)
				AS:SkinCloseButton(PetTrackerSwapCloseButton)
				self.IsSkinned = true
			end
			AS:StripTextures(PetTrackerSwapInset)
			for i = 1, self:GetNumChildren() do
				local Region = select(i, self:GetChildren())
				if Region and Region:IsObjectType('Frame') and not Region.IsSkinned then
					local a, b, c, d, e = Region:GetPoint()
					if a == 'TOP' and c == 'TOP' and d == 0 and e == 2 then
						Region:Kill()
						Region.IsSkinned = true
					end
				end
			end
			for i = 1, 6 do
				if not _G['PetTrackerBattleSlot'..i].IsSkinned then
					AS:SetTemplate(_G['PetTrackerBattleSlot'..i], 'Transparent')
					_G['PetTrackerBattleSlot'..i].Bg:Hide()
					AS:SkinTexture(_G['PetTrackerBattleSlot'..i].Icon)
					_G['PetTrackerBattleSlot'..i].IconBorder:Hide()
					_G['PetTrackerBattleSlot'..i].Quality:Hide()
					AS:StripTextures(_G['PetTrackerBattleSlot'..i].Highlight)
					_G['PetTrackerBattleSlot'..i].Highlight:HookScript('OnShow', function() _G['PetTrackerBattleSlot'..i]:SetBackdropBorderColor(1, 1, 0) end)
					_G['PetTrackerBattleSlot'..i].Highlight:HookScript('OnHide', function() _G['PetTrackerBattleSlot'..i]:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
					AS:SkinStatusBar(_G['PetTrackerBattleSlot'..i].Health)
					AS:SkinStatusBar(_G['PetTrackerBattleSlot'..i].Xp)
					_G['PetTrackerBattleSlot'..i].IsSkinned = true
				end
			end
			for i = 1, 45 do
				local Ability = _G['PetTrackerAbilityButton'..i]
				if Ability and not Ability.IsSkinned then
					for i = 1, Ability:GetNumRegions() do
						local Region = select(i, Ability:GetRegions())
						if Region and Region:IsObjectType('Texture') then
							if Region:GetTexture() == 'Interface\\Spellbook\\Spellbook-Parts' then
								Region:SetTexture(nil)
							end
						end
					end
					AS:SkinTexture(Ability.Icon)
					Ability.IsSkinned = true
				end
			end
		end)
	end
	if AS:CheckAddOn('PetTracker_Journal') then
		LoadAddOn('Blizzard_Collections')
		AS:SkinCheckBox(PetTrackerTrackToggle)
--		AS:SkinTab(CollectionsJournalTab5)
		PetTrackerTamerJournal:HookScript('OnShow', function(self)
			if not self.IsSkinned then
				AS:StripTextures(PetTrackerTamerJournal.Count)
				AS:StripTextures(PetTrackerTamerJournal.ListInset)
				AS:SkinEditBox(PetTrackerTamerJournalSearchBox)
				AS:SkinScrollBar(PetTrackerTamerJournalListScrollBar)
				AS:SkinFrame(PetTrackerTamerJournalCard)
				AS:StripTextures(PetTrackerTamerJournal.Team.Border)
				PetTrackerTamerJournal.Team:DisableDrawLayer('BORDER')
				AS:CreateBackdrop(PetTrackerTamerJournalMap)
				PetTrackerTamerJournalMapBorder:Kill()
				AS:StripTextures(PetTrackerTamerJournalHistory)
				AS:StripTextures(PetTrackerTamerJournalHistoryLoadButton, true)
				AS:SkinButton(PetTrackerTamerJournalHistoryLoadButton)
				for i = 1, 4 do
					if _G['PetTrackerTamerJournalCardLoot'..i] then
						AS:SkinIconButton(_G['PetTrackerTamerJournalCardLoot'..i])
					end
				end
				for i = 1, 11 do
					local b = _G["PetTrackerTamerJournalListButton"..i]
					if b then
						AS:StripTextures(b)
						AS:StyleButton(b)
						AS:SetTemplate(b.model)
						b.model.quality:Hide()
						hooksecurefunc(PetTrackerTamerJournalList, 'update', function(...) b.model:SetBackdropBorderColor(b.model.quality:GetVertexColor()) end)
						b.model.levelRing:SetAlpha(0)
					end
				end
				self.IsSkinned = true
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
						if PetTrackerTamerJournal['Tab'..i] then
							AS:SetTemplate(PetTrackerTamerJournal['Tab'..i])
							PetTrackerTamerJournal['Tab'..i].TabBg:Kill()
							AS:SkinTexture(PetTrackerTamerJournal['Tab'..i].Icon)
							PetTrackerTamerJournal['Tab'..i].Icon:SetAllPoints()
							AS:StyleButton(PetTrackerTamerJournal['Tab'..i])
							PetTrackerTamerJournal['Tab'..i].Highlight:SetTexture(nil)
							PetTrackerTamerJournal['Tab'..i].Highlight:Kill()
						end
					end
					for i = 1, 15 do
						local Ability = _G['PetTrackerAbilityButton'..i]
						if Ability then
							for i = 1, Ability:GetNumRegions() do
								local Region = select(i, Ability:GetRegions())
								if Region and Region:IsObjectType('Texture') then
									if Region:GetTexture() == 'Interface\\Spellbook\\Spellbook-Parts' then
										Region:SetTexture(nil)
									end
								end
							end
							AS:StyleButton(Ability)
							AS:SkinTexture(Ability.Icon)
						end
					end
				end
			end
		end)
	end
	for i = 1, 2 do
		local MapTip = _G['PetTrackerMapTip'..i]
		if MapTip then
			AS:SkinTooltip(MapTip)
			MapTip:HookScript('OnUpdate', function(self)
				for i = 1, self:NumLines() do
					local Line = self:GetLine(i)
					local Texture, Text = strmatch(Line:GetText(), '^|T(.-)|t(.+)')
					if Texture and not strmatch(Texture, 'PetIcon') then
						Texture = strsplit(':', Texture)
						self:GetLine(i):SetFormattedText('|T%s:20:20:0:0:64:64:4:60:4:60|t %s', Texture, Text)
					end
				end
			end)
		end
	end

	AS:Delay(5, function()
		for i = 1, 6 do
			local button = _G["PetTrackerAbilityAction"..i]
			if button then
				AS:SkinIconButton(button)
				AS:SkinTexture(button.Icon)
			end
		end
	end)
end

AS:RegisterSkin('PetTracker', AS.PetTracker)
