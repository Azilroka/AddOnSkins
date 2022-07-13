local AS = unpack(AddOnSkins)

local _G = _G

local function ReskinEventTraceButton(button)
	AS:SkinButton(button)
	button.NormalTexture:SetAlpha(0)
	button.MouseoverOverlay:SetAlpha(0)
end

local function reskinScrollChild(self)
	for i = 1, self.ScrollTarget:GetNumChildren() do
		local child = select(i, self.ScrollTarget:GetChildren())
		local hideButton = child and child.HideButton
		if hideButton and not hideButton.IsSkinned then
			AS:SkinCloseButton(hideButton)

			hideButton:ClearAllPoints()
			hideButton:SetPoint('LEFT', 3, 0)

			local checkButton = child.CheckButton
			if checkButton then
				AS:SkinCheckBox(checkButton)
				checkButton:SetSize(22, 22)
			end

			hideButton.IsSkinned = true
		end
	end
end

local function ReskinEventTraceScrollBox(frame)
	frame:DisableDrawLayer('BACKGROUND')
	frame:CreateBackdrop('Transparent')

	hooksecurefunc(frame, 'Update', reskinScrollChild)
end

local function ReskinEventTraceFrame(frame)
	ReskinEventTraceScrollBox(frame.ScrollBox)
	AS:SkinTrimScrollBar(frame.ScrollBar) -- needs adjustments.. see:Trimscrollbar in ElvUI
end

function AS:Blizzard_EventTrace(event, addon)
	if addon ~= "Blizzard_EventTrace" then return end

	local EventTrace = _G.EventTrace
	AS:SkinFrame(EventTrace)
	AS:SkinCloseButton(_G.EventTraceCloseButton)

	_G.EventTraceTooltip:SetFrameLevel(10)

	-- Top Buttons
	local SubtitleBar = EventTrace.SubtitleBar
	EventTrace.SubtitleBar.ViewLog:StripTextures()
	EventTrace.SubtitleBar.ViewFilter:StripTextures()
	AS:SkinButton(EventTrace.SubtitleBar.ViewLog)
	AS:SkinButton(EventTrace.SubtitleBar.ViewFilter)

	-- Options Dropdown
	local OptionsDropDown = EventTrace.SubtitleBar.OptionsDropDown
	OptionsDropDown:SetWidth(135)
	AS:SkinButton(OptionsDropDown)

	-- Log Bar
	local LogBar = EventTrace.Log.Bar
	AS:SkinEditBox(LogBar.SearchBox)
	LogBar.SearchBox:SetHeight(18)
	LogBar.DiscardAllButton:StripTextures()
	LogBar.PlaybackButton:StripTextures()
	LogBar.MarkButton:StripTextures()
	AS:SkinButton(LogBar.DiscardAllButton)
	AS:SkinButton(LogBar.PlaybackButton)
	AS:SkinButton(LogBar.MarkButton)

	-- Filter Bar
	local FilterBar = EventTrace.Filter.Bar
	FilterBar.DiscardAllButton:StripTextures()
	FilterBar.UncheckAllButton:StripTextures()
	FilterBar.CheckAllButton:StripTextures()
	AS:SkinButton(FilterBar.DiscardAllButton)
	AS:SkinButton(FilterBar.UncheckAllButton)
	AS:SkinButton(FilterBar.CheckAllButton)

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

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_EventTrace', AS.Blizzard_EventTrace, 'ADDON_LOADED')
