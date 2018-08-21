local AS = unpack(AddOnSkins)

function AS:Blizzard_WorldMap()
	AS:SkinBackdropFrame(WorldMapFrame)
	AS:CreateShadow(WorldMapFrame.Backdrop)
	AS:StripTextures(WorldMapFrame.BorderFrame)
	AS:SkinCloseButton(WorldMapFrameCloseButton)

	WorldMapFrame.BorderFrame.Tutorial:Kill()

	AS:StripTextures(WorldMapFrame.NavBar)
	AS:StripTextures(WorldMapFrame.NavBar.overlay)

	AS:SkinBackdropFrame(WorldMapFrameHomeButton)
	WorldMapFrameHomeButton.Backdrop:SetPoint("TOPLEFT", WorldMapFrameHomeButton, "TOPLEFT", 0, 0)
	WorldMapFrameHomeButton.Backdrop:SetPoint("BOTTOMRIGHT", WorldMapFrameHomeButton, "BOTTOMRIGHT", -15, 0)
	WorldMapFrameHomeButton:SetFrameLevel(1)

	AS:SkinScrollBar(QuestScrollFrameScrollBar)

	AS:SkinButton(QuestMapFrame.DetailsFrame.BackButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.AbandonButton)
	--AS:SkinButton(QuestMapFrame.DetailsFrame.IgnoreButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.ShareButton, true)
	AS:SkinButton(QuestMapFrame.DetailsFrame.TrackButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.CompleteQuestFrame.CompleteButton, true)

	AS:SkinFrame(QuestMapFrame.QuestsFrame.StoryTooltip)
	AS:StripTextures(QuestMapFrame.DetailsFrame.CompleteQuestFrame)

	for _, Button in pairs({ WorldMapFrameSizeDownButton, WorldMapFrameSizeUpButton }) do
		AS:SkinButton(Button, true)
		Button:SetSize(16, 16)
		Button.Text = Button:CreateFontString(nil, 'OVERLAY')
		Button.Text:SetFont('Interface\\AddOns\\AddOnSkins\\Media\\Fonts\\Arial.ttf', 12)
		Button.Text:SetPoint('CENTER', Button)
	end

	local rewardFrames = {
		['MoneyFrame'] = true,
		['HonorFrame'] = true,
		['XPFrame'] = true,
		['SpellFrame'] = true,
		['SkillPointFrame'] = true,
	}

	local function HandleReward(frame)
		if (not frame or frame.isSkinned) then return end
		frame.NameFrame:SetAlpha(0)
		AS:SkinTexture(frame.Icon)
		AS:CreateBackdrop(frame)
		frame.Backdrop:SetOutside(frame.Icon)
		frame.Count:ClearAllPoints()
		frame.Count:SetPoint("BOTTOMRIGHT", frame.Icon, "BOTTOMRIGHT", 2, 0)
		if (frame.CircleBackground) then
			frame.CircleBackground:SetAlpha(0)
			frame.CircleBackgroundGlow:SetAlpha(0)
		end
		frame.isSkinned = true
	end

	for frame, _ in pairs(rewardFrames) do
		HandleReward(MapQuestInfoRewardsFrame[frame])
	end

	hooksecurefunc('QuestInfo_GetRewardButton', function(rewardsFrame, index)
		local button = MapQuestInfoRewardsFrame.RewardButtons[index]
		if (button) then
			HandleReward(button)
		end
	end)

	AS:SkinMaxMinFrame(WorldMapFrame.BorderFrame.MaximizeMinimizeFrame)

	if not AS.ParchmentEnabled then
		AS:StripTextures(QuestMapFrame.DetailsFrame)
		AS:StripTextures(QuestMapFrame.DetailsFrame.RewardsFrame)
		AS:SkinScrollBar(QuestMapFrame.DetailsFrame.ScrollFrame.ScrollBar)
	end
end

AS:RegisterSkin('Blizzard_WorldMap', AS.Blizzard_WorldMap)