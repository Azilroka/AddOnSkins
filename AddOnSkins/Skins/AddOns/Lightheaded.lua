local AS, L, S, R = unpack(AddOnSkins)

function R:LightHeaded()
	S:HandleFrame(LightHeadedFrame)
	--QuestNPCModel:SetScale(UIParent:GetScale())
	LightHeadedFrame:SetScale(UIParent:GetScale())
	S:HandleFrame(LightHeadedSearchBox)
	S:HandleTooltip(LightHeadedTooltip)
	S:StripTextures(LightHeadedScrollFrame)
	S:HandleCloseButton(LightHeadedFrame.close)

	S:HandleNextPrevButton(LightHeadedFrameSub.prev)
	S:HandleNextPrevButton(LightHeadedFrameSub.next)
	LightHeadedFrameSub.prev:SetSize(16, 16)
	LightHeadedFrameSub.next:SetSize(16, 16)
	LightHeadedFrameSub.prev:SetPoint('RIGHT', LightHeadedFrameSub.page, 'LEFT', -25, 0)
	LightHeadedFrameSub.next:SetPoint('LEFT', LightHeadedFrameSub.page, 'RIGHT', 25, 0)
	S:HandleScrollBar(LightHeadedScrollFrameScrollBar)
	LightHeadedFrameSub.title:SetTextColor(23 / 255, 132 / 255, 209 / 255)
end

AS:RegisterSkin('Lightheaded')
