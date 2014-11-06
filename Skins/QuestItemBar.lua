local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('QuestItemBar') then return end

function AS:QuestItemBar()
	hooksecurefunc(QuestItemBar,'LibQuestItem_Update', function()
		for i = 1, 99 do
			if _G['QuestItemBarButton'..i] then AS:SkinIconButton(_G['QuestItemBarButton'..i], true) end
		end
		QuestItemBar:UpdateBar()
	end)
end

AS:RegisterSkin('QuestItemBar', AS.QuestItemBar)