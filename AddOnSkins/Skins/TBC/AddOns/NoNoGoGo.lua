local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('NoNoGoGo') then return end

function AS:NoNoGoGo()
	AS:CreateBackdrop(NNGGAnchorFrame)
	AS:SkinButton(NNGGPullTimerFrame, true)
	AS:SkinButton(NNGGReadyCheckFrame, true)
	AS:SkinStatusBar(NNGGStatusBarFrame)
end

AS:RegisterSkin('NoNoGoGo', AS.NoNoGoGo)