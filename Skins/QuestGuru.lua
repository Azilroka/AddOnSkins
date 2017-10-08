local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('QuestGuru') then return end

function AS:QuestGuru()
	AS:SkinFrame(QuestGuru)
	AS:SkinFrame(QuestGuru.count)
	AS:SkinFrame(QuestGuruScrollFrame.expandAll)
	QuestGuru:SetTemplate("Transparent")

	-- Skin QuestGuru Buttons
for i = 1, QuestGuru:GetNumChildren() do
	local object = select(i, QuestGuru:GetChildren())
	if object:IsObjectType('Button') then
		if object:GetText() ~= nil then
			AS:SkinButton(object, true)
		else
			AS:SkinCloseButton(object, true)
		end
	end
end

	--Reposition Expand/Collapse Button
	QuestGuruScrollFrame.expandAll:ClearAllPoints()
	QuestGuruScrollFrame.expandAll:Point('BOTTOMLEFT', QuestGuru, 'TOPLEFT', 10, -53)

	--Reposition Show Map Button
	QuestGuru.mapButton:ClearAllPoints()
	QuestGuru.mapButton:Point('RIGHT', QuestGuru.count, 'RIGHT', 407, 0)

	--Resize Expand/Collapse Button
	QuestGuruScrollFrame.expandAll:Size(120, 30)
	QuestGuruScrollFrame.expandAll:SetFormattedText(TEXT" Expand/Collapse ")

	--Resize Show Map Button
	QuestGuru.mapButton:Size(50, 40)
	QuestGuru.mapButton:SetFormattedText(TEXT" Quest Log ")

	AS:SkinScrollBar(QuestGuruScrollFrameScrollBar)
	AS:SkinScrollBar(QuestGuruDetailScrollFrameScrollBar)

	QuestGuruInset:StripTextures()
	QuestGuruDetailScrollFrame:StripTextures()
	QuestGuruScrollFrame:StripTextures()

	QGC_FramePortrait:Kill()
	QGC_FrameTitleText:SetFormattedText(TEXT" Quest Log ")
end

AS:RegisterSkin('QuestGuru', AS.QuestGuru)