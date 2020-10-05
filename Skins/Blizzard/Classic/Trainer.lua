if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_CraftUI(event, addon)
	if addon ~= 'Blizzard_CraftUI' then return end

	AS:SkinBackdropFrame(CraftFrame, nil, nil, true)
	CraftFrame.Backdrop:SetPoint('TOPLEFT', 10, -12)
	CraftFrame.Backdrop:SetPoint('BOTTOMRIGHT', -34, 70)

	AS:SkinStatusBar(CraftRankFrame)

	AS:StripTextures(CraftListScrollFrame)
	AS:StripTextures(CraftDetailScrollFrame)
	AS:StripTextures(CraftDetailScrollChildFrame)

	AS:SkinScrollBar(CraftListScrollFrameScrollBar)
	AS:SkinScrollBar(CraftDetailScrollFrameScrollBar)

	AS:SkinButton(CraftCancelButton)
	AS:SkinButton(CraftCreateButton)

	AS:SkinFrame(CraftIcon)
	AS:StyleButton(CraftIcon)

	CraftRequirements:SetTextColor(1, 0.80, 0.10)

	AS:SkinCloseButton(CraftFrameCloseButton, CraftFrame.backdrop)

	AS:StripTextures(CraftExpandButtonFrame)

	CraftCollapseAllButton:SetPoint('LEFT', CraftExpandTabLeft, 'RIGHT', -8, 5)
	CraftCollapseAllButton:GetNormalTexture():SetPoint('LEFT', 3, 2)
	CraftCollapseAllButton:GetNormalTexture():SetSize(15, 15)

	CraftCollapseAllButton:SetHighlightTexture('')
	CraftCollapseAllButton.SetHighlightTexture = AS.Noop

	CraftCollapseAllButton:SetDisabledTexture(AS.Media.Textures.Minus)
	CraftCollapseAllButton.SetDisabledTexture = AS.Noop
	CraftCollapseAllButton:GetDisabledTexture():SetPoint('LEFT', 3, 2)
	CraftCollapseAllButton:GetDisabledTexture():SetSize(15, 15)
	CraftCollapseAllButton:GetDisabledTexture():SetDesaturated(true)

	for i = 1, CRAFTS_DISPLAYED do
		local button = _G['Craft'..i]
		local highlight = _G['Craft'..i..'Highlight']

		button:GetNormalTexture():SetSize(14, 14)
		button:GetNormalTexture():SetPoint('LEFT', 4, 1)

		highlight:SetTexture('')
		highlight.SetTexture = AS.Noop
	end

	for i = 1, MAX_CRAFT_REAGENTS do
		local reagent = _G['CraftReagent'..i]
		local icon = _G['CraftReagent'..i..'IconTexture']
		local name = _G['CraftReagent'..i..'Name']
		local nameFrame = _G['CraftReagent'..i..'NameFrame']

		AS:SetTemplate(reagent)
		AS:StyleButton(reagent)
		reagent:SetSize(143, 40)

		AS:SkinTexture(icon, true)

		name:SetPoint('LEFT', nameFrame, 'LEFT', 20, 0)

		AS:Kill(nameFrame)
	end

	CraftReagent1:SetPoint('TOPLEFT', CraftReagentLabel, 'BOTTOMLEFT', -3, -3)
	CraftReagent2:SetPoint('LEFT', CraftReagent1, 'RIGHT', 3, 0)
	CraftReagent4:SetPoint('LEFT', CraftReagent3, 'RIGHT', 3, 0)
	CraftReagent6:SetPoint('LEFT', CraftReagent5, 'RIGHT', 3, 0)
	CraftReagent8:SetPoint('LEFT', CraftReagent7, 'RIGHT', 3, 0)

	hooksecurefunc('CraftFrame_Update', function()
		CraftRankFrame:SetStatusBarColor(0.13, 0.28, 0.85)

		for i = 1, CRAFTS_DISPLAYED do
			local button = _G['Craft'..i]
			local texture = button:GetNormalTexture():GetTexture()
			if texture then
				if strfind(texture, 'MinusButton') then
					button:SetNormalTexture(AS.Media.Textures.Minus)
				elseif strfind(texture, 'PlusButton') then
					button:SetNormalTexture(AS.Media.Textures.Plus)
				end
			end
		end

		if CraftCollapseAllButton.collapsed then
			CraftCollapseAllButton:SetNormalTexture(AS.Media.Textures.Plus)
		else
			CraftCollapseAllButton:SetNormalTexture(AS.Media.Textures.Minus)
		end
	end)

	hooksecurefunc('CraftFrame_SetSelection', function(id)
		if ( not id ) then
			return;
		end

		CraftReagentLabel:SetPoint('TOPLEFT', CraftDescription, 'BOTTOMLEFT', 0, -10)

		if CraftIcon:GetNormalTexture() then
			CraftReagentLabel:SetAlpha(1)
			CraftIcon:SetAlpha(1)
			AS:SkinTexture(CraftIcon:GetNormalTexture())
			AS:SetInside(CraftIcon:GetNormalTexture())
		else
			CraftReagentLabel:SetAlpha(0)
			CraftIcon:SetAlpha(0)
		end

		local skillLink = GetCraftItemLink(id)
		if skillLink then
			local quality = select(3, GetItemInfo(skillLink))
			if quality and quality > 1 then
				CraftIcon:SetBackdropBorderColor(GetItemQualityColor(quality))
				CraftName:SetTextColor(GetItemQualityColor(quality))
			else
				CraftIcon:SetBackdropBorderColor(unpack(AS.BorderColor))
				CraftName:SetTextColor(1, 1, 1)
			end
		end

		local numReagents = GetCraftNumReagents(id)
		for i = 1, numReagents, 1 do
			local _, _, reagentCount, playerReagentCount = GetCraftReagentInfo(id, i)
			local reagentLink = GetCraftReagentItemLink(id, i)
			local reagent = _G['CraftReagent'..i]
			local icon = _G['CraftReagent'..i..'IconTexture']
			local name = _G['CraftReagent'..i..'Name']

			if reagentLink then
				local quality = select(3, GetItemInfo(reagentLink))
				if quality and quality > 1 then
					icon.Backdrop:SetBackdropBorderColor(GetItemQualityColor(quality))
					reagent:SetBackdropBorderColor(GetItemQualityColor(quality))
					if playerReagentCount < reagentCount then
						name:SetTextColor(0.5, 0.5, 0.5)
					else
						name:SetTextColor(GetItemQualityColor(quality))
					end
				else
					reagent:SetBackdropBorderColor(unpack(AS.BorderColor))
					icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
		end

		if (numReagents < 4) then
			CraftDetailScrollFrameScrollBar:Hide();
			CraftDetailScrollFrameTop:Hide();
			CraftDetailScrollFrameBottom:Hide();
		else
			CraftDetailScrollFrameScrollBar:Show();
			CraftDetailScrollFrameTop:Show();
			CraftDetailScrollFrameBottom:Show();
		end
	end)
