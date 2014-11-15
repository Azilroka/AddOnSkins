local AS = unpack(AddOnSkins)

function AS:Blizzard_Quest()
	AS:SkinFrame(QuestFrame, nil, nil, true)
	AS:StripTextures(QuestFrameInset)
--	AS:StripTextures(QuestFrameDetailPanel, true)
	AS:StripTextures(QuestDetailScrollFrame, true)
	AS:CreateBackdrop(QuestDetailScrollFrame)
	QuestDetailScrollFrame.Backdrop:SetBackdropColor(0, 0, 0, 0)
--	AS:StripTextures(QuestDetailScrollChildFrame, true)
	AS:StripTextures(QuestRewardScrollFrame, true)
--	AS:StripTextures(QuestRewardScrollChildFrame, true)
	AS:StripTextures(QuestFrameProgressPanel, true)
	AS:StripTextures(QuestFrameRewardPanel, true)
	--QuestFrame.backdrop:Point("TOPLEFT", 6, -8)
	--QuestFrame.backdrop:Point("BOTTOMRIGHT", -20, 65)
	--QuestFrame.Backdrop:CreateShadow('Default')
	AS:SkinButton(QuestFrameAcceptButton, true)
	AS:SkinButton(QuestFrameDeclineButton, true)
	AS:SkinButton(QuestFrameCompleteButton, true)
	AS:SkinButton(QuestFrameGoodbyeButton, true)
	AS:SkinButton(QuestFrameCompleteQuestButton, true)
	AS:SkinCloseButton(QuestFrameCloseButton)
	AS:SkinScrollBar(QuestDetailScrollFrameScrollBar)
	AS:SkinScrollBar(QuestRewardScrollFrameScrollBar)

	QuestFrame:SetHeight(500)

	for i = 1, 6 do
		local button = _G["QuestProgressItem"..i]
		local texture = _G["QuestProgressItem"..i.."IconTexture"]
		AS:StripTextures(button)
		AS:StyleButton(button)
		button:Width(_G["QuestProgressItem"..i]:GetWidth() - 4)
		button:SetFrameLevel(button:GetFrameLevel() + 2)
		AS:SkinTexture(texture)
		texture:SetDrawLayer("OVERLAY")
		texture:Point("TOPLEFT", 2, -2)
		texture:Size(texture:GetWidth() - 2, texture:GetHeight() - 2)
		_G["QuestProgressItem"..i.."Count"]:SetDrawLayer("OVERLAY")
		AS:SetTemplate(button, 'Default')				
	end

	hooksecurefunc("QuestFrameProgressItems_Update", function()
		QuestProgressTitleText:SetTextColor(1, 1, 0)
		QuestProgressText:SetTextColor(1, 1, 1)
		QuestProgressRequiredItemsText:SetTextColor(1, 1, 0)
		QuestProgressRequiredMoneyText:SetTextColor(1, 1, 0)
	end)
	
	AS:SkinScrollBar(QuestNPCModelTextScrollFrameScrollBar)
	AS:SkinScrollBar(QuestGreetingScrollFrameScrollBar)
	AS:SkinScrollBar(QuestProgressScrollFrameScrollBar)
	AS:StripTextures(QuestProgressScrollFrame)
	AS:StripTextures(QuestNPCModel)
	AS:CreateBackdrop(QuestNPCModel, 'Default')
	QuestNPCModel:Point("TOPLEFT", QuestLogDetailFrame, "TOPRIGHT", 4, -34)
	AS:StripTextures(QuestNPCModelTextFrame)
	AS:CreateBackdrop(QuestNPCModelTextFrame, 'Default')
	QuestNPCModelTextFrame.Backdrop:Point("TOPLEFT", QuestNPCModel.Backdrop, "BOTTOMLEFT", 0, -2)

	hooksecurefunc("QuestFrame_ShowQuestPortrait", function(parentFrame, portrait, text, name, x, y)
		QuestNPCModel:ClearAllPoints();
		QuestNPCModel:SetPoint("TOPLEFT", parentFrame, "TOPRIGHT", x + 18, y);			
	end)
end

AS:RegisterSkin('Blizzard_Quest', AS.Blizzard_Quest)