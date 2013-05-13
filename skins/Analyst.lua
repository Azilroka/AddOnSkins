local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "AnalystSkin"
function AS:SkinAnalyst()
	AS:SkinFrame(EconomyFrame)
	EconomyFrame:SetHeight(450)
	EconomyFrame:SetWidth(364)
	EconomyFrameTitleFrame:ClearAllPoints()
	EconomyFrameTitleFrame:SetPoint("TOP", EconomyFrame, "TOP", 0, -5)
	S:HandleCloseButton(EconomyFrameCloseButton)
	AS:SkinFrame(EconomyFrameTopStats)
	AS:SkinFrame(EconomyFrameLeftStats)
	AS:SkinFrame(EconomyFrameRightStats)
	S:HandleDropDownBox(EconomyFramePeriodDropDown)
	S:HandleDropDownBox(EconomyFrameLeftStatsReportDropDown)
	S:HandleDropDownBox(EconomyFrameRightStatsReportDropDown)
	S:HandleCheckBox(EconomyFrameAllCharacters)
end

AS:RegisterSkin(name, AS.SkinAnalyst)