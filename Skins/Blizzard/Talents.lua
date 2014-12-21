local AS = unpack(AddOnSkins)

local AddOnSkinned = 0
function AS:Blizzard_Talent(event, addon)
	if (addon == 'Blizzard_TalentUI' or IsAddOnLoaded('Blizzard_TalentUI')) and not PlayerTalentFrame.isSkinned then
		AS:SkinFrame(PlayerTalentFrame)
		AS:StripTextures(PlayerTalentFrameInset)
		AS:StripTextures(PlayerTalentFrameTalents, true)
		AS:SkinCloseButton(PlayerTalentFrameCloseButton)

		for _, Button in pairs({ PlayerTalentFrameTalentsTutorialButton, PlayerTalentFrameSpecializationTutorialButton, PlayerTalentFramePetSpecializationTutorialButton }) do
			Button.Ring:Hide()
			Button:Point("TOPLEFT", PlayerTalentFrame, "TOPLEFT", -12, 12)
		end

		AS:SkinButton(PlayerTalentFrameTalentsLearnButton, true)
		AS:SkinButton(PlayerTalentFrameActivateButton, true)
		AS:SkinButton(PlayerTalentFramePetSpecializationLearnButton, true)
		AS:SkinButton(PlayerTalentFrameSpecializationLearnButton, true)

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
			bu.specIcon:Point("LEFT", bu, "LEFT", 15, 0)
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
			bu.specIcon:Point("LEFT", bu, "LEFT", 15, 0)
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

			local bonuses
			if self.isPet then
				bonuses = {GetSpecializationSpells(shownSpec, nil, self.isPet, true)}
			else
				bonuses = SPEC_SPELLS_DISPLAY[id]
			end

			for i = 1, #bonuses, 2 do
				local frame = scrollChild["abilityButton"..index]
				if frame and not frame.reskinned then
					AS:SetTemplate(frame)
					AS:SkinTexture(frame.icon)
					frame:Size(45, 45)
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

			for j = 1, NUM_TALENT_COLUMNS do
				local Button = _G["PlayerTalentFrameTalentsTalentRow"..i.."Talent"..j]

				AS:SkinBackdropFrame(Button)
				Button:SetFrameLevel(Button:GetFrameLevel() + 2)
				Button.Backdrop:Point("TOPLEFT", 15, -1)
				Button.Backdrop:Point("BOTTOMRIGHT", -10, 1)

				Button.Border = CreateFrame("Frame", nil, Button)
				AS:SkinFrame(Button.Border)
				Button.Border:SetBackdropColor(0, 0, 0, 0)
				Button.Border:SetOutside(Button.icon)
				Button.icon:Size(32)
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
					elseif self.learnSelection:IsShown() then
						self.Backdrop:SetBackdropBorderColor(1, 0.82, 0, 1)
						self.Border:SetBackdropBorderColor(1, 0.82, 0, 1)
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
		PlayerTalentFrame.isSkinned = true
		AddOnSkinned = AddOnSkinned + 1
	end
	if (addon == 'Blizzard_GlyphUI' or IsAddOnLoaded('Blizzard_GlyphUI')) and not GlyphFrame.isSkinned then
		GlyphFrame.background:SetDrawLayer('BORDER')
		AS:SkinBackdropFrame(GlyphFrame, nil, true)
		GlyphFrame.background:SetInside(GlyphFrame.Backdrop)
		AS:SkinEditBox(GlyphFrameSearchBox)
		AS:SkinDropDownBox(GlyphFrameFilterDropDown, 212)

		for i = 1, 2 do
			_G["GlyphFrameHeader"..i].middle:SetTexture(nil)
			_G["GlyphFrameHeader"..i].leftEdge:SetTexture(nil)
			_G["GlyphFrameHeader"..i].rightEdge:SetTexture(nil)
			AS:SetTemplate(_G["GlyphFrameHeader"..i])
		end

		for i = 1, 10 do
			local Button = _G["GlyphFrameScrollFrameButton"..i]
			AS:SkinButton(Button, true)
			AS:SkinTexture(Button.icon)
		end

		AS:SetTemplate(GlyphFrameClearInfoFrame, 'Default')
		AS:SkinTexture(GlyphFrameClearInfoFrameIcon)
		GlyphFrameClearInfoFrameIcon:SetInside()

		AS:SkinScrollBar(GlyphFrameScrollFrameScrollBar)

		AS:StripTextures(GlyphFrameScrollFrame)
		AS:StripTextures(GlyphFrameSideInset)
		AS:StripTextures(GlyphFrameScrollFrameScrollChild)

		if not AS.ParchmentEnabled then
			AS:StripTextures(GlyphFrame)
			AS:SkinTexture(GlyphFrame.specIcon)
			GlyphFrame:HookScript('OnUpdate', function(self)
				self.specIcon:SetAlpha(1 - self.glow:GetAlpha())
			end)

			for i = 1, 6 do
				local Glyph = _G["GlyphFrameGlyph"..i]
				AS:SetTemplate(Glyph)
				Glyph:SetBackdropColor(0,0,0,0)
				Glyph:SetFrameLevel(Glyph:GetFrameLevel() + 5)
				Glyph.ring:Hide()
				Glyph.glyph:Hide()
				Glyph.highlight:SetTexture(nil)

				-- This will make the glyphs nice and square.
				Glyph.glyph:Hide()
				Glyph.icon = Glyph:CreateTexture(nil, 'OVERLAY')
				Glyph.icon:SetInside()
				AS:SkinTexture(Glyph.icon)

				-- Real Highlight shit right here.
				AS:CreateBackdrop(Glyph)
				Glyph.Backdrop:SetAllPoints()
				Glyph.Backdrop:SetFrameLevel(Glyph:GetFrameLevel() + 1)
				Glyph.Backdrop:SetBackdropColor(0, 0, 0, 0)
				Glyph.Backdrop:SetBackdropBorderColor(1, 1, 0)
				Glyph.Backdrop:SetScript('OnUpdate', function(self)
					local Alpha = Glyph.highlight:GetAlpha()
					self:SetAlpha(Alpha)
					if strfind(Glyph.icon:GetTexture(), "Interface\\Spellbook\\UI%-Glyph%-Rune") then
						if Alpha == 0 then
							Glyph.icon:SetVertexColor(1, 1, 1)
							Glyph.icon:SetAlpha(1)
						else
							Glyph.icon:SetVertexColor(1, 1, 0)
							Glyph.icon:SetAlpha(Alpha)
						end
					end
				end)

				hooksecurefunc(Glyph.highlight, 'Show', function()
					Glyph.Backdrop:Show()
				end)

				Glyph.glyph:Hide()
				hooksecurefunc(Glyph.glyph, 'Show', function(self) self:Hide() end)
				
				if i % 2 == 1 then
					Glyph:Size(Glyph:GetWidth() * .8, Glyph:GetHeight() * .8)
				end
			end

			hooksecurefunc('GlyphFrame_Update', function(self)
				local isActiveTalentGroup = PlayerTalentFrame and PlayerTalentFrame.talentGroup == GetActiveSpecGroup();
				for i = 1, NUM_GLYPH_SLOTS do
					local GlyphSocket = _G["GlyphFrameGlyph"..i]
					local _, _, _, _, iconFilename = GetGlyphSocketInfo(i, PlayerTalentFrame.talentGroup)
					if iconFilename then
						GlyphSocket.icon:SetTexture(iconFilename)
					else
						GlyphSocket.icon:SetTexture("Interface\\Spellbook\\UI-Glyph-Rune-"..i)
					end
					GlyphFrameGlyph_UpdateSlot(GlyphSocket);
					SetDesaturation(GlyphSocket.icon, not isActiveTalentGroup);
				end
				SetDesaturation(self.specIcon, not isActiveTalentGroup);
			end)
		end
		GlyphFrame.isSkinned = true
		AddOnSkinned = AddOnSkinned + 1
	end
	if AddOnSkinned == 2 then
		AS:UnregisterSkinEvent('Blizzard_Talent', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('Blizzard_Talent', AS.Blizzard_Talent, 'ADDON_LOADED')