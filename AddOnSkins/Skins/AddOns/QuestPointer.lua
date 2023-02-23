local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('QuestPointer') then return end

function AS:QuestPointer(event, addon)
	S:HandleTooltip(QuestPointerTooltip)
end

AS:RegisterSkin('QuestPointer', AS.QuestPointer, '[AddonLoader]')
