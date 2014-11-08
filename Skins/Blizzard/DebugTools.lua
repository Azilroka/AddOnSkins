local AS = unpack(AddOnSkins)

function AS:Blizzard_DebugTools(event, addon)
	if IsAddOnLoaded('Blizzard_DebugTools') or addon == 'Blizzard_DebugTools' then
		ScriptErrorsFrame:SetParent(UIParent)
		AS:SkinFrame(ScriptErrorsFrame, nil, nil, true)
		AS:SkinButton(ScriptErrorsFrame.next)
		AS:SkinButton(ScriptErrorsFrame.previous)
		AS:SkinButton(ScriptErrorsFrame.close)
		AS:SkinCloseButton(ScriptErrorsFrameClose)
		AS:SkinScrollBar(ScriptErrorsFrameScrollFrameScrollBar)
		ScriptErrorsFrameScrollFrameScrollBar:ClearAllPoints()
		ScriptErrorsFrameScrollFrameScrollBar:SetPoint("TOPRIGHT", 50, 14)
		ScriptErrorsFrameScrollFrameScrollBar:SetPoint("BOTTOMRIGHT", 50, -20)

		AS:SkinFrame(EventTraceFrame, nil, nil, true)
		EventTraceFrameScrollBG:SetTexture(nil)
		EventTraceFrameScroll:CreateBackdrop()
		local Backdrop = EventTraceFrameScroll.backdrop or EventTraceFrameScroll.Backdrop
		EventTraceFrameScroll.thumb:SetTexture(nil)
		Backdrop:SetAllPoints(EventTraceFrameScroll.thumb)
		AS:SkinCloseButton(EventTraceFrameCloseButton)

		AS:SkinTooltip(EventTraceTooltip)

		FrameStackTooltip:SetParent(UIParent)
		AS:SkinTooltip(FrameStackTooltip)
		FrameStackTooltip:SetFrameStrata('TOOLTIP')
		FrameStackTooltip:SetFrameLevel(255)

		AS:UnregisterEvent('Blizzard_DebugTools', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('Blizzard_DebugTools', AS.Blizzard_DebugTools, 'ADDON_LOADED')