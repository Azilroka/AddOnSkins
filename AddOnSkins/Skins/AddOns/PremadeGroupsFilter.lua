local AS, L, S, R = unpack(AddOnSkins)

function R:PremadeGroupsFilter()
	-- local function Reposition()
	-- 	local dialog = PremadeGroupsFilterDialog
	-- 	dialog:SetPoint("TOPLEFT", GroupFinderFrame, "TOPRIGHT", S:AdjustForTheme(2), S:AdjustForTheme(1))
	-- 	dialog:SetPoint("BOTTOMLEFT", GroupFinderFrame, "BOTTOMRIGHT", S:AdjustForTheme(2), S:AdjustForTheme(-1))
	-- end
	-- hooksecurefunc(PremadeGroupsFilter.Debug, "Dialog_ResetPosition", Reposition)

	S:HandleFrame(PremadeGroupsFilterDialog)
	S:HandleCloseButton(PremadeGroupsFilterDialog.CloseButton)
	S:HandleMaxMinFrame(PremadeGroupsFilterDialog.MaximizeMinimizeFrame)
	S:HandleCheckBox(UsePGFButton)

	local panels = {
		PremadeGroupsFilterDungeonPanel,
		PremadeGroupsFilterRaidPanel,
		PremadeGroupsFilterRBGPanel,
		PremadeGroupsFilterArenaPanel,
        PremadeGroupsFilterExpressionPanel
	}
	for _, panel in pairs(panels) do
		if panel.Group then
			if panel.Group.Difficulty then
		    	S:HandleCheckBox(panel.Group.Difficulty.Act)
		    	panel.Group.Difficulty.Act:SetWidth(30)
		    	panel.Group.Difficulty.Act:SetHeight(30)
		    	S:HandleDropDownBox(panel.Group.Difficulty.DropDown)
		    end
		    if panel.Group.MPRating then
		    	S:HandleCheckBox(panel.Group.MPRating.Act)
		    	panel.Group.MPRating.Act:SetWidth(30)
		    	panel.Group.MPRating.Act:SetHeight(30)
		    	S:HandleEditBox(panel.Group.MPRating.Min)
		    	S:HandleEditBox(panel.Group.MPRating.Max)
		    end
		    if panel.Group.Members then
		    	S:HandleCheckBox(panel.Group.Members.Act)
		    	panel.Group.Members.Act:SetWidth(30)
		    	panel.Group.Members.Act:SetHeight(30)
		    	S:HandleEditBox(panel.Group.Members.Min)
		    	S:HandleEditBox(panel.Group.Members.Max)
		    end
		    if panel.Group.Tanks then
		    	S:HandleCheckBox(panel.Group.Tanks.Act)
		    	panel.Group.Tanks.Act:SetWidth(30)
		    	panel.Group.Tanks.Act:SetHeight(30)
		    	S:HandleEditBox(panel.Group.Tanks.Min)
		    	S:HandleEditBox(panel.Group.Tanks.Max)
		    end
		    if panel.Group.Heals then
		    	S:HandleCheckBox(panel.Group.Heals.Act)
		    	panel.Group.Heals.Act:SetWidth(30)
		    	panel.Group.Heals.Act:SetHeight(30)
		    	S:HandleEditBox(panel.Group.Heals.Min)
		    	S:HandleEditBox(panel.Group.Heals.Max)
		    end
		    if panel.Group.DPS then
		    	S:HandleCheckBox(panel.Group.DPS.Act)
		    	panel.Group.DPS.Act:SetWidth(30)
		    	panel.Group.DPS.Act:SetHeight(30)
		    	S:HandleEditBox(panel.Group.DPS.Min)
		    	S:HandleEditBox(panel.Group.DPS.Max)
		    end
		    if panel.Group.Partyfit then
		    	S:HandleCheckBox(panel.Group.Partyfit.Act)
		    	panel.Group.Partyfit.Act:SetWidth(30)
		    	panel.Group.Partyfit.Act:SetHeight(30)
		    end
		    if panel.Group.BLFit then
		    	S:HandleCheckBox(panel.Group.BLFit.Act)
		    	panel.Group.BLFit.Act:SetWidth(30)
		    	panel.Group.BLFit.Act:SetHeight(30)
		    end
		    if panel.Group.BRFit then
		    	S:HandleCheckBox(panel.Group.BRFit.Act)
		    	panel.Group.BRFit.Act:SetWidth(30)
		    	panel.Group.BRFit.Act:SetHeight(30)
		    end
		    if panel.Group.Defeated then
		    	S:HandleCheckBox(panel.Group.Defeated.Act)
		    	panel.Group.Defeated.Act:SetWidth(30)
		    	panel.Group.Defeated.Act:SetHeight(30)
		    	S:HandleEditBox(panel.Group.Defeated.Min)
		    	S:HandleEditBox(panel.Group.Defeated.Max)
		    end
		    if panel.Group.MatchingId then
		    	S:HandleCheckBox(panel.Group.MatchingId.Act)
		    	panel.Group.MatchingId.Act:SetWidth(30)
		    	panel.Group.MatchingId.Act:SetHeight(30)
		    end
			if panel.Group.PvPRating then
				S:HandleCheckBox(panel.Group.PvPRating.Act)
				panel.Group.PvPRating.Act:SetWidth(30)
				panel.Group.PvPRating.Act:SetHeight(30)
				S:HandleEditBox(panel.Group.PvPRating.Min)
				S:HandleEditBox(panel.Group.PvPRating.Max)
			end
		end
		if panel.Dungeons then
            for i = 1, 10 do
	        	if panel.Dungeons["Dungeon"..i] then
	        	    S:HandleCheckBox(panel.Dungeons["Dungeon"..i].Act)
					panel.Dungeons["Dungeon"..i].Act:SetWidth(30)
					panel.Dungeons["Dungeon"..i].Act:SetHeight(30)
	        	end
	        end
		end
		if panel.Advanced then
		    S:HandleFrame(panel.Advanced.Expression)
		    S:HandleScrollBar(panel.Advanced.Expression.ScrollBar)
		    panel.Advanced.Expression.ScrollBar:SetPoint("TOPLEFT", panel.Advanced.Expression, "TOPRIGHT", -13, 0)
		    panel.Advanced.Expression.ScrollBar:SetPoint("BOTTOMLEFT", panel.Advanced.Expression, "BOTTOMRIGHT", -13, 0)
		end
		if panel.Sorting then
			S:HandleEditBox(panel.Sorting.Expression)
		end
	end

	S:StripTextures(PremadeGroupsFilterDialog.ResetButton)
	S:HandleButton(PremadeGroupsFilterDialog.ResetButton)
	S:StripTextures(PremadeGroupsFilterDialog.RefreshButton)
	S:HandleButton(PremadeGroupsFilterDialog.RefreshButton)

	S:HandleFrame(PremadeGroupsFilterStaticPopup)
	S:StripTextures(PremadeGroupsFilterStaticPopup.Button1)
	S:HandleButton(PremadeGroupsFilterStaticPopup.Button1)
	S:StripTextures(PremadeGroupsFilterStaticPopup.Button2)
	S:HandleButton(PremadeGroupsFilterStaticPopup.Button2)
	S:StripTextures(PremadeGroupsFilterStaticPopup.Button3)
	S:HandleButton(PremadeGroupsFilterStaticPopup.Button3)
	S:StripTextures(PremadeGroupsFilterStaticPopup.Button4)
	S:HandleButton(PremadeGroupsFilterStaticPopup.Button4)

end

AS:RegisterSkin('PremadeGroupsFilter')
