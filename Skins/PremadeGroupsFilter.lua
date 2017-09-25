local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PremadeGroupsFilter') then return end

function AS:PremadeGroupsFilter()
	local function Reposition()
		local dialog = PremadeGroupsFilterDialog
		dialog:SetPoint("TOPLEFT", GroupFinderFrame, "TOPRIGHT", AS.PixelPerfect and 2 or 5, AS.PixelPerfect and 1 or 2)
		dialog:SetPoint("BOTTOMLEFT", GroupFinderFrame, "BOTTOMRIGHT", AS.PixelPerfect and 2 or 5, -(AS.PixelPerfect and 1 or 2))
	end
	hooksecurefunc(PremadeGroupsFilter.Debug, "Dialog_UpdatePosition", Reposition)

	AS:SkinFrame(PremadeGroupsFilterDialog)
	AS:SkinCloseButton(PremadeGroupsFilterDialog.CloseButton)
	AS:SkinCheckBox(UsePFGButton)
	
	AS:SkinCheckBox(PremadeGroupsFilterDialog.Difficulty.Act)
	AS:SkinDropDownBox(PremadeGroupsFilterDialog.Difficulty.DropDown)

	AS:SkinCheckBox(PremadeGroupsFilterDialog.Ilvl.Act)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Ilvl.Min)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Ilvl.Max)
	AS:SkinCheckBox(PremadeGroupsFilterDialog.Noilvl.Act)

	AS:SkinCheckBox(PremadeGroupsFilterDialog.Defeated.Act)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Defeated.Min)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Defeated.Max)

	AS:SkinCheckBox(PremadeGroupsFilterDialog.Members.Act)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Members.Min)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Members.Max)

	AS:SkinCheckBox(PremadeGroupsFilterDialog.Tanks.Act)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Tanks.Min)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Tanks.Max)

	AS:SkinCheckBox(PremadeGroupsFilterDialog.Heals.Act)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Heals.Min)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Heals.Max)

	AS:SkinCheckBox(PremadeGroupsFilterDialog.Dps.Act)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Dps.Min)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Dps.Max)

	AS:SkinCheckBox(PremadeGroupsFilterDialog.Dps.Act)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Dps.Min)
	AS:SkinEditBox(PremadeGroupsFilterDialog.Dps.Max)
	
	AS:StripTextures(PremadeGroupsFilterDialog.Advanced)

	AS:SkinFrame(PremadeGroupsFilterDialog.Expression)
	AS:SkinScrollBar(PremadeGroupsFilterDialog.Expression.ScrollBar)
	PremadeGroupsFilterDialog.Expression.ScrollBar:SetPoint("TOPLEFT", PremadeGroupsFilterDialog.Expression, "TOPRIGHT", -17, -12)
	PremadeGroupsFilterDialog.Expression.ScrollBar:SetPoint("BOTTOMLEFT", PremadeGroupsFilterDialog.Expression, "BOTTOMRIGHT", -17, 12)

	AS:StripTextures(PremadeGroupsFilterDialog.ResetButton)
	AS:SkinButton(PremadeGroupsFilterDialog.ResetButton)
	AS:StripTextures(PremadeGroupsFilterDialog.RefreshButton)
	AS:SkinButton(PremadeGroupsFilterDialog.RefreshButton)
end

AS:RegisterSkin('PremadeGroupsFilter', AS.PremadeGroupsFilter)