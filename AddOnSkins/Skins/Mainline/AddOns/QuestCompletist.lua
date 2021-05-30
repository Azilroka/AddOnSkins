local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('QuestCompletist') then return end

function AS:QuestCompletist()
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
			_G[object]:SetFrameStrata('DIALOG')
			AS:SkinTooltip(_G[object])
		end
	end

	AS:SkinFrame(qcQuestCompletistUI)
	qcQuestCompletistUI:SetSize(360,450)
	AS:SkinEditBox(qcSearchBox)
	AS:SkinButton(qcOptionsButton)
	AS:SkinButton(qcCategoryDropdownButton)
	AS:SkinCloseButton(qcXButton)
	AS:SkinSlideBar(qcMenuSlider)
	qcMenuSlider:SetPoint('TOPLEFT', qcQuestCompletistUI, 'TOPLEFT', 303, -90)
	qcMenuSlider:SetHeight(256)
end

AS:RegisterSkin('QuestCompletist', AS.QuestCompletist)
