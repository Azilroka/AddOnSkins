local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Lightheaded') then return end

function AS:LightHeaded()
	AS:SkinFrame(LightHeadedFrame)
	QuestNPCModel:SetScale(UIParent:GetScale())
	LightHeadedFrame:SetScale(UIParent:GetScale())
	AS:SkinFrame(LightHeadedSearchBox)
	AS:SkinTooltip(LightHeadedTooltip)
	AS:StripTextures(LightHeadedScrollFrame)
	AS:SkinCloseButton(LightHeadedFrame.close)

	AS:SkinArrowButton(LightHeadedFrameSub.prev)
	AS:SkinArrowButton(LightHeadedFrameSub.next)
	LightHeadedFrameSub.prev:SetSize(16, 16)
	LightHeadedFrameSub.next:SetSize(16, 16)
	LightHeadedFrameSub.prev:SetPoint('RIGHT', LightHeadedFrameSub.page, 'LEFT', -25, 0)
	LightHeadedFrameSub.next:SetPoint('LEFT', LightHeadedFrameSub.page, 'RIGHT', 25, 0)
	AS:SkinScrollBar(LightHeadedScrollFrameScrollBar)
	LightHeadedFrameSub.title:SetTextColor(23/255, 132/255, 209/255)	
end

AS:RegisterSkin('Lightheaded', AS.LightHeaded)
