local AS = unpack(AddOnSkins)

function AS:Blizzard_TimeManager(event, addon)
	if addon == "Blizzard_TimeManager" or IsAddOnLoaded('Blizzard_TimeManager') then
		AS:SkinFrame(TimeManagerFrame)

		AS:StripTextures(TimeManagerFrameInset)
		AS:SkinCloseButton(TimeManagerFrameCloseButton)

		AS:SkinDropDownBox(TimeManagerAlarmHourDropDown, 80)
		AS:SkinDropDownBox(TimeManagerAlarmMinuteDropDown, 80)
		AS:SkinDropDownBox(TimeManagerAlarmAMPMDropDown, 80)
		
		AS:SkinEditBox(TimeManagerAlarmMessageEditBox)
		
		AS:SkinButton(TimeManagerAlarmEnabledButton)
		TimeManagerAlarmEnabledButton:SetSize(16, 16)
		TimeManagerAlarmEnabledButtonText:SetPoint("RIGHT", 76, 0)
		
		AS:SkinCheckBox(TimeManagerMilitaryTimeCheck)
		AS:SkinCheckBox(TimeManagerLocalTimeCheck)
		
		AS:StripTextures(TimeManagerStopwatchFrame)
		AS:SetTemplate(TimeManagerStopwatchCheck)
		AS:SkinTexture(TimeManagerStopwatchCheck:GetNormalTexture())
		TimeManagerStopwatchCheck:GetNormalTexture():SetInside()
		AS:StyleButton(TimeManagerStopwatchCheck)
		
		AS:SkinBackdropFrame(StopwatchFrame)
		StopwatchFrame.Backdrop:SetPoint("TOPLEFT", 0, -17)
		StopwatchFrame.Backdrop:SetPoint("BOTTOMRIGHT", 0, 2)
		
		AS:StripTextures(StopwatchTabFrame)
		AS:SkinCloseButton(StopwatchCloseButton)
		AS:SkinNextPrevButton(StopwatchPlayPauseButton)
		AS:SkinNextPrevButton(StopwatchResetButton)
		StopwatchPlayPauseButton:SetPoint("RIGHT", StopwatchResetButton, "LEFT", -4, 0)
		StopwatchResetButton:SetPoint("BOTTOMRIGHT", StopwatchFrame, "BOTTOMRIGHT", -4, 6)
		AS:UnregisterSkinEvent('Blizzard_TimeManager', 'ADDON_LOADED')
	end
end

AS:RegisterSkin("Blizzard_TimeManager", AS.Blizzard_TimeManager)