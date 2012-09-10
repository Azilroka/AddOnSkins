if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Arh") then return end
local function SkinARH(self,event)
	Arh_MainWindow:StripTextures()
	Arh_MainWindow:SetTemplate('Transparent')
end

cRegisterSkin('ArhSkin',SkinArh)