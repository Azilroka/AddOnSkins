local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Odyssey') then return end

function AS:Odyssey()
	AS:StripTextures(OdysseyMapsMenuScrollFrame, true)
	AS:StripTextures(OdysseyFrameQuestDetailsSeries, true)
	AS:StripTextures(OdysseyFrameSearchScrollFrame, true)
	OdysseyFramePortrait:Kill()
	AS:SkinFrame(OdysseyFrame)
	AS:SkinFrame(OdysseyFrameRealmSummaryScrollFrame)
	AS:SkinFrame(OdysseyFrameQuestDB)
	AS:SkinFrame(OdysseyFrameQuestDBScrollFrame)
	AS:SkinFrame(OdysseyFrameQuestDetails)
	AS:SkinFrame(OdysseyFrameZoneMaps)
	AS:SkinScrollBar(OdysseyFrameQuestDBScrollFrameScrollBar)
	AS:SkinScrollBar(OdysseyFrameRealmSummaryScrollFrameScrollBar)
	AS:SkinScrollBar(OdysseyMapsMenuScrollFrameScrollBar)
	AS:SkinEditBox(OdysseyFrame_SearchEditBox)
	AS:SkinEditBox(OdysseyFrameQuestDB_MinLevel)
	AS:SkinEditBox(OdysseyFrameQuestDB_MaxLevel)
	OdysseyFrame_ResetButton:SetPoint('TOPLEFT', OdysseyFrame, 'TOPLEFT', 55, -77)
	OdysseyFrameTab1:SetPoint('TOPLEFT', OdysseyFrame, 'BOTTOMLEFT', -5, 2)
	AS:SkinButton(OdysseyFrame_ResetButton)
	AS:SkinButton(OdysseyFrame_SearchButton)
	AS:SkinButton(OdysseyFrameQuestDB_GetHistory)
	AS:SkinCloseButton(OdysseyFrameCloseButton)
	AS:SkinNextPrevButton(OdysseyFrameQuestDetailsGoBack)
	AS:SkinNextPrevButton(OdysseyFrameQuestDetailsGoForward)
	AS:SkinDropDownBox(OdysseyFrameRealmSummary_SelectContinent)
	AS:SkinScrollBar(OdysseyFrameSearchScrollFrameScrollBar)
	for i = 1, 3 do
		AS:SkinTab(_G['OdysseyFrameTab'..i])
		AS:SkinFrame(_G['OdysseyTabQuestsMenuItem'..i])
	end
	for i = 1, 5 do
		AS:SkinFrame(_G['OdysseyTabQuests_Sort'..i])
	end
	for i = 1, 15 do
		AS:SkinFrame(_G['OdysseyTabMapsMenuItem'..i])
	end
	for i = 1, 4 do
		AS:SkinFrame(_G['OdysseyTabSearchMenuItem'..i])
	end
	for i = 1, 10 do
		AS:SkinBackdropFrame(_G['OdysseyFrameRealmSummaryEntry1Item'..i])
		AS:SkinBackdropFrame(_G['OdysseyFrameRealmSummaryEntry2Item'..i])
		AS:SkinBackdropFrame(_G['OdysseyFrameRealmSummaryEntry3Item'..i])
		AS:SkinBackdropFrame(_G['OdysseyFrameRealmSummaryEntry4Item'..i])
		AS:SkinBackdropFrame(_G['OdysseyFrameRealmSummaryEntry5Item'..i])
		AS:SkinBackdropFrame(_G['OdysseyFrameRealmSummaryEntry6Item'..i])
		AS:SkinBackdropFrame(_G['OdysseyFrameRealmSummaryEntry7Item'..i])
		AS:SkinBackdropFrame(_G['OdysseyFrameRealmSummaryEntry8Item'..i])
	end
	AS:SkinTooltip(OdyTooltip)
end

AS:RegisterSkin('Odyssey', AS.Odyssey)