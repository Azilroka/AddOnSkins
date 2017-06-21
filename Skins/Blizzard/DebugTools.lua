local AS = unpack(AddOnSkins)

function AS:Blizzard_DebugTools(event, addon)
	if IsAddOnLoaded('Blizzard_DebugTools') or addon == 'Blizzard_DebugTools' then
		ScriptErrorsFrame:SetParent(UIParent)
		AS:SkinFrame(ScriptErrorsFrame, nil, nil, true)
		AS:SkinNextPrevButton(ScriptErrorsFrame.NextError) -- must be redone
		AS:SkinNextPrevButton(ScriptErrorsFrame.PreviousError) -- must be redone
		AS:SkinButton(ScriptErrorsFrame.Close)
		AS:SkinButton(ScriptErrorsFrame.Reload)
		AS:SkinButton(ScriptErrorsFrame.firstButton)
		AS:SkinButton(ScriptErrorsFrame.lastButton)
		AS:SkinCloseButton(ScriptErrorsFrameClose)
		AS:SkinScrollBar(ScriptErrorsFrameScrollBar)
		ScriptErrorsFrame.ScrollFrame.Text:FontTemplate(nil, 13)
		ScriptErrorsFrame.ScrollFrame:CreateBackdrop('Default')
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

		AS:UnregisterSkinEvent('Blizzard_DebugTools', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('Blizzard_DebugTools', AS.Blizzard_DebugTools, 'ADDON_LOADED')