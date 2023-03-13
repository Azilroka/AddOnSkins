local AS, L, S, R = unpack(AddOnSkins)

function R:PremadeGroupsFilter()
	local function Reposition()
		local dialog = PremadeGroupsFilterDialog
		dialog:SetPoint("TOPLEFT", GroupFinderFrame, "TOPRIGHT", S:AdjustForTheme(2), S:AdjustForTheme(1))
		dialog:SetPoint("BOTTOMLEFT", GroupFinderFrame, "BOTTOMRIGHT", S:AdjustForTheme(2), S:AdjustForTheme(-1))
	end
	hooksecurefunc(PremadeGroupsFilter.Debug, "Dialog_ResetPosition", Reposition)

	S:HandleFrame(PremadeGroupsFilterDialog)
	S:HandleCloseButton(PremadeGroupsFilterDialog.CloseButton)
	S:HandleMaxMinFrame(PremadeGroupsFilterDialog.MaximizeMinimizeFrame)
	S:HandleCheckBox(UsePGFButton)

	S:HandleCheckBox(PremadeGroupsFilterDialog.Difficulty.Act)
	S:HandleDropDownBox(PremadeGroupsFilterDialog.Difficulty.DropDown)

	S:HandleCheckBox(PremadeGroupsFilterDialog.MPRating.Act)
	S:HandleEditBox(PremadeGroupsFilterDialog.MPRating.Min)
	S:HandleEditBox(PremadeGroupsFilterDialog.MPRating.Max)
	--S:HandleCheckBox(PremadeGroupsFilterDialog.Noilvl.Act)

	S:HandleCheckBox(PremadeGroupsFilterDialog.PVPRating.Act)
	S:HandleEditBox(PremadeGroupsFilterDialog.PVPRating.Min)
	S:HandleEditBox(PremadeGroupsFilterDialog.PVPRating.Max)

	S:HandleCheckBox(PremadeGroupsFilterDialog.Defeated.Act)
	S:HandleEditBox(PremadeGroupsFilterDialog.Defeated.Min)
	S:HandleEditBox(PremadeGroupsFilterDialog.Defeated.Max)

	S:HandleCheckBox(PremadeGroupsFilterDialog.Members.Act)
	S:HandleEditBox(PremadeGroupsFilterDialog.Members.Min)
	S:HandleEditBox(PremadeGroupsFilterDialog.Members.Max)

	S:HandleCheckBox(PremadeGroupsFilterDialog.Tanks.Act)
	S:HandleEditBox(PremadeGroupsFilterDialog.Tanks.Min)
	S:HandleEditBox(PremadeGroupsFilterDialog.Tanks.Max)

	S:HandleCheckBox(PremadeGroupsFilterDialog.Heals.Act)
	S:HandleEditBox(PremadeGroupsFilterDialog.Heals.Min)
	S:HandleEditBox(PremadeGroupsFilterDialog.Heals.Max)

	S:HandleCheckBox(PremadeGroupsFilterDialog.Dps.Act)
	S:HandleEditBox(PremadeGroupsFilterDialog.Dps.Min)
	S:HandleEditBox(PremadeGroupsFilterDialog.Dps.Max)

	S:HandleCheckBox(PremadeGroupsFilterDialog.Dps.Act)
	S:HandleEditBox(PremadeGroupsFilterDialog.Dps.Min)
	S:HandleEditBox(PremadeGroupsFilterDialog.Dps.Max)

	--S:StripTextures(PremadeGroupsFilterDialog.Advanced)

	S:HandleFrame(PremadeGroupsFilterDialog.Expression)
	S:HandleScrollBar(PremadeGroupsFilterDialog.Expression.ScrollBar)
	S:HandleEditBox(PremadeGroupsFilterDialog.Sorting.SortingExpression)
	PremadeGroupsFilterDialog.Expression.ScrollBar:SetPoint("TOPLEFT", PremadeGroupsFilterDialog.Expression, "TOPRIGHT", -17, -12)
	PremadeGroupsFilterDialog.Expression.ScrollBar:SetPoint("BOTTOMLEFT", PremadeGroupsFilterDialog.Expression, "BOTTOMRIGHT", -17, 12)

	S:StripTextures(PremadeGroupsFilterDialog.ResetButton)
	S:HandleButton(PremadeGroupsFilterDialog.ResetButton)
	S:StripTextures(PremadeGroupsFilterDialog.RefreshButton)
	S:HandleButton(PremadeGroupsFilterDialog.RefreshButton)
end

AS:RegisterSkin('PremadeGroupsFilter')
