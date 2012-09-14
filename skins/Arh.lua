if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Arh") then return end
local U = unpack(select(2,...))
local name = 'ArhSkin'
local function SkinArh(self,event)
	U.SkinFrame(Arh_MainFrame)
end

U.RegisterSkin(name,SkinArh)