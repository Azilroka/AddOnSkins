local AS, L, S, R = unpack(AddOnSkins)

function R:AutoEquipQuestItem()
	for _, Region in pairs({QuestFrameRewardPanel:GetChildren()}) do
		if Region:IsObjectType('Button') and Region:GetName() == nil then
			S:HandleButton(Region)
		end
	end
end

AS:RegisterSkin('AutoEquipQuestItem')
