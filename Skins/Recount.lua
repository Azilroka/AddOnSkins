local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Recount') then return end

local name = 'RecountSkin'
function AS:SkinRecount()
	local L = LibStub('AceLocale-3.0'):GetLocale('Recount')

	function Recount:ShowReset()
		AS:AcceptFrame(L['Reset Recount?'], function(self) Recount:ResetData() self:GetParent():Hide() end)
	end

	local function SkinFrame(frame)
		AS:SkinBackdropFrame(frame)
		local Backdrop = frame.backdrop or frame.Backdrop
		Backdrop:SetAllPoints()
		Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, -6)
		frame.CloseButton:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', -1, -9)
		frame:SetBackdrop(nil)
		frame.TitleBackground = CreateFrame('Frame', nil, frame)
		AS:SkinTitleBar(frame.TitleBackground, 'Default')
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

	if _G['Recount_Realtime_!RAID_DAMAGE'] then SkinFrame(_G['Recount_Realtime_!RAID_DAMAGE'].Window) end
	if _G['Recount_Realtime_!RAID_HEALING'] then SkinFrame(_G['Recount_Realtime_!RAID_HEALING'].Window) end
	if _G['Recount_Realtime_!RAID_HEALINGTAKEN'] then SkinFrame(_G['Recount_Realtime_!RAID_HEALINGTAKEN'].Window) end
	if _G['Recount_Realtime_!RAID_DAMAGETAKEN'] then SkinFrame(_G['Recount_Realtime_!RAID_DAMAGETAKEN'].Window) end
	if _G['Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH'] then SkinFrame(_G['Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH'].Window) end
	if _G['Recount_Realtime_FPS_FPS'] then SkinFrame(_G['Recount_Realtime_FPS_FPS'].Window) end
	if _G['Recount_Realtime_Latency_LAG'] then SkinFrame(_G['Recount_Realtime_Latency_LAG'].Window) end
	if _G['Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC'] then SkinFrame(_G['Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC'].Window) end
	if _G['Recount_Realtime_Downstream Traffic_UP_TRAFFIC'] then SkinFrame(_G['Recount_Realtime_Downstream Traffic_UP_TRAFFIC'].Window) end

	AS:SkinScrollBar(Recount_MainWindow_ScrollBarScrollBar)

	Recount.MainWindow:HookScript('OnShow', function(self) if AS:CheckEmbed('Recount') then EmbedSystem_MainWindow:Show() end end)
	Recount.MainWindow.FileButton:HookScript('OnClick', function(self) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate() end end)

	hooksecurefunc(Recount, 'ShowScrollbarElements', function(self, name) Recount_MainWindow_ScrollBarScrollBar:Show() end)
	hooksecurefunc(Recount, 'HideScrollbarElements', function(self, name) Recount_MainWindow_ScrollBarScrollBar:Hide() end)

	hooksecurefunc(Recount, 'ShowReport', function(self)
		if Recount_ReportWindow.isSkinned then return end
		Recount_ReportWindow.isSkinned = true
		AS:SkinBackdropFrame(Recount_ReportWindow.Whisper)
		AS:SkinButton(Recount_ReportWindow.ReportButton)
		AS:SkinSlideBar(Recount_ReportWindow_Slider, 8, true)
	end)
end

AS:RegisterSkin(name, AS.SkinRecount)