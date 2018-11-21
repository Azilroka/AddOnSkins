local AS = unpack(AddOnSkins)

function AS:Blizzard_AzeriteUI(event, addon)
	if addon ~= 'Blizzard_AzeriteUI' then return end

	AS:SkinBackdropFrame(AzeriteEmpoweredItemUI)
	AS:StripTextures(AzeriteEmpoweredItemUI.BorderFrame)
	AzeriteEmpoweredItemUI.BorderFrame.portrait:SetAlpha(0)

	AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.Bg:Hide()
	AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.KeyOverlay.Shadow:Hide()

	AS:SkinCloseButton(AzeriteEmpoweredItemUICloseButton)

	AS:UnregisterSkinEvent(addon, event)
end

local function SkinEtheralFrame(frame)
	frame.CornerTL:Hide()
	frame.CornerTR:Hide()
	frame.CornerBL:Hide()
	frame.CornerBR:Hide()

	local name = frame:GetName()
	_G[name.."LeftEdge"]:Hide()
	_G[name.."RightEdge"]:Hide()
	_G[name.."TopEdge"]:Hide()
	_G[name.."BottomEdge"]:Hide()

	local bg = select(23, frame:GetRegions())
	bg:ClearAllPoints()
	bg:SetPoint("TOPLEFT", -50, 25)
	bg:SetPoint("BOTTOMRIGHT")
	bg:SetTexture([[Interface\Transmogrify\EtherealLines]], true, true)
	bg:SetHorizTile(true)
	bg:SetVertTile(true)
	bg:SetAlpha(0.5)
end

function AS:Blizzard_AzeriteRespecUI(event, addon)
	if addon ~= 'Blizzard_AzeriteRespecUI' then return end

	local AzeriteRespecFrame = _G["AzeriteRespecFrame"]
	AzeriteRespecFrame:SetClipsChildren(true)
	AzeriteRespecFrame.Background:Hide()
	SkinEtheralFrame(AzeriteRespecFrame)

	AzeriteRespecFramePortraitFrame:Hide()
	AzeriteRespecFramePortrait:Hide()
	AzeriteRespecFrameTitleBg:Hide()
	AzeriteRespecFrameTopBorder:Hide()
	AzeriteRespecFrameTopRightCorner:Hide()
	AzeriteRespecFrameRightBorder:Hide()
	AzeriteRespecFrameLeftBorder:Hide()
	AzeriteRespecFrameBottomBorder:Hide()
	AzeriteRespecFrameBotRightCorner:Hide()
	AzeriteRespecFrameBotLeftCorner:Hide()
	AzeriteRespecFrameBg:Hide()

	local ItemSlot = AzeriteRespecFrame.ItemSlot
	ItemSlot:SetSize(64, 64)
	ItemSlot:SetPoint("CENTER", AzeriteRespecFrame)
	ItemSlot.Icon:ClearAllPoints()
	ItemSlot.Icon:SetPoint("TOPLEFT", 1, -1)
	ItemSlot.Icon:SetPoint("BOTTOMRIGHT", -1, 1)
	ItemSlot.GlowOverlay:SetAlpha(0)

	AzeriteRespecFrame.ItemSlot:CreateBackdrop("Transparent")
	AzeriteRespecFrame.ItemSlot.backdrop:SetBackdropColor(153/255, 0/255, 153/255, 0.5)
	AS:SkinTexture(AzeriteRespecFrame.ItemSlot.Icon)

	local ButtonFrame = AzeriteRespecFrame.ButtonFrame
	ButtonFrame:GetRegions():Hide()
	ButtonFrame.ButtonBorder:Hide()
	ButtonFrame.ButtonBottomBorder:Hide()

	ButtonFrame.MoneyFrameEdge:Hide()
	ButtonFrame.MoneyFrame:ClearAllPoints()
	ButtonFrame.MoneyFrame:SetPoint("BOTTOMRIGHT", ButtonFrame.MoneyFrameEdge, 7, 5)

	AzeriteRespecFrame:CreateBackdrop("Transparent")
	AzeriteRespecFrame.backdrop:SetAllPoints()

	AS:SkinButton(AzeriteRespecFrame.ButtonFrame.AzeriteRespecButton)
	AS:SkinCloseButton(AzeriteRespecFrameCloseButton)

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
		option.ArtworkBorder:SetAlpha(0)
	end

	local WarboardQuestChoiceDelayed = function(self)
		if not self then return end

		local frame
		for i = 1, 4 do
			frame = self["Option"..i]
			if frame and frame.WidgetContainer then
				S:SkinWidgetContainer(frame.WidgetContainer)
			end
		end
	end

	WarboardQuestChoiceFrame:HookScript("OnShow", function(self)
		AS:Delay(.5, WarboardQuestChoiceDelayed, self)
	end)

	AS:SkinCloseButton(WarboardQuestChoiceFrame.CloseButton)

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