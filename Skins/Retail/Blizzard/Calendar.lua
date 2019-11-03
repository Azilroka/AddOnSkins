if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local ipairs, unpack = ipairs, unpack
--WoW API / Variables
local CLASS_ICON_TCOORDS = CLASS_ICON_TCOORDS
local CLASS_SORT_ORDER = CLASS_SORT_ORDER
-- GLOBALS:

function AS:Blizzard_Calendar(event, addon)
	if addon ~= 'Blizzard_Calendar' then return end

	AS:SkinFrame(_G.CalendarFrame)
	AS:SkinCloseButton(_G.CalendarCloseButton)
	_G.CalendarCloseButton:SetPoint("TOPRIGHT", _G.CalendarFrame, "TOPRIGHT", -4, -4)

	AS:SkinArrowButton(_G.CalendarPrevMonthButton)
	AS:SkinArrowButton(_G.CalendarNextMonthButton)

	AS:StripTextures(_G.CalendarFilterFrame)
	_G.CalendarFilterFrame:SetWidth(155)

	_G.CalendarFilterFrameText:ClearAllPoints()
	_G.CalendarFilterFrameText:SetPoint("RIGHT", _G.CalendarFilterButton, "LEFT", -2, 0)

	_G.CalendarFilterButton:ClearAllPoints()
	_G.CalendarFilterButton:SetPoint("RIGHT", _G.CalendarFilterFrame, "RIGHT", -10, 3)
	_G.CalendarFilterButton.SetPoint = AS.Noop

	AS:SkinArrowButton(_G.CalendarFilterButton)

	AS:CreateBackdrop(_G.CalendarFilterFrame, 'Default')
	_G.CalendarFilterFrame.Backdrop:SetPoint("TOPLEFT", 20, 2)
	_G.CalendarFilterFrame.Backdrop:SetPoint("BOTTOMRIGHT", _G.CalendarFilterButton, "BOTTOMRIGHT", 2, -2)

	AS:SetTemplate(_G.CalendarContextMenu)
	_G.CalendarContextMenu.SetBackdropColor = AS.Noop
	_G.CalendarContextMenu.SetBackdropBorderColor = AS.Noop

	AS:SetTemplate(_G.CalendarInviteStatusContextMenu)
	_G.CalendarInviteStatusContextMenu.SetBackdropColor = AS.Noop
	_G.CalendarInviteStatusContextMenu.SetBackdropBorderColor = AS.Noop

	if not AS.ParchmentEnabled then
		for i = 1, 42 do
			local Button = _G["CalendarDayButton"..i]
			Button:SetFrameLevel(Button:GetFrameLevel() + 1)
			AS:SkinFrame(Button)
			Button:SetBackdropColor(0,0,0,0)
			for j = 1, 4 do
				local EventButton = _G["CalendarDayButton"..i.."EventButton"..j]
				AS:StripTextures(EventButton)
				AS:StyleButton(EventButton)
			end
		end

		AS:SkinFrame(_G.CalendarTodayFrame)
		AS:CreateBackdrop(_G.CalendarTodayFrame)
		_G.CalendarTodayFrame:SetSize(_G.CalendarDayButton1:GetWidth(), _G.CalendarDayButton1:GetHeight())
		_G.CalendarTodayFrame:SetBackdropBorderColor(unpack(AS.Color))
		_G.CalendarTodayFrame:SetBackdropColor(0, 0, 0, 0)
		_G.CalendarTodayFrame:HookScript('OnUpdate', function(self) self:SetAlpha(_G.CalendarTodayTextureGlow:GetAlpha()) end)
		_G.CalendarTodayFrame.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
		_G.CalendarTodayFrame.Backdrop:SetBackdropColor(0, 0, 0, 0)
		_G.CalendarTodayFrame.Backdrop:CreateShadow()
	end

	AS:SkinFrame(_G.CalendarCreateEventFrame)
	_G.CalendarCreateEventFrame:SetPoint("TOPLEFT", _G.CalendarFrame, "TOPRIGHT", 3, -24)
	AS:StripTextures(_G.CalendarCreateEventTitleFrame)

	AS:SkinButton(_G.CalendarCreateEventCreateButton, true)
	AS:SkinButton(_G.CalendarCreateEventMassInviteButton, true)
	AS:SkinButton(_G.CalendarCreateEventInviteButton, true)
	_G.CalendarCreateEventInviteButton:SetPoint("TOPLEFT", _G.CalendarCreateEventInviteEdit, "TOPRIGHT", 4, 1)
	_G.CalendarCreateEventInviteEdit:SetWidth(_G.CalendarCreateEventInviteEdit:GetWidth() - 2)

	AS:SkinFrame(_G.CalendarCreateEventInviteList)

	AS:SkinEditBox(_G.CalendarCreateEventInviteEdit)
	AS:SkinEditBox(_G.CalendarCreateEventTitleEdit)
	AS:SkinDropDownBox(_G.CalendarCreateEventTypeDropDown)

	AS:SkinFrame(_G.CalendarCreateEventDescriptionContainer)

	AS:SkinCloseButton(_G.CalendarCreateEventCloseButton)
	AS:StripTextures(_G.CalendarCreateEventCloseButton)

	AS:SkinCheckBox(_G.CalendarCreateEventLockEventCheck)

	AS:SkinDropDownBox(_G.CalendarCreateEventHourDropDown)
	AS:SkinDropDownBox(_G.CalendarCreateEventMinuteDropDown)
	AS:SkinDropDownBox(_G.CalendarCreateEventAMPMDropDown)
	AS:SkinDropDownBox(_G.CalendarCreateEventDifficultyOptionDropDown)
	AS:SkinTexture(_G.CalendarCreateEventIcon)
	_G.CalendarCreateEventIcon.SetTexCoord = AS.Noop

	AS:StripTextures(_G.CalendarCreateEventInviteListSection)

	_G.CalendarClassButtonContainer:HookScript("OnShow", function()
		for i, class in ipairs(CLASS_SORT_ORDER) do
			local button = _G["CalendarClassButton"..i]
			local tcoords = CLASS_ICON_TCOORDS[class]
			local buttonIcon = button:GetNormalTexture()
			buttonIcon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
			buttonIcon:SetTexCoord(tcoords[1] + 0.015, tcoords[2] - 0.02, tcoords[3] + 0.018, tcoords[4] - 0.02)
			AS:SetInside(buttonIcon)
		end
	end)

	_G.CalendarClassButton1:SetPoint("TOPLEFT", _G.CalendarClassButtonContainer, "TOPLEFT", 4, 0)

	for i = 1, 12 do
		local Button = _G["CalendarClassButton"..i]
		AS:StripTextures(Button)
		AS:SkinButton(Button)
		Button:SetSize(24, 24)
	end

	AS:StripTextures(_G.CalendarClassTotalsButton)
	AS:SkinButton(_G.CalendarClassTotalsButton)
	_G.CalendarClassTotalsButton:SetWidth(24)

	AS:SkinFrame(_G.CalendarTexturePickerFrame)
	AS:StripTextures(_G.CalendarTexturePickerTitleFrame)

	AS:SkinScrollBar(_G.CalendarTexturePickerScrollBar)
	AS:SkinButton(_G.CalendarTexturePickerAcceptButton, true)
	AS:SkinButton(_G.CalendarTexturePickerCancelButton, true)
	_G.CalendarCreateEventRaidInviteButtonBorder:Hide()
	AS:SkinButton(_G.CalendarCreateEventInviteButton)
	AS:SkinButton(_G.CalendarCreateEventRaidInviteButton)

	AS:SkinFrame(_G.CalendarMassInviteFrame)
	AS:StripTextures(_G.CalendarMassInviteTitleFrame)

	AS:SkinCloseButton(_G.CalendarMassInviteCloseButton)

	AS:SkinFrame(_G.CalendarViewRaidFrame)
	_G.CalendarViewRaidFrame:SetPoint("TOPLEFT", _G.CalendarFrame, "TOPRIGHT", 3, -24)
	AS:StripTextures(_G.CalendarViewRaidTitleFrame)
	AS:SkinCloseButton(_G.CalendarViewRaidCloseButton)
	AS:StripTextures(_G.CalendarViewRaidCloseButton)

	AS:SkinFrame(_G.CalendarViewHolidayFrame)
	_G.CalendarViewHolidayFrame:SetPoint("TOPLEFT", _G.CalendarFrame, "TOPRIGHT", 3, -24)
	AS:StripTextures(_G.CalendarViewHolidayTitleFrame)
	AS:SkinCloseButton(_G.CalendarViewHolidayCloseButton)
	AS:StripTextures(_G.CalendarViewHolidayCloseButton)
	_G.CalendarViewHolidayInfoTexture:SetAllPoints()

	AS:SkinFrame(_G.CalendarViewEventFrame)
	_G.CalendarViewEventFrame:SetPoint("TOPLEFT", _G.CalendarFrame, "TOPRIGHT", 3, -24)
	AS:StripTextures(_G.CalendarViewEventTitleFrame)
	AS:SkinFrame(_G.CalendarViewEventDescriptionContainer)
	AS:SkinFrame(_G.CalendarViewEventInviteList)
	AS:StripTextures(_G.CalendarViewEventInviteListSection)
	AS:SkinCloseButton(_G.CalendarViewEventCloseButton)
	AS:StripTextures(_G.CalendarViewEventCloseButton)

	AS:SkinScrollBar(_G.CalendarViewEventInviteListScrollFrameScrollBar)
	AS:SkinButton(_G.CalendarViewEventAcceptButton)
	AS:SkinButton(_G.CalendarViewEventTentativeButton)
	AS:SkinButton(_G.CalendarViewEventRemoveButton)
	AS:SkinButton(_G.CalendarViewEventDeclineButton)

	AS:SkinFrame(_G.CalendarEventPickerFrame)
	AS:StripTextures(_G.CalendarEventPickerTitleFrame)

	AS:SkinScrollBar(_G.CalendarEventPickerScrollBar)

	AS:StripTextures(_G.CalendarEventPickerCloseButton)
	AS:SkinCloseButton(_G.CalendarEventPickerCloseButton)
	AS:SkinScrollBar(_G.CalendarCreateEventDescriptionScrollFrameScrollBar)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_Calendar', AS.Blizzard_Calendar, 'ADDON_LOADED')
