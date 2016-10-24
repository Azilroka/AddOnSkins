local AS = unpack(AddOnSkins)

function AS:Blizzard_Inspect(event, addon)
	if addon ~= "Blizzard_InspectUI" then return end
	AS:SkinFrame(InspectFrame, nil, nil, true)
	AS:StripTextures(InspectFrameInset, true)
	AS:SkinCloseButton(InspectFrameCloseButton)

	for i = 1, 4 do
		AS:SkinTab(_G["InspectFrameTab"..i])
	end

	AS:SkinButton(InspectPaperDollFrame.ViewButton)

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
		Slot.IconBorder:SetAlpha(0)
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
	for _, Section in pairs({ 'RatedBG', 'Arena2v2', 'Arena3v3'}) do
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

	InspectGuildFrameBG:SetTexture('')
end

AS:RegisterSkin("Blizzard_Inspect", AS.Blizzard_Inspect, 'ADDON_LOADED')