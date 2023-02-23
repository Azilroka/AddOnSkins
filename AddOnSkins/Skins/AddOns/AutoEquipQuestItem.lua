local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('AutoEquipQuestItem') then return end

function R:AutoEquipQuestItem(event, addon)
	for _, Region in pairs({QuestFrameRewardPanel:GetChildren()}) do
		if Region:IsObjectType('Button') and Region:GetName() == nil then
			S:HandleButton(Region)
		end
	end
end

AS:RegisterSkin('AutoEquipQuestItem', R.AutoEquipQuestItem)
