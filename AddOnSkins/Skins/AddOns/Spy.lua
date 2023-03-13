local AS, L, S, R = unpack(AddOnSkins)

function R:Spy()
	if Spy_MainWindow.Background then
		S:CreateBackdrop(Spy_MainWindow.Background)
		S:StripTextures(Spy_MainWindow)
	else
		S:HandleFrame(Spy_MainWindow)
	end

	S:HandleFrame(TestFrame)
	S:HandleFrame(Spy_AlertWindow)
	S:HandleCloseButton(Spy_MainWindow.CloseButton)
	S:Desaturate(Spy_MainWindow.ClearButton)
	S:Desaturate(Spy_MainWindow.LeftButton)
	S:Desaturate(Spy_MainWindow.RightButton)
	Spy_AlertWindow:SetPoint('TOP', UIParent, 'TOP', 0, -130)
end

AS:RegisterSkin('Spy')
