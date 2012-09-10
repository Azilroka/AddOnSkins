if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Spy") then return end
local name = "SpySkin"
local function SkinSpy(self)
	cSkinFrame(Spy_MainWindow)
	cSkinCloseButton(Spy_MainWindow.CloseButton)
	cDesaturate(Spy_MainWindow.ClearButton)
	cDesaturate(Spy_MainWindow.LeftButton)
	cDesaturate(Spy_MainWindow.RightButton)
end

cRegisterSkin(name,SkinSpy)