local AS, L, S, R = unpack(AddOnSkins)

function R:QuestGuru()
	S:HandleFrame(QuestGuru)
	S:HandleFrame(QuestGuru.count)
	S:HandleFrame(QuestGuruScrollFrame.expandAll)
	QuestGuru:SetTemplate("Transparent")

	-- Skin QuestGuru Buttons
	for _, object in pairs({QuestGuru:GetChildren()}) do
		if object:IsObjectType('Button') then
			if object:GetText() ~= nil then
				S:HandleButton(object, true)
			else
				S:HandleCloseButton(object, true)
			end
		end
	end

	--Reposition Expand/Collapse Button
	QuestGuruScrollFrame.expandAll:ClearAllPoints()
	QuestGuruScrollFrame.expandAll:SetPoint('BOTTOMLEFT', QuestGuru, 'TOPLEFT', 10, -53)

	--Reposition Show Map Button
	QuestGuru.mapButton:ClearAllPoints()
	QuestGuru.mapButton:SetPoint('RIGHT', QuestGuru.count, 'RIGHT', 407, 0)

	--Resize Expand/Collapse Button
	QuestGuruScrollFrame.expandAll:SetSize(120, 30)
	QuestGuruScrollFrame.expandAll:SetText(" Expand/Collapse ")

	--Resize Show Map Button
	QuestGuru.mapButton:SetSize(50, 40)
	QuestGuru.mapButton:SetText(" Quest Log ")

	S:HandleScrollBar(QuestGuruScrollFrameScrollBar)
	S:HandleScrollBar(QuestGuruDetailScrollFrameScrollBar)

	S:StripTextures(QuestGuruInset)
	S:StripTextures(QuestGuruDetailScrollFrame)
	S:StripTextures(QuestGuruScrollFrame)
end

AS:RegisterSkin('QuestGuru')
