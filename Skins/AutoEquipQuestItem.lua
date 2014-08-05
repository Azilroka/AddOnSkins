local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AutoEquipQuestItem') then return end

local name = 'AutoEquipQuestItemSkin'
function AS:SkinAutoEquipQuestItem(event, addon)
	for i = 1, QuestFrameRewardPanel:GetNumChildren() do
		local Region = select(i, QuestFrameRewardPanel:GetChildren())
		if Region:IsObjectType('Button') and Region:GetName() == nil then
			AS:SkinButton(Region)
		end
	end
end

AS:RegisterSkin(name, AS.SkinAutoEquipQuestItem)