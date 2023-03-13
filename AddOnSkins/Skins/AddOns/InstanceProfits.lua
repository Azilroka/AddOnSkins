local AS, L, S, R = unpack(AddOnSkins)

function R:InstanceProfits()
  InstanceProfits_LiveDisplay:SetHeight(90)
  S:HandleFrame(InstanceProfits_LiveDisplay, true)
  InstanceProfits_LiveDisplay:CreateBackdrop("Transparent")

  -- Skin Close Button
  InstanceProfits_LiveDisplay_ButtonClose:ClearAllPoints()
  InstanceProfits_LiveDisplay_ButtonClose:SetPoint("TOPRIGHT", InstanceProfits_LiveDisplay, "TOPRIGHT", -5, -5)
  S:HandleButton(InstanceProfits_LiveDisplay_ButtonClose)

  -- Skin Details Button
  InstanceProfits_LiveDisplay_ButtonDetails:ClearAllPoints()
  InstanceProfits_LiveDisplay_ButtonDetails:SetPoint("TOPRIGHT", InstanceProfits_LiveDisplay, "TOPRIGHT", -5, -25)
  InstanceProfits_LiveDisplay_ButtonDetails:SetWidth(16)
  InstanceProfits_LiveDisplay_ButtonDetails:SetHeight(16)
  InstanceProfits_LiveDisplay_ButtonDetails.Text:SetText("H")
  S:HandleButton(InstanceProfits_LiveDisplay_ButtonDetails)

  -- Skin Recent Button
  InstanceProfits_LiveDisplay_ButtonRecent:ClearAllPoints()
  InstanceProfits_LiveDisplay_ButtonRecent:SetPoint("TOPRIGHT", InstanceProfits_LiveDisplay, "TOPRIGHT", -5, -45)
  InstanceProfits_LiveDisplay_ButtonRecent:SetWidth(16)
  InstanceProfits_LiveDisplay_ButtonRecent:SetHeight(16)
  InstanceProfits_LiveDisplay_ButtonRecent.Text:SetText("R")
  S:HandleButton(InstanceProfits_LiveDisplay_ButtonRecent)

  -- Skin Share Button
  InstanceProfits_LiveDisplay_ButtonShare:ClearAllPoints()
  InstanceProfits_LiveDisplay_ButtonShare:SetPoint("TOPRIGHT", InstanceProfits_LiveDisplay, "TOPRIGHT", -5, -65)
  InstanceProfits_LiveDisplay_ButtonShare:SetWidth(16)
  InstanceProfits_LiveDisplay_ButtonShare:SetHeight(16)
  InstanceProfits_LiveDisplay_ButtonShare.Text:SetText("S")
  InstanceProfits_LiveDisplay_ButtonShare.Text:SetTextColor(1, 1, 1, 1)
  InstanceProfits_LiveDisplay_ButtonShare.Text:SetJustifyV("CENTER");
  InstanceProfits_LiveDisplay_ButtonShare.Text:SetJustifyH("CENTER");
  S:HandleButton(InstanceProfits_LiveDisplay_ButtonShare)


  -- Skin the InstanceProfits_TableDisplay Frame, all Buttons and the Scroll Bar
  S:HandleFrame(InstanceProfits_TableDisplay, true)
  S:HandleButton(InstanceProfits_TableDisplay_TitleBar_ButtonClose)
  InstanceProfits_TableDisplay_TitleBar:SetBackdropColor(128/255, 128/255, 128/255, 0.75)
  InstanceProfits_TableDisplay_TitleBar_TitleString:SetTextColor(1, 1, 1)
  S:HandleButton(InstanceProfits_TableDisplay_ButtonToggleData)
  S:HandleButton(InstanceProfits_TableDisplay_ButtonRecent)
  S:HandleButton(InstanceProfits_TableDisplay_ButtonClose)
  S:HandleButton(InstanceProfits_TableDisplay_ButtonFilter)
  S:HandleButton(InstanceProfits_TableDisplay_ButtonResetChar)
  S:HandleButton(InstanceProfits_TableDisplay_ButtonChangeTextColor)

  -- Skin the InstanceProfits_FilterOptions Frame and all Buttons
  S:HandleFrame(InstanceProfits_FilterOptions, true)
  InstanceProfits_FilterOptions_TitleBar:SetBackdropColor(128/255, 128/255, 128/255, 0.75)
  InstanceProfits_FilterOptions_TitleBar_TitleString:SetTextColor(1, 1, 1)
  S:HandleButton(InstanceProfits_FilterOptions_TitleBar_ButtonClose)
  S:HandleButton(InstanceProfits_FilterOptions_ButtonSave)
  S:HandleDropDownBox(InstanceProfits_FilterOptions_SortDropDown)
  S:HandleCheckBox(InstanceProfits_FilterOptionsNormalFilter)
  S:HandleCheckBox(InstanceProfits_FilterOptionsHeroicFilter)
  S:HandleCheckBox(InstanceProfits_FilterOptionsTenManFilter)
  S:HandleCheckBox(InstanceProfits_FilterOptionsTwentyFiveFilter)
  S:HandleCheckBox(InstanceProfits_FilterOptionsTenHeroicFilter)
  S:HandleCheckBox(InstanceProfits_FilterOptionsTwentyFiveHeroicFilter)
  S:HandleCheckBox(InstanceProfits_FilterOptionsLFRFilter)

  -- Skin the InstanceProfits_DetailedDisplay Frame and all Buttons
  S:HandleFrame(InstanceProfits_DetailedDisplay, true)
  S:HandleButton(InstanceProfits_DetailedDisplay_ButtonClose)

  -- Skin the InstanceProfits_RecentHistory Frame and all Buttons
  S:HandleFrame(InstanceProfits_RecentHistory, true)
  InstanceProfits_RecentHistory_TitleBar:SetBackdropColor(128/255, 128/255, 128/255, 0.75)
  InstanceProfits_RecentHistory_TitleBar_TitleString:SetTextColor(1, 1, 1)
  S:HandleButton(InstanceProfits_RecentHistory_TitleBar_ButtonClose)
  S:HandleDropDownBox(InstanceProfits_RecentHistory_LimitDropDown)
  S:HandleButton(InstanceProfits_RecentHistory_ButtonChangeTextColor)
  S:HandleButton(InstanceProfits_RecentHistory_ButtonResetRecent)

  -- Skin Share Dialog
  S:HandleFrame(InstanceProfits_ShareDialog, true)
  InstanceProfits_ShareDialog_TitleBar:SetBackdropColor(128/255, 128/255, 128/255, 0.75)
  InstanceProfits_ShareDialog_TitleBar_TitleString:SetTextColor(1, 1, 1)
  S:HandleButton(InstanceProfits_ShareDialog_ButtonSave)
  S:HandleEditBox(InstanceProfits_ShareDialogWhisperName)
  InstanceProfits_ShareDialogWhisperName:SetWidth(120)
  InstanceProfits_ShareDialogWhisperName:SetHeight(18)
  local point, relativeTo, relativePoint, xOfs, yOfs = InstanceProfits_ShareDialogWhisperName:GetPoint()
  InstanceProfits_ShareDialogWhisperName:ClearAllPoints()
  InstanceProfits_ShareDialogWhisperName:SetPoint(point, relativeTo, relativePoint, xOfs, -130)
  S:HandleRadioButton(InstanceProfits_ShareDialogSay)
  S:HandleRadioButton(InstanceProfits_ShareDialogGuild)
  S:HandleRadioButton(InstanceProfits_ShareDialogWhisper)
  S:HandleRadioButton(InstanceProfits_ShareDialogGeneral)
  S:HandleRadioButton(InstanceProfits_ShareDialogTrade)
end

AS:RegisterSkin('InstanceProfits')
