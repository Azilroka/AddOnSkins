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

			for i=1, PlayerTalentFramePetSpecialization:GetNumChildren() do
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

		for i = 1, GetNumSpecializations(false, true) do
			local bu = PlayerTalentFramePetSpecialization["specButton"..i]
			local _, _, _, icon = GetSpecializationInfo(i, false, true)

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
					self:SetBackdropBorderColor(0, 0.44, .87, 1)
					self.border:SetBackdropBorderColor(0, 0.44, .87, 1)
				else
					self:SetBackdropBorderColor(unpack(AS.BorderColor))
					self.border:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
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
					self:SetBackdropBorderColor(0, 0.44, .87, 1)
					self.border:SetBackdropBorderColor(0, 0.44, .87, 1)
				else
					self:SetBackdropBorderColor(unpack(AS.BorderColor))
					self.border:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
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

			local id, _, _, icon = GetSpecializationInfo(shownSpec, nil, self.isPet)
			local scrollChild = self.spellsScroll.child

			scrollChild.specIcon:SetTexture(icon)

			local index = 1

			local bonuses = self.isPet and {GetSpecializationSpells(shownSpec, nil, self.isPet, true)} or C_SpecializationInfo.GetSpellsDisplay(id)
			local bonusesIncrement = self.isPet and 2 or 1

			for i = 1, #bonuses, bonusesIncrement do
				local frame = scrollChild["abilityButton"..index]
				if frame and not frame.reskinned then
					AS:SetTemplate(frame)
					AS:SkinTexture(frame.icon)
					frame.ring:Hide()
					frame.icon:SetInside()			
					frame.icon:SetTexture(select(2, GetSpellTexture(bonuses[i])))
					frame.reskinned = true
				end
				index = index + 1
			end

			for i = 1, GetNumSpecializations(nil, self.isPet) do
				local bu = self["specButton"..i]
				if bu.selected then
					bu:SetBackdropBorderColor(0, 0.44, .87, 1)
					bu.border:SetBackdropBorderColor(0, 0.44, .87, 1)
				else
					bu:SetBackdropBorderColor(unpack(AS.BorderColor))
					bu.border:SetBackdropBorderColor(unpack(AS.BorderColor))
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
				Button:SetFrameLevel(Button:GetFrameLevel() + 2)
				Button.Backdrop:SetPoint("TOPLEFT", 15, -1)
				Button.Backdrop:SetPoint("BOTTOMRIGHT", -10, 1)

				Button.Border = CreateFrame("Frame", nil, Button)
				AS:SkinFrame(Button.Border)
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
						self.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
						self.Border:SetBackdropBorderColor(0, 0.44, .87, 1)
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
	end
end

AS:RegisterSkin('Blizzard_Talent', AS.Blizzard_Talent, 'ADDON_LOADED')