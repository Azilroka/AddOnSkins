local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TradeSkillDW') then return end

local name = 'TradeSkillDWSkin'
function AS:SkinTradeSkillDW()
	AS:SkinFrame(TradeSkillFrame)
	AS:SkinCloseButton(TradeSkillFrameCloseButton)

	AS:SkinFrame(TradeSkillGuildFrame)
	AS:SkinFrame(TradeSkillGuildFrameContainer)
	AS:SkinCloseButton(TradeSkillGuildFrameCloseButton)

	AS:SkinStatusBar(TradeSkillRankFrame)
	AS:SkinButton(TradeSkillCreateButton, true)
	AS:SkinButton(TradeSkillCancelButton, true)
	AS:SkinButton(TradeSkillFilterButton, true)
	AS:SkinButton(TradeSkillCreateAllButton, true)
	AS:SkinButton(TradeSkillViewGuildCraftersButton, true)
	AS:SkinScrollBar(TradeSkillDetailScrollFrameScrollBar)

	local function SkinTabs(self)
		for i = 1, self:GetNumChildren() do
			local Child = select(i, self:GetChildren())
			if Child:IsObjectType('CheckButton') and not Child.IsSkinned then
				Child:DisableDrawLayer('BACKGROUND')
				Child:CreateBackdrop()
				AS:SkinTexture(Child:GetNormalTexture())
				Child:GetNormalTexture():SetInside()
				Child:GetNormalTexture().SetPoint = AS.Noop
				Child:GetNormalTexture().SetTexCoord = AS.Noop
				Child:StyleButton()
				Child.IsSkinned = true
			end
		end
	end

	TradeSkillFrame:HookScript('OnUpdate', function(self)
		if not TradeSkillDWExpandButton then return end
		if self.isSkinned then return end
		AS:SkinNextPrevButton(TradeSkillDWExpandButton)
		TradeSkillDWExpandButton.SetNormalTexture = AS.Noop
		TradeSkillDWExpandButton.SetPushedTexture = AS.Noop
		TradeSkillDWExpandButton:HookScript('OnUpdate', function(self)
			if self.expanded then
				SquareButton_SetIcon(self, 'LEFT')
			else
				SquareButton_SetIcon(self, 'RIGHT')
			end
		end)
		TradeSkillListScrollFrame:StripTextures(true)
		SkinTabs(self)
		self.isSkinned = true
	end)

	AS:SkinEditBox(TradeSkillFrameSearchBox)
	AS:SkinEditBox(TradeSkillInputBox)

	TradeSkillDetailScrollFrame:StripTextures(true)
	TradeSkillFrameInset:StripTextures(true)
	TradeSkillExpandButtonFrame:StripTextures(true)
	TradeSkillDetailScrollChildFrame:StripTextures(true)

	TradeSkillGuildFrame:Point('BOTTOMLEFT', TradeSkillFrame, 'BOTTOMRIGHT', 3, 19)

	TradeSkillFrame:Height(TradeSkillFrame:GetHeight() + 12)
	TradeSkillLinkButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
	TradeSkillLinkButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
	TradeSkillLinkButton:GetHighlightTexture():Kill()
	TradeSkillLinkButton:Size(17, 14)
	TradeSkillLinkButton:Point('LEFT', TradeSkillLinkFrame, 'LEFT', 5, -1)
	TradeSkillIncrementButton:Point('RIGHT', TradeSkillCreateButton, 'LEFT', -13, 0)

	local once = false
	hooksecurefunc('TradeSkillFrame_SetSelection', function(id)
		if not TradeSkillSkillIcon.isSkinned then
			TradeSkillSkillIcon:StyleButton()
			TradeSkillSkillIcon:SetTemplate('Default')
			TradeSkillSkillIcon.isSkinned = true
		end
		if TradeSkillSkillIcon:GetNormalTexture() then
			AS:SkinTexture(TradeSkillSkillIcon:GetNormalTexture())
			TradeSkillSkillIcon:GetNormalTexture():ClearAllPoints()
			TradeSkillSkillIcon:GetNormalTexture():SetInside()
		end
		for i = 1, MAX_TRADE_SKILL_REAGENTS do
			local button = _G['TradeSkillReagent'..i]
			local icon = _G['TradeSkillReagent'..i..'IconTexture']
			local count = _G['TradeSkillReagent'..i..'Count']

			if not button.isSkinned then
				AS:SkinTexture(icon)
				icon.SetTexCoord = AS.Noop
				icon:SetDrawLayer('ARTWORK')
				icon.backdrop = CreateFrame('Frame', nil, button)
				icon.backdrop:SetFrameLevel(button:GetFrameLevel() - 1)
				AS:SkinFrame(icon.backdrop)
				icon.backdrop:SetOutside(icon)
				icon:SetParent(icon.backdrop)
				count:SetParent(icon.backdrop)
				count:SetDrawLayer('OVERLAY')
				_G['TradeSkillReagent'..i..'NameFrame']:Kill()
				button.isSkinned = true
			end
			if i > 2 and once == false then
				local point, anchoredto, point2, x, y = button:GetPoint()
				button:ClearAllPoints()
				button:Point(point, anchoredto, point2, x, y - 3)
				once = true
			end
		end
	end)

	AS:SkinFrame(TradeSkillDW_QueueFrame, nil, nil, true)
	AS:SkinCloseButton(TradeSkillDW_QueueFrameCloseButton)
	TradeSkillDW_QueueFrameInset:StripTextures(true)
	AS:SkinButton(TradeSkillDW_QueueFrameClear, true)
	AS:SkinButton(TradeSkillDW_QueueFrameDown, true)
	AS:SkinButton(TradeSkillDW_QueueFrameUp, true)
	AS:SkinButton(TradeSkillDW_QueueFrameDo, true)
	TradeSkillDW_QueueFrameDetailScrollFrame:StripTextures()
	TradeSkillDW_QueueFrameDetailScrollFrameChildFrame:StripTextures()

	for i = 1, 8 do
		_G['TradeSkillDW_QueueFrameDetailScrollFrameChildFrameReagent'..i]:StripTextures()
		AS:SkinTexture(_G['TradeSkillDW_QueueFrameDetailScrollFrameChildFrameReagent'..i..'IconTexture'])
	end

	AS:SkinScrollBar(TradeSkillDW_QueueFrameDetailScrollFrameScrollBar)
end

AS:RegisterSkin(name, AS.SkinTradeSkillDW)