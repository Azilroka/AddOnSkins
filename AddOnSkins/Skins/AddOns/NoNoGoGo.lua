local AS, L, S, R = unpack(AddOnSkins)

function R:NoNoGoGo()
	S:CreateBackdrop(NNGGAnchorFrame)
	S:HandleButton(NNGGPullTimerFrame, true)
	S:HandleButton(NNGGReadyCheckFrame, true)
	S:HandleStatusBar(NNGGStatusBarFrame)
end

AS:RegisterSkin('NoNoGoGo')
