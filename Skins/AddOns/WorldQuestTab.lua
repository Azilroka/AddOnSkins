local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WorldQuestTab') then return end

function AS:WorldQuestTab()
	AS:SkinButton(WQT_TabNormal)
	AS:SkinButton(WQT_TabWorld)

	AS:StripTextures(WQT_WorldQuestFrameSortButton)

	AS:StripTextures(WQT_WorldQuestFrameFilterButton, true)

	AS:SkinButton(WQT_WorldQuestFrameFilterButton)

	AS:SkinArrowButton(WQT_WorldQuestFrameSortButton.Button)

	WQT_TabWorld.TabBg:Hide()
	WQT_TabWorld.Highlight:SetTexture("")

	WQT_TabNormal.Highlight:SetTexture("")
	WQT_TabNormal.TabBg:Hide()

	AS:SkinScrollBar(WQT_QuestScrollFrameScrollBar)

	for _, Tooltip in pairs({ WQT_CompareTooltip1, WQT_CompareTooltip2, WQT_Tooltip}) do
		AS:SkinTooltip(Tooltip)
	end
end

AS:RegisterSkin('WorldQuestTab', AS.WorldQuestTab)
