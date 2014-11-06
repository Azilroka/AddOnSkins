local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BigBrother') then return end

function AS:BigBrother()
	hooksecurefunc(BigBrother, 'ToggleBuffWindow', function()
		if BigBrother_BuffWindow.isSkinned then return end
		AS:SkinFrame(BigBrother_BuffWindow)
		AS:SkinCloseButton(BigBrother_BuffWindow.CloseButton)
		AS:Desaturate(BigBrother_BuffWindow.LeftButton)
		AS:Desaturate(BigBrother_BuffWindow.RightButton)
		BigBrother_BuffWindow.isSkinned = true
	end)
end

AS:RegisterSkin('BigBrother', AS.BigBrother)