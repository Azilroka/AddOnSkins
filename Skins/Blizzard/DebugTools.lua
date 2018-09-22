local AS = unpack(AddOnSkins)

function AS:Blizzard_DebugTools(event, addon)
	if addon ~= 'Blizzard_DebugTools' then return end

	ScriptErrorsFrame:SetParent(UIParent)

	AS:SkinFrame(ScriptErrorsFrame, nil, nil, true)
	AS:SkinNextPrevButton(ScriptErrorsFrame.NextError)
	AS:SkinNextPrevButton(ScriptErrorsFrame.PreviousError)
	AS:SkinButton(ScriptErrorsFrame.Close)
	AS:SkinButton(ScriptErrorsFrame.Reload)
	AS:SkinCloseButton(ScriptErrorsFrameClose)
	AS:SkinScrollBar(ScriptErrorsFrameScrollBar)

	AS:SkinBackdropFrame(ScriptErrorsFrame.ScrollFrame)
	ScriptErrorsFrame.ScrollFrame:SetFrameLevel(ScriptErrorsFrame.ScrollFrame:GetFrameLevel() + 2)

	AS:SkinFrame(EventTraceFrame, nil, nil, true)
	EventTraceFrameScrollBG:SetTexture(nil)
	AS:CreateBackdrop(EventTraceFrameScroll)
	EventTraceFrameScroll.Backdrop:SetAllPoints(EventTraceFrameScroll.thumb)
	EventTraceFrameScroll.thumb:SetTexture(nil)
	AS:SkinCloseButton(EventTraceFrameCloseButton)

	AS:SkinTooltip(EventTraceTooltip)

	FrameStackTooltip:SetParent(UIParent)

	AS:SkinTooltip(FrameStackTooltip)
	FrameStackTooltip:SetFrameStrata('TOOLTIP')
	FrameStackTooltip:SetFrameLevel(255)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_DebugTools', AS.Blizzard_DebugTools, 'ADDON_LOADED')
