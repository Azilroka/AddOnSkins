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
	FrameStackTooltip:SetParent(UIParent)
	FrameStackTooltip:SetFrameStrata('TOOLTIP')
	FrameStackTooltip:SetFrameLevel(255)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_DebugTools', AS.Blizzard_DebugTools, 'ADDON_LOADED')
