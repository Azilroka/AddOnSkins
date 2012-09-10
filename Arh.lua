if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Arh") then return end
local name = 'ArhSkin'
local function SkinArh(self,event)
	cSkinFrame(Arh_MainFrame)
end

cRegisterSkin(name,SkinArh)