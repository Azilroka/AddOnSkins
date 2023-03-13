local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local pairs = pairs

function R:BtWLoadouts()
	S:HandleFrame(_G.BtWLoadoutsFrame)
	S:HandleButton(_G.BtWLoadoutsFrame.AddButton)
	S:HandleButton(_G.BtWLoadoutsFrame.ActivateButton)
	S:HandleButton(_G.BtWLoadoutsFrame.DeleteButton)

	S:HandleFrame(_G.BtWLoadoutsFrame.Profiles.Inset)
	S:HandleEditBox(_G.BtWLoadoutsFrame.Profiles.Name)

	local ProfileDropDowns = {
		_G.BtWLoadoutsFrame.Profiles.SpecDropDown,
		_G.BtWLoadoutsFrame.Profiles.TalentsDropDown,
		_G.BtWLoadoutsFrame.Profiles.PvPTalentsDropDown,
		_G.BtWLoadoutsFrame.Profiles.EssencesDropDown,
		_G.BtWLoadoutsFrame.Profiles.EquipmentDropDown,
		_G.BtWLoadoutsFrame.Profiles.ActionBarDropDown,
	}

	for _, DropDown in pairs(ProfileDropDowns) do
		S:HandleDropDownBox(DropDown)
	end

	S:HandleFrame(_G.BtWLoadoutsFrame.Talents.Inset)
	S:HandleEditBox(_G.BtWLoadoutsFrame.Talents.Name)
	S:HandleDropDownBox(_G.BtWLoadoutsFrame.Talents.SpecDropDown)

	for i = 1, MAX_TALENT_TIERS do
		local Row = BtWLoadoutsFrame.Talents.rows[i]
		S:StripTextures(Row, true)

		hooksecurefunc(Row, "Update", function(self)
			for bg in self.BackgroundPool:EnumerateActive() do
				bg:Hide()
			end

			for sep in self.SeparatorPool:EnumerateActive() do
				sep:Hide()
			end

			for Button in self.ButtonPool:EnumerateActive() do
				if not Button.isSkinned then
					Button.Slot:SetAlpha(0)
					S:HandleIcon(Button.Icon)
					S:SetTemplate(Button)
					Button.KnownSelection:SetAlpha(0)
					Button.Highlight:SetAlpha(0)

					if Button.KnownSelection:IsShown() then
						Button:SetBackdropBorderColor(1, 0, 0)
					end

					Button:HookScript("OnEnter", function() Button:SetBackdropBorderColor(unpack(AS:CheckOption('HighlightColor'))) end)
					Button:HookScript("OnLeave", function()
						if Button.KnownSelection:IsShown() then
							Button:SetBackdropBorderColor(1, 0, 0)
						else
							Button:SetBackdropBorderColor(unpack(AS.BorderColor))
						end
					end)
				end
			end
		end)
	end

	S:HandleFrame(_G.BtWLoadoutsFrame.PvPTalents.Inset)
	S:HandleEditBox(_G.BtWLoadoutsFrame.PvPTalents.Name)
	S:HandleDropDownBox(_G.BtWLoadoutsFrame.PvPTalents.SpecDropDown)

	S:HandleFrame(_G.BtWLoadoutsFrame.Essences.Inset)
	S:HandleEditBox(_G.BtWLoadoutsFrame.Essences.Name)
	S:HandleDropDownBox(_G.BtWLoadoutsFrame.Essences.RoleDropDown)

	S:HandleFrame(_G.BtWLoadoutsFrame.Equipment.Inset)
	S:HandleEditBox(_G.BtWLoadoutsFrame.Equipment.Name)

	S:HandleFrame(_G.BtWLoadoutsFrame.ActionBars.Inset)
	S:HandleEditBox(_G.BtWLoadoutsFrame.ActionBars.Name)

	S:HandleFrame(_G.BtWLoadoutsFrame.Conditions.Inset)
	S:HandleCheckBox(_G.BtWLoadoutsFrame.Conditions.Enabled)
	S:HandleEditBox(_G.BtWLoadoutsFrame.Conditions.Name)

	local ConditionsDropDowns = {
		_G.BtWLoadoutsFrame.Conditions.ProfileDropDown,
		_G.BtWLoadoutsFrame.Conditions.ConditionTypeDropDown,
		_G.BtWLoadoutsFrame.Conditions.InstanceDropDown,
		_G.BtWLoadoutsFrame.Conditions.DifficultyDropDown,
		_G.BtWLoadoutsFrame.Conditions.AffixesDropDown,
		_G.BtWLoadoutsFrame.Conditions.BossDropDown,
	}

	for _, DropDown in pairs(ConditionsDropDowns) do
		S:HandleDropDownBox(DropDown)
	end
end

AS:RegisterSkin('BtWLoadouts')
