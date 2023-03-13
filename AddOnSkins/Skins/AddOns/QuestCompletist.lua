local AS, L, S, R = unpack(AddOnSkins)

function R:QuestCompletist()
	local tooltips = {
		'qcMapTooltip',
		'qcQuestInformationTooltip',
		'qcToastTooltip',
		'qcQuestReputationTooltip',
		'qcNewDataAlertTooltip',
		'qcMutuallyExclusiveAlertTooltip',
	}

	for _, object in pairs(tooltips) do
		if _G[object] then
			--_G[object]:SetFrameStrata('DIALOG')
			S:HandleTooltip(_G[object])
		end
	end

	S:HandleFrame(qcQuestCompletistUI)
	qcQuestCompletistUI:SetSize(360,450)
	S:HandleEditBox(qcSearchBox)
	S:HandleButton(qcOptionsButton)
	S:HandleButton(qcCategoryDropdownButton)
	S:HandleCloseButton(qcXButton)
	S:HandleSlideBar(qcMenuSlider)
	qcMenuSlider:SetPoint('TOPLEFT', qcQuestCompletistUI, 'TOPLEFT', 303, -90)
	qcMenuSlider:SetHeight(256)
end

AS:RegisterSkin('QuestCompletist')
