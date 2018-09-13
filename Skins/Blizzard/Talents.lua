local AS = unpack(AddOnSkins)

local AddOnSkinned = 0
function AS:Blizzard_Talent(event, addon)
	if (addon == 'Blizzard_TalentUI' or IsAddOnLoaded('Blizzard_TalentUI')) then
		AS:UnregisterSkinEvent('Blizzard_Talent', 'ADDON_LOADED')

		AS:SkinFrame(PlayerTalentFrame, nil, nil, true)
		AS:StripTextures(PlayerTalentFrameInset)
		AS:SkinCloseButton(PlayerTalentFrame.CloseButton)

		for _, Button in pairs({ PlayerTalentFrameTalentsTutorialButton, PlayerTalentFrameSpecializationTutorialButton, PlayerTalentFramePetSpecializationTutorialButton }) do
			Button.Ring:Hide()
			Button:SetPoint("TOPLEFT", PlayerTalentFrame, "TOPLEFT", -12, 12)
		--	Button:Kill()
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

				_G["PlayerTalentFrameSpecializationSpecButton"..i.."Glow"]:Kill()

				AS:SkinBackdropFrame(Button, nil, true)
				Button.Backdrop:SetPoint("TOPLEFT", 70, 2)
				Button.Backdrop:SetPoint("BOTTOMRIGHT", 4, -2)

				Button.bg:SetAlpha(0)
				Button.ring:SetAlpha(0)
				Button.learnedTex:SetAlpha(0)
				Button.selectedTex:SetAlpha(0)
				Button.specIcon:SetTexture(icon)
				AS:SkinTexture(Button.specIcon)
				Button:SetHighlightTexture(nil)

				Button.specIcon.border = CreateFrame("Frame", nil, Button)
				Button.specIcon.border:SetOutside(Button.specIcon)
				AS:SetTemplate(Button.specIcon.border)
				Button.specIcon.border:SetBackdropColor(0, 0, 0, 0)

				Button:HookScript('OnEnter', function(self)
					self.Backdrop:SetBackdropBorderColor(1, .82, 0)
					self.specIcon.border:SetBackdropBorderColor(1, .82, 0)
				end)
				Button:HookScript('OnLeave', function(self)
					if self.selected then
						self.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
						self.specIcon.border:SetBackdropBorderColor(unpack(AS.Color))
					else
						self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
						self.specIcon.border:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				end)
			end

			AS:CreateBackdrop(Frame.spellsScroll)
			Frame.spellsScroll.child.gradient:Kill()
			Frame.spellsScroll.child.scrollwork_topleft:SetAlpha(0)
			Frame.spellsScroll.child.scrollwork_topright:SetAlpha(0)
			Frame.spellsScroll.child.scrollwork_bottomleft:SetAlpha(0)
			Frame.spellsScroll.child.scrollwork_bottomright:SetAlpha(0)
			Frame.spellsScroll.child.ring:SetAlpha(0)
			Frame.spellsScroll.child.Seperator:SetAlpha(0)

			Frame.spellsScroll.Backdrop:SetOutside(Frame.spellsScroll.child.specIcon)
		end

		hooksecurefunc("PlayerTalentFrame_UpdateSpecFrame", function(self, spec)
			local playerTalentSpec = GetSpecialization(nil, self.isPet, PlayerSpecTab2:GetChecked() and 2 or 1)
			local shownSpec = spec or playerTalentSpec or 1
			local id, _, _, icon = GetSpecializationInfo(shownSpec, nil, self.isPet)
			local scrollChild = self.spellsScroll.child
			scrollChild.specIcon:SetTexture(icon)
			AS:SkinTexture(scrollChild.specIcon)

			local index = 1
			local bonuses
			local bonusesIncrement = 1
			if self.isPet then
				bonuses = {GetSpecializationSpells(shownSpec, nil, self.isPet, true)}
				bonusesIncrement = 2
			else
				bonuses = C_SpecializationInfo.GetSpellsDisplay(id)
			end

			for i = 1, 4 do
				local Button = self['specButton'..i]
				if Button.selected then
					Button.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
					Button.specIcon.border:SetBackdropBorderColor(unpack(AS.Color))
				else
					Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					Button.specIcon.border:SetBackdropBorderColor(unpack(AS.BorderColor))
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

						if not frame.Backdrop then
							AS:CreateBackdrop(frame)
							frame.Backdrop:SetOutside(frame.icon)
							frame.ring:Hide()
							AS:SkinTexture(frame.icon)
							frame.icon:SetSize(40, 40)
						end

						frame.subText:SetTextColor(1, 1, 0)
					end

					index = index + 1
				end
			end
		end)

		AS:StripTextures(PlayerTalentFrameTalents, true)
		AS:SkinButton(PlayerTalentFrameTalents.PvpTalentButton)

		for i = 1, MAX_TALENT_TIERS do
			local Row = PlayerTalentFrameTalents['tier'..i]
			AS:StripTextures(Row, true)
			Row.GlowFrame:Kill()

			for j = 1, NUM_TALENT_COLUMNS do
				local Button = Row['talent'..j]

				AS:SkinBackdropFrame(Button)
				AS:CreateShadow(Button.Backdrop, true)
				Button.Backdrop.Shadow:SetBackdropBorderColor(unpack(AS.Color))
				Button.GlowFrame.TopGlowLine = Button.Backdrop.Shadow
				Button.GlowFrame.TopGlowLine:Hide()
				Button.GlowFrame.BottomGlowLine:Kill()

				Button.GlowFrame:HookScript('OnShow', function(self) self.TopGlowLine:Show() Button.Backdrop.Shadow:Show() end)
				Button.GlowFrame:HookScript('OnHide', function(self) self.TopGlowLine:Hide() Button.Backdrop.Shadow:Hide() end)

				Button:SetFrameLevel(Button:GetFrameLevel() + 2)
				Button.Backdrop:SetPoint("TOPLEFT", 15, -1)
				Button.Backdrop:SetPoint("BOTTOMRIGHT", -10, 1)

				Button.Border = CreateFrame("Frame", nil, Button)
				AS:SkinFrame(Button.Border)
				Button.knownSelection:SetAlpha(0)
				Button.Border:SetBackdropColor(0, 0, 0, 0)
				Button.Border:SetOutside(Button.icon)
				Button.icon:SetSize(32, 32)
				Button.icon:SetDrawLayer("ARTWORK")
				AS:SkinTexture(Button.icon)
				Button:HookScript('OnEnter', function(self)
					self.Backdrop:SetBackdropBorderColor(1, .82, 0)
					self.Border:SetBackdropBorderColor(1, .82, 0)
				end)
				Button:HookScript('OnLeave', function(self)
					if self.knownSelection:IsShown() then
						self.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
						self.Border:SetBackdropBorderColor(unpack(AS.Color))
					else
						self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
						self.Border:SetBackdropBorderColor(unpack(AS.BorderColor))
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
						Talent.Border:SetBackdropBorderColor(unpack(AS.Color))
					else
						Talent.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
						Talent.Border:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				end
			end
		end)

		local PvpTalentFrame = PlayerTalentFrameTalents.PvpTalentFrame
		AS:StripTextures(PvpTalentFrame)

		for _, Button in pairs(PvpTalentFrame.Slots) do
			AS:CreateBackdrop(Button)
			Button.Backdrop:SetOutside(Button.Texture)

			Button.Arrow:SetAlpha(0)
			Button.Border:Hide()

			hooksecurefunc(Button, "Update", function(self)
				local slotInfo = C_SpecializationInfo.GetPvpTalentSlotInfo(self.slotIndex);
				if (not slotInfo) then
					return;
				end

				if (slotInfo.enabled) then
					AS:SkinTexture(self.Texture)
					if (not slotInfo.selectedTalentID) then
						self.Texture:SetTexture([[Interface\Icons\INV_Misc_QuestionMark]])
						self.Backdrop:SetBackdropBorderColor(1, 1, 0, 1)
					else
						self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				else
					self.Texture:SetTexture([[Interface\PetBattles\PetBattle-LockIcon]])
					self.Texture:SetTexCoord(0, 1, 0, 1)
					self.Texture:SetDesaturated(true)
					self.Texture:Show()
					self.Backdrop:SetBackdropBorderColor(1, 0, 0, 1)
				end
			end)
		end

		PvpTalentFrame.Swords:SetSize(72, 67)
		PvpTalentFrame.OrbModelScene:SetAlpha(0)
		PvpTalentFrame.Orb:Hide()
		PvpTalentFrame.Ring:Hide()

		AS:SkinBackdropFrame(PvpTalentFrame.TalentList)
		AS:StripTextures(PvpTalentFrame.TalentList.Inset)

		PvpTalentFrame.TalentList:SetPoint("BOTTOMLEFT", PlayerTalentFrame, "BOTTOMRIGHT", 5, 26)

		AS:SkinButton(AS:FindChildFrameBySize(PlayerTalentFrameTalents.PvpTalentFrame.TalentList, 'Button', 100, 22), true)

		for _, Button in pairs(PvpTalentFrame.TalentList.ScrollFrame.buttons) do
			Button:DisableDrawLayer("BACKGROUND")
			AS:SkinTexture(Button.Icon)
			AS:StyleButton(Button)
			AS:CreateBackdrop(Button, 'Transparent')
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

		AS:SkinFrame(TalentMicroButtonAlert)
		TalentMicroButtonAlert:SetBackdropBorderColor(1, 1, 0)
		AS:CreateShadow(TalentMicroButtonAlert)
		AS:SkinCloseButton(TalentMicroButtonAlert.CloseButton)
		TalentMicroButtonAlert.CloseButton:ClearAllPoints()
		TalentMicroButtonAlert.CloseButton:SetPoint("TOPRIGHT", 6, 1)
		TalentMicroButtonAlert.Text:SetTextColor(1, 1, 0)
		TalentMicroButtonAlert:ClearAllPoints()
		TalentMicroButtonAlert:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -6)
	end
end

AS:RegisterSkin('Blizzard_Talent', AS.Blizzard_Talent, 'ADDON_LOADED')
