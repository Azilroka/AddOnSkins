if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_TimeManager(event, addon)
	if addon ~= "Blizzard_TimeManager" then return end

	AS:SkinFrame(TimeManagerFrame)

	AS:StripTextures(TimeManagerFrameInset)
	AS:SkinCloseButton(TimeManagerFrameCloseButton)

	AS:SkinDropDownBox(TimeManagerAlarmHourDropDown)
	AS:SkinDropDownBox(TimeManagerAlarmMinuteDropDown)
	AS:SkinDropDownBox(TimeManagerAlarmAMPMDropDown)

	AS:SkinEditBox(TimeManagerAlarmMessageEditBox)

	AS:SkinButton(TimeManagerAlarmEnabledButton)
	TimeManagerAlarmEnabledButton:SetSize(16, 16)
	TimeManagerAlarmEnabledButtonText:SetPoint("RIGHT", 76, 0)

	AS:SkinCheckBox(TimeManagerMilitaryTimeCheck)
	AS:SkinCheckBox(TimeManagerLocalTimeCheck)

	AS:StripTextures(TimeManagerStopwatchFrame)
	AS:SetTemplate(TimeManagerStopwatchCheck)
	AS:SkinTexture(TimeManagerStopwatchCheck:GetNormalTexture())
	AS:SetInside(TimeManagerStopwatchCheck:GetNormalTexture())
	AS:StyleButton(TimeManagerStopwatchCheck)

	AS:SkinBackdropFrame(StopwatchFrame)
	StopwatchFrame.Backdrop:SetPoint("TOPLEFT", 0, -17)
	StopwatchFrame.Backdrop:SetPoint("BOTTOMRIGHT", 0, 2)

	AS:StripTextures(StopwatchTabFrame)
	AS:SkinCloseButton(StopwatchCloseButton)

	AS:SkinArrowButton(StopwatchPlayPauseButton)
	AS:SkinArrowButton(StopwatchResetButton)

	StopwatchPlayPauseButton:SetPoint("RIGHT", StopwatchResetButton, "LEFT", -4, 0)
	StopwatchResetButton:SetPoint("BOTTOMRIGHT", StopwatchFrame, "BOTTOMRIGHT", -4, 6)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_TimeManager", AS.Blizzard_TimeManager, 'ADDON_LOADED')
