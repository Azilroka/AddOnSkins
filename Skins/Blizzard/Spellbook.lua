local AS = unpack(AddOnSkins)

function AS:Blizzard_Spellbook()
	AS:SkinFrame(SpellBookFrame, nil, nil, true)
	AS:SkinCloseButton(SpellBookFrameCloseButton)
	AS:StripTextures(SpellBookFrameInset)

	SpellBookPageText:SetTextColor(0.6, 0.6, 0.6)
	SpellBookPageText:SetPoint("BOTTOMRIGHT", -100, 32)
	AS:SkinNextPrevButton(SpellBookPrevPageButton)
	AS:SkinNextPrevButton(SpellBookNextPageButton)

	SpellBookFrameTutorialButton.Ring:Hide()
	SpellBookFrameTutorialButton:SetPoint("TOPLEFT", SpellBookFrame, "TOPLEFT", -5, 10)

	for i = 1, SPELLS_PER_PAGE do
		local Button = _G["SpellButton"..i]
		local Icon = _G["SpellButton"..i.."IconTexture"]

		Button.EmptySlot:SetTexture(nil)
		Button.TextBackground:SetTexture(nil)
		Button.TextBackground2:SetTexture(nil)
		Button.IconTextureBg:SetTexture(nil)
		Button:SetCheckedTexture(nil)
		Button:SetPushedTexture(nil)
		hooksecurefunc(Button, 'SetChecked', function(self, checked)
			if checked then
				self:SetBackdropBorderColor(1, 1, 0)
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
		_G["SpellButton"..i..'SlotFrame']:SetTexture(nil)
		Button.UnlearnedFrame:SetTexture(nil)
		Button.TrainFrame:SetTexture(nil)
		Button.TrainTextBackground:SetTexture(nil)

		AS:SkinFrame(Button, nil, true)
		Button:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
		Button:GetHighlightTexture():SetInside()
		Button.cooldown:SetInside()
		AS:SkinTexture(Icon)
		Icon:SetInside()
	end

	hooksecurefunc("SpellButton_UpdateButton", function()
		for i = 1, SPELLS_PER_PAGE do
			local Button = _G["SpellButton"..i]
			Button.SpellName:SetPoint("LEFT", Button, "RIGHT", 8, 10)
			if Button.SpellName:GetTextColor() < 0.8 then
				Button.SpellName:SetTextColor(0.6, 0.6, 0.6)
			end
			Button.SpellSubName:SetTextColor(0.6, 0.6, 0.6)
			Button.RequiredLevelString:SetTextColor(0.6, 0.6, 0.6)
			Button:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
			Button:GetHighlightTexture():SetInside()
		end
	end)

	-- Skill Line Tabs
	for i = 1, MAX_SKILLLINE_TABS do
		local Tab = _G["SpellBookSkillLineTab"..i]
		_G["SpellBookSkillLineTab"..i.."Flash"]:Kill()
		if Tab then
			AS:SkinFrame(Tab)
			AS:StyleButton(Tab)
			Tab:GetNormalTexture():SetInside()
			AS:SkinTexture(Tab:GetNormalTexture())
			local point, relatedTo, point2, x, y = Tab:GetPoint()
			Tab:Point(point, relatedTo, point2, 1, y)
		end
	end

	-- Profession Tab
	local ProfessionButtons = {
		PrimaryProfession1SpellButtonTop,
		PrimaryProfession1SpellButtonBottom,
		PrimaryProfession2SpellButtonTop,
		PrimaryProfession2SpellButtonBottom,
		SecondaryProfession1SpellButtonLeft,
		SecondaryProfession1SpellButtonRight,
		SecondaryProfession2SpellButtonLeft,
		SecondaryProfession2SpellButtonRight,
		SecondaryProfession3SpellButtonLeft,
		SecondaryProfession3SpellButtonRight,
		SecondaryProfession4SpellButtonLeft,
		SecondaryProfession4SpellButtonRight
	}

	local ProfessionHeaders = {
		PrimaryProfession1,
		PrimaryProfession2,
		SecondaryProfession1,
		SecondaryProfession2,
		SecondaryProfession3,
		SecondaryProfession4
	}

	for _, Header in pairs(ProfessionHeaders) do
		Header.missingHeader:SetTextColor(1, 0.8, 0)
		Header.missingHeader:SetShadowColor(0, 0, 0)
		Header.missingHeader:SetShadowOffset(1, -1)
		Header.missingText:SetTextColor(0.6, 0.6, 0.6)
	end

	for _, Button in pairs(ProfessionButtons) do
		AS:SkinFrame(Button)
		AS:SkinTexture(Button.iconTexture)
		Button.iconTexture:SetInside()
	end

	hooksecurefunc('SpellBook_UpdateProfTab', function()
		for _, Button in pairs(ProfessionButtons) do
			Button:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
			Button:GetHighlightTexture():SetInside()
		end
	end)

	local ProfessionStatusBars = {
		PrimaryProfession1StatusBar,
		PrimaryProfession2StatusBar,
		SecondaryProfession1StatusBar,
		SecondaryProfession2StatusBar,
		SecondaryProfession3StatusBar,
		SecondaryProfession4StatusBar
	}

	for _, StatusBar in pairs(ProfessionStatusBars) do
		AS:SkinStatusBar(StatusBar)
		StatusBar:SetStatusBarColor(0, .8, 0)
		StatusBar.rankText:ClearAllPoints()
		StatusBar.rankText:SetPoint("CENTER")
	end

	-- Bottom Tabs
	for i = 1, 5 do
		AS:SkinTab(_G["SpellBookFrameTabButton"..i])
	end

	SpellBookFrameTabButton1:ClearAllPoints()
	SpellBookFrameTabButton1:Point("TOPLEFT", SpellBookFrame, "BOTTOMLEFT", -5, 2)

	hooksecurefunc("SpellBook_UpdateCoreAbilitiesTab", function()
		for i = 1, #SpellBookCoreAbilitiesFrame.Abilities do
			local button = SpellBookCoreAbilitiesFrame.Abilities[i]
			if button and not button.isSkinned then
				AS:SetTemplate(button)
				button.EmptySlot:SetAlpha(0)
				button.ActiveTexture:SetAlpha(0)
				button.FutureTexture:SetAlpha(0)
				AS:SkinTexture(button.iconTexture)
				button.iconTexture:SetInside()
				if button.FutureTexture:IsShown() then
					button.iconTexture:SetDesaturated(true)
					button.Name:SetTextColor(0.6, 0.6, 0.6)
					button.InfoText:SetTextColor(0.6, 0.6, 0.6)
					button.RequiredLevel:SetTextColor(0.6, 0.6, 0.6)
				else
					button.Name:SetTextColor(1, 0.82, 0)
					button.InfoText:SetTextColor(0.8, 0.8, 0.8)
					button.RequiredLevel:SetTextColor(0.8, 0.8, 0.8)
				end
				AS:StyleButton(button)
				button.isSkinned = true
			end
		end
		for i = 1, #SpellBookCoreAbilitiesFrame.SpecTabs do
			local Tab = SpellBookCoreAbilitiesFrame.SpecTabs[i]
			if Tab and not Tab.isSkinned then
				AS:SkinFrame(Tab)
				AS:StyleButton(Tab)
				Tab:SetNormalTexture(select(4, GetSpecializationInfo(i)))
				Tab:GetNormalTexture():SetInside()
				AS:SkinTexture(Tab:GetNormalTexture())

				if i == 1 then
					Tab:SetPoint("TOPLEFT", SpellBookFrame, "TOPRIGHT", 1, 0)
				end
				
				Tab.isSkinned = true
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_Spellbook', AS.Blizzard_Spellbook)