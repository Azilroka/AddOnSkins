local AS = unpack(AddOnSkins)

function AS:Blizzard_AzeriteUI(event, addon)
	if addon ~= 'Blizzard_AzeriteUI' then return end

	AS:SkinFrame(AzeriteEmpoweredItemUI)
	AS:SkinCloseButton(AzeriteEmpoweredItemUI.BorderFrame.CloseButton)

	AzeriteEmpoweredItemUI.BorderFrame.portrait:SetAlpha(0)

	AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.Bg:Hide()

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_AzeriteRespecUI(event, addon)
	if addon ~= 'Blizzard_AzeriteRespecUI' then return end

	local AzeriteRespecFrame = _G["AzeriteRespecFrame"]
	AzeriteRespecFrame:SetClipsChildren(true)
	AzeriteRespecFrame.Background:Hide()

	AS:SkinFrame(AzeriteRespecFrame)
	AS:SkinCloseButton(AzeriteRespecFrame.CloseButton)

	local Lines = select(23, AzeriteRespecFrame:GetRegions())
	Lines:ClearAllPoints()
	Lines:SetPoint("TOPLEFT", -50, 25)
	Lines:SetPoint("BOTTOMRIGHT")
	Lines:SetTexture([[Interface\Transmogrify\EtherealLines]], true, true)
	Lines:SetHorizTile(true)
	Lines:SetVertTile(true)
	Lines:SetAlpha(0.5)

	local ItemSlot = AzeriteRespecFrame.ItemSlot
	AS:CreateBackdrop(ItemSlot)
	AS:SkinTexture(ItemSlot.Icon)

	ItemSlot:SetSize(64, 64)
	ItemSlot:SetPoint("CENTER", AzeriteRespecFrame)

	ItemSlot.Icon:SetInside()
	ItemSlot.GlowOverlay:SetAlpha(0)

	ItemSlot.Backdrop:SetBackdropColor(.6, 0, .6, .5)

	local ButtonFrame = AzeriteRespecFrame.ButtonFrame
	ButtonFrame:GetRegions():Hide()
	ButtonFrame.ButtonBorder:Hide()
	ButtonFrame.ButtonBottomBorder:Hide()

	ButtonFrame.MoneyFrameEdge:Hide()
	ButtonFrame.MoneyFrame:ClearAllPoints()
	ButtonFrame.MoneyFrame:SetPoint("BOTTOMRIGHT", ButtonFrame.MoneyFrameEdge, 7, 5)

	AS:SkinButton(ButtonFrame.AzeriteRespecButton)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_IslandsPartyPoseUI(event, addon)
	if addon ~= 'Blizzard_IslandsPartyPoseUI' then return end

	AS:SkinBackdropFrame(IslandsPartyPoseFrame)
	AS:SkinButton(IslandsPartyPoseFrame.LeaveButton)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_IslandsQueueUI(event, addon)
	if addon ~= 'Blizzard_IslandsQueueUI' then return end

	AS:SkinBackdropFrame(IslandsQueueFrame)
	IslandsQueueFrame.ArtOverlayFrame.PortraitFrame:SetAlpha(0)
	IslandsQueueFrame.ArtOverlayFrame.portrait:SetAlpha(0)
	IslandsQueueFrame.portrait:Hide()

	AS:SkinCloseButton(IslandsQueueFrame.CloseButton)
	AS:SkinButton(IslandsQueueFrame.DifficultySelectorFrame.QueueButton)

	IslandsQueueFrame.WeeklyQuest.OverlayFrame:StripTextures()
	IslandsQueueFrame.WeeklyQuest.StatusBar:CreateBackdrop("Default")

	--StatusBar Icon
	AS:SkinTexture(IslandsQueueFrame.WeeklyQuest.QuestReward.Icon)

	AS:SkinButton(IslandsQueueFrame.TutorialFrame.Leave)
	AS:SkinCloseButton(IslandsQueueFrame.TutorialFrame.CloseButton)

	AS:Kill(IslandsQueueFrame.HelpButton)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_ScrappingMachineUI(event, addon)
	if addon ~= 'Blizzard_ScrappingMachineUI' then return end

	AS:SkinBackdropFrame(ScrappingMachineFrame)
	AS:SkinCloseButton(ScrappingMachineFrame.CloseButton)
	AS:SkinButton(ScrappingMachineFrame.ScrapButton, true)

	AS:StripTextures(ScrappingMachineFrame.ItemSlots)

	for button in pairs(ScrappingMachineFrame.ItemSlots.scrapButtons.activeObjects) do
		AS:SkinFrame(button)
		AS:SkinTexture(button.Icon)
		button.IconBorder:SetAlpha(0)
		hooksecurefunc(button.IconBorder, 'SetVertexColor', function(self, r, g, b) button:SetBackdropBorderColor(r, g, b) end)
		hooksecurefunc(button.IconBorder, 'Hide', function() button:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
	end

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_WarboardUI(event, addon)
	if addon ~= 'Blizzard_WarboardUI' then return end

	local WarboardQuestChoiceFrame = _G["WarboardQuestChoiceFrame"]
	WarboardQuestChoiceFrame:StripTextures()
	WarboardQuestChoiceFrame:CreateBackdrop("Transparent")

	WarboardQuestChoiceFrame.BorderFrame:Hide()
	WarboardQuestChoiceFrame.BorderFrame.Header:SetAlpha(0)
	WarboardQuestChoiceFrame.Background:Hide()
	WarboardQuestChoiceFrame.Title:DisableDrawLayer("BACKGROUND")

	for i = 1, 4 do
		local option = WarboardQuestChoiceFrame["Option"..i]

		for x = 1, #option.OptionButtonsContainer.Buttons do
			AS:SkinButton(option.OptionButtonsContainer.Buttons[x])
		end
	end

	AS:SkinCloseButton(WarboardQuestChoiceFrame.CloseButton)

	hooksecurefunc(WarboardQuestChoiceFrame, "Update", function()
		local numOptions = WarboardQuestChoiceFrame:GetNumOptions();
		for i = 1, numOptions do
			local option = WarboardQuestChoiceFrame.Options[i];
			option.Background:Hide()
			option.ArtworkBorder:Hide()
			AS:CreateBackdrop(option.Artwork)
			option.OptionText:SetTextColor(1, 1, 1)
			if option.WidgetContainer then
				AS:SkinWidgetContainer(option.WidgetContainer)
			end
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_WarfrontsPartyPoseUI(event, addon)
	if addon ~= 'Blizzard_WarfrontsPartyPoseUI' then return end

	AS:SkinBackdropFrame(WarfrontsPartyPoseFrame)
	AS:SkinBackdropFrame(WarfrontsPartyPoseFrame.ModelScene)

	AS:SkinButton(WarfrontsPartyPoseFrame.LeaveButton)

	AS:CreateBackdrop(WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame)
	WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.Backdrop:SetPoint("TOPLEFT", -5, 5)
	WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.Backdrop:SetPoint("BOTTOMRIGHT", WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.NameFrame, 0, -5)

	WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.NameFrame:SetAlpha(0)
	WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.IconBorder:SetAlpha(0)

	AS:SkinTexture(WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.Icon)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_AzeriteRespecUI", AS.Blizzard_AzeriteRespecUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_AzeriteUI", AS.Blizzard_AzeriteUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_IslandsPartyPoseUI", AS.Blizzard_IslandsPartyPoseUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_IslandsQueueUI", AS.Blizzard_IslandsQueueUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_ScrappingMachineUI', AS.Blizzard_ScrappingMachineUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_WarboardUI", AS.Blizzard_WarboardUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_WarfrontsPartyPoseUI", AS.Blizzard_WarfrontsPartyPoseUI, 'ADDON_LOADED')