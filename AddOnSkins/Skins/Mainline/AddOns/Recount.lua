local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Recount') then return end

function AS:Recount()
	local L = LibStub('AceLocale-3.0'):GetLocale('Recount')

	function Recount:ShowReset()
		AS:AcceptFrame(L['Reset Recount?'], function(self) Recount:ResetData() self:GetParent():Hide() end)
	end

	local function SkinFrame(frame)
		AS:SkinBackdropFrame(frame)
		frame.Backdrop:SetAllPoints()
		frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, -6)
		frame.CloseButton:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', -1, -9)
		frame:SetBackdrop(nil)
		frame.TitleBackground = CreateFrame('Frame', nil, frame)
		AS:SkinFrame(frame.TitleBackground, 'Default')
		frame.TitleBackground:SetPoint('TOP', frame, 'TOP', 0, -8)
		frame.TitleBackground:SetScript('OnUpdate', function(self) self:SetSize(frame:GetWidth() - 4, 22) end)
		frame.TitleBackground:SetFrameLevel(frame:GetFrameLevel())
		frame.Title:SetPoint('TOPLEFT', frame, 'TOPLEFT', 6, -12)
		AS:Desaturate(frame.CloseButton)
		if frame.ConfigButton then AS:Desaturate(frame.ConfigButton) end
		if frame.FileButton then AS:Desaturate(frame.FileButton) end
		if frame.LeftButton then AS:Desaturate(frame.LeftButton) end
		if frame.ResetButton then AS:Desaturate(frame.ResetButton) end
		if frame.RightButton then AS:Desaturate(frame.RightButton) end
		if frame.ReportButton then AS:Desaturate(frame.ReportButton) end
		if frame.SummaryButton then AS:Desaturate(frame.SummaryButton) end
	end

	local RecountFrames = {
		Recount.MainWindow,
		Recount.ConfigWindow,
		Recount.GraphWindow,
		Recount.DetailWindow,
	}

	for _, frame in pairs(RecountFrames) do
		if frame then SkinFrame(frame) end
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

	AS:SkinScrollBar(Recount.MainWindow.ScrollBar)

	Recount.MainWindow:HookScript('OnShow', function(self) if AS:CheckEmbed('Recount') then EmbedSystem_MainWindow:Show() end end)
	Recount.MainWindow.FileButton:HookScript('OnClick', function(self) if LibDropdownFrame0 then AS:SetTemplate(LibDropdownFrame0) end end)

	hooksecurefunc(Recount, 'ShowScrollbarElements', function(self, name) Recount_MainWindow_ScrollBarScrollBar:Show() end)
	hooksecurefunc(Recount, 'HideScrollbarElements', function(self, name) Recount_MainWindow_ScrollBarScrollBar:Hide() end)

	if Recount.db.profile.MainWindow.ShowScrollbar == false then
		Recount:HideScrollbarElements("Recount_MainWindow_ScrollBar")
	end

	hooksecurefunc(Recount, 'ShowReport', function(self)
		if Recount_ReportWindow.isSkinned then return end
		Recount_ReportWindow.isSkinned = true
		AS:SkinBackdropFrame(Recount_ReportWindow.Whisper)
		AS:SkinButton(Recount_ReportWindow.ReportButton)
		AS:SkinSlideBar(Recount_ReportWindow_Slider, true)
	end)
end

AS:RegisterSkin('Recount', AS.Recount)