end

function AS:Blizzard_TradeSkill(event, addon)
	if addon ~= 'Blizzard_TradeSkillUI' then return end
	AS:SkinBackdropFrame(_G.TradeSkillFrame, nil, nil, true)
	_G.TradeSkillFramePortrait:SetAlpha(0)
	_G.TradeSkillFrame.Backdrop:SetPoint('TOPLEFT', 11, -12)
	_G.TradeSkillFrame.Backdrop:SetPoint('BOTTOMRIGHT', -32, 76)
	AS:CreateShadow(_G.TradeSkillFrame)
	_G.TradeSkillFrame.Shadow:SetPoint('TOPLEFT', 8, -9)
	_G.TradeSkillFrame.Shadow:SetPoint('BOTTOMRIGHT', -29, 73)

	AS:StripTextures(_G.TradeSkillRankFrame)
	AS:CreateBackdrop(_G.TradeSkillRankFrame, "Transparent")
	_G.TradeSkillRankFrame:Size(322, 16)
	_G.TradeSkillRankFrame:ClearAllPoints()
	_G.TradeSkillRankFrame:Point('TOP', -10, -45)
	_G.TradeSkillRankFrame:SetStatusBarTexture(AS.NormTex)

	AS:SkinCloseButton(_G.TradeSkillFrameCloseButton)

	AS:StripTextures(_G.TradeSkillExpandButtonFrame)

	local TradeSkillCollapseAllButton = _G.TradeSkillCollapseAllButton
	TradeSkillCollapseAllButton:GetNormalTexture():SetPoint('LEFT', 3, 2)
	TradeSkillCollapseAllButton:GetNormalTexture():SetSize(15, 15)

	TradeSkillCollapseAllButton:SetHighlightTexture('')
	TradeSkillCollapseAllButton.SetHighlightTexture = AS.Noop

	TradeSkillCollapseAllButton:SetDisabledTexture(AS.Media.Textures.Minus)
	TradeSkillCollapseAllButton.SetDisabledTexture = AS.Noop
	TradeSkillCollapseAllButton:GetDisabledTexture():SetPoint('LEFT', 3, 2)
	TradeSkillCollapseAllButton:GetDisabledTexture():SetSize(15, 15)
	TradeSkillCollapseAllButton:GetDisabledTexture():SetDesaturated(true)

	AS:SkinDropDownBox(_G.TradeSkillInvSlotDropDown)
	_G.TradeSkillInvSlotDropDown:ClearAllPoints()
	_G.TradeSkillInvSlotDropDown:SetPoint('TOPRIGHT', TradeSkillFrame, 'TOPRIGHT', -32, -64)

	AS:SkinDropDownBox(_G.TradeSkillSubClassDropDown)
	_G.TradeSkillSubClassDropDown:ClearAllPoints()
	_G.TradeSkillSubClassDropDown:SetPoint('RIGHT', _G.TradeSkillInvSlotDropDown, 'RIGHT', -130, 0)

	_G.TradeSkillFrameTitleText:ClearAllPoints()
	_G.TradeSkillFrameTitleText:SetPoint('TOP', _G.TradeSkillFrame, 'TOP', 0, -18)

	for i = 1, _G.TRADE_SKILLS_DISPLAYED do
		local button = _G['TradeSkillSkill'..i]
		local highlight = _G['TradeSkillSkill'..i..'Highlight']

		button:GetNormalTexture():SetSize(14, 14)
		button:GetNormalTexture():SetPoint('LEFT', 2, 1)

		highlight:SetTexture('')
		highlight.SetTexture = AS.Noop
	end

	hooksecurefunc('TradeSkillFrame_Update', function()
		for i = 1, _G.TRADE_SKILLS_DISPLAYED do
			local button = _G['TradeSkillSkill'..i]
			local texture = button:GetNormalTexture():GetTexture()
			if texture then
				if strfind(texture, 'MinusButton') then
					button:SetNormalTexture(AS.Media.Textures.Minus)
				elseif strfind(texture, 'PlusButton') then
					button:SetNormalTexture(AS.Media.Textures.Plus)
				end
			end
		end

		if TradeSkillCollapseAllButton.collapsed then
			TradeSkillCollapseAllButton:SetNormalTexture(AS.Media.Textures.Plus)
		else
			TradeSkillCollapseAllButton:SetNormalTexture(AS.Media.Textures.Minus)
		end
	end)

	AS:StripTextures(_G.TradeSkillDetailScrollFrame)
	AS:StripTextures(_G.TradeSkillListScrollFrame)
	AS:StripTextures(_G.TradeSkillDetailScrollChildFrame)

	AS:SkinScrollBar(_G.TradeSkillListScrollFrameScrollBar)
	AS:SkinScrollBar(_G.TradeSkillDetailScrollFrameScrollBar)

	AS:StyleButton(_G.TradeSkillSkillIcon, nil, true)

	for i = 1, _G.MAX_TRADE_SKILL_REAGENTS do
		local icon = _G['TradeSkillReagent'..i..'IconTexture']
		local nameFrame = _G['TradeSkillReagent'..i..'NameFrame']

		AS:SkinTexture(icon, true)

		AS:Kill(nameFrame)
	end

	AS:SkinButton(_G.TradeSkillCancelButton)
	AS:SkinButton(_G.TradeSkillCreateButton)
	AS:SkinButton(_G.TradeSkillCreateAllButton)

	AS:SkinArrowButton(_G.TradeSkillDecrementButton)
	_G.TradeSkillInputBox:SetHeight(16)
	AS:SkinEditBox(_G.TradeSkillInputBox)
	AS:SkinArrowButton(_G.TradeSkillIncrementButton)

	hooksecurefunc('TradeSkillFrame_SetSelection', function(id)
		local skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(id)
		if skillType == "header" then
			return
		end

		if _G.TradeSkillSkillIcon:GetNormalTexture() then
			_G.TradeSkillSkillIcon:SetAlpha(1)
			AS:SkinTexture(_G.TradeSkillSkillIcon:GetNormalTexture(), true)
			_G.TradeSkillSkillIcon:GetNormalTexture():SetInside()
		else
			_G.TradeSkillSkillIcon:SetAlpha(0)
		end

		_G.TradeSkillSkillIcon:SetSize(40, 40)
		_G.TradeSkillSkillIcon:SetPoint('TOPLEFT', 2, -3)

		local skillLink = GetTradeSkillItemLink(id)
		if skillLink then
			local quality = select(3, GetItemInfo(skillLink))
			if quality and quality > 1 then
				_G.TradeSkillSkillIcon:SetBackdropBorderColor(GetItemQualityColor(quality))
				_G.TradeSkillSkillName:SetTextColor(GetItemQualityColor(quality))
			else
				_G.TradeSkillSkillIcon:SetBackdropBorderColor(unpack(AS.BorderColor))
				_G.TradeSkillSkillName:SetTextColor(1, 1, 1)
			end
		end

		local numReagents = GetTradeSkillNumReagents(id)
		for i = 1, numReagents, 1 do
			local _, _, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(id, i)
			local reagentLink = GetTradeSkillReagentItemLink(id, i)
			local icon = _G['TradeSkillReagent'..i..'IconTexture']
			local name = _G['TradeSkillReagent'..i..'Name']

			if reagentLink then
				local quality = select(3, GetItemInfo(reagentLink))
				if quality and quality > 1 then
					icon.Backdrop:SetBackdropBorderColor(GetItemQualityColor(quality))
					if playerReagentCount < reagentCount then
						name:SetTextColor(0.5, 0.5, 0.5)
					else
						name:SetTextColor(GetItemQualityColor(quality))
					end
				else
					icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_TrainerUI(event, addon)
	if addon ~= 'Blizzard_TrainerUI' then return end

	AS:SkinBackdropFrame(ClassTrainerFrame, nil, nil, true)
	AS:SkinCloseButton(ClassTrainerFrameCloseButton)
	ClassTrainerFrame.Backdrop:SetPoint('TOPLEFT', 10, -11)
	ClassTrainerFrame.Backdrop:SetPoint('BOTTOMRIGHT', -32, 74)

	AS:SkinButton(ClassTrainerTrainButton, true)
	AS:SkinButton(ClassTrainerCancelButton, true)

	AS:SkinDropDownBox(ClassTrainerFrameFilterDropDown)

	AS:StripTextures(_G.ClassTrainerListScrollFrame)
	AS:SkinScrollBar(_G.ClassTrainerListScrollFrameScrollBar)

	AS:StripTextures(_G.ClassTrainerDetailScrollFrame)
	AS:SkinScrollBar(_G.ClassTrainerDetailScrollFrameScrollBar)
	AS:StripTextures(_G.ClassTrainerSkillIcon)

	hooksecurefunc('ClassTrainer_SetSelection', function()
		local skillIcon = _G.ClassTrainerSkillIcon:GetNormalTexture()
		if skillIcon then
			skillIcon:SetInside()
			AS:SkinTexture(skillIcon, true)
		end
	end)

	for i = 1, _G.CLASS_TRAINER_SKILLS_DISPLAYED do
		local button = _G['ClassTrainerSkill'..i]
		local highlight = _G['ClassTrainerSkill'..i..'Highlight']

		button:SetNormalTexture(AS.Media.Textures.Plus)
		button.SetNormalTexture = AS.Noop

		button:GetNormalTexture():SetSize(16, 16)
		button:GetNormalTexture():SetPoint('LEFT', 5, 0)

		highlight:SetTexture('')
		highlight.SetTexture = AS.Noop

		hooksecurefunc(button, 'SetNormalTexture', function(self, texture)
			local tex = self:GetNormalTexture()

			if strfind(texture, 'MinusButton') then
				tex:SetTexture(AS.Media.Textures.Minus)
			elseif strfind(texture, 'PlusButton') then
				tex:SetTexture(AS.Media.Textures.Plus)
			else
				tex:SetTexture()
			end
		end)
	end

	AS:StripTextures(_G.ClassTrainerExpandButtonFrame)

	_G.ClassTrainerCollapseAllButton:SetNormalTexture(AS.Media.Textures.Plus)
	_G.ClassTrainerCollapseAllButton.SetNormalTexture = AS.Noop
	_G.ClassTrainerCollapseAllButton:GetNormalTexture():SetPoint('LEFT', 3, 2)
	_G.ClassTrainerCollapseAllButton:GetNormalTexture():SetSize(15, 15)

	_G.ClassTrainerCollapseAllButton:SetHighlightTexture('')
	_G.ClassTrainerCollapseAllButton.SetHighlightTexture = AS.Noop

	_G.ClassTrainerCollapseAllButton:SetDisabledTexture(AS.Media.Textures.Plus)
	_G.ClassTrainerCollapseAllButton.SetDisabledTexture = AS.Noop
	_G.ClassTrainerCollapseAllButton:GetDisabledTexture():SetPoint('LEFT', 3, 2)
	_G.ClassTrainerCollapseAllButton:GetDisabledTexture():SetSize(15, 15)
	_G.ClassTrainerCollapseAllButton:GetDisabledTexture():SetDesaturated(true)

	hooksecurefunc(_G.ClassTrainerCollapseAllButton, 'SetNormalTexture', function(self, texture)
		local tex = self:GetNormalTexture()

		if strfind(texture, 'MinusButton') then
			tex:SetTexture(AS.Media.Textures.Minus)
		else
			tex:SetTexture(AS.Media.Textures.Plus)
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_CraftUI", AS.Blizzard_CraftUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_TradeSkill', AS.Blizzard_TradeSkill, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_TrainerUI", AS.Blizzard_TrainerUI, 'ADDON_LOADED')
