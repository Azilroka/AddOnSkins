local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Spy') then return end

function AS:Spy()
	AS:StripTextures(Spy_MainWindow)
	AS:CreateBackdrop(Spy_MainWindow.Background)
	AS:SkinFrame(Spy_AlertWindow)
	AS:SkinCloseButton(Spy_MainWindow.CloseButton)
	AS:Desaturate(Spy_MainWindow.ClearButton)
	AS:Desaturate(Spy_MainWindow.LeftButton)
	AS:Desaturate(Spy_MainWindow.RightButton)
	Spy_AlertWindow:SetPoint('TOP', UIParent, 'TOP', 0, -130)
end

AS:RegisterSkin('Spy', AS.Spy)
