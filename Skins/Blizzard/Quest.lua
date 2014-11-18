local AS = unpack(AddOnSkins)

function AS:Blizzard_Quest()
	AS:SkinFrame(QuestFrame, nil, nil, true)
	AS:StripTextures(QuestFrameInset)
	AS:StripTextures(QuestProgressScrollFrame)
	AS:StripTextures(QuestDetailScrollFrame)
	AS:CreateBackdrop(QuestDetailScrollFrame)
	QuestDetailScrollFrame.Backdrop:SetBackdropColor(0, 0, 0, 0)
	AS:CreateBackdrop(QuestProgressScrollFrame)
	QuestProgressScrollFrame.Backdrop:SetBackdropColor(0, 0, 0, 0)
	AS:CreateBackdrop(QuestRewardScrollFrame)
	AS:StripTextures(QuestRewardScrollFrame, true)
	QuestRewardScrollFrame.Backdrop:SetBackdropColor(0, 0, 0, 0)

	AS:SkinScrollBar(QuestDetailScrollFrameScrollBar)
	AS:SkinScrollBar(QuestNPCModelTextScrollFrameScrollBar)
	AS:SkinScrollBar(QuestGreetingScrollFrameScrollBar)
	AS:SkinScrollBar(QuestProgressScrollFrameScrollBar)
	AS:SkinScrollBar(QuestRewardScrollFrameScrollBar)

	AS:SkinButton(QuestFrameAcceptButton, true)
	AS:SkinButton(QuestFrameDeclineButton, true)
	AS:SkinButton(QuestFrameCompleteButton, true)
	AS:SkinButton(QuestFrameGoodbyeButton, true)
	AS:SkinButton(QuestFrameCompleteQuestButton, true)

	AS:SkinCloseButton(QuestFrameCloseButton)
	QuestInfoItemHighlight:StripTextures()
	QuestFrame:SetHeight(500)

	for i = 1, 6 do
		local Button = _G["QuestProgressItem"..i]
		local Texture = _G["QuestProgressItem"..i.."IconTexture"]
		AS:StripTextures(Button)
		AS:SkinTexture(Texture)
		AS:CreateBackdrop(Button)
		Button.Backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 0, 0)
		Button.Backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 0, 0)
		Button.Backdrop:SetPoint('RIGHT', Button, 'RIGHT', -2, 0)
		Button.Icon.Backdrop = CreateFrame('Frame', nil, Button)
		AS:SetTemplate(Button.Icon.Backdrop)
		Button.Icon.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Button.Icon.Backdrop:SetOutside(Button.Icon)
		Button:Width(_G["QuestProgressItem"..i]:GetWidth() - 4)
	end

--[[
	AS:StripTextures(QuestFrameDetailPanel, true)
	AS:StripTextures(QuestDetailScrollChildFrame, true)
	AS:StripTextures(QuestFrameProgressPanel, true)
	AS:StripTextures(QuestFrameRewardPanel, true)
	hooksecurefunc("QuestFrameProgressItems_Update", function()
		QuestProgressTitleText:SetTextColor(1, 1, 0)
		QuestProgressText:SetTextColor(1, 1, 1)
		QuestProgressRequiredItemsText:SetTextColor(1, 1, 0)
		QuestProgressRequiredMoneyText:SetTextColor(1, 1, 0)
	end)
]]

    hooksecurefunc("QuestInfo_GetRewardButton", function(rewardsFrame, index)
    	local RewardButton = rewardsFrame.RewardButtons[index];
    	if (not RewardButton.skinned) then
    		RewardButton.NameFrame:Hide()
			AS:CreateBackdrop(RewardButton)
			RewardButton.Backdrop:SetPoint('TOPLEFT', RewardButton.Icon, 'TOPRIGHT', 0, 0)
			RewardButton.Backdrop:SetPoint('BOTTOMLEFT', RewardButton.Icon, 'BOTTOMRIGHT', 0, 0)
			RewardButton.Backdrop:SetPoint('RIGHT', RewardButton, 'RIGHT', -2, 0)
    		AS:SkinTexture(RewardButton.Icon)
			RewardButton.Icon.Backdrop = CreateFrame('Frame', nil, RewardButton)
			AS:SetTemplate(RewardButton.Icon.Backdrop)
			RewardButton.Icon.Backdrop:SetBackdropColor(0, 0, 0, 0)
			RewardButton.Icon.Backdrop:SetOutside(RewardButton.Icon)
			RewardButton.Icon.Backdrop:SetScript('OnShow', function(self)
				if RewardButton:GetID() == 0 then return end
				local quality = 0
				if (QuestInfoFrame.questLog) then
					quality = select(4, GetQuestLogChoiceInfo(RewardButton:GetID()))
				else
					quality = select(4, GetQuestItemInfo(RewardButton.type, RewardButton:GetID()))
				end
				if quality and quality > 1 then
					local r, g, b = GetItemQualityColor(quality)
					self:SetBackdropBorderColor(r, g, b, 1)
				else
					self:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
			RewardButton:HookScript('OnUpdate', function(self)
				if QuestInfoItemHighlight:IsShown() and self:GetID() == QuestInfoFrame.itemChoice then
					self.Backdrop:SetBackdropBorderColor(1, 1, 0)
					self.Name:SetTextColor(1, 1, 0)
				elseif QuestInfoItemHighlight:IsShown() then
					self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					self.Name:SetTextColor(1, 1, 1)
				else
					self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					self.Name:SetTextColor(1, 1, 1)
				end
			end)
			RewardButton.skinned = true
    	end
    end)

	AS:SkinFrame(QuestNPCModel)
	--QuestNPCModel:Point("TOPLEFT", QuestLogDetailFrame, "TOPRIGHT", 4, -34)
	AS:SkinBackdropFrame(QuestNPCModelTextFrame)
	QuestNPCModelTextFrame.Backdrop:Point("TOPLEFT", QuestNPCModel, "BOTTOMLEFT", 0, -2)
	QuestNPCModelTextFrame.Backdrop:Point("TOPRIGHT", QuestNPCModel, "BOTTOMRIGHT", 0, -2)

	hooksecurefunc("QuestFrame_ShowQuestPortrait", function(parentFrame, portrait, text, name, x, y)
		QuestNPCModel:ClearAllPoints();
		QuestNPCModel:SetPoint("TOPLEFT", parentFrame, "TOPRIGHT", x + 18, y);			
	end)
end

AS:RegisterSkin('Blizzard_Quest', AS.Blizzard_Quest)