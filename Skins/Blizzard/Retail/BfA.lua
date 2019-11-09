if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local pairs, select, unpack = pairs, select, unpack
--WoW API / Variables
local hooksecurefunc = hooksecurefunc
-- GLOBALS:

function AS:Blizzard_AzeriteUI(event, addon)
	if addon ~= 'Blizzard_AzeriteUI' then return end

	AS:SkinFrame(_G.AzeriteEmpoweredItemUI)
	AS:SkinCloseButton(_G.AzeriteEmpoweredItemUI.BorderFrame.CloseButton)

	_G.AzeriteEmpoweredItemUI.BorderFrame.portrait:SetAlpha(0)

	_G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.Bg:Hide()

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

	AS:SetInside(ItemSlot.Icon)
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

	AS:SkinBackdropFrame(_G.IslandsPartyPoseFrame)
	AS:SkinButton(_G.IslandsPartyPoseFrame.LeaveButton)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_IslandsQueueUI(event, addon)
	if addon ~= 'Blizzard_IslandsQueueUI' then return end

	AS:SkinBackdropFrame(_G.IslandsQueueFrame)
	_G.IslandsQueueFrame.ArtOverlayFrame.PortraitFrame:SetAlpha(0)
	_G.IslandsQueueFrame.ArtOverlayFrame.portrait:SetAlpha(0)
	_G.IslandsQueueFrame.portrait:Hide()

	AS:SkinCloseButton(_G.IslandsQueueFrame.CloseButton)
	AS:SkinButton(_G.IslandsQueueFrame.DifficultySelectorFrame.QueueButton)

	AS:StripTextures(_G.IslandsQueueFrame.WeeklyQuest.OverlayFrame)
	_G.IslandsQueueFrame.WeeklyQuest.StatusBar:CreateBackdrop("Default")

	--StatusBar Icon
	AS:SkinTexture(_G.IslandsQueueFrame.WeeklyQuest.QuestReward.Icon)

	AS:SkinButton(_G.IslandsQueueFrame.TutorialFrame.Leave)
	AS:SkinCloseButton(_G.IslandsQueueFrame.TutorialFrame.CloseButton)

	AS:Kill(_G.IslandsQueueFrame.HelpButton)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_ScrappingMachineUI(event, addon)
	if addon ~= 'Blizzard_ScrappingMachineUI' then return end

	AS:SkinBackdropFrame(_G.ScrappingMachineFrame)
	AS:SkinCloseButton(_G.ScrappingMachineFrame.CloseButton)
	AS:SkinButton(_G.ScrappingMachineFrame.ScrapButton, true)

	AS:StripTextures(_G.ScrappingMachineFrame.ItemSlots)

	for button in pairs(_G.ScrappingMachineFrame.ItemSlots.scrapButtons.activeObjects) do
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
	AS:StripTextures(WarboardQuestChoiceFrame)
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

	AS:SkinBackdropFrame(_G.WarfrontsPartyPoseFrame)
	AS:SkinBackdropFrame(_G.WarfrontsPartyPoseFrame.ModelScene)

	AS:SkinButton(_G.WarfrontsPartyPoseFrame.LeaveButton)

	AS:CreateBackdrop(_G.WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame)
	_G.WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.Backdrop:SetPoint("TOPLEFT", -5, 5)
	_G.WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.Backdrop:SetPoint("BOTTOMRIGHT", _G.WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.NameFrame, 0, -5)

	_G.WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.NameFrame:SetAlpha(0)
	_G.WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.IconBorder:SetAlpha(0)

	AS:SkinTexture(_G.WarfrontsPartyPoseFrame.RewardAnimations.RewardFrame.Icon)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_AzeriteRespecUI", AS.Blizzard_AzeriteRespecUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_AzeriteUI", AS.Blizzard_AzeriteUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_IslandsPartyPoseUI", AS.Blizzard_IslandsPartyPoseUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_IslandsQueueUI", AS.Blizzard_IslandsQueueUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_ScrappingMachineUI', AS.Blizzard_ScrappingMachineUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_WarboardUI", AS.Blizzard_WarboardUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_WarfrontsPartyPoseUI", AS.Blizzard_WarfrontsPartyPoseUI, 'ADDON_LOADED')
