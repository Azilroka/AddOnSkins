local AS, L, S, R = unpack(AddOnSkins)

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

AS:RegisterSkin('Analyst')
