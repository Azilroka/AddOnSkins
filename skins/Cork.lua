local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "CorkSkin"
function AS:SkinCork()
	AS:SkinBackdropFrame(Corkboard, true)
	Corkboard:HookScript("OnUpdate", function(self) self:StripTextures() end)
end
AS:RegisterSkin(name, AS.SkinCork)