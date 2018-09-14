local AS = unpack(AddOnSkins)

function AS:Blizzard_TradeSkill(event, addon)
	if (addon == 'Blizzard_TradeSkillUI' and event == 'PLAYER_ENTERING_WORLD') or IsAddOnLoaded('Blizzard_TradeSkillUI') then
		AS:UnregisterSkinEvent('Blizzard_TradeSkill', 'ADDON_LOADED')

		AS:SkinFrame(TradeSkillFrame, nil, nil, true)

		TradeSkillFrame:SetHeight(TradeSkillFrame:GetHeight() + 12)

		AS:SkinStatusBar(TradeSkillFrame.RankFrame)

		AS:SkinButton(TradeSkillFrame.FilterButton)

		TradeSkillFrame.LinkToButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
		TradeSkillFrame.LinkToButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
		TradeSkillFrame.LinkToButton:GetHighlightTexture():Kill()
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

		AS:SkinScrollBar(TradeSkillFrame)
		AS:SkinScrollBar(TradeSkillFrame.RecipeList.scrollBar)

		AS:StripTextures(TradeSkillFrame.DetailsFrame)

		AS:SkinBackdropFrame(TradeSkillFrame.DetailsInset)
		TradeSkillFrame.DetailsInset.Backdrop:SetFrameLevel(TradeSkillFrame.DetailsInset.Backdrop:GetFrameLevel() + 1)
		TradeSkillFrame.DetailsInset.Backdrop:SetPoint("TOPLEFT", 4, -1)
		TradeSkillFrame.DetailsInset.Backdrop:SetPoint("BOTTOMRIGHT", 1, 1)

		AS:StripTextures(TradeSkillFrame.DetailsFrame.ScrollBar)
		AS:SkinScrollBar(TradeSkillFrame.DetailsFrame.ScrollBar)

		TradeSkillFrame.DetailsFrame.Background:Hide()

		AS:SkinEditBox(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox)

		TradeSkillFrame.DetailsFrame.CreateMultipleInputBox:DisableDrawLayer("BACKGROUND")

		AS:SkinButton(TradeSkillFrame.DetailsFrame.CreateAllButton, true)
		AS:SkinButton(TradeSkillFrame.DetailsFrame.CreateButton, true)
		AS:SkinButton(TradeSkillFrame.DetailsFrame.ExitButton, true)

		AS:SkinNextPrevButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.DecrementButton, nil, true)
		AS:SkinNextPrevButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton)
		TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:SetPoint("LEFT", TradeSkillFrame.DetailsFrame.CreateMultipleInputBox, "RIGHT", 4, 0)

		hooksecurefunc(TradeSkillFrame.DetailsFrame, "RefreshDisplay", function(self)
			AS:StyleButton(self.Contents.ResultIcon)
			if self.Contents.ResultIcon:GetNormalTexture() then
				AS:SkinTexture(self.Contents.ResultIcon:GetNormalTexture())
				self.Contents.ResultIcon:GetNormalTexture():SetInside()
			end
			self.Contents.ResultIcon.ResultBorder:SetTexture("")
			self.Contents.ResultIcon.IconBorder:SetTexture("")
			AS:SetTemplate(self.Contents.ResultIcon)
			self.Contents.ResultIcon:SetBackdropBorderColor(self.Contents.ResultIcon.IconBorder:GetVertexColor())

			for _, Button in pairs(self.Contents.Reagents) do
				if not Button.Icon.Backdrop then
					Button.Icon.Backdrop = CreateFrame("Frame", nil, Button)
					Button.Icon.Backdrop:SetFrameLevel(Button:GetFrameLevel() - 1)
					AS:SetTemplate(Button.Icon.Backdrop)
					Button.Icon.Backdrop:SetOutside(Button.Icon)
				end

				AS:SkinTexture(Button.Icon)

				Button.NameFrame:SetTexture("")
			end
		end)

		--Guild Crafters
		AS:SkinCloseButton(TradeSkillFrame.DetailsFrame.GuildFrame.CloseButton)
		AS:SkinButton(TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton)
		TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton.LeftSeparator:SetTexture(nil)
		TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton.RightSeparator:SetTexture(nil)
		AS:SkinFrame(TradeSkillFrame.DetailsFrame.GuildFrame)
		AS:SkinFrame(TradeSkillFrame.DetailsFrame.GuildFrame.Container)
	end
end

AS:RegisterSkin('Blizzard_TradeSkill', AS.Blizzard_TradeSkill, 'ADDON_LOADED')
