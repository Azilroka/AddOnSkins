local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'RecountSkin'
function AS:SkinRecount()
	local L = LibStub('AceLocale-3.0'):GetLocale('Recount')

	function Recount:ShowReset()
		AS:AcceptFrame(L['Reset Recount?'], function(self) Recount:ResetData() self:GetParent():Hide() end)
	end

	local function SkinFrame(frame)
		AS:SkinBackdropFrame(frame)
		frame.backdrop:SetAllPoints()
		frame.backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, -6)
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

	AS:SkinScrollBar(Recount_MainWindow_ScrollBarScrollBar)

	Recount_MainWindow:HookScript('OnShow', function(self) if AS:CheckOption('EmbedRecount') then EmbedSystem_MainWindow:Show() end end)
	Recount.MainWindow.FileButton:HookScript('OnClick', function(self) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate() end end)

	hooksecurefunc(Recount, 'ShowScrollbarElements', function(self, name) Recount_MainWindow_ScrollBarScrollBar:Show() end)
	hooksecurefunc(Recount, 'HideScrollbarElements', function(self, name) Recount_MainWindow_ScrollBarScrollBar:Hide() end)
	hooksecurefunc(Recount, 'CreateFrame', function(self, frame) SkinFrame(_G[frame]) end)

	hooksecurefunc(Recount, 'ShowReport', function(self)
		if Recount_ReportWindow.isSkinned then return end
		Recount_ReportWindow.isSkinned = true
		AS:SkinBackdropFrame(Recount_ReportWindow.Whisper)
		AS:SkinButton(Recount_ReportWindow.ReportButton)
		AS:SkinSlideBar(Recount_ReportWindow_Slider, 8, true)
	end)
end

AS:RegisterSkin(name, AS.SkinRecount)