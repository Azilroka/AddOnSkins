local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BtWLoadouts') then return end

local _G = _G
local pairs = pairs

function AS:BtWLoadouts()
	AS:SkinFrame(_G.BtWLoadoutsFrame)
	AS:SkinButton(_G.BtWLoadoutsFrame.AddButton)
	AS:SkinButton(_G.BtWLoadoutsFrame.ActivateButton)
	AS:SkinButton(_G.BtWLoadoutsFrame.DeleteButton)

	AS:SkinFrame(_G.BtWLoadoutsFrame.ScrollInset)
	AS:SkinFrame(_G.BtWLoadoutsFrame.Profiles.Inset)
	AS:SkinEditBox(_G.BtWLoadoutsFrame.Profiles.Name)

	local ProfileDropDowns = {
		_G.BtWLoadoutsFrame.Profiles.SpecDropDown,
		_G.BtWLoadoutsFrame.Profiles.TalentsDropDown,
		_G.BtWLoadoutsFrame.Profiles.PvPTalentsDropDown,
		_G.BtWLoadoutsFrame.Profiles.EssencesDropDown,
		_G.BtWLoadoutsFrame.Profiles.EquipmentDropDown,
		_G.BtWLoadoutsFrame.Profiles.ActionBarDropDown,
	}

	for _, DropDown in pairs(ProfileDropDowns) do
		AS:SkinDropDownBox(DropDown)
	end

	AS:SkinFrame(_G.BtWLoadoutsFrame.Talents.Inset)
	AS:SkinEditBox(_G.BtWLoadoutsFrame.Talents.Name)
	AS:SkinDropDownBox(_G.BtWLoadoutsFrame.Talents.SpecDropDown)

	for i = 1, MAX_TALENT_TIERS do
		local Row = BtWLoadoutsFrame.Talents.rows[i]
		AS:StripTextures(Row, true)

		for j = 1, NUM_TALENT_COLUMNS do
			local Button = Row.talents[j]

			AS:SkinBackdropFrame(Button)
			AS:CreateShadow(Button.Backdrop, true)

			Button:SetFrameLevel(Button:GetFrameLevel() + 2)
			Button.Backdrop:SetPoint("TOPLEFT", 15, -1)
			Button.Backdrop:SetPoint("BOTTOMRIGHT", -10, 1)

			Button.knownSelection:SetAlpha(0)

			AS:SkinTexture(Button.icon)

			Button.icon:SetSize(32, 32)

			Button:HookScript('OnEnter', function(self)
				self.Backdrop:SetBackdropBorderColor(1, .82, 0)
			end)

			Button:HookScript('OnLeave', function(self)
				self.Backdrop:SetBackdropBorderColor(nil)
			end)
		end
	end

	AS:SkinFrame(_G.BtWLoadoutsFrame.PvPTalents.Inset)
	AS:SkinEditBox(_G.BtWLoadoutsFrame.PvPTalents.Name)
	AS:SkinDropDownBox(_G.BtWLoadoutsFrame.PvPTalents.SpecDropDown)

	AS:SkinFrame(_G.BtWLoadoutsFrame.Essences.Inset)
	AS:SkinEditBox(_G.BtWLoadoutsFrame.Essences.Name)
	AS:SkinDropDownBox(_G.BtWLoadoutsFrame.Essences.RoleDropDown)

	AS:SkinFrame(_G.BtWLoadoutsFrame.Equipment.Inset)
	AS:SkinEditBox(_G.BtWLoadoutsFrame.Equipment.Name)

	AS:SkinFrame(_G.BtWLoadoutsFrame.ActionBars.Inset)
	AS:SkinEditBox(_G.BtWLoadoutsFrame.ActionBars.Name)

	AS:SkinFrame(_G.BtWLoadoutsFrame.Conditions.Inset)
	AS:SkinCheckBox(_G.BtWLoadoutsFrame.Conditions.Enabled)
	AS:SkinEditBox(_G.BtWLoadoutsFrame.Conditions.Name)

	local ConditionsDropDowns = {
		_G.BtWLoadoutsFrame.Conditions.ProfileDropDown,
		_G.BtWLoadoutsFrame.Conditions.ConditionTypeDropDown,
		_G.BtWLoadoutsFrame.Conditions.InstanceDropDown,
		_G.BtWLoadoutsFrame.Conditions.DifficultyDropDown,
		_G.BtWLoadoutsFrame.Conditions.AffixesDropDown,
		_G.BtWLoadoutsFrame.Conditions.BossDropDown,
	}

	for _, DropDown in pairs(ConditionsDropDowns) do
		AS:SkinDropDownBox(DropDown)
	end
end

AS:RegisterSkin('BtWLoadouts', AS.BtWLoadouts)
