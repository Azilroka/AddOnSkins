if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_TradeSkill(event, addon)
	if addon ~= 'Blizzard_TradeSkillUI' then return end
	AS:SkinBackdropFrame(TradeSkillFrame, nil, nil, true)
	TradeSkillFrame.portrait:SetAlpha(0)

	TradeSkillFrame:SetHeight(TradeSkillFrame:GetHeight() + 12)

	AS:SkinStatusBar(TradeSkillFrame.RankFrame)

	AS:SkinButton(TradeSkillFrame.FilterButton)

	TradeSkillFrame.LinkToButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
	TradeSkillFrame.LinkToButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
	AS:Kill(TradeSkillFrame.LinkToButton:GetHighlightTexture())
	AS:CreateBackdrop(TradeSkillFrame.LinkToButton)
	TradeSkillFrame.LinkToButton:SetSize(17, 14)
	TradeSkillFrame.LinkToButton:SetPoint("BOTTOMRIGHT", TradeSkillFrame.FilterButton, "TOPRIGHT", -2, 4)

	AS:SkinEditBox(TradeSkillFrame.SearchBox)
	AS:SkinCloseButton(TradeSkillFrame.CloseButton)

	AS:SkinBackdropFrame(TradeSkillFrame.RecipeInset)
	TradeSkillFrame.RecipeInset.Backdrop:SetFrameLevel(TradeSkillFrame.RecipeInset.Backdrop:GetFrameLevel() + 1)
	TradeSkillFrame.RecipeInset.Backdrop:SetPoint("TOPLEFT", 0, -1)
	TradeSkillFrame.RecipeInset.Backdrop:SetPoint("BOTTOMRIGHT", 0, -2)

	AS:StripTextures(TradeSkillFrame.RecipeList.LearnedTab)
	AS:StripTextures(TradeSkillFrame.RecipeList.UnlearnedTab)

	AS:SkinScrollBar(TradeSkillFrame.RecipeList.scrollBar)
	AS:StripTextures(TradeSkillFrame.DetailsFrame)

	AS:SkinBackdropFrame(TradeSkillFrame.DetailsInset)
	TradeSkillFrame.DetailsInset.Backdrop:SetFrameLevel(TradeSkillFrame.DetailsInset.Backdrop:GetFrameLevel() + 1)
	TradeSkillFrame.DetailsInset.Backdrop:SetPoint("TOPLEFT", 4, -1)
	TradeSkillFrame.DetailsInset.Backdrop:SetPoint("BOTTOMRIGHT", 1, 1)

	AS:SkinScrollBar(TradeSkillFrame.DetailsFrame.ScrollBar)

	TradeSkillFrame.DetailsFrame.Background:Hide()

	AS:SkinEditBox(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox)

	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox:DisableDrawLayer("BACKGROUND")

	AS:SkinButton(TradeSkillFrame.DetailsFrame.CreateAllButton, true)
	AS:SkinButton(TradeSkillFrame.DetailsFrame.CreateButton, true)
	AS:SkinButton(TradeSkillFrame.DetailsFrame.ExitButton, true)

	AS:SkinArrowButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.DecrementButton)
	AS:SkinArrowButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:SetPoint("LEFT", TradeSkillFrame.DetailsFrame.CreateMultipleInputBox, "RIGHT", 4, 0)

	hooksecurefunc(TradeSkillFrame.DetailsFrame, "RefreshDisplay", function(self)
		AS:StyleButton(self.Contents.ResultIcon)
		AS:SetTemplate(self.Contents.ResultIcon)

		if self.Contents.ResultIcon:GetNormalTexture() then
			AS:SkinTexture(self.Contents.ResultIcon:GetNormalTexture())
			AS:SetInside(self.Contents.ResultIcon:GetNormalTexture())
		end

		self.Contents.ResultIcon.ResultBorder:SetTexture("")
		self.Contents.ResultIcon.IconBorder:SetTexture("")
		self.Contents.ResultIcon:SetBackdropBorderColor(self.Contents.ResultIcon.IconBorder:GetVertexColor())

		for _, Button in pairs(self.Contents.Reagents) do
			AS:SkinTexture(Button.Icon, true)
			Button.NameFrame:SetTexture("")
		end
	end)

	--Guild Crafters
	AS:SkinCloseButton(TradeSkillFrame.DetailsFrame.GuildFrame.CloseButton)
	AS:SkinButton(TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton)
	AS:SkinFrame(TradeSkillFrame.DetailsFrame.GuildFrame)
	AS:SkinFrame(TradeSkillFrame.DetailsFrame.GuildFrame.Container)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_TrainerUI(event, addon)
	if addon ~= 'Blizzard_TrainerUI' then return end

	AS:SkinFrame(ClassTrainerFrame, nil, nil, true)
	AS:SkinCloseButton(ClassTrainerFrame.CloseButton)

	AS:SkinStatusBar(ClassTrainerStatusBar)
	ClassTrainerStatusBar:SetPoint("TOPLEFT", ClassTrainerFrame, "TOPLEFT", 15, -35)

	AS:SkinButton(ClassTrainerTrainButton, true)

	AS:SkinDropDownBox(ClassTrainerFrameFilterDropDown)
	ClassTrainerFrameFilterDropDown:SetPoint("TOPRIGHT", ClassTrainerFrame, "TOPRIGHT", -6, -32)

	AS:SkinScrollBar(ClassTrainerScrollFrameScrollBar)
	AS:StripTextures(ClassTrainerFrame.scrollFrame.ScrollChild)

	AS:SkinFrame(ClassTrainerFrame.skillStepButton)
	AS:SkinTexture(ClassTrainerFrame.skillStepButton.icon)
	ClassTrainerFrame.skillStepButton:SetHighlightTexture('')

	ClassTrainerFrame.skillStepButton:HookScript('OnEnter', function(self)
		self:SetBackdropBorderColor(1, .82, 0)
	end)
	ClassTrainerFrame.skillStepButton:HookScript('OnLeave', function(self)
		if self.selectedTex:IsShown() then
			self:SetBackdropBorderColor(unpack(AS.Color))
		else
			self:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end)

	for _, Button in pairs(ClassTrainerFrame.scrollFrame.buttons) do
		AS:SkinFrame(Button)
		AS:SkinTexture(Button.icon)

		Button:SetHighlightTexture('')
		Button:SetPushedTexture('')
		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self.selectedTex:IsShown() then
				self:SetBackdropBorderColor(unpack(AS.Color))
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)

		Button.selectedTex:SetTexture('')
	end

	hooksecurefunc('ClassTrainerFrame_SetServiceButton', function(skillButton, skillIndex, playerMoney, selected, isTradeSkill)
		if ( ClassTrainerFrame.selectedService and selected == skillIndex ) then
			skillButton:SetBackdropBorderColor(unpack(AS.Color))
		else
			skillButton:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_TradeSkill', AS.Blizzard_TradeSkill, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_TrainerUI", AS.Blizzard_TrainerUI, 'ADDON_LOADED')
