local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Classic Quest Log') then return end

function AS:ClassicQuestLog()
	AS:SkinFrame(ClassicQuestLog, "Transparent")
	AS:SkinScrollBar(ClassicQuestLogScrollFrameScrollBar)
	AS:SkinScrollBar(ClassicQuestLogDetailScrollFrameScrollBar)
	AS:StripTextures(ClassicQuestLogInset)
	AS:StripTextures(ClassicQuestLogScrollFrame.expandAll)
	AS:StripTextures(ClassicQuestLog.count)
	AS:StripTextures(ClassicQuestLogScrollFrame)
	AS:StripTextures(ClassicQuestLogDetailScrollFrame)

	for i = 1, ClassicQuestLog:GetNumChildren() do
		local object = select(i, ClassicQuestLog:GetChildren())
		if object:IsObjectType('Button') then
			if object:GetText() ~= nil then
				AS:SkinButton(object, true)
			else
				AS:SkinCloseButton(object, true)
			end
		end
	end

	--Reposition Expand/Collapse Button
	ClassicQuestLogScrollFrame.expandAll:ClearAllPoints()
	ClassicQuestLogScrollFrame.expandAll:SetPoint('BOTTOMLEFT', ClassicQuestLog, 'TOPLEFT', 10, -53)

	ClassicQuestLog.count:SetSize(100, 20)
	ClassicQuestLog.count:ClearAllPoints()
	ClassicQuestLog.count:SetPoint('LEFT', ClassicQuestLogScrollFrame.expandAll, 'RIGHT', -4, -4)

	--Reposition Show Map Button
	ClassicQuestLog.mapButton:ClearAllPoints()
	ClassicQuestLog.mapButton:SetPoint('BOTTOMRIGHT', ClassicQuestLog, 'TOPRIGHT', 0, -59)
	ClassicQuestLog.mapButton.text:SetFormattedText("Click") -- Install addon and fix this button.

	--Resize Expand/Collapse Button
	ClassicQuestLogScrollFrame.expandAll:SetSize(120, 30)
	ClassicQuestLogScrollFrame.expandAll:SetFormattedText("Expand/Collapse")

	--Resize Show Map Button
	ClassicQuestLog.mapButton:SetSize(56, 40)
end

AS:RegisterSkin('Classic Quest Log', AS.ClassicQuestLog)
