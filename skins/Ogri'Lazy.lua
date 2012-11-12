if not IsAddOnLoaded("Ogri'Lazy") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "OgriLazySkin"
local function SkinOgriLazy(self)
	AS:SkinFrame(Relic_View)
	AS:SkinCloseButton(Relic_ViewCloseButton)
end

AS:RegisterSkin(name,SkinOgriLazy)
