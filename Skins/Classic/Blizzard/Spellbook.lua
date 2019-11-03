if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_Spellbook()
	SpellBookFrame:SetSize(354, 442)
	SpellBookFrame:SetHitRectInsets(0, 0, 0, 0)
	SpellBookTitleText:ClearAllPoints()
	SpellBookTitleText:SetPoint('TOP', '$parent', 'TOP', 0, -5)
	SpellBookCloseButton:ClearAllPoints()
	SpellBookCloseButton:SetPoint('TOPRIGHT', '$parent', 'TOPRIGHT', 4, 5)
	SpellBookTitleText:SetPoint('TOP', '$parent', 'TOP', 0, -5)
	SpellBookFrameTabButton1:ClearAllPoints()
	SpellBookFrameTabButton1:SetPoint('TOPLEFT', '$parent', 'BOTTOMLEFT', 0, 19)
	SpellBookPageText:ClearAllPoints()
	SpellBookPageText:SetPoint('BOTTOMRIGHT', -100, 38)
	SpellBookPrevPageButton:ClearAllPoints()
	SpellBookPrevPageButton:SetPoint('BOTTOMRIGHT', '$parent', -66, 26)
	SpellBookNextPageButton:ClearAllPoints()
	SpellBookNextPageButton:SetPoint('BOTTOMRIGHT', '$parent', -31, 26)
	SpellBookSkillLineTab1:ClearAllPoints()
	SpellBookSkillLineTab1:SetPoint('TOPLEFT', '$parent', 'TOPRIGHT', 0, -17)

	AS:SkinFrame(SpellBookFrame, nil, nil, true)
	AS:SkinCloseButton(SpellBookCloseButton)

	for i = 1, 3 do
		local Tab = _G["SpellBookFrameTabButton"..i]
		AS:SkinTab(Tab)
		Tab.Backdrop:SetPoint('TOPLEFT', 14, -18)
		Tab.Backdrop:SetPoint('BOTTOMRIGHT', -14, 18)
	end

	SpellBookPageText:SetTextColor(1, 1, 1)

	AS:SkinArrowButton(SpellBookPrevPageButton)
	AS:SkinArrowButton(SpellBookNextPageButton)

	for i = 1, SPELLS_PER_PAGE do
		local Button = _G["SpellButton"..i]
		local Icon = _G["SpellButton"..i.."IconTexture"]

		AS:SkinButton(Button, true)
		AS:SkinTexture(Icon)
		AS:SetInside(Icon)

		Button:SetCheckedTexture('')
		Button:SetPushedTexture('')

		AS:SetInside(Button.cooldown)

		Button.AutoCastShine = CreateFrame('Frame', '$parentShine', Button, 'AutoCastShineTemplate')
		Button.AutoCastShine:SetAllPoints()

		for _, sparks in pairs(Button.AutoCastShine.sparkles) do
			sparks:SetSize(sparks:GetWidth() * 2, sparks:GetHeight() * 2)
		end
	end

	hooksecurefunc("SpellButton_UpdateButton", function()
		for i = 1, SPELLS_PER_PAGE do
			local Button = _G["SpellButton"..i]
			local iconTexture = _G["SpellButton"..i.."IconTexture"];
			Button:SetHighlightTexture('')
			local r = Button.SpellName:GetTextColor()
			if r < 0.8 then
				Button.SpellName:SetTextColor(0.6, 0.6, 0.6)
			else
				Button.SpellName:SetTextColor(1, 1, 1)
			end
			Button.SpellSubName:SetTextColor(0.6, 0.6, 0.6)
		end
	end)

	for i = 1, 8 do
		local Tab = _G["SpellBookSkillLineTab"..i]
		AS:SkinFrame(Tab)

		Tab:HookScript("OnEnter", function(self) self:SetBackdropBorderColor(unpack(AS.Color)) end)
		Tab:HookScript("OnLeave", function(self) if self:GetChecked() then self:SetBackdropBorderColor(1, .8, .1) else self:SetBackdropBorderColor(unpack(AS.BorderColor)) end end)

		hooksecurefunc(Tab, 'SetChecked', function(self, value)
			if value == true then
				self:SetBackdropBorderColor(1, .8, .1)
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	hooksecurefunc("SpellBookFrame_UpdateSkillLineTabs", function()
		for i = 1, 8 do
			local Tab = _G["SpellBookSkillLineTab"..i]
			if Tab:GetNormalTexture() then
				AS:SkinTexture(Tab:GetNormalTexture())
				AS:SetInside(Tab:GetNormalTexture())
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_Spellbook', AS.Blizzard_Spellbook)
