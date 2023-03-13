local AS, L, S, R = unpack(AddOnSkins)

function R:QuestPointer(event, addon)
	S:HandleTooltip(QuestPointerTooltip)
end

AS:RegisterSkin('QuestPointer')
