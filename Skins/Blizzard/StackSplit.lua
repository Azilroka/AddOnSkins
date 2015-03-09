local AS = unpack(AddOnSkins)

function AS:Blizzard_StackSplit()
	AS:SkinFrame(StackSplitFrame)
	AS:SkinButton(StackSplitOkayButton)
	AS:SkinButton(StackSplitCancelButton)
end

AS:RegisterSkin('Blizzard_StackSplit', AS.Blizzard_StackSplit)