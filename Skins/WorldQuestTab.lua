local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WorldQuestTab') then return end

function AS:WorldQuestTab()

	AS:SkinButton(WQT_TabNormal)
	WQT_TabNormal.TabBg:Hide()
	WQT_TabNormal.Highlight:SetAlpha(0)
	AS:SkinButton(WQT_TabWorld)
	WQT_TabWorld.TabBg:Hide()
	WQT_TabWorld.Highlight:SetAlpha(0)
	AS:SkinDropDownBox(WQT_WorldQuestFrameSortButton, 130)
	WQT_WorldQuestFrameSortButton:ClearAllPoints()
	WQT_WorldQuestFrameSortButton:SetPoint("LEFT", WQT_TabWorld, "RIGHT", -5, -4)
	AS:SkinButton(WQT_WorldQuestFrameFilterButton)
	AS:SkinScrollBar(WQT_QuestScrollFrameScrollBar)
end

AS:RegisterSkin('WorldQuestTab', AS.WorldQuestTab)