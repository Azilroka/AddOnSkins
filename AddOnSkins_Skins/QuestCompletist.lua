local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('QuestCompletist') then return end

local name = 'QuestCompletistSkin'
function AS:SkinQuestCompletist()
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
	qcQuestCompletistUI:Size(360,450)
	AS:SkinEditBox(qcSearchBox)
	AS:SkinButton(qcOptionsButton)
	AS:SkinButton(qcCategoryDropdownButton)
	AS:SkinCloseButton(qcXButton)
	AS:SkinSlideBar(qcMenuSlider, 16)
	qcMenuSlider:Point('TOPLEFT', qcQuestCompletistUI, 'TOPLEFT', 303, -90)
	qcMenuSlider:Height(256)
end

AS:RegisterSkin(name, AS.SkinQuestCompletist)