local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('QuestPointer') then return end

function R:QuestPointer(event, addon)
	S:HandleTooltip(QuestPointerTooltip)
end

AS:RegisterSkin('QuestPointer', R.QuestPointer)
