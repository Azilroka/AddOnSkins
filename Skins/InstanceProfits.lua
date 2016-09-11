local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('InstanceProfits') then return end

function AS:InstanceProfits(event, addon)
	InstanceProfits_LiveDisplay:SetHeight(90);
	InstanceProfits_LiveDisplay_ButtonClose:ClearAllPoints();
	InstanceProfits_LiveDisplay_ButtonClose:SetPoint("TOPRIGHT", InstanceProfits_LiveDisplay, "TOPRIGHT", -5, -5);
	InstanceProfits_LiveDisplay_ButtonDetails:ClearAllPoints();
	InstanceProfits_LiveDisplay_ButtonDetails:SetPoint("TOPRIGHT", InstanceProfits_LiveDisplay, "TOPRIGHT", -5, -25);
	InstanceProfits_LiveDisplay_ButtonDetails:SetWidth(16)
	InstanceProfits_LiveDisplay_ButtonDetails:SetHeight(16)
	InstanceProfits_LiveDisplay_ButtonDetails.Text:SetText("H")
	InstanceProfits_LiveDisplay_ButtonRecent:ClearAllPoints();
	InstanceProfits_LiveDisplay_ButtonRecent:SetPoint("TOPRIGHT", InstanceProfits_LiveDisplay, "TOPRIGHT", -5, -45);
	InstanceProfits_LiveDisplay_ButtonRecent:SetWidth(16)
	InstanceProfits_LiveDisplay_ButtonRecent:SetHeight(16)
	InstanceProfits_LiveDisplay_ButtonRecent.Text:SetText("R")

	AS:SkinBackdropFrame(InstanceProfits_LiveDisplay);
	InstanceProfits_LiveDisplay:CreateBackdrop("Transparent");
	AS:SkinButton(InstanceProfits_LiveDisplay_ButtonClose);
	AS:SkinButton(InstanceProfits_LiveDisplay_ButtonDetails);
	AS:SkinButton(InstanceProfits_LiveDisplay_ButtonRecent);
	
	-- Skin the InstanceProfits_TableDisplay Frame, all Buttons and the Scroll Bar
	AS:SkinBackdropFrame(InstanceProfits_TableDisplay);
	AS:SkinButton(InstanceProfits_TableDisplay_TitleBar_ButtonClose);
	InstanceProfits_TableDisplay_TitleBar:SetBackdropColor(128/255, 128/255, 128/255, 0.75);
	InstanceProfits_TableDisplay_TitleBar_TitleString:SetTextColor(1, 1, 1);
	AS:SkinButton(InstanceProfits_TableDisplay_ButtonToggleData);
	AS:SkinButton(InstanceProfits_TableDisplay_ButtonRecent);
	AS:SkinButton(InstanceProfits_TableDisplay_ButtonClose);
	AS:SkinButton(InstanceProfits_TableDisplay_ButtonFilter);
	AS:SkinButton(InstanceProfits_TableDisplay_ButtonResetChar);
	AS:SkinButton(InstanceProfits_TableDisplay_ButtonChangeTextColor);
	
	-- Skin the InstanceProfits_FilterOptions Frame and all Buttons
	AS:SkinBackdropFrame(InstanceProfits_FilterOptions);
	InstanceProfits_FilterOptions_TitleBar:SetBackdropColor(128/255, 128/255, 128/255, 0.75);
	InstanceProfits_FilterOptions_TitleBar_TitleString:SetTextColor(1, 1, 1);
	AS:SkinButton(InstanceProfits_FilterOptions_TitleBar_ButtonClose);
	AS:SkinButton(InstanceProfits_FilterOptions_ButtonSave);
	AS:SkinDropDownBox(InstanceProfits_FilterOptions_SortDropDown);
	AS:SkinCheckBox(InstanceProfits_FilterOptionsNormalFilter);
	AS:SkinCheckBox(InstanceProfits_FilterOptionsHeroicFilter);
	AS:SkinCheckBox(InstanceProfits_FilterOptionsTenManFilter);
	AS:SkinCheckBox(InstanceProfits_FilterOptionsTwentyFiveFilter);
	AS:SkinCheckBox(InstanceProfits_FilterOptionsTenHeroicFilter);
	AS:SkinCheckBox(InstanceProfits_FilterOptionsTwentyFiveHeroicFilter);
	AS:SkinCheckBox(InstanceProfits_FilterOptionsLFRFilter);
	
	-- Skin the InstanceProfits_DetailedDisplay Frame and all Buttons
	AS:SkinBackdropFrame(InstanceProfits_DetailedDisplay)
	AS:SkinButton(InstanceProfits_DetailedDisplay_ButtonClose);
	
	-- Skin the InstanceProfits_RecentHistory Frame and all Buttons
	AS:SkinBackdropFrame(InstanceProfits_RecentHistory);
	InstanceProfits_RecentHistory_TitleBar:SetBackdropColor(128/255, 128/255, 128/255, 0.75);
	InstanceProfits_RecentHistory_TitleBar_TitleString:SetTextColor(1, 1, 1);
	AS:SkinButton(InstanceProfits_RecentHistory_TitleBar_ButtonClose);
	AS:SkinDropDownBox(InstanceProfits_RecentHistory_LimitDropDown);
	AS:SkinButton(InstanceProfits_RecentHistory_ButtonChangeTextColor);
end

AS:RegisterSkin('InstanceProfits', AS.InstanceProfits)