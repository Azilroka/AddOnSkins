local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('QuestPointer') then return end

local name = 'QuestPointerSkin'
function AS:SkinQuestPointer(event, addon)
	AS:SkinTooltip(QuestPointerTooltip)
end

AS:RegisterSkin(name, AS.SkinQuestPointer)