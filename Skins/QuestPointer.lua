local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('QuestPointer') then return end

function AS:QuestPointer(event, addon)
	AS:SkinTooltip(QuestPointerTooltip)
end

AS:RegisterSkin('QuestPointer', AS.QuestPointer)