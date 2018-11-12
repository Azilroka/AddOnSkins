local AS = unpack(AddOnSkins)

function AS:Blizzard_Spellbook()
	AS:SkinFrame(SpellBookFrame, nil, nil, true)
	AS:SkinCloseButton(SpellBookFrame.CloseButton)

	for i = 1, 5 do
		AS:SkinTab(_G["SpellBookFrameTabButton"..i])
	end

	SpellBookPageText:SetTextColor(1, 1, 1)
	SpellBookPageText:SetPoint("BOTTOMRIGHT", -100, 32)

	AS:SkinArrowButton(SpellBookPrevPageButton)
	AS:SkinArrowButton(SpellBookNextPageButton)

	SpellBookFrameTutorialButton.Ring:Hide()
	SpellBookFrameTutorialButton:SetPoint("TOPLEFT", SpellBookFrame, "TOPLEFT", -5, 10)

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

		hooksecurefunc(Button.SpellHighlightTexture, 'SetShown', function(self, value)
			if value == true then
				AutoCastShine_AutoCastStart(Button.AutoCastShine, unpack(AS.Color))
			end
		end)
		hooksecurefunc(Button.SpellHighlightTexture, 'Hide', function() AutoCastShine_AutoCastStop(Button.AutoCastShine) end)
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
			Button.RequiredLevelString:SetTextColor(0.6, 0.6, 0.6)
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

	-- Professions

	for _, Button in pairs({ PrimaryProfession1, PrimaryProfession2, SecondaryProfession1, SecondaryProfession2, SecondaryProfession3 }) do
		Button.professionName:SetTextColor(1, 1, 1)
		Button.missingHeader:SetTextColor(1, 1, 1)
		Button.missingText:SetTextColor(1, 1, 1)

		AS:SkinStatusBar(Button.statusBar, true)
		Button.statusBar.Backdrop:SetOutside(Button.statusBar, 1, 1)
		Button.statusBar.rankText:SetPoint("CENTER")

		Button.statusBar:SetPoint("TOPLEFT", "$parentRank", "BOTTOMLEFT", 1, -3)
	end

	for i = 1, 2 do
		local Button = _G["PrimaryProfession"..i]
		_G["PrimaryProfession"..i.."IconBorder"]:Hide()

		Button.professionName:SetPoint("TOPLEFT", 100, -4)

		AS:CreateBackdrop(Button.icon)
		AS:SkinTexture(Button.icon)

		Button.icon:SetAlpha(1)
		Button.icon:SetDesaturated(false)
	end

	for _, Button in pairs({ PrimaryProfession1SpellButtonTop, PrimaryProfession1SpellButtonBottom, PrimaryProfession2SpellButtonTop, PrimaryProfession2SpellButtonBottom, SecondaryProfession1SpellButtonLeft, SecondaryProfession1SpellButtonRight, SecondaryProfession2SpellButtonLeft, SecondaryProfession2SpellButtonRight, SecondaryProfession3SpellButtonLeft, SecondaryProfession3SpellButtonRight }) do
		AS:SkinButton(Button, true)

		if Button.iconTexture then
			AS:SkinTexture(Button.iconTexture)
			Button.iconTexture:SetInside()
		end
	end

	hooksecurefunc("FormatProfession", function(frame, index)
		if index then
			local _, texture = GetProfessionInfo(index)

			if frame.icon and texture then
				frame.icon:SetTexture(texture)
			end
		end
	end)

	hooksecurefunc("UpdateProfessionButton", function(self)
		self:SetHighlightTexture('')
		self.spellString:SetTextColor(1, 1, 1)
		self.subSpellString:SetTextColor(1, 1, 1)
	end)

	SpellBookFrameTabButton1:SetPoint("TOPLEFT", SpellBookFrame, "BOTTOMLEFT", -5, 2)
end

AS:RegisterSkin('Blizzard_Spellbook', AS.Blizzard_Spellbook)
