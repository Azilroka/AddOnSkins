local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "OgriLazySkin"
function AS:SkinOgriLazy()
	AS:SkinFrame(Relic_View)
	S:HandleCloseButton(Relic_ViewCloseButton)
end

AS:RegisterSkin(name,AS.SkinOgriLazy)
