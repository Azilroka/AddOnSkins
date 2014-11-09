local AS = unpack(AddOnSkins)

function AS:Blizzard_Talent(event, addon)
	if addon == 'Blizzard_TalentUI' or IsAddOnLoaded('Blizzard_TalentUI') then
		local buttons = {
			PlayerTalentFrameTalentsLearnButton,
			PlayerTalentFrameActivateButton,
			PlayerTalentFramePetSpecializationLearnButton,
			PlayerTalentFrameSpecializationLearnButton
		}

		for _, button in pairs(buttons) do
			button:StripTextures()
			button:SkinButton()
		end

		PlayerTalentFrameTalentsTutorialButton.Ring:Hide()
		PlayerTalentFrameTalentsTutorialButton:Point("TOPLEFT", PlayerTalentFrame, "TOPLEFT", -12, 12)
		PlayerTalentFrameSpecializationTutorialButton.Ring:Hide()
		PlayerTalentFrameSpecializationTutorialButton:Point("TOPLEFT", PlayerTalentFrame, "TOPLEFT", -12, 12)
		PlayerTalentFramePetSpecializationTutorialButton.Ring:Hide()
		PlayerTalentFramePetSpecializationTutorialButton:Point("TOPLEFT", PlayerTalentFrame, "TOPLEFT", -12, 12)

		AS:SkinFrame(PlayerTalentFrame)
		PlayerTalentFrameInset:StripTextures()
		PlayerTalentFrameTalents:StripTextures(true)
		AS:SkinCloseButton(PlayerTalentFrameCloseButton)

		AS:SkinFrame(PlayerTalentFrameTalentsClearInfoFrame)
		AS:SkinTexture(PlayerTalentFrameTalentsClearInfoFrameIcon)
		PlayerTalentFrameTalentsClearInfoFrameIcon:SetInside()


		for i = 1, 6 do
			select(i, PlayerTalentFrameSpecialization:GetRegions()):Hide()
			select(i, PlayerTalentFramePetSpecialization:GetRegions()):Hide()
		end

		for i = 1, 5 do
			select(i, PlayerTalentFrameSpecializationSpellScrollFrameScrollChild:GetRegions()):Hide()
			select(i, PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild:GetRegions()):Hide()
		end

		select(7, PlayerTalentFrameSpecialization:GetChildren()):DisableDrawLayer("OVERLAY")
		select(7, PlayerTalentFramePetSpecialization:GetChildren()):DisableDrawLayer("OVERLAY")

		PlayerTalentFrameSpecializationSpellScrollFrameScrollChild.Seperator:SetTexture(1, 1, 1)
		PlayerTalentFrameSpecializationSpellScrollFrameScrollChild.Seperator:SetAlpha(0.2)

		PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild.Seperator:SetTexture(1, 1, 1)
		PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild.Seperator:SetAlpha(0.2)

		for i = 1, GetNumSpecializations(false, true) do
			local bu = PlayerTalentFramePetSpecialization["specButton"..i]
			local _, _, _, icon = GetSpecializationInfo(i, false, true)

			bu.ring:Hide()
			bu.specIcon:SetTexture(icon)
			AS:SkinTexture(bu.specIcon)
			bu.specIcon:SetSize(50, 50)
			bu.specIcon:Point("LEFT", bu, "LEFT", 15, 0)
		end

		for i = 1, NUM_TALENT_FRAME_TABS do
			AS:SkinTab(_G["PlayerTalentFrameTab"..i])
		end

		local pspecspell = _G["PlayerTalentFrameSpecializationSpellScrollFrameScrollChild"]
		pspecspell.ring:Hide()
		pspecspell:CreateBackdrop("Default")
		local Backdrop = pspecspell.Backdrop or pspecspell.backdrop
		Backdrop:SetOutside(pspecspell.specIcon)
		AS:SkinTexture(pspecspell.specIcon)
		pspecspell.specIcon:SetParent(Backdrop)

		local specspell2 = _G["PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild"]
		specspell2.ring:Hide()
		specspell2:CreateBackdrop("Default")
		local Backdrop = specspell2.Backdrop or specspell2.backdrop
		Backdrop:SetOutside(specspell2.specIcon)
		AS:SkinTexture(specspell2.specIcon)
		specspell2.specIcon:SetParent(Backdrop)

		hooksecurefunc("PlayerTalentFrame_UpdateSpecFrame", function(self, spec)
			local playerTalentSpec = GetSpecialization(nil, self.isPet, PlayerSpecTab2:GetChecked() and 2 or 1)
			local shownSpec = spec or playerTalentSpec or 1

			local id, _, _, icon = GetSpecializationInfo(shownSpec, nil, self.isPet)
			local scrollChild = self.spellsScroll.child

			scrollChild.specIcon:SetTexture(icon)

			local index = 1

			local bonuses
			if self.isPet then
				bonuses = {GetSpecializationSpells(shownSpec, nil, self.isPet)}
			else
				bonuses = SPEC_SPELLS_DISPLAY[id]
			end

			for i = 1, #bonuses, 2 do
				local frame = scrollChild["abilityButton"..index]
				local _, icon = GetSpellTexture(bonuses[i])
				if not frame.reskinned then
					frame.reskinned = true
					frame:Size(30, 30)
					frame.ring:Hide()
					frame:SetTemplate("Default")
					AS:SkinTexture(frame.icon)
					frame.icon:SetInside()			
				end
				frame.icon:SetTexture(icon)
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

		for i = 1, GetNumSpecializations(false, nil) do
			local bu = PlayerTalentFrameSpecialization["specButton"..i]
			local _, _, _, icon = GetSpecializationInfo(i, false, nil)

			bu.ring:Hide()

			bu.specIcon:SetTexture(icon)
			AS:SkinTexture(bu.specIcon)
			bu.specIcon:SetSize(50, 50)
			bu.specIcon:Point("LEFT", bu, "LEFT", 15, 0)
		end

		local buttons = {"PlayerTalentFrameSpecializationSpecButton", "PlayerTalentFramePetSpecializationSpecButton"}

		for _, name in pairs(buttons) do
			for i = 1, 4 do
				local bu = _G[name..i]
				_G["PlayerTalentFrameSpecializationSpecButton"..i.."Glow"]:SetTexture(nil)

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

		for i = 1, MAX_TALENT_TIERS do
			local row = _G["PlayerTalentFrameTalentsTalentRow"..i]
			row:StripTextures(true)

			for j = 1, NUM_TALENT_COLUMNS do
				local bu = _G["PlayerTalentFrameTalentsTalentRow"..i.."Talent"..j]
				local ic = _G["PlayerTalentFrameTalentsTalentRow"..i.."Talent"..j.."IconTexture"]

				AS:SkinFrame(bu)
				bu:SetFrameLevel(bu:GetFrameLevel() + 2)

				bu.bg = CreateFrame("Frame", nil, bu)
				AS:SkinFrame(bu.bg)
				bu.bg:SetBackdropColor(0, 0, 0, 0)
				bu.bg:SetOutside(ic)
				ic:Size(30)
				ic:SetDrawLayer("ARTWORK")
				AS:SkinTexture(ic)
			end
		end

		hooksecurefunc("TalentFrame_Update", function()
			for i = 1, MAX_TALENT_TIERS do
				for j = 1, NUM_TALENT_COLUMNS do
					local bu = _G["PlayerTalentFrameTalentsTalentRow"..i.."Talent"..j]
					if bu.knownSelection:IsShown() then
						bu:SetBackdropBorderColor(0, 0.44, .87, 1)
						bu.bg:SetBackdropBorderColor(0, 0.44, .87, 1)
					else
						bu:SetBackdropBorderColor(unpack(AS.BorderColor))
						bu.bg:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
					if bu.learnSelection:IsShown() then
						bu:SetBackdropBorderColor(1, 0.82, 0, 1)
						bu.bg:SetBackdropBorderColor(1, 0.82, 0, 1)
					end
				end
			end
		end)

		for i = 1, 2 do
			local tab = _G["PlayerSpecTab"..i]
			_G["PlayerSpecTab"..i.."Background"]:Hide()

			AS:SkinFrame(tab)
			AS:SkinTexture(tab:GetNormalTexture())
			tab:GetNormalTexture():SetInside()
			tab:StyleButton()
		end

		hooksecurefunc('PlayerTalentFrame_UpdateTabs', function()
			PlayerSpecTab1:SetPoint('TOPLEFT', PlayerTalentFrame, 'TOPRIGHT', 1, -36)
		end)
		
		AS:SkinFrame(TalentMicroButtonAlert)
		TalentMicroButtonAlert:SetBackdropBorderColor(1, 1, 0)
		TalentMicroButtonAlert:CreateShadow()
		AS:SkinCloseButton(TalentMicroButtonAlert.CloseButton)
		TalentMicroButtonAlert.CloseButton:ClearAllPoints()
		TalentMicroButtonAlert.CloseButton:SetPoint("TOPRIGHT", 6, 1)
		TalentMicroButtonAlert.Text:SetTextColor(1, 1, 0)
		TalentMicroButtonAlert:ClearAllPoints()
		TalentMicroButtonAlert:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -6)
		AS:UnregisterSkinEvent('Blizzard_Talent', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('Blizzard_Talent', AS.Blizzard_Talent, 'ADDON_LOADED')