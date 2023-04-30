local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local next, unpack = next, unpack

local CLASS_SORT_ORDER = CLASS_SORT_ORDER
local CLASS_ICON_TCOORDS = CLASS_ICON_TCOORDS
local hooksecurefunc = hooksecurefunc

local function SkinContainer(frame, container)
	S:Kill(frame.NineSlice)

	local child = container or frame.scrollFrame
	if child and not child.backdrop then
		S:CreateBackdrop(child)
	end
end

local function StripClassTextures(button, class)
	local tcoords = CLASS_ICON_TCOORDS[class]
	button:SetTexCoord(tcoords[1] + .022, tcoords[2] - .025, tcoords[3] + .022, tcoords[4] - .025)
end

local function HandleEventIcon(icon)
	S:Size(icon, 54)
	icon:ClearAllPoints()
	S:Point(icon, 'TOPLEFT', _G.CalendarViewEventFrame.HeaderFrame, 'TOPLEFT', 15, -20)
	S:CreateBackdrop(icon, nil, nil, nil, nil, nil, nil, nil, nil, true)
	icon:SetTexCoord(unpack(S.Media.TexCoords))
	icon.SetTexCoord = S.noop
end

function R:Blizzard_Calendar()
	if not AS:IsSkinEnabled('Blizzard_Calendar', 'calendar') then return end

	local CalendarFrame = _G.CalendarFrame
	CalendarFrame:DisableDrawLayer('BORDER')
	S:CreateBackdrop(CalendarFrame)

	S:HandleCloseButton(_G.CalendarCloseButton)
	S:Point(_G.CalendarCloseButton, 'TOPRIGHT', CalendarFrame, 'TOPRIGHT', -4, -4)

	for i = 1, 7 do
		_G['CalendarWeekday'..i..'Background']:SetAlpha(0)
	end

	SkinContainer(_G.CalendarViewEventInviteList)
	SkinContainer(_G.CalendarCreateEventInviteList)
	SkinContainer(_G.CalendarViewEventDescriptionContainer, _G.CalendarViewEventDescriptionScrollFrame)
	SkinContainer(_G.CalendarCreateEventDescriptionContainer, _G.CalendarCreateEventDescriptionScrollFrame)

	_G.CalendarCreateEventFrameButtonBackground:Hide()
	_G.CalendarCreateEventMassInviteButtonBorder:Hide()
	_G.CalendarCreateEventCreateButtonBorder:Hide()
	_G.CalendarEventPickerFrameButtonBackground:Hide()
	_G.CalendarEventPickerCloseButtonBorder:Hide()
	_G.CalendarCreateEventRaidInviteButtonBorder:Hide()
	_G.CalendarMonthBackground:SetAlpha(0)
	_G.CalendarYearBackground:SetAlpha(0)
	_G.CalendarFrameModalOverlay:SetAlpha(.25)
	_G.CalendarTexturePickerFrameButtonBackground:Hide()
	_G.CalendarTexturePickerAcceptButtonBorder:Hide()
	_G.CalendarTexturePickerCancelButtonBorder:Hide()
	_G.CalendarClassTotalsButtonBackgroundTop:Hide()
	_G.CalendarClassTotalsButtonBackgroundMiddle:Hide()
	_G.CalendarClassTotalsButtonBackgroundBottom:Hide()
	_G.CalendarFilterFrameLeft:Hide()
	_G.CalendarFilterFrameMiddle:Hide()
	_G.CalendarFilterFrameRight:Hide()
	_G.CalendarViewEventDivider:Hide()
	_G.CalendarCreateEventDivider:Hide()

	S:HandleNextPrevButton(_G.CalendarPrevMonthButton, nil, nil, true)
	S:HandleNextPrevButton(_G.CalendarNextMonthButton, nil, nil, true)

	S:StripTextures(_G.CalendarFilterFrame)
	S:Width(_G.CalendarFilterFrame, 155)

	_G.CalendarFilterFrameText:ClearAllPoints()
	S:Point(_G.CalendarFilterFrameText, 'RIGHT', _G.CalendarFilterButton, 'LEFT', -2, 0)

	_G.CalendarFilterButton:ClearAllPoints()
	S:Point(_G.CalendarFilterButton, 'RIGHT', _G.CalendarFilterFrame, 'RIGHT', -10, 3)
	_G.CalendarFilterButton.SetPoint = S.noop

	S:HandleNextPrevButton(_G.CalendarFilterButton)

	S:CreateBackdrop(_G.CalendarFilterFrame)
	S:Point(_G.CalendarFilterFrame.backdrop, 'TOPLEFT', 20, 2)
	S:Point(_G.CalendarFilterFrame.backdrop, 'BOTTOMRIGHT', _G.CalendarFilterButton, 'BOTTOMRIGHT', 2, -2)

	S:SetTemplate(_G.CalendarContextMenu.NineSlice)
	S:SetTemplate(_G.CalendarInviteStatusContextMenu.NineSlice)

	--Boost frame levels
	for i = 1, 42 do
		_G['CalendarDayButton'..i..'DarkFrame']:SetAlpha(.5)
		local bu = _G['CalendarDayButton'..i]

		if not AS:CheckOption('Parchment') then
			bu:DisableDrawLayer('BACKGROUND') -- This would remove the 'Parchement'
		end

		S:SetTemplate(bu, nil, nil, nil, true)
		bu:SetBackdropColor(0,0,0,0)
		bu:SetHighlightTexture(S.Media.Blank)
		bu:SetFrameLevel(bu:GetFrameLevel() + 1)

		local hl = bu:GetHighlightTexture()
		hl:SetVertexColor(1, 1, 1, 0.3)
		S:Point(hl, 'TOPLEFT', -1, 1)
		S:Point(hl, 'BOTTOMRIGHT')
		hl.SetAlpha = S.noop
	end

	_G.CalendarWeekdaySelectedTexture:SetDesaturated(true)
	_G.CalendarWeekdaySelectedTexture:SetVertexColor(1, 1, 1, 0.6)

	_G.CalendarTodayTexture:Hide()
	_G.CalendarTodayTextureGlow:Hide()

	S:SetTemplate(_G.CalendarTodayFrame)
	_G.CalendarTodayFrame:SetBackdropBorderColor(_G.NORMAL_FONT_COLOR:GetRGB())
	_G.CalendarTodayFrame:SetBackdropColor(0,0,0,0)
	_G.CalendarTodayFrame:SetScript('OnUpdate', nil)

	hooksecurefunc('CalendarFrame_SetToday', function()
		_G.CalendarTodayFrame:SetAllPoints()
	end)

	--CreateEventFrame
	S:HandleFrame(_G.CalendarCreateEventFrame)
	S:Point(_G.CalendarCreateEventFrame, 'TOPLEFT', CalendarFrame, 'TOPRIGHT', 3, -24)
	S:StripTextures(_G.CalendarCreateEventFrame.Header)
	S:HandleTrimScrollBar(_G.CalendarCreateEventInviteList.ScrollBar)

	S:HandleButton(_G.CalendarCreateEventCreateButton, true)
	S:HandleButton(_G.CalendarCreateEventMassInviteButton, true)
	S:HandleButton(_G.CalendarCreateEventInviteButton, true)
	S:Point(_G.CalendarCreateEventInviteButton, 'TOPLEFT', _G.CalendarCreateEventInviteEdit, 'TOPRIGHT', 4, 1)
	S:Width(_G.CalendarCreateEventInviteEdit, _G.CalendarCreateEventInviteEdit:GetWidth() - 2)

	S:HandleEditBox(_G.CalendarCreateEventInviteEdit)
	S:HandleEditBox(_G.CalendarCreateEventTitleEdit)
	S:HandleDropDownBox(_G.CalendarCreateEventTypeDropDown, 120)
	S:HandleDropDownBox(_G.CalendarCreateEventCommunityDropDown, 240)

	S:HandleCloseButton(_G.CalendarCreateEventCloseButton)
	S:HandleCheckBox(_G.CalendarCreateEventLockEventCheck)

	S:HandleDropDownBox(_G.CalendarCreateEventHourDropDown, 75)
	S:HandleDropDownBox(_G.CalendarCreateEventMinuteDropDown, 75)
	S:HandleDropDownBox(_G.CalendarCreateEventAMPMDropDown, 75)
	S:HandleDropDownBox(_G.CalendarCreateEventDifficultyOptionDropDown)

	_G.CalendarViewEventTitle:ClearAllPoints()
	S:Point(_G.CalendarViewEventTitle, 'TOPLEFT', _G.CalendarViewEventIcon, 'TOPRIGHT', 5, 0)
	HandleEventIcon(_G.CalendarViewEventIcon)

	_G.CalendarCreateEventDateLabel:ClearAllPoints()
	S:Point(_G.CalendarCreateEventDateLabel, 'TOPLEFT', _G.CalendarCreateEventIcon, 'TOPRIGHT', 5, 0)
	HandleEventIcon(_G.CalendarCreateEventIcon)

	S:Point(_G.CalendarClassButton1, 'TOPLEFT', _G.CalendarClassButtonContainer, 'TOPLEFT', E.PixelMode and 3 or 5, 0)

	local lastClassButton
	for i, class in next, CLASS_SORT_ORDER do
		local button = _G['CalendarClassButton'..i]
		local count = _G['CalendarClassButton'..i..'Count']
		StripClassTextures(button:GetNormalTexture(), class)
		button:GetRegions():Hide()
		S:SetTemplate(button)
		S:Size(button, 28)

		S:FontTemplate(count)
		count:ClearAllPoints()
		S:Point(count, 'BOTTOMRIGHT', 0, 1)

		if lastClassButton then
			button:ClearAllPoints()
			S:Point(button, 'TOPLEFT', lastClassButton, 'BOTTOMLEFT', 0, -8)
		end

		lastClassButton = button
	end

	S:handleFrame(_G.CalendarClassTotalsButton)
	S:Size(_G.CalendarClassTotalsButton, 28, 18)

	--Texture Picker Frame
	S:HandleFrame(_G.CalendarTexturePickerFrame)
	_G.CalendarTexturePickerFrame.Header:StripTextures()

	S:HandleButton(_G.CalendarTexturePickerAcceptButton, true)
	S:HandleButton(_G.CalendarTexturePickerCancelButton, true)
	S:HandleButton(_G.CalendarCreateEventInviteButton, true)
	S:HandleButton(_G.CalendarCreateEventRaidInviteButton, true)

	--Mass Invite Frame
	S:HandleFrame(_G.CalendarMassInviteFrame)
	S:StripTextures(_G.CalendarMassInviteFrame.Header)
	S:HandleDropDownBox(_G.CalendarMassInviteCommunityDropDown, 200)
	S:HandleDropDownBox(_G.CalendarMassInviteRankMenu)
	S:HandleEditBox(_G.CalendarMassInviteMinLevelEdit)
	S:HandleEditBox(_G.CalendarMassInviteMaxLevelEdit)
	S:HandleCloseButton(_G.CalendarMassInviteCloseButton)
	S:HandleButton(_G.CalendarMassInviteAcceptButton)

	--Raid View
	S:HandleFrame(_G.CalendarViewRaidFrame)
	S:Point(_G.CalendarViewRaidFrame, 'TOPLEFT', CalendarFrame, 'TOPRIGHT', 3, -24)
	S:StripTextures(_G.CalendarViewRaidFrame.Header)
	S:HandleCloseButton(_G.CalendarViewRaidCloseButton)

	--Holiday View
	S:StripTextures(_G.CalendarViewHolidayFrame, true)
	S:SetTemplate(_G.CalendarViewHolidayFrame)
	S:Point(_G.CalendarViewHolidayFrame, 'TOPLEFT', CalendarFrame, 'TOPRIGHT', 3, -24)
	S:StripTextures(_G.CalendarViewHolidayFrame.Header)
	_G.CalendarViewHolidayFrameModalOverlay:SetAlpha(0)
	S:HandleCloseButton(_G.CalendarViewHolidayCloseButton)

	-- Event View
	S:HandleFrame(_G.CalendarViewEventFrame)
	S:Point(_G.CalendarViewEventFrame, 'TOPLEFT', CalendarFrame, 'TOPRIGHT', 3, -24)
	S:StripTextures(_G.CalendarViewEventFrame.Header)
	S:StripTextures(_G.CalendarViewEventInviteListSection)

	S:HandleCloseButton(_G.CalendarViewEventCloseButton)
	S:HandleButton(_G.CalendarViewEventAcceptButton)
	S:HandleButton(_G.CalendarViewEventTentativeButton)
	S:HandleButton(_G.CalendarViewEventRemoveButton)
	S:HandleButton(_G.CalendarViewEventDeclineButton)

	--Event Picker Frame
	S:HandleFrame(_G.CalendarEventPickerFrame)
	S:StripTextures(_G.CalendarEventPickerFrame.Header)

	S:HandleTrimScrollBar(_G.CalendarEventPickerFrame.ScrollBar)
	S:HandleButton(_G.CalendarEventPickerCloseButton, true)
end

AS:RegisterSkin('Blizzard_Calendar', nil, 'ADDON_LOADED')
