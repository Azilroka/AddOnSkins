if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_Spellbook()
	AS:SkinFrame(SpellBookFrame, nil, nil, true)
	AS:SkinCloseButton(SpellBookCloseButton)

	for i = 1, 3 do
		AS:SkinTab(_G["SpellBookFrameTabButton"..i])
	end

	SpellBookPageText:SetTextColor(1, 1, 1)
	SpellBookPageText:SetPoint("BOTTOMRIGHT", -100, 32)

	AS:SkinArrowButton(SpellBookPrevPageButton)
	AS:SkinArrowButton(SpellBookNextPageButton)

	for i = 1, SPELLS_PER_PAGE do
		local Button = _G["SpellButton"..i]
		local Icon = _G["SpellButton"..i.."IconTexture"]

		AS:SkinButton(Button, true)
		AS:SkinTexture(Icon)
		Icon:SetInside()

		Button:SetCheckedTexture('')
		Button:SetPushedTexture('')

		Button.cooldown:SetInside()

		Button.AutoCastShine = CreateFrame('Frame', '$parentShine', Button, 'AutoCastShineTemplate')
		Button.AutoCastShine:SetAllPoints()

		for _, sparks in pairs(Button.AutoCastShine.sparkles) do
			sparks:SetSize(sparks:GetWidth() * 2, sparks:GetHeight() * 2)
		end
	end

	hooksecurefunc("SpellButton_UpdateButton", function()
		for i = 1, SPELLS_PER_PAGE do
			local Button = _G["SpellButton"..i]
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
				Tab:GetNormalTexture():SetInside()
			end
		end
	end)

	SpellBookFrameTabButton1:SetPoint("TOPLEFT", SpellBookFrame, "BOTTOMLEFT", -5, 2)
end

AS:RegisterSkin('Blizzard_Spellbook', AS.Blizzard_Spellbook)
