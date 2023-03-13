local AS, L, S, R = unpack(AddOnSkins)

local ES = AS.EmbedSystem

function R:Recount()
	local function SkinFrame(frame)
		S:HandleFrame(frame, true)
		frame.backdrop:SetAllPoints()
		frame.backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, -6)
		frame.CloseButton:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', -1, -9)
		frame:SetBackdrop(nil)
		frame.TitleBackground = CreateFrame('Frame', nil, frame)
		S:HandleFrame(frame.TitleBackground, nil, 'Default')
		frame.TitleBackground:SetPoint('TOP', frame, 'TOP', 0, -8)
		frame.TitleBackground:SetFrameLevel(frame:GetFrameLevel())
		frame.TitleBackground:SetSize(frame:GetWidth() - 4, 22)
		frame.Title:SetPoint('TOPLEFT', frame, 'TOPLEFT', 6, -12)

		for _, button in pairs({ 'CloseButton', 'ConfigButton', 'FileButton', 'LeftButton', 'ResetButton', 'RightButton', 'ReportButton', 'SummaryButton'}) do
			if frame[button] then S:Desaturate(frame.ConfigButton) end
		end
	end

	for _, frame in pairs({ 'MainWindow', 'ConfigWindow', 'GraphWindow', 'DetailWindow' }) do
		if Recount[frame] then SkinFrame(Recount[frame]) end
	end

	local OtherRecountFrames = {
		'Recount_Realtime_!RAID_DAMAGE',
		'Recount_Realtime_!RAID_HEALING',
		'Recount_Realtime_!RAID_HEALINGTAKEN',
		'Recount_Realtime_!RAID_DAMAGETAKEN',
		'Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH',
		'Recount_Realtime_FPS_FPS',
		'Recount_Realtime_Latency_LAG',
		'Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC',
		'Recount_Realtime_Downstream Traffic_UP_TRAFFIC'
	}

	for _, frame in pairs(OtherRecountFrames) do
		if _G[frame] then
			SkinFrame(_G[frame].Window)
		end
	end

	S:HandleScrollBar(Recount.MainWindow.ScrollBar)

	Recount.MainWindow:HookScript('OnShow', function() if AS:CheckEmbed('Recount') then ES.Main:Show() end end)
	Recount.MainWindow.FileButton:HookScript('OnClick', function() if LibDropdownFrame0 then S:SetTemplate(LibDropdownFrame0) end end)

	hooksecurefunc(Recount, 'ShowScrollbarElements', function() Recount_MainWindow_ScrollBarScrollBar:Show() end)
	hooksecurefunc(Recount, 'HideScrollbarElements', function() Recount_MainWindow_ScrollBarScrollBar:Hide() end)

	if Recount.db.profile.MainWindow.ShowScrollbar == false then
		Recount:HideScrollbarElements("Recount_MainWindow_ScrollBar")
	end

	hooksecurefunc(Recount, 'ShowReport', function()
		if Recount_ReportWindow.isSkinned then return end
		Recount_ReportWindow.isSkinned = true
		S:HandleFrame(Recount_ReportWindow.Whisper, true)
		S:HandleButton(Recount_ReportWindow.ReportButton)
		S:HandleSliderFrame(Recount_ReportWindow_Slider, true)
	end)
end

AS:RegisterSkin('Recount')
