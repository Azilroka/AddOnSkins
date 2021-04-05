if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_TalentUI(event, addon)
	if addon ~= 'Blizzard_TalentUI' then return end

	AS:SkinFrame(PlayerTalentFrame, nil, nil, true)
	AS:SkinCloseButton(PlayerTalentFrame.CloseButton)

	for _, Button in pairs({ PlayerTalentFrameTalentsTutorialButton, PlayerTalentFrameSpecializationTutorialButton, PlayerTalentFramePetSpecializationTutorialButton }) do
		Button.Ring:Hide()
		Button:SetPoint("TOPLEFT", PlayerTalentFrame, "TOPLEFT", -12, 12)
	--	AS:Kill(Button)
	end

	AS:SkinButton(PlayerTalentFrameActivateButton, true)
	AS:SkinButton(PlayerTalentFrameSpecializationLearnButton, true)

	for i = 1, NUM_TALENT_FRAME_TABS do
		AS:SkinTab(_G["PlayerTalentFrameTab"..i])
	end

	for _, Frame in pairs({ PlayerTalentFrameSpecialization, PlayerTalentFramePetSpecialization }) do
		AS:StripTextures(Frame, true)

		for _, Child in pairs({Frame:GetChildren()}) do
			if Child:IsObjectType("Frame") and not Child:GetName() then
				AS:StripTextures(Child)
			end
		end

		for i = 1, 4 do
			local Button = Frame['specButton'..i]
			local _, _, _, icon = GetSpecializationInfo(i, false, Frame.isPet)

			AS:Kill(_G["PlayerTalentFrameSpecializationSpecButton"..i.."Glow"])

			AS:SkinBackdropFrame(Button, nil, true)
			Button.Backdrop:SetPoint("TOPLEFT", 70, 2)
			Button.Backdrop:SetPoint("BOTTOMRIGHT", 4, -2)

			Button.bg:SetAlpha(0)
			Button.ring:SetAlpha(0)
			Button.learnedTex:SetAlpha(0)
			Button.selectedTex:SetAlpha(0)
			Button.specIcon:SetTexture(icon)
			AS:SkinTexture(Button.specIcon, true)
			Button:SetHighlightTexture(nil)

			Button:HookScript('OnEnter', function(self)
				self.Backdrop:SetBackdropBorderColor(1, .82, 0)
				self.specIcon.Backdrop:SetBackdropBorderColor(1, .82, 0)
			end)
			Button:HookScript('OnLeave', function(self)
				if self.selected then
					self.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
					self.specIcon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				else
					self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					self.specIcon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
		end

		AS:CreateBackdrop(Frame.spellsScroll)
		AS:Kill(Frame.spellsScroll.child.gradient)
		Frame.spellsScroll.child.scrollwork_topleft:SetAlpha(0)
		Frame.spellsScroll.child.scrollwork_topright:SetAlpha(0)
		Frame.spellsScroll.child.scrollwork_bottomleft:SetAlpha(0)
		Frame.spellsScroll.child.scrollwork_bottomright:SetAlpha(0)
		Frame.spellsScroll.child.ring:SetAlpha(0)
		Frame.spellsScroll.child.Seperator:SetAlpha(0)

		AS:SetOutside(Frame.spellsScroll.Backdrop, Frame.spellsScroll.child.specIcon)
	end

	for i = 1, MAX_TALENT_TIERS do
		local Row = PlayerTalentFrameTalents['tier'..i]
		AS:StripTextures(Row, true)
		AS:Kill(Row.GlowFrame)

		for j = 1, NUM_TALENT_COLUMNS do
			local Button = Row['talent'..j]

			AS:SkinBackdropFrame(Button)
			AS:CreateShadow(Button.Backdrop, true)

			if Button.Backdrop.Shadow then
				Button.Backdrop.Shadow:SetBackdropBorderColor(unpack(AS.Color))

				Button.GlowFrame.TopGlowLine = Button.Backdrop.Shadow
				Button.GlowFrame.TopGlowLine:Hide()
				AS:Kill(Button.GlowFrame.BottomGlowLine)

				Button.GlowFrame:HookScript('OnShow', function(self) self.TopGlowLine:Show() Button.Backdrop.Shadow:Show() end)
				Button.GlowFrame:HookScript('OnHide', function(self) self.TopGlowLine:Hide() Button.Backdrop.Shadow:Hide() end)
			end

			Button:SetFrameLevel(Button:GetFrameLevel() + 2)
			Button.Backdrop:SetPoint("TOPLEFT", 15, -1)
			Button.Backdrop:SetPoint("BOTTOMRIGHT", -10, 1)

			Button.knownSelection:SetAlpha(0)

			AS:CreateBackdrop(Button.icon)
			AS:SkinTexture(Button.icon)

			Button.icon:SetSize(32, 32)

			Button:HookScript('OnEnter', function(self)
				self.Backdrop:SetBackdropBorderColor(1, .82, 0)
				self.icon.Backdrop:SetBackdropBorderColor(1, .82, 0)
			end)

			Button:HookScript('OnLeave', function(self)
				if self.knownSelection:IsShown() then
					self.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
					self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				else
					self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
		end
	end

	hooksecurefunc("TalentFrame_Update", function(self)
		for i = 1, MAX_TALENT_TIERS do
			for j = 1, NUM_TALENT_COLUMNS do
				local Talent = self['tier'..i]['talent'..j]
				if Talent.knownSelection:IsShown() then
					Talent.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
					Talent.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				else
					Talent.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					Talent.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
		end
	end)

	hooksecurefunc("PlayerTalentFrame_UpdateSpecFrame", function(self, spec)
		local playerTalentSpec = GetSpecialization(nil, self.isPet, PlayerSpecTab2:GetChecked() and 2 or 1)
		local shownSpec = spec or playerTalentSpec or 1
		local sex = self.isPet and UnitSex("pet") or UnitSex("player")
		local id, _, _, icon = GetSpecializationInfo(shownSpec, nil, self.isPet, nil, sex)
		local scrollChild = self.spellsScroll.child
		scrollChild.specIcon:SetTexture(icon)
		AS:SkinTexture(scrollChild.specIcon)

		local index = 1
		local bonuses
		local bonusesIncrement = 1
		if self.isPet then
			bonuses = {GetSpecializationSpells(shownSpec, nil, self.isPet, true)}
			bonusesIncrement = 2
		elseif id then
			bonuses = C_SpecializationInfo.GetSpellsDisplay(id)
		end

		for i = 1, 4 do
			local Button = self['specButton'..i]
			if Button.selected then
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				Button.specIcon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.specIcon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end

		if bonuses then
			for i = 1, #bonuses, bonusesIncrement do
				local frame = scrollChild["abilityButton"..index]

				if frame then
					local _, spellTex = GetSpellTexture(bonuses[i])
					if spellTex then
						frame.icon:SetTexture(spellTex)
					end

					AS:SkinTexture(frame.icon, true)

					frame.ring:Hide()
					frame.icon:SetSize(40, 40)
					frame.subText:SetTextColor(1, .8, .1)
				end

				index = index + 1
			end
		end
	end)

	AS:StripTextures(PlayerTalentFrameTalents, true)
	PlayerTalentFrameTalents.PvpTalentButton:HookScript("OnShow", function(self) AS:SkinArrowButton(self, self.currentlyExpanded and 'left' or 'right') end)
	PlayerTalentFrameTalents.PvpTalentButton:HookScript("PostClick", function(self) AS:SkinArrowButton(self, self.currentlyExpanded and 'left' or 'right') end)

	local PvpTalentFrame = PlayerTalentFrameTalents.PvpTalentFrame
	AS:StripTextures(PvpTalentFrame)

	for _, Button in pairs(PvpTalentFrame.Slots) do
		AS:CreateBackdrop(Button.Texture)

		Button.Arrow:SetAlpha(0)
		Button.Border:Hide()

		hooksecurefunc(Button, "Update", function(self)
			local slotInfo = C_SpecializationInfo.GetPvpTalentSlotInfo(self.slotIndex)
			if (not slotInfo) then
				return
			end

			if (slotInfo.enabled) then
				AS:SkinTexture(self.Texture)
				if (not slotInfo.selectedTalentID) then
					self.Texture:SetTexture([[Interface\Icons\INV_Misc_QuestionMark]])
					self.Texture.Backdrop:SetBackdropBorderColor(1, 1, 0, 1)
				else
					self.Texture.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			else
				self.Texture:SetTexture([[Interface\PetBattles\PetBattle-LockIcon]])
				self.Texture:SetTexCoord(0, 1, 0, 1)
				self.Texture:SetDesaturated(true)
				self.Texture:Show()
				self.Texture.Backdrop:SetBackdropBorderColor(1, 0, 0, 1)
			end
		end)
	end

	PvpTalentFrame.Swords:SetSize(72, 67)
	PvpTalentFrame.OrbModelScene:SetAlpha(0)
	PvpTalentFrame.Orb:Hide()
	PvpTalentFrame.Ring:Hide()

	AS:SkinBackdropFrame(PvpTalentFrame.TalentList)

	PvpTalentFrame.TalentList:SetPoint("BOTTOMLEFT", PlayerTalentFrame, "BOTTOMRIGHT", 5, 26)

	AS:SkinButton(AS:FindChildFrameBySize(PlayerTalentFrameTalents.PvpTalentFrame.TalentList, 'Button', 100, 22), true)

	for _, Button in pairs(PvpTalentFrame.TalentList.ScrollFrame.buttons) do
		Button:DisableDrawLayer("BACKGROUND")
		AS:SkinTexture(Button.Icon)
		AS:StyleButton(Button)
		AS:CreateBackdrop(Button)
		Button.Selected:SetTexture("")
		Button.Backdrop:SetAllPoints()
	end

	hooksecurefunc(PvpTalentFrame.TalentList, "Update", function(self)
		for _, Button in pairs(PvpTalentFrame.TalentList.ScrollFrame.buttons) do
			if Button.Selected:IsShown() then
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end
	end)

	AS:SkinScrollBar(PvpTalentFrame.TalentList.ScrollFrame.ScrollBar)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_TalentUI', AS.Blizzard_TalentUI, 'ADDON_LOADED')
