local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Spy') then return end

local name = 'SpySkin'
function AS:SkinSpy()
	AS:SkinFrame(Spy_MainWindow)
	AS:SkinFrame(Spy_AlertWindow)
	AS:SkinCloseButton(Spy_MainWindow.CloseButton)
	AS:Desaturate(Spy_MainWindow.ClearButton)
	AS:Desaturate(Spy_MainWindow.LeftButton)
	AS:Desaturate(Spy_MainWindow.RightButton)
	Spy_AlertWindow:Point('TOP', UIParent, 'TOP', 0, -130)
end

AS:RegisterSkin(name, AS.SkinSpy)