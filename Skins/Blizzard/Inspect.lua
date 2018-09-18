local AS = unpack(AddOnSkins)

function AS:Blizzard_Inspect(event, addon)
	if addon ~= "Blizzard_InspectUI" then return end

	AS:SkinFrame(InspectFrame)
	AS:StripTextures(InspectFrame.Inset)
	AS:SkinCloseButton(InspectFrame.CloseButton)
	InspectFrame.portrait:SetAlpha(0)

	for i = 1, 4 do
		AS:SkinTab(_G["InspectFrameTab"..i])
	end

	AS:SkinButton(InspectPaperDollFrame.ViewButton)
	AS:SkinBackdropFrame(InspectModelFrame)

	local Slots = { 'Head', 'Neck', 'Shoulder', 'Back', 'Chest', 'Shirt', 'Tabard', 'Wrist', 'Hands', 'Waist', 'Legs', 'Feet', 'Finger0', 'Finger1', 'Trinket0', 'Trinket1', 'MainHand', 'SecondaryHand' }

	for _, Slot in pairs(Slots) do
		local Button = _G['Inspect'..Slot..'Slot']
		AS:SkinFrame(Button)
		AS:SkinTexture(Button.icon)
		Button.icon:SetInside()
		Button.IconBorder:SetAlpha(0)
		Button:SetFrameLevel(Button:GetFrameLevel() + 2)
		hooksecurefunc(Button.IconBorder, 'SetVertexColor', function(self, r, g, b) Button:SetBackdropBorderColor(r, g, b) end)
		hooksecurefunc(Button.IconBorder, 'Hide', function(self) Button:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		AS:StyleButton(Button)
	end

	AS:StripTextures(InspectPVPFrame)

	for _, Button in pairs(InspectPVPFrame.Slots) do
		AS:CreateBackdrop(Button.Texture)

		Button.Arrow:SetAlpha(0)
		Button.Border:Hide()

		hooksecurefunc(Button, "Update", function(self)
			if (not self.slotIndex) or (not INSPECTED_UNIT) then
				return
			end

			local slotInfo = C_SpecializationInfo.GetInspectSelectedPvpTalent(INSPECTED_UNIT, self.slotIndex)

			if (slotInfo) then
				AS:SkinTexture(self.Texture)
				self.Texture:SetDesaturated(false)
				self.Texture.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			else
				self.Texture:SetTexture([[Interface\PetBattles\PetBattle-LockIcon]])
				self.Texture:SetTexCoord(0, 1, 0, 1)
				self.Texture:SetDesaturated(true)
				self.Texture:Show()
				self.Texture.Backdrop:SetBackdropBorderColor(1, 0, 0, 1)
			end
		end)
	end

	AS:StripTextures(InspectTalentFrame)
	InspectTalentFrame.InspectSpec.ring:SetTexture('')
	AS:SkinTexture(InspectTalentFrame.InspectSpec.specIcon, true)

	InspectTalentFrame.InspectSpec:HookScript('OnShow', function(self)
		local Spec, Sex
		if (INSPECTED_UNIT ~= nil) then
			Spec = GetInspectSpecialization(INSPECTED_UNIT)
			Sex = UnitSex(INSPECTED_UNIT)
		end
		if(Spec ~= nil and Spec > 0 and Sex ~= nil) then
			local Role = GetSpecializationRoleByID(Spec)
			if (Role ~= nil) then
				self.specIcon:SetTexture(select(4, GetSpecializationInfoByID(Spec, Sex)))
			end
		end
	end)

	for i = 1, MAX_TALENT_TIERS do
		for j = 1, NUM_TALENT_COLUMNS do
			local Button = InspectTalentFrame.InspectTalents['tier'..i]["talent"..j]
			AS:StripTextures(Button)
			AS:SkinTexture(Button.icon, true)
			hooksecurefunc(Button.border, 'SetShown', function(self, value)
				if value == true then
					Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				else
					Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
		end
	end

	InspectGuildFrameBG:SetTexture('')

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_Inspect", AS.Blizzard_Inspect, 'ADDON_LOADED')
