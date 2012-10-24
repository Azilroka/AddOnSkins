if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Spy") then return end
local U = unpack(select(2,...))
local name = "SpySkin"
local function SkinSpy(self)
	U.SkinFrame(Spy_MainWindow)
	U.SkinFrame(Spy_AlertWindow)
	U.SkinCloseButton(Spy_MainWindow.CloseButton)
	U.Desaturate(Spy_MainWindow.ClearButton)
	U.Desaturate(Spy_MainWindow.LeftButton)
	U.Desaturate(Spy_MainWindow.RightButton)
	Spy_AlertWindow:Point("TOP", UIParent, "TOP", 0, -130)
end

U.RegisterSkin(name,SkinSpy)