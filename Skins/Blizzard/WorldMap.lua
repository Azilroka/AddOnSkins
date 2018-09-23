local AS = unpack(AddOnSkins)

function AS:Blizzard_WorldMap()
	AS:SkinBackdropFrame(WorldMapFrame)
	AS:CreateShadow(WorldMapFrame.Backdrop)
	AS:StripTextures(WorldMapFrame.BorderFrame)
	AS:SkinCloseButton(WorldMapFrameCloseButton)

	WorldMapFrame.BorderFrame.Tutorial:Kill()

	AS:StripTextures(WorldMapFrame.NavBar)
	AS:StripTextures(WorldMapFrame.NavBar.overlay)

	AS:SkinButton(WorldMapFrameHomeButton)
	WorldMapFrameHomeButton.xoffset = 1
	WorldMapFrameHomeButton:SetPoint('LEFT', -60, 0)
	WorldMapFrameHomeButton.text:SetFont(AS.Font, 13)
	WorldMapFrameHomeButton.text:ClearAllPoints()
	WorldMapFrameHomeButton.text:SetPoint('CENTER')

	AS:SkinScrollBar(QuestScrollFrameScrollBar)

	AS:SkinButton(QuestMapFrame.DetailsFrame.BackButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.AbandonButton)
	--AS:SkinButton(QuestMapFrame.DetailsFrame.IgnoreButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.ShareButton, true)
	AS:SkinButton(QuestMapFrame.DetailsFrame.TrackButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.CompleteQuestFrame.CompleteButton, true)

	AS:SkinFrame(QuestMapFrame.QuestsFrame.StoryTooltip)
	AS:StripTextures(QuestMapFrame.DetailsFrame.CompleteQuestFrame)

	AS:SkinMaxMinFrame(WorldMapFrame.BorderFrame.MaximizeMinimizeFrame)

	if not AS.ParchmentEnabled then
		AS:StripTextures(QuestMapFrame.DetailsFrame)
		AS:StripTextures(QuestMapFrame.DetailsFrame.RewardsFrame)
		AS:SkinScrollBar(QuestMapFrame.DetailsFrame.ScrollFrame.ScrollBar)
	end
end

AS:RegisterSkin('Blizzard_WorldMap', AS.Blizzard_WorldMap)
