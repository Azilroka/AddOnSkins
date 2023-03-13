local AS, L, S, R = unpack(AddOnSkins)

function R:WorldQuestTab()
	S:HandleButton(WQT_TabNormal)
	S:HandleButton(WQT_TabWorld)

	S:StripTextures(WQT_WorldQuestFrameSortButton)

	S:StripTextures(WQT_WorldQuestFrameFilterButton, true)

	S:HandleButton(WQT_WorldQuestFrameFilterButton)

	S:HandleNextPrevButton(WQT_WorldQuestFrameSortButton.Button)

	WQT_TabWorld.TabBg:Hide()
	WQT_TabWorld.Highlight:SetTexture("")

	WQT_TabNormal.Highlight:SetTexture("")
	WQT_TabNormal.TabBg:Hide()

	S:HandleScrollBar(WQT_QuestScrollFrameScrollBar)

	for _, Tooltip in pairs({ WQT_CompareTooltip1, WQT_CompareTooltip2, WQT_Tooltip}) do
		S:HandleTooltip(Tooltip)
	end
end

AS:RegisterSkin('WorldQuestTab')
