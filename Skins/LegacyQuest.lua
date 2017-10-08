local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('LegacyQuest') then return end

function AS:LegacyQuest()
	AS:SkinFrame(QuestLogFrame)
	AS:SkinFrame(QuestLogCount)
	QuestLogFrame:SetTemplate("Transparent")

	AS:SkinCloseButton(QuestLogFrameCloseButton)

	AS:SkinButton(QuestLogFrameAbandonButton)
	AS:SkinButton(QuestLogFramePushQuestButton)
	AS:SkinButton(QuestLogFrameTrackButton)
	AS:SkinButton(QuestLogFrameCancelButton)

	AS:SkinScrollBar(QuestLogScrollFrameScrollBar)
	AS:SkinScrollBar(QuestLogDetailScrollFrameScrollBar)

	QuestLogFrameInset:StripTextures()
	QuestLogFrame.iborder:StripTextures()
	QuestLogScrollFrame:StripTextures()
	QuestLogDetailScrollFrame:StripTextures()
end

AS:RegisterSkin('LegacyQuest', AS.LegacyQuest)