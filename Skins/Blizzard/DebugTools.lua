local AS = unpack(AddOnSkins)

function AS:Blizzard_DebugTools(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		ScriptErrorsFrame:SetParent(UIParent)

		AS:SkinFrame(ScriptErrorsFrame, nil, nil, true)
		AS:SkinArrowButton(ScriptErrorsFrame.NextError)
		AS:SkinArrowButton(ScriptErrorsFrame.PreviousError)
		AS:SkinButton(ScriptErrorsFrame.Close)
		AS:SkinButton(ScriptErrorsFrame.Reload)
		AS:SkinCloseButton(ScriptErrorsFrameClose)
		AS:SkinScrollBar(ScriptErrorsFrameScrollBar)

		AS:SkinBackdropFrame(ScriptErrorsFrame.ScrollFrame)
		ScriptErrorsFrame.ScrollFrame:SetFrameLevel(ScriptErrorsFrame.ScrollFrame:GetFrameLevel() + 2)
	end
	if addon ~= 'Blizzard_DebugTools' then return end

	AS:SkinFrame(EventTraceFrame)
	AS:SkinScrollBar(EventTraceFrameScroll)
	AS:SkinCloseButton(EventTraceFrameCloseButton)

	AS:SkinTooltip(EventTraceTooltip)

	AS:SkinTooltip(FrameStackTooltip)

	local function SkinTableAttributeDisplay(frame)
		AS:SkinFrame(frame)
		AS:SkinFrame(frame.ScrollFrameArt)

		AS:SkinCloseButton(frame.CloseButton)

		AS:SkinEditBox(frame.FilterBox)

		AS:SkinArrowButton(frame.OpenParentButton, 'up')
		AS:SkinArrowButton(frame.DuplicateButton, 'down')
		AS:SkinArrowButton(frame.NavigateBackwardButton, 'left')
		AS:SkinArrowButton(frame.NavigateForwardButton, 'right')

		frame.OpenParentButton:Size(17)
		frame.DuplicateButton:Size(17)
		frame.NavigateBackwardButton:Size(17)
		frame.NavigateForwardButton:Size(17)

		AS:SkinCheckBox(frame.VisibilityButton)
		AS:SkinCheckBox(frame.HighlightButton)
		AS:SkinCheckBox(frame.DynamicUpdateButton)

		frame.OpenParentButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
		frame.DuplicateButton:SetPoint("LEFT", frame.NavigateForwardButton, "RIGHT")
		frame.NavigateBackwardButton:SetPoint("LEFT", frame.OpenParentButton, "RIGHT", 2, 0)
		frame.NavigateForwardButton:SetPoint("LEFT", frame.NavigateBackwardButton, "RIGHT", 2, 0)
		frame.DuplicateButton:SetPoint("LEFT", frame.NavigateForwardButton, "RIGHT", 2, 0)

		if frame.LinesScrollFrame and frame.LinesScrollFrame.ScrollBar then
			AS:SkinScrollBar(frame.LinesScrollFrame.ScrollBar)
		end
	end

	SkinTableAttributeDisplay(TableAttributeDisplay)
	hooksecurefunc(TableInspectorMixin, "OnLoad", function(self)
		if self and self.ScrollFrameArt and not self.skinned then
			SkinTableAttributeDisplay(self)
			self.skinned = true
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_DebugTools', AS.Blizzard_DebugTools, 'ADDON_LOADED')
