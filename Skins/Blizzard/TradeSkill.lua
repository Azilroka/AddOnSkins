local AS = unpack(AddOnSkins)

function AS:Blizzard_TradeSkill(event, addon)
	if (addon == 'Blizzard_TradeSkillUI' and event == 'PLAYER_ENTERING_WORLD') or IsAddOnLoaded('Blizzard_TradeSkillUI') then
		AS:UnregisterSkinEvent('Blizzard_TradeSkill', 'ADDON_LOADED')
		TradeSkillFramePortrait:Kill()
		AS:SkinFrame(TradeSkillFrame, nil, nil, true)
		TradeSkillFrame:SetHeight(TradeSkillFrame:GetHeight() + 12)
		AS:SkinStatusBar(TradeSkillFrame.RankFrame)
		AS:SkinBackdropFrame(TradeSkillFrame.FilterButton, nil, nil, true)
		TradeSkillFrame.FilterButton.Backdrop:SetAllPoints()
		TradeSkillFrame.LinkToButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
		TradeSkillFrame.LinkToButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
		TradeSkillFrame.LinkToButton:GetHighlightTexture():Kill()
		TradeSkillFrame.LinkToButton:CreateBackdrop("Default")
		TradeSkillFrame.LinkToButton:SetSize(17, 14)
		TradeSkillFrame.LinkToButton:SetPoint("BOTTOMRIGHT", TradeSkillFrame.FilterButton, "TOPRIGHT", -2, 4)

		AS:SkinEditBox(TradeSkillFrame.SearchBox)
		AS:SkinCloseButton(TradeSkillFrameCloseButton)

		-- RecipeList
		AS:StripTextures(TradeSkillFrame.RecipeInset)
		AS:StripTextures(TradeSkillFrame.RecipeList.LearnedTab)
		AS:StripTextures(TradeSkillFrame.RecipeList.UnlearnedTab)

		-- DetailsFrame
		AS:StripTextures(TradeSkillFrame.DetailsFrame)
		AS:StripTextures(TradeSkillFrame.DetailsInset)
		TradeSkillFrame.DetailsFrame.Background:Hide()
		AS:SkinEditBox(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox)
		TradeSkillFrame.DetailsFrame.CreateMultipleInputBox:DisableDrawLayer("BACKGROUND")

		AS:SkinButton(TradeSkillFrame.DetailsFrame.CreateAllButton, true)
		AS:SkinButton(TradeSkillFrame.DetailsFrame.CreateButton, true)
		AS:SkinButton(TradeSkillFrame.DetailsFrame.ExitButton, true)

		AS:SkinScrollBar(TradeSkillFrame.DetailsFrame.ScrollBar)

		AS:SkinNextPrevButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.DecrementButton, nil, true)
		AS:SkinNextPrevButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton)
		TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:SetPoint("LEFT", TradeSkillFrame.DetailsFrame.CreateMultipleInputBox, "RIGHT", 4, 0)

		hooksecurefunc(TradeSkillFrame.DetailsFrame, "RefreshDisplay", function()
			local ResultIcon = TradeSkillFrame.DetailsFrame.Contents.ResultIcon
			ResultIcon:StyleButton()
			if ResultIcon:GetNormalTexture() then
				ResultIcon:GetNormalTexture():SetTexCoord(unpack(AS.TexCoords))
				ResultIcon:GetNormalTexture():SetInside()
			end
			ResultIcon:SetTemplate("Default")
			ResultIcon.Background:SetTexture(nil)

			for i = 1, #TradeSkillFrame.DetailsFrame.Contents.Reagents do
				local Button = TradeSkillFrame.DetailsFrame.Contents.Reagents[i]
				local Icon = Button.Icon
				local Count = Button.Count
				
				Icon:SetTexCoord(unpack(AS.TexCoords))
				Icon:SetDrawLayer("OVERLAY")
				if not Icon.Backdrop then
					Icon.Backdrop = CreateFrame("Frame", nil, Button)
					Icon.Backdrop:SetFrameLevel(Button:GetFrameLevel() - 1)
					Icon.Backdrop:SetTemplate("Default")
					Icon.Backdrop:SetOutside(Icon)
				end
				
				Icon:SetParent(Icon.Backdrop)
				Count:SetParent(Icon.Backdrop)
				Count:SetDrawLayer("OVERLAY")
				
				Button.NameFrame:Kill()
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