if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_TradeSkill(event, addon)
	if addon ~= 'Blizzard_TradeSkillUI' then return end
	AS:SkinBackdropFrame(TradeSkillFrame, nil, nil, true)
	TradeSkillFramePortrait:SetAlpha(0)

	AS:SkinStatusBar(TradeSkillRankFrame)

	AS:SkinCloseButton(TradeSkillFrameCloseButton)

	--AS:SkinBackdropFrame(TradeSkillFrame.RecipeInset)
	--TradeSkillFrame.RecipeInset.Backdrop:SetFrameLevel(TradeSkillFrame.RecipeInset.Backdrop:GetFrameLevel() + 1)
	--TradeSkillFrame.RecipeInset.Backdrop:SetPoint("TOPLEFT", 0, -1)
	--TradeSkillFrame.RecipeInset.Backdrop:SetPoint("BOTTOMRIGHT", 0, -2)

	--AS:StripTextures(TradeSkillFrame.RecipeList.LearnedTab)
	--AS:StripTextures(TradeSkillFrame.RecipeList.UnlearnedTab)

	--AS:SkinScrollBar(TradeSkillFrame.RecipeList.scrollBar)
	--AS:StripTextures(TradeSkillFrame.DetailsFrame)

	--AS:SkinBackdropFrame(TradeSkillFrame.DetailsInset)
	--TradeSkillFrame.DetailsInset.Backdrop:SetFrameLevel(TradeSkillFrame.DetailsInset.Backdrop:GetFrameLevel() + 1)
	--TradeSkillFrame.DetailsInset.Backdrop:SetPoint("TOPLEFT", 4, -1)
	--TradeSkillFrame.DetailsInset.Backdrop:SetPoint("BOTTOMRIGHT", 1, 1)

	--AS:SkinScrollBar(TradeSkillFrame.DetailsFrame.ScrollBar)

	--TradeSkillFrame.DetailsFrame.Background:Hide()

	--AS:SkinEditBox(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox)

	--TradeSkillFrame.DetailsFrame.CreateMultipleInputBox:DisableDrawLayer("BACKGROUND")

	--AS:SkinButton(TradeSkillFrame.DetailsFrame.CreateAllButton, true)
	--AS:SkinButton(TradeSkillFrame.DetailsFrame.CreateButton, true)
	--AS:SkinButton(TradeSkillFrame.DetailsFrame.ExitButton, true)

	--AS:SkinArrowButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.DecrementButton)
	--AS:SkinArrowButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton)
	--TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:SetPoint("LEFT", TradeSkillFrame.DetailsFrame.CreateMultipleInputBox, "RIGHT", 4, 0)

	--hooksecurefunc(TradeSkillFrame.DetailsFrame, "RefreshDisplay", function(self)
	--	AS:StyleButton(self.Contents.ResultIcon)
	--	AS:SetTemplate(self.Contents.ResultIcon)

	--	if self.Contents.ResultIcon:GetNormalTexture() then
	--		AS:SkinTexture(self.Contents.ResultIcon:GetNormalTexture())
	--		self.Contents.ResultIcon:GetNormalTexture():SetInside()
	--	end

	--	self.Contents.ResultIcon.ResultBorder:SetTexture("")
	--	self.Contents.ResultIcon.IconBorder:SetTexture("")
	--	self.Contents.ResultIcon:SetBackdropBorderColor(self.Contents.ResultIcon.IconBorder:GetVertexColor())

	--	for _, Button in pairs(self.Contents.Reagents) do
	--		AS:SkinTexture(Button.Icon, true)
	--		Button.NameFrame:SetTexture("")
	--	end
	--end)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_TrainerUI(event, addon)
	if addon ~= 'Blizzard_TrainerUI' then return end

	AS:SkinBackdropFrame(ClassTrainerFrame, nil, nil, true)
	AS:SkinCloseButton(ClassTrainerFrameCloseButton)
	ClassTrainerFrame.Backdrop:Point('TOPLEFT', 10, -11)
	ClassTrainerFrame.Backdrop:Point('BOTTOMRIGHT', -32, 74)

	AS:SkinButton(ClassTrainerTrainButton, true)
	AS:SkinButton(ClassTrainerCancelButton, true)

	AS:SkinDropDownBox(ClassTrainerFrameFilterDropDown)

	_G.ClassTrainerListScrollFrame:StripTextures()
	AS:SkinScrollBar(_G.ClassTrainerListScrollFrameScrollBar)

	_G.ClassTrainerDetailScrollFrame:StripTextures()
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

		button:GetNormalTexture():Size(16)
		button:GetNormalTexture():Point('LEFT', 5, 0)

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
	_G.ClassTrainerCollapseAllButton:GetNormalTexture():Size(15)

	_G.ClassTrainerCollapseAllButton:SetHighlightTexture('')
	_G.ClassTrainerCollapseAllButton.SetHighlightTexture = AS.Noop

	_G.ClassTrainerCollapseAllButton:SetDisabledTexture(AS.Media.Textures.Plus)
	_G.ClassTrainerCollapseAllButton.SetDisabledTexture = AS.Noop
	_G.ClassTrainerCollapseAllButton:GetDisabledTexture():SetPoint('LEFT', 3, 2)
	_G.ClassTrainerCollapseAllButton:GetDisabledTexture():Size(15)
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

AS:RegisterSkin('Blizzard_TradeSkill', AS.Blizzard_TradeSkill, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_TrainerUI", AS.Blizzard_TrainerUI, 'ADDON_LOADED')
