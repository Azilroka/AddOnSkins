local AS = unpack(AddOnSkins)

function AS:Blizzard_Inspect(event, addon)
	if addon ~= "Blizzard_InspectUI" then return end
	AS:SkinFrame(InspectFrame, nil, nil, true)
	AS:StripTextures(InspectFrameInset, true)
	AS:SkinCloseButton(InspectFrameCloseButton)

	for i = 1, 4 do
		AS:SkinTab(_G["InspectFrameTab"..i])
	end

	InspectModelFrameBorderTopLeft:SetTexture('')
	InspectModelFrameBorderTopRight:SetTexture('')
	InspectModelFrameBorderTop:SetTexture('')
	InspectModelFrameBorderLeft:SetTexture('')
	InspectModelFrameBorderRight:SetTexture('')
	InspectModelFrameBorderBottomLeft:SetTexture('')
	InspectModelFrameBorderBottomRight:SetTexture('')
	InspectModelFrameBorderBottom:SetTexture('')
	InspectModelFrameBorderBottom2:SetTexture('')
	InspectModelFrameBackgroundOverlay:SetTexture('')
	AS:SkinBackdropFrame(InspectModelFrame, nil, true)
	
	local InspectSlots = {
		InspectHeadSlot,
		InspectNeckSlot,
		InspectShoulderSlot,
		InspectBackSlot,
		InspectChestSlot,
		InspectShirtSlot,
		InspectTabardSlot,
		InspectWristSlot,
		InspectHandsSlot,
		InspectWaistSlot,
		InspectLegsSlot,
		InspectFeetSlot,
		InspectFinger0Slot,
		InspectFinger1Slot,
		InspectTrinket0Slot,
		InspectTrinket1Slot,
		InspectMainHandSlot,
		InspectSecondaryHandSlot,
	}

	for _, Slot in pairs(InspectSlots) do
		AS:SkinTexture(Slot.icon)
		AS:SkinFrame(Slot)
		Slot.icon:SetInside()
		Slot.IconBorder:SetTexture(nil)
		Slot:SetFrameLevel(Slot:GetFrameLevel() + 2)
		hooksecurefunc(Slot.IconBorder, 'SetVertexColor', function(self, r, g, b)
			Slot:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(Slot.IconBorder, 'Hide', function(self)
			Slot:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)
		AS:StyleButton(Slot)
	end

	AS:StripTextures(InspectPVPFrame)
	for _, Section in pairs({ 'RatedBG', 'Arena2v2', 'Arena3v3', 'Arena5v5'}) do
		local Frame = InspectPVPFrame[Section]
		AS:SkinFrame(Frame)
		Frame:EnableMouse(true)
		Frame:SetScript('OnEnter', function(self)
			self:SetBackdropBorderColor(0, 0.44, .87, 1)
		end)
		Frame:SetScript('OnLeave', function(self)
			self:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)
	end

	AS:StripTextures(InspectTalentFrame)
	Specialization.ring:SetTexture('')
	AS:SkinBackdropFrame(Specialization, nil, true)
	Specialization.Backdrop:SetOutside(Specialization.specIcon)
	AS:SkinTexture(Specialization.specIcon)

	Specialization:HookScript('OnShow', function(self)
		if(INSPECTED_UNIT ~= nil) then
			Spec = GetInspectSpecialization(INSPECTED_UNIT);
			Sex = UnitSex(INSPECTED_UNIT);
		end
		if(Spec ~= nil and Spec > 0 and Sex ~= nil) then
			local Role = GetSpecializationRoleByID(Spec);
			if (Role ~= nil) then
				self.specIcon:SetTexture(select(4, GetSpecializationInfoByID(Spec, Sex)))
			end
		end
	end)

	for i = 1, MAX_TALENT_TIERS do
		for j = 1, NUM_TALENT_COLUMNS do
			local Button = _G["TalentsTalentRow"..i.."Talent"..j]
			AS:SkinBackdropFrame(Button)
			Button.Backdrop:SetOutside(Button.icon)
			AS:SkinTexture(Button.icon)
			hooksecurefunc(Button.border, 'Show', function()
				Button.Backdrop:SetBackdropBorderColor(0, 0.44, .87)
			end)
			hooksecurefunc(Button.border, 'Hide', function()
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end)
		end
	end

	InspectTalentFrame:HookScript('OnShow', function(self)
		if self.isGlyphsDone then return end
		for i = 1, 6 do
			local Glyph = InspectGlyphs["Glyph"..i]
			AS:SetTemplate(Glyph)
			Glyph:SetBackdropColor(0,0,0,0)
			Glyph:SetFrameLevel(Glyph:GetFrameLevel() + 5)
			Glyph.ring:Hide()
			Glyph.highlight:SetTexture(nil)
			Glyph.glyph:Hide()

			Glyph.icon = Glyph:CreateTexture(nil, 'OVERLAY')
			Glyph.icon:SetInside()
			AS:SkinTexture(Glyph.icon)
			if i % 2 == 1 then
				Glyph:Size(Glyph:GetWidth() * .8, Glyph:GetHeight() * .8)
			end
		end
		InspectGlyphs.Glyph1:SetPoint("TOPLEFT", 80, -7)
		InspectGlyphs.Glyph3:SetPoint("TOPLEFT", 80, -97)
		InspectGlyphs.Glyph5:SetPoint("TOPLEFT", 80, -187)
		InspectGlyphFrameGlyph_UpdateGlyphs(self.InspectGlyphs, false)
		self.isGlyphsDone = true
	end)

	hooksecurefunc('InspectGlyphFrameGlyph_UpdateSlot', function(self)
		local id = self:GetID();
		local talentGroup = PlayerTalentFrame and PlayerTalentFrame.talentGroup;
		local enabled, glyphType, glyphTooltipIndex, glyphSpell, iconFilename, glyphID = GetGlyphSocketInfo(id, talentGroup, true, INSPECTED_UNIT);
		if self.icon then
			self.icon:SetTexture("Interface\\Spellbook\\UI-Glyph-Rune1")
		end
		if not glyphType then
			return;
		end
		if ( not enabled ) then
		elseif (not glyphSpell or (clear == true)) then
		else
			if self.icon then
				if (iconFilename) then
					self.icon:SetTexture(iconFilename);
				end
			end
		end
	end)
	
	InspectGuildFrameBG:SetTexture('')
end

AS:RegisterSkin("Blizzard_Inspect", AS.Blizzard_Inspect, 'ADDON_LOADED')