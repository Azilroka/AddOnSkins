local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('DejaClassicStats') then return end

function AS:DejaClassicStats()
	if DCS_StatScrollFrame and DejaClassicStatsFrame then
		local DejaClassicStatsFrame_Height = DejaClassicStatsFrame:GetHeight()
		local point, relativeFrame, relativePoint, xOfs, yOfs = DCS_StatScrollFrame:GetPoint()
		DCS_StatScrollFrame:ClearAllPoints()
		DCS_StatScrollFrame:SetPoint(point, relativeFrame, relativePoint, xOfs+1, yOfs+14)
		DCS_StatScrollFrame:SetHeight(424)
		DejaClassicStatsFrame:SetHeight(DejaClassicStatsFrame_Height+20)
	end
	AS:SkinFrame(DCSPrimaryStatsHeader)
	AS:SkinFrame(DCSDefenseStatsHeader)
	AS:SkinFrame(DCSMeleeEnhancementsStatsHeader)
	AS:SkinFrame(DCSSpellEnhancementsStatsHeader)
	AS:SkinFrame(DCS_StatScrollFrame)
	AS:SkinFrame(DejaClassicStatsFrame)
	AS:SkinScrollBar(DCS_StatScrollFrame.ScrollBar)
end

AS:RegisterSkin('DejaClassicStats', AS.DejaClassicStats)
