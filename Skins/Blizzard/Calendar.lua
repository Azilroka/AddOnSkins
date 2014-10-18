if not Tukui then return end
local AS = unpack(select(2, ...))

local name = 'Blizzard_Calendar'
function AS:Blizzard_Calendar(event, addon)
	if addon == name then
		AS:SkinFrame(CalendarFrame)
		AS:SkinCloseButton(CalendarCloseButton)
		CalendarCloseButton:Point("TOPRIGHT", CalendarFrame, "TOPRIGHT", -4, -4)

		AS:SkinNextPrevButton(CalendarPrevMonthButton)
		AS:SkinNextPrevButton(CalendarNextMonthButton)

		do
			local frame = CalendarFilterFrame
			local button = CalendarFilterButton

			frame:StripTextures()
			frame:Width(155)
			
			_G[frame:GetName().."Text"]:ClearAllPoints()
			_G[frame:GetName().."Text"]:Point("RIGHT", button, "LEFT", -2, 0)

			
			button:ClearAllPoints()
			button:Point("RIGHT", frame, "RIGHT", -10, 3)
			button.SetPoint = AS.Noop
			
			AS:SkinNextPrevButton(button, true)
			
			frame:CreateBackdrop("Default")
			local Backdrop = frame.backdrop or frame.Backdrop
			Backdrop:Point("TOPLEFT", 20, 2)
			Backdrop:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -2)
		end

		CalendarContextMenu:SetTemplate("Transparent")
		CalendarContextMenu.SetBackdropColor = AS.Noop
		CalendarContextMenu.SetBackdropBorderColor = AS.Noop
		
		CalendarInviteStatusContextMenu:SetTemplate("Transparent")
		CalendarInviteStatusContextMenu.SetBackdropColor = AS.Noop
		CalendarInviteStatusContextMenu.SetBackdropBorderColor = AS.Noop

		for i = 1, 42 do
			_G["CalendarDayButton"..i]:SetFrameLevel(_G["CalendarDayButton"..i]:GetFrameLevel() + 1)
			AS:SkinFrame(_G["CalendarDayButton"..i])
			_G["CalendarDayButton"..i]:SetBackdropColor(0,0,0,0)
			for j = 1, 4 do
				local b = _G["CalendarDayButton"..i.."EventButton"..j]
				b:StripTextures()
				b:StyleButton()
			end
		end

		AS:SkinFrame(CalendarTodayFrame)
		CalendarTodayFrame:Size(CalendarDayButton1:GetWidth(), CalendarDayButton1:GetHeight())
		CalendarTodayFrame:SetBackdropBorderColor(0, 0.44, .87, 1)
		CalendarTodayFrame:SetBackdropColor(0, 0, 0, 0)
		CalendarTodayFrame:HookScript('OnUpdate', function(self) self:SetAlpha(CalendarTodayTextureGlow:GetAlpha()) end)
		CalendarTodayFrame:CreateBackdrop()
		CalendarTodayFrame.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
		CalendarTodayFrame.Backdrop:SetBackdropColor(0, 0, 0, 0)
		CalendarTodayFrame.Backdrop:CreateShadow()

		AS:SkinFrame(CalendarCreateEventFrame)
		CalendarCreateEventFrame:Point("TOPLEFT", CalendarFrame, "TOPRIGHT", 3, -24)
		CalendarCreateEventTitleFrame:StripTextures()

		AS:SkinButton(CalendarCreateEventCreateButton, true)
		AS:SkinButton(CalendarCreateEventMassInviteButton, true)
		AS:SkinButton(CalendarCreateEventInviteButton, true)
		CalendarCreateEventInviteButton:Point("TOPLEFT", CalendarCreateEventInviteEdit, "TOPRIGHT", 4, 1)
		CalendarCreateEventInviteEdit:Width(CalendarCreateEventInviteEdit:GetWidth() - 2)

		AS:SkinFrame(CalendarCreateEventInviteList)

		AS:SkinEditBox(CalendarCreateEventInviteEdit)
		AS:SkinEditBox(CalendarCreateEventTitleEdit)
		AS:SkinDropDownBox(CalendarCreateEventTypeDropDown, 120)

		AS:SkinFrame(CalendarCreateEventDescriptionContainer)

		AS:SkinCloseButton(CalendarCreateEventCloseButton)
		CalendarCreateEventCloseButton:StripTextures()

		AS:SkinCheckBox(CalendarCreateEventLockEventCheck)

		AS:SkinDropDownBox(CalendarCreateEventHourDropDown, 68)
		AS:SkinDropDownBox(CalendarCreateEventMinuteDropDown, 68)
		AS:SkinDropDownBox(CalendarCreateEventAMPMDropDown, 68)
		AS:SkinDropDownBox(CalendarCreateEventRepeatOptionDropDown, 120)
		CalendarCreateEventIcon:SetTexCoord(.08, .92, .08, .92)
		CalendarCreateEventIcon.SetTexCoord = AS.Noop

		CalendarCreateEventInviteListSection:StripTextures()

		CalendarClassButtonContainer:HookScript("OnShow", function()
			for i, class in ipairs(CLASS_SORT_ORDER) do
				local button = _G["CalendarClassButton"..i]
				button:StripTextures()
				button:CreateBackdrop("Default")

				local tcoords = CLASS_ICON_TCOORDS[class]
				local buttonIcon = button:GetNormalTexture()
				buttonIcon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
				buttonIcon:SetTexCoord(tcoords[1] + 0.015, tcoords[2] - 0.02, tcoords[3] + 0.018, tcoords[4] - 0.02)
			end

			CalendarClassButton1:Point("TOPLEFT", CalendarClassButtonContainer, "TOPLEFT", 5, 0)

			CalendarClassTotalsButton:StripTextures()
			CalendarClassTotalsButton:CreateBackdrop("Default")
		end)
		
		AS:SkinFrame(CalendarTexturePickerFrame)
		CalendarTexturePickerTitleFrame:StripTextures()

		AS:SkinScrollBar(CalendarTexturePickerScrollBar)
		AS:SkinButton(CalendarTexturePickerAcceptButton, true)
		AS:SkinButton(CalendarTexturePickerCancelButton, true)
		AS:SkinButton(CalendarCreateEventInviteButton, true)
		AS:SkinButton(CalendarCreateEventRaidInviteButton, true)
		
		AS:SkinFrame(CalendarMassInviteFrame)
		CalendarMassInviteTitleFrame:StripTextures()
		
		AS:SkinCloseButton(CalendarMassInviteCloseButton)
		AS:SkinButton(CalendarMassInviteGuildAcceptButton)
		AS:SkinDropDownBox(CalendarMassInviteGuildRankMenu, 130)
		
		AS:SkinEditBox(CalendarMassInviteGuildMinLevelEdit)
		AS:SkinEditBox(CalendarMassInviteGuildMaxLevelEdit)

		AS:SkinFrame(CalendarViewRaidFrame)
		CalendarViewRaidFrame:Point("TOPLEFT", CalendarFrame, "TOPRIGHT", 3, -24)
		CalendarViewRaidTitleFrame:StripTextures()
		AS:SkinCloseButton(CalendarViewRaidCloseButton)
		CalendarViewRaidCloseButton:StripTextures()
		
		AS:SkinFrame(CalendarViewHolidayFrame)
		CalendarViewHolidayFrame:Point("TOPLEFT", CalendarFrame, "TOPRIGHT", 3, -24)
		CalendarViewHolidayTitleFrame:StripTextures()
		AS:SkinCloseButton(CalendarViewHolidayCloseButton)
		CalendarViewHolidayCloseButton:StripTextures()
		CalendarViewHolidayInfoTexture:SetAllPoints()
		
		AS:SkinFrame(CalendarViewEventFrame)
		CalendarViewEventFrame:Point("TOPLEFT", CalendarFrame, "TOPRIGHT", 3, -24)
		CalendarViewEventTitleFrame:StripTextures()
		AS:SkinFrame(CalendarViewEventDescriptionContainer)
		AS:SkinFrame(CalendarViewEventInviteList)
		CalendarViewEventInviteListSection:StripTextures()
		AS:SkinCloseButton(CalendarViewEventCloseButton)
		CalendarViewEventCloseButton:StripTextures()
		
		AS:SkinScrollBar(CalendarViewEventInviteListScrollFrameScrollBar)

		local buttons = {
			"CalendarViewEventAcceptButton",
			"CalendarViewEventTentativeButton",
			"CalendarViewEventRemoveButton",
			"CalendarViewEventDeclineButton",
		}

		for _, button in pairs(buttons) do
			_G[button]:SkinButton()
		end		
		
		-- too many event same day box
		AS:SkinFrame(CalendarEventPickerFrame)
		CalendarEventPickerTitleFrame:StripTextures()

		AS:SkinScrollBar(CalendarEventPickerScrollBar)

		CalendarEventPickerCloseButton:StripTextures()
		AS:SkinCloseButton(CalendarEventPickerCloseButton, true)
		AS:SkinScrollBar(CalendarCreateEventDescriptionScrollFrameScrollBar)
	end
end

AS:RegisterSkin(name, AS.Blizzard_Calendar, 'ADDON_LOADED')
