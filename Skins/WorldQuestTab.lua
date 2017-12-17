local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WorldQuestTab') then return end

function AS:WorldQuestTab()
	AS:SkinButton(WQT_TabNormal)
	AS:SkinButton(WQT_TabWorld)
	AS:SkinButton(WQT_WorldQuestFrameSortButton)
	AS:StripTextures(WQT_WorldQuestFrameFilterButton, true)
	AS:SkinButton(WQT_WorldQuestFrameFilterButton)
	AS:SkinNextPrevButton(WQT_WorldQuestFrameSortButtonButton)
	WQT_TabWorld.TabBg:Hide()
	WQT_TabNormal.TabBg:Hide()

	--Reposition elements
	WQT_TabNormal:ClearAllPoints()
	WQT_TabNormal:Point('RIGHT', WorldMapFrameCloseButton, 'LEFT', -231, -36)
	WQT_TabWorld:ClearAllPoints()
	WQT_TabWorld:Point('LEFT', WQT_TabNormal, 'RIGHT', 1, 0)
	WQT_WorldQuestFrameSortButton:ClearAllPoints()
	WQT_WorldQuestFrameSortButton:Point('LEFT', WQT_TabWorld, 'RIGHT', 18, -2)
	WQT_WorldQuestFrameSortButtonButton:ClearAllPoints()
	WQT_WorldQuestFrameSortButtonButton:Point('LEFT', WQT_WorldQuestFrameSortButton, 'RIGHT', -29, 0)
	WQT_WorldQuestFrameSortButtonText:ClearAllPoints()
	WQT_WorldQuestFrameSortButtonText:Point('CENTER', WQT_WorldQuestFrameSortButton, 'CENTER', -20, 0)
	WQT_WorldQuestFrameFilterButton:ClearAllPoints()
	WQT_WorldQuestFrameFilterButton:Point('LEFT', WQT_WorldQuestFrameSortButton, 'RIGHT', 18, 0)

	--Resize Buttons
	WQT_WorldQuestFrameSortButton:Size(92, 32)
	WQT_WorldQuestFrameSortButtonButton:Size(27, 28)
	WQT_WorldQuestFrameFilterButton:Size(92, 32)

	AS:SkinScrollBar(WQT_QuestScrollFrameScrollBar)
end

AS:RegisterSkin('WorldQuestTab', AS.WorldQuestTab)
