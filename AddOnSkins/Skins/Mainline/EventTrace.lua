local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local pairs, next = pairs, next
local hooksecurefunc = hooksecurefunc

local function ReskinEventTraceButton(button)
	S:HandleButton(button)
	button.NormalTexture:SetAlpha(0)
	button.MouseoverOverlay:SetAlpha(0)
end

local function reskinScrollChild(self)
	for _, child in next, { self.ScrollTarget:GetChildren() } do
		local button = child.HideButton
		if button and not button.IsSkinned then
			S:HandleCloseButton(button)

			button:ClearAllPoints()
			S:Point(button, 'LEFT', 3, 0)

			local checkButton = child.CheckButton
			if checkButton then
				S:HandleCheckBox(checkButton)
				checkButton:SetSize(22, 22)
			end

			button.IsSkinned = true
		end
	end
end

local function ReskinEventTraceScrollBox(frame)
	frame:DisableDrawLayer('BACKGROUND')
	S:CreateBackdrop(frame)

	hooksecurefunc(frame, 'Update', reskinScrollChild)
end

local function ReskinEventTraceFrame(frame)
	ReskinEventTraceScrollBox(frame.ScrollBox)
	S:HandleTrimScrollBar(frame.ScrollBar)
end

function R:Blizzard_EventTrace()
	if not AS:IsSkinEnabled('Blizzard_EventTrace', 'eventLog') then return end

	-- Frame
	local EventTrace = _G.EventTrace
	S:handleFrame(EventTrace)

	_G.EventTraceTooltip:SetFrameLevel(10)

	-- Top Buttons
	local SubtitleBar = EventTrace.SubtitleBar
	S:StripTextures(EventTrace.SubtitleBar.ViewLog)
	S:StripTextures(EventTrace.SubtitleBar.ViewFilter)
	S:HandleButton(EventTrace.SubtitleBar.ViewLog)
	S:HandleButton(EventTrace.SubtitleBar.ViewFilter)

	-- Options Dropdown
	local OptionsDropDown = EventTrace.SubtitleBar.OptionsDropDown
	OptionsDropDown:SetWidth(135)
	S:HandleButton(OptionsDropDown)

	-- Log Bar
	local LogBar = EventTrace.Log.Bar
	S:HandleEditBox(LogBar.SearchBox)
	LogBar.SearchBox:SetHeight(18)
	S:StripTextures(LogBar.DiscardAllButton)
	S:StripTextures(LogBar.PlaybackButton)
	S:StripTextures(LogBar.MarkButton)
	S:HandleButton(LogBar.DiscardAllButton)
	S:HandleButton(LogBar.PlaybackButton)
	S:HandleButton(LogBar.MarkButton)

	-- Filter Bar
	local FilterBar = EventTrace.Filter.Bar
	S:StripTextures(FilterBar.DiscardAllButton)
	S:StripTextures(FilterBar.UncheckAllButton)
	S:StripTextures(FilterBar.CheckAllButton)
	S:HandleButton(FilterBar.DiscardAllButton)
	S:HandleButton(FilterBar.UncheckAllButton)
	S:HandleButton(FilterBar.CheckAllButton)

	-- Resize Button
	EventTrace.ResizeButton:SetAlpha(0)

	ReskinEventTraceFrame(EventTrace.Log.Events)
	ReskinEventTraceFrame(EventTrace.Log.Search)
	ReskinEventTraceFrame(EventTrace.Filter)

	local buttons = {
		SubtitleBar.ViewLog,
		SubtitleBar.ViewFilter,
		LogBar.DiscardAllButton,
		LogBar.PlaybackButton,
		LogBar.MarkButton,
		FilterBar.DiscardAllButton,
		FilterBar.UncheckAllButton,
		FilterBar.CheckAllButton,
	}

	for _, button in pairs(buttons) do
		ReskinEventTraceButton(button)
	end
end

AS:RegisterSkin('Blizzard_EventTrace', nil, 'ADDON_LOADED')
