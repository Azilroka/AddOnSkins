local AS = unpack(AddOnSkins)

local name = 'Blizzard_StackSplit'
function AS:Blizzard_StackSplit()
	AS:SkinFrame(StackSplitFrame)
	AS:SkinButton(StackSplitOkayButton)
	AS:SkinButton(StackSplitCancelButton)
end

AS:RegisterSkin(name, AS.Blizzard_StackSplit)