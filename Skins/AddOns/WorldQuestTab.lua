local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WorldQuestTab') then return end

function AS:WorldQuestTab()
	AS:SkinButton(WQT_TabNormal)
	AS:SkinButton(WQT_TabWorld)

	AS:SkinButton(WQT_WorldQuestFrameSortButton)

	AS:StripTextures(WQT_WorldQuestFrameFilterButton, true)

	AS:SkinButton(WQT_WorldQuestFrameFilterButton)

	AS:SkinArrowButton(WQT_WorldQuestFrameSortButtonButton)

	WQT_TabWorld.TabBg:Hide()
	WQT_TabWorld.Highlight:SetTexture("")

	WQT_TabNormal.Highlight:SetTexture("")
	WQT_TabNormal.TabBg:Hide()

	WQT_WorldQuestFrameSortButton:ClearAllPoints()
	WQT_WorldQuestFrameSortButton:Point('LEFT', WQT_TabWorld, 'RIGHT', 18, -2)
	WQT_WorldQuestFrameSortButtonButton:ClearAllPoints()
	WQT_WorldQuestFrameSortButtonButton:Point('LEFT', WQT_WorldQuestFrameSortButton, 'RIGHT', -29, 0)
	WQT_WorldQuestFrameSortButtonText:ClearAllPoints()
	WQT_WorldQuestFrameSortButtonText:Point('CENTER', WQT_WorldQuestFrameSortButton, 'CENTER', -20, 0)
	WQT_WorldQuestFrameFilterButton:ClearAllPoints()
	WQT_WorldQuestFrameFilterButton:Point('LEFT', WQT_WorldQuestFrameSortButton, 'RIGHT', 18, 0)

	WQT_WorldQuestFrameSortButton:Size(92, 32)
	WQT_WorldQuestFrameSortButtonButton:Size(27, 28)
	WQT_WorldQuestFrameFilterButton:Size(92, 32)

	AS:SkinScrollBar(WQT_QuestScrollFrameScrollBar)

	for _, Button in ipairs(WQT_QuestScrollFrame.buttons) do
		Button.Reward:SetSize(26, 26)
		AS:SkinTexture(Button.Reward.Icon, true)
		Button.Reward.IconBorder:SetAlpha(0)
		hooksecurefunc(Button.Reward.IconBorder, 'SetVertexColor', function(self, r, g, b) Button.Reward.Icon.Backdrop:SetBackdropBorderColor(r, g, b) end)
	end

	for _, Tooltip in pairs({ WQT_CompareTooltip1, WQT_CompareTooltip2, WQT_Tooltip}) do
		AS:SkinTooltip(Tooltip)
	end
end

AS:RegisterSkin('WorldQuestTab', AS.WorldQuestTab)
