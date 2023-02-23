local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('NoNoGoGo') then return end

function AS:NoNoGoGo()
	S:CreateBackdrop(NNGGAnchorFrame)
	S:HandleButton(NNGGPullTimerFrame, true)
	S:HandleButton(NNGGReadyCheckFrame, true)
	S:HandleStatusBar(NNGGStatusBarFrame)
end

AS:RegisterSkin('NoNoGoGo', AS.NoNoGoGo)
