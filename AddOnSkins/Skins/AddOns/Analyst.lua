local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('Analyst') then return end

function R:Analyst()
	S:HandleFrame(EconomyFrame)
	EconomyFrame:SetHeight(450)
	EconomyFrame:SetWidth(364)
	EconomyFrameTitleFrame:ClearAllPoints()
	EconomyFrameTitleFrame:SetPoint('TOP', EconomyFrame, 'TOP', 0, -5)
	S:HandleCloseButton(EconomyFrameCloseButton)
	S:HandleFrame(EconomyFrameTopStats)
	S:HandleFrame(EconomyFrameLeftStats)
	S:HandleFrame(EconomyFrameRightStats)
	S:HandleDropDownBox(EconomyFramePeriodDropDown)
	S:HandleDropDownBox(EconomyFrameLeftStatsReportDropDown)
	S:HandleDropDownBox(EconomyFrameRightStatsReportDropDown)
	S:HandleCheckBox(EconomyFrameAllCharacters)
end

AS:RegisterSkin('Analyst', R.Analyst)
