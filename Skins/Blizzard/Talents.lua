local AS = unpack(AddOnSkins)

local AddOnSkinned = 0
function AS:Blizzard_Talent(event, addon)
	if (addon == 'Blizzard_TalentUI' or IsAddOnLoaded('Blizzard_TalentUI')) then
		AS:UnregisterSkinEvent('Blizzard_Talent', 'ADDON_LOADED')

		AS:SkinFrame(PlayerTalentFrame, nil, nil, true)
		AS:StripTextures(PlayerTalentFrameInset)
		AS:StripTextures(PlayerTalentFrameTalents, true)
		AS:SkinCloseButton(PlayerTalentFrameCloseButton)

		PlayerTalentFramePortrait:Kill()

		for _, Button in pairs({ PlayerTalentFrameTalentsTutorialButton, PlayerTalentFrameSpecializationTutorialButton, PlayerTalentFramePetSpecializationTutorialButton }) do
			Button.Ring:Hide()
			Button:SetPoint("TOPLEFT", PlayerTalentFrame, "TOPLEFT", -12, 12)
			Button:Kill()
		end

		AS:SkinButton(PlayerTalentFrameActivateButton, true)
		AS:SkinButton(PlayerTalentFrameSpecializationLearnButton, true)

		for i = 1, 6 do
			select(i, PlayerTalentFrameSpecialization:GetRegions()):Hide()
		end

		for i = 1, 5 do
			select(i, PlayerTalentFrameSpecializationSpellScrollFrameScrollChild:GetRegions()):Hide()
		end

		select(7, PlayerTalentFrameSpecialization:GetChildren()):DisableDrawLayer("OVERLAY")

		PlayerTalentFrameSpecializationSpellScrollFrameScrollChild.Seperator:SetColorTexture(1, 1, 1)
		PlayerTalentFrameSpecializationSpellScrollFrameScrollChild.Seperator:SetAlpha(0.2)

		PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild.Seperator:SetColorTexture(1, 1, 1)
		PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild.Seperator:SetAlpha(0.2)

		if AS.MyClass == "HUNTER" then
			for i = 1, 6 do
				select(i, PlayerTalentFramePetSpecialization:GetRegions()):Hide()
			end

			for i = 1, PlayerTalentFramePetSpecialization:GetNumChildren() do
				local child = select(i, PlayerTalentFramePetSpecialization:GetChildren())
				if child and not child:GetName() then
					child:DisableDrawLayer("OVERLAY")
				end
			end

			for i = 1, 5 do
				select(i, PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild:GetRegions()):Hide()
			end

			for i = 1, GetNumSpecializations(false, true) do
				local bu = PlayerTalentFramePetSpecialization["specButton"..i]
				local _, _, _, icon = GetSpecializationInfo(i, false, true)

				bu.ring:Hide()
				bu.specIcon:SetTexture(icon)
				bu.specIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				bu.specIcon:SetSize(50, 50)
				bu.specIcon:SetPoint("LEFT", bu, "LEFT", 15, 0)

				bu.SelectedTexture = bu:CreateTexture(nil, 'ARTWORK')
				bu.SelectedTexture:SetColorTexture(1, 1, 0, 0.1)
			end

			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild.Seperator:SetColorTexture(1, 1, 1, 0.2)
			AS:SkinButton(PlayerTalentFramePetSpecializationLearnButton, true)
		end

		for _, name in pairs({"PlayerTalentFrameSpecializationSpecButton", "PlayerTalentFramePetSpecializationSpecButton"}) do
			for i = 1, 4 do
				local bu = _G[name..i]
				_G[name..i.."Glow"]:SetTexture(nil)

				bu:SetHighlightTexture("")
				bu.bg:SetAlpha(0)
				bu.learnedTex:SetAlpha(0)
				bu.selectedTex:SetAlpha(0)
				AS:SkinFrame(bu, nil, true)

				bu.border = CreateFrame("Frame", nil, bu)
				AS:SkinFrame(bu.border)
				bu.border:SetBackdropColor(0, 0, 0, 0)
				bu.border:SetOutside(bu.specIcon)
			end
		end

		for i = 1, GetNumSpecializations(false, nil) do
			local bu = PlayerTalentFrameSpecialization["specButton"..i]
			local _, _, _, icon = GetSpecializationInfo(i, false, nil)

			bu.ring:Hide()

			bu.specIcon:SetTexture(icon)
			AS:SkinTexture(bu.specIcon)
			bu.specIcon:SetSize(50, 50)
			bu.specIcon:SetPoint("LEFT", bu, "LEFT", 15, 0)
			bu:HookScript('OnEnter', function(self)
				self:SetBackdropBorderColor(1, .82, 0)
				self.border:SetBackdropBorderColor(1, .82, 0)
			end)
			bu:HookScript('OnLeave', function(self)
				if self.selected then
					self:SetBackdropBorderColor(unpack(AS.Color))
					self.border:SetBackdropBorderColor(unpack(AS.Color))
				else
					self:SetBackdropBorderColor(unpack(AS.BorderColor))
					self.border:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
			AS:Delay(0, function() bu:GetScript('OnLeave')(bu) end)
		end

		for i = 1, NUM_TALENT_FRAME_TABS do
			AS:SkinTab(_G["PlayerTalentFrameTab"..i])
		end

		for _, Frame in pairs({ _G["PlayerTalentFrameSpecializationSpellScrollFrameScrollChild"], _G["PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild"] }) do
			Frame.ring:Hide()
			AS:CreateBackdrop(Frame)
			Frame.Backdrop:SetOutside(Frame.specIcon)
			AS:SkinTexture(Frame.specIcon)
			Frame.specIcon:SetParent(Frame.Backdrop)
		end

		hooksecurefunc("PlayerTalentFrame_UpdateSpecFrame", function(self, spec)
			local playerTalentSpec = GetSpecialization(nil, self.isPet, PlayerSpecTab2:GetChecked() and 2 or 1)
			local shownSpec = spec or playerTalentSpec or 1
			local numSpecs = GetNumSpecializations(nil, self.isPet)
			local id, _, _, icon = GetSpecializationInfo(shownSpec, nil, self.isPet)
			local scrollChild = self.spellsScroll.child
			scrollChild.specIcon:SetTexture(icon)

			local index = 1
			local bonuses
			local bonusesIncrement = 1
			if self.isPet then
				bonuses = {GetSpecializationSpells(shownSpec, nil, self.isPet, true)}
				bonusesIncrement = 2
			else
				bonuses = C_SpecializationInfo.GetSpellsDisplay(id)
			end

			if bonuses then
				for i = 1, #bonuses, bonusesIncrement do
					local frame = scrollChild["abilityButton"..index]
					if frame then
						local _, spellTex = GetSpellTexture(bonuses[i])
						if spellTex then
							frame.icon:SetTexture(spellTex)
						end

						if not frame.reskinned then
							frame.reskinned = true
							frame.ring:Hide()
							AS:SkinTexture(frame.icon)
							frame.icon:SetSize(40, 40)
							AS:CreateBackdrop(frame)
							frame.Backdrop:SetOutside(frame.icon)
						end
					end
					index = index + 1
				end
			end
		end)

		for i = 1, MAX_TALENT_TIERS do
			local Row = _G["PlayerTalentFrameTalentsTalentRow"..i]
			AS:StripTextures(Row, true)

			Row.GlowFrame:Kill()

			for j = 1, NUM_TALENT_COLUMNS do
				local Button = _G["PlayerTalentFrameTalentsTalentRow"..i.."Talent"..j]

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

		hooksecurefunc("TalentFrame_Update", function()
			for i = 1, MAX_TALENT_TIERS do
				for j = 1, NUM_TALENT_COLUMNS do
					local Talent = _G["PlayerTalentFrameTalentsTalentRow"..i.."Talent"..j]
					Talent:GetScript('OnLeave')(Talent)
				end
			end
		end)

		for i = 1, 2 do
			local tab = _G["PlayerSpecTab"..i]
			_G["PlayerSpecTab"..i..'Background']:Kill()

			AS:SkinFrame(tab)
			AS:SkinTexture(tab:GetNormalTexture())
			tab:GetNormalTexture():SetInside()
			AS:StyleButton(tab)
		end

		hooksecurefunc('PlayerTalentFrame_UpdateTabs', function()
			PlayerSpecTab1:SetPoint('TOPLEFT', PlayerTalentFrame, 'TOPRIGHT', 1, -36)
		end)

		AS:SkinFrame(TalentMicroButtonAlert)
		TalentMicroButtonAlert:SetBackdropBorderColor(1, 1, 0)
		AS:CreateShadow(TalentMicroButtonAlert)
		AS:SkinCloseButton(TalentMicroButtonAlert.CloseButton)
		TalentMicroButtonAlert.CloseButton:ClearAllPoints()
		TalentMicroButtonAlert.CloseButton:SetPoint("TOPRIGHT", 6, 1)
		TalentMicroButtonAlert.Text:SetTextColor(1, 1, 0)
		TalentMicroButtonAlert:ClearAllPoints()
		TalentMicroButtonAlert:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -6)

		-- PVP Talents
		local function SkinPvpTalentSlots(button)
			button.Texture.SetAtlas = AS.Noop
			button.Texture:Show()
			button.Texture.Hide = AS.Noop

			AS:SkinTexture(button.Texture)
			AS:CreateBackdrop(button)
			button.Backdrop:SetAllPoints(button.Texture)
			SetPortraitToTexture(button.Texture, [[Interface\Icons\INV_Misc_QuestionMark]])
			button.Arrow:SetPoint("LEFT", button.Texture, "RIGHT", 5, 0)
			button.Arrow:SetSize(26, 13)
			button.Border:Hide()

			button:SetSize(button:GetSize())
			button.Texture:SetSize(32, 32)
			button.TalentName:SetPoint("TOP", button, "BOTTOM", 0, 0)
		end

		local function SkinPvpTalentTrinketSlot(button)
			SkinPvpTalentSlots(button)
			button.Texture:SetTexture([[Interface\Icons\INV_Jewelry_Trinket_04]])
			button.Texture:SetSize(48, 48)
			button.Arrow:SetSize(26, 13)
		end

		local PvpTalentFrame = PlayerTalentFrameTalents.PvpTalentFrame
		PvpTalentFrame:StripTextures()

		PvpTalentFrame.Swords:SetSize(72, 67)
		PvpTalentFrame.Orb:Hide()
		PvpTalentFrame.Ring:Hide()

		-- Skin the PvP Icons
		SkinPvpTalentTrinketSlot(PvpTalentFrame.TrinketSlot)
		SkinPvpTalentSlots(PvpTalentFrame.TalentSlot1)
		SkinPvpTalentSlots(PvpTalentFrame.TalentSlot2)
		SkinPvpTalentSlots(PvpTalentFrame.TalentSlot3)

		for k, Slot in pairs({ PvpTalentFrame.TrinketSlot, PvpTalentFrame.TalentSlot1, PvpTalentFrame.TalentSlot2, PvpTalentFrame.TalentSlot3 }) do
			if not C_SpecializationInfo.GetPvpTalentSlotInfo(k).enabled then
				Slot:HookScript("OnUpdate", function(self)
					if not C_SpecializationInfo.GetPvpTalentSlotInfo(k).enabled then
						self.Backdrop:SetBackdropBorderColor(1, 0, 0)
					else
						self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				end)
			end
		end

		AS:SkinBackdropFrame(PvpTalentFrame.TalentList)

		PvpTalentFrame.TalentList:SetPoint("BOTTOMLEFT", PlayerTalentFrame, "BOTTOMRIGHT", 5, 26)
		AS:StripTextures(PvpTalentFrame.TalentList.Inset)
		PvpTalentFrame.TalentList.MyTopLeftCorner:Hide()
		PvpTalentFrame.TalentList.MyTopRightCorner:Hide()
		PvpTalentFrame.TalentList.MyTopBorder:Hide()

		local function HandleInsetButton(Button)
			AS:SkinButton(Button)

			if Button.LeftSeparator then
				Button.LeftSeparator:Hide()
			end
			if Button.RightSeparator then
				Button.RightSeparator:Hide()
			end
		end

		local TalentList_CloseButton = select(4, PlayerTalentFrameTalents.PvpTalentFrame.TalentList:GetChildren())
		if TalentList_CloseButton and TalentList_CloseButton:HasScript("OnClick") then
			HandleInsetButton(TalentList_CloseButton)
		end

		PvpTalentFrame.TalentList.ScrollFrame:SetPoint("TOPLEFT", 5, -5)
		PvpTalentFrame.TalentList.ScrollFrame:SetPoint("BOTTOMRIGHT", -21, 32)
		PvpTalentFrame.OrbModelScene:SetAlpha(0)

		PvpTalentFrame:SetSize(131, 379)
		PvpTalentFrame:SetPoint("LEFT", PlayerTalentFrameTalents, "RIGHT", -135, 0)
		PvpTalentFrame.Swords:SetPoint("BOTTOM", 0, 30)
		PvpTalentFrame.Label:SetPoint("BOTTOM", 0, 104)
		PvpTalentFrame.InvisibleWarmodeButton:SetAllPoints(PvpTalentFrame.Swords)

		PvpTalentFrame.TrinketSlot:SetPoint("TOP", 0, -16)
		PvpTalentFrame.TalentSlot1:SetPoint("TOP", PvpTalentFrame.TrinketSlot, "BOTTOM", 0, -16)
		PvpTalentFrame.TalentSlot2:SetPoint("TOP", PvpTalentFrame.TalentSlot1, "BOTTOM", 0, -10)
		PvpTalentFrame.TalentSlot3:SetPoint("TOP", PvpTalentFrame.TalentSlot2, "BOTTOM", 0, -10)

		for i = 1, 10 do
			local bu = _G["PlayerTalentFrameTalentsPvpTalentFrameTalentListScrollFrameButton"..i]
			if bu then
				local border = bu:GetRegions()
				if border then border:SetTexture(nil) end

				AS:StyleButton(bu)
				AS:CreateBackdrop(bu, 'Transparent')

				if bu.Selected then
					bu.Selected:SetTexture(nil)
				end

				bu.Backdrop:SetAllPoints()

				if bu.Icon then
					AS:SkinTexture(bu.Icon)
					bu.Icon:SetDrawLayer('ARTWORK', 1)
				end
			end
		end

		AS:SkinButton(PlayerTalentFrameTalentsPvpTalentButton)
		AS:SkinScrollBar(PlayerTalentFrameTalentsPvpTalentFrameTalentListScrollFrameScrollBar)

		AS:SkinCloseButton(PlayerTalentFrameTalentsPvpTalentFrame.TrinketSlot.HelpBox.CloseButton)
		AS:SkinCloseButton(PlayerTalentFrameTalentsPvpTalentFrame.WarmodeTutorialBox.CloseButton)
	end
end

AS:RegisterSkin('Blizzard_Talent', AS.Blizzard_Talent, 'ADDON_LOADED')
