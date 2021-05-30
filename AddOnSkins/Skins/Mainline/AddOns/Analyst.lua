local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Analyst') then return end

function AS:Analyst()
	AS:SkinFrame(EconomyFrame)
	EconomyFrame:SetHeight(450)
	EconomyFrame:SetWidth(364)
	EconomyFrameTitleFrame:ClearAllPoints()
	EconomyFrameTitleFrame:SetPoint('TOP', EconomyFrame, 'TOP', 0, -5)
	AS:SkinCloseButton(EconomyFrameCloseButton)
	AS:SkinFrame(EconomyFrameTopStats)
	AS:SkinFrame(EconomyFrameLeftStats)
	AS:SkinFrame(EconomyFrameRightStats)
	AS:SkinDropDownBox(EconomyFramePeriodDropDown)
	AS:SkinDropDownBox(EconomyFrameLeftStatsReportDropDown)
	AS:SkinDropDownBox(EconomyFrameRightStatsReportDropDown)
	AS:SkinCheckBox(EconomyFrameAllCharacters)
end

AS:RegisterSkin('Analyst', AS.Analyst)