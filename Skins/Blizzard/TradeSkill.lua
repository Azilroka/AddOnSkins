local AS = unpack(AddOnSkins)

function AS:Blizzard_TradeSkill(event, addon)
	if addon == 'Blizzard_TradeSkillUI' or IsAddOnLoaded('Blizzard_TradeSkillUI') then
		AS:SkinFrame(TradeSkillFrame, nil, nil, true)
		AS:CreateShadow(TradeSkillFrame)
		AS:SkinStatusBar(TradeSkillRankFrame)
		TradeSkillFrame:Height(TradeSkillFrame:GetHeight() + 12)

		AS:SkinBackdropFrame(TradeSkillListScrollFrame)
		AS:SkinBackdropFrame(TradeSkillDetailScrollFrame)
		AS:StripTextures(TradeSkillFrameInset)
		AS:StripTextures(TradeSkillExpandButtonFrame)
		AS:StripTextures(TradeSkillDetailScrollChildFrame)

		AS:SkinButton(TradeSkillCreateButton, true)
		AS:SkinButton(TradeSkillCancelButton, true)
		AS:StripTextures(TradeSkillFilterButton, true)
		AS:SkinButton(TradeSkillFilterButton, true)
		AS:SkinButton(TradeSkillCreateAllButton, true)
		AS:SkinButton(TradeSkillViewGuildCraftersButton, true)

		AS:SkinFrame(TradeSkillGuildFrame)
		TradeSkillGuildFrame:Point("BOTTOMLEFT", TradeSkillFrame, "BOTTOMRIGHT", 3, 19)
		AS:SkinFrame(TradeSkillGuildFrameContainer)
		AS:SkinCloseButton(TradeSkillGuildFrameCloseButton)
		
		TradeSkillLinkButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
		TradeSkillLinkButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
		TradeSkillLinkButton:SetHighlightTexture('')
		AS:CreateBackdrop(TradeSkillLinkButton, 'Default')
		TradeSkillLinkButton:Size(17, 14)
		TradeSkillLinkButton:Point("LEFT", TradeSkillLinkFrame, "LEFT", 5, -1)
		AS:SkinEditBox(TradeSkillFrameSearchBox)
		AS:SkinEditBox(TradeSkillInputBox)
		AS:SkinNextPrevButton(TradeSkillDecrementButton)
		AS:SkinNextPrevButton(TradeSkillIncrementButton)
		TradeSkillIncrementButton:Point("RIGHT", TradeSkillCreateButton, "LEFT", -13, 0)
		
		AS:SkinCloseButton(TradeSkillFrameCloseButton)
		AS:SkinScrollBar(TradeSkillDetailScrollFrameScrollBar)
		AS:SkinScrollBar(TradeSkillListScrollFrameScrollBar)
		
		for i = 1, MAX_TRADE_SKILL_REAGENTS do
			local Button = _G["TradeSkillReagent"..i]
			AS:StripTextures(Button)
			AS:SkinTexture(Button.Icon)
			Button.Icon:Size(Button.Icon:GetSize() - 4)
			AS:CreateBackdrop(Button)
			Button.Backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 0, 0)
			Button.Backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 0, 0)
			Button.Backdrop:SetPoint('RIGHT', Button, 'RIGHT', -5, 0)
			Button.Icon.Backdrop = CreateFrame('Frame', nil, Button)
			AS:SetTemplate(Button.Icon.Backdrop)
			Button.Icon.Backdrop:SetBackdropColor(0, 0, 0, 0)
			Button.Icon.Backdrop:SetOutside(Button.Icon)
		end

		TradeSkillReagent1:SetPoint("TOPLEFT", TradeSkillReagentLabel, "BOTTOMLEFT", 1, -3)

		for i = 1, 8 do
			local Button = _G["TradeSkillSkill"..i]
			AS:SkinStatusBar(Button.SubSkillRankBar)
		end

		AS:SetTemplate(TradeSkillSkillIcon)
		AS:StyleButton(TradeSkillSkillIcon)

		hooksecurefunc("TradeSkillFrame_SetSelection", function(id)
			if TradeSkillSkillIcon:GetNormalTexture() then
				AS:SkinTexture(TradeSkillSkillIcon:GetNormalTexture())
				TradeSkillSkillIcon:GetNormalTexture():SetInside()
			end
			local skillName, skillType, numAvailable, isExpanded, altVerb, numSkillUps, indentLevel, showProgressBar, currentRank, maxRank, startingRank, displayAsUnavailable, unavailableString = GetTradeSkillInfo(id);
			local skillLink = GetTradeSkillItemLink(id)
			if skillLink then
				local Quality = select(3, GetItemInfo(skillLink))
				if Quality and Quality > 1 and BAG_ITEM_QUALITY_COLORS[Quality] then
					TradeSkillSkillIcon:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
				else
					TradeSkillSkillIcon:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
			local numReagents = GetTradeSkillNumReagents(id);
			for i = 1, numReagents, 1 do
				local reagentName, reagentTexture, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(id, i);
				local reagentLink = GetTradeSkillReagentItemLink(id, i)
				local reagent = _G["TradeSkillReagent"..i]
				if reagent:IsShown() then
					if reagentLink then
						local Quality = select(3, GetItemInfo(reagentLink))
						if Quality and Quality > 1 and BAG_ITEM_QUALITY_COLORS[Quality] then
							reagent.Icon.Backdrop:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
						else
							reagent.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
						end
					end
				end
			end
		end)

		hooksecurefunc('TradeSkillFrame_Update', function()
			local skillOffset = FauxScrollFrame_GetOffset(TradeSkillListScrollFrame);
			local diplayedSkills = TRADE_SKILLS_DISPLAYED;
			local numTradeSkills = GetNumTradeSkills();
			local buttonIndex = 0
			for i = 1, diplayedSkills, 1 do
				local skillIndex = i + skillOffset;
				local skillName, skillType, numAvailable, isExpanded, altVerb, numSkillUps, indentLevel, showProgressBar, currentRank, maxRank, startingRank, displayAsUnavailable = GetTradeSkillInfo(skillIndex);
				if ( skillIndex <= numTradeSkills ) then
					if ( skillType == "header" or skillType == "subheader" ) then
						if hasFilterBar then
							buttonIndex = i + 1;
						else
							buttonIndex = i;
						end
						local skillButton = _G["TradeSkillSkill"..buttonIndex];
						skillButton:SetNormalTexture("Interface\\Buttons\\UI-PlusMinus-Buttons");
						skillButton:GetNormalTexture():Size(12)
						if(indentLevel ~= 0) then
							skillButton:GetNormalTexture():SetPoint("LEFT", 23, 2);
							skillButton:GetDisabledTexture():SetPoint("LEFT", 23, 2);
						else
							skillButton:GetNormalTexture():SetPoint("LEFT", 3, 2);
							skillButton:GetDisabledTexture():SetPoint("LEFT", 3, 2);
						end
						skillButton:SetHighlightTexture('')
						if ( isExpanded ) then
							skillButton:GetNormalTexture():SetTexCoord(0.5625, 1, 0, 0.4375)
						else
							skillButton:GetNormalTexture():SetTexCoord(0, 0.4375, 0, 0.4375)
						end
					end
				end
			end
		end)

		TradeSkillCollapseAllButton:HookScript('OnUpdate', function(self)
			self:SetNormalTexture("Interface\\Buttons\\UI-PlusMinus-Buttons")
			self:SetHighlightTexture("")
			self:GetNormalTexture():SetPoint("LEFT", 3, 2)
			if (self.collapsed) then
				self:GetNormalTexture():SetTexCoord(0, 0.4375, 0, 0.4375)
			else
				self:GetNormalTexture():SetTexCoord(0.5625, 1, 0, 0.4375)
			end
		end)
		AS:UnregisterSkinEvent('Blizzard_TradeSkill', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('Blizzard_TradeSkill', AS.Blizzard_TradeSkill, 'ADDON_LOADED')