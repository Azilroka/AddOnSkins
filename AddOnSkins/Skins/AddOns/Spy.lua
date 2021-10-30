local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Spy') then return end

function AS:Spy()
	if Spy_MainWindow.Background then
		AS:CreateBackdrop(Spy_MainWindow.Background)
		AS:StripTextures(Spy_MainWindow)
	else
		AS:SkinFrame(Spy_MainWindow)
	end

	AS:SkinFrame(TestFrame)
	AS:SkinFrame(Spy_AlertWindow)
	AS:SkinCloseButton(Spy_MainWindow.CloseButton)
	AS:Desaturate(Spy_MainWindow.ClearButton)
	AS:Desaturate(Spy_MainWindow.LeftButton)
	AS:Desaturate(Spy_MainWindow.RightButton)
	Spy_AlertWindow:SetPoint('TOP', UIParent, 'TOP', 0, -130)
end

AS:RegisterSkin('Spy', AS.Spy)
