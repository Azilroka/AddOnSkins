local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WorldQuestTab') then return end

function AS:WorldQuestTab()

	AS:SkinButton(BWQ_TabNormal)
	BWQ_TabNormal.TabBg:Hide()
	AS:SkinButton(BWQ_TabWorld)
	BWQ_TabWorld.TabBg:Hide()
	AS:SkinButton(BWQ_WorldQuestFrameFilterButton)
	AS:SkinScrollBar(BWQ_QuestScrollFrameScrollBar)
end

AS:RegisterSkin('WorldQuestTab', AS.WorldQuestTab)