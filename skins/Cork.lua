local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "CorkSkin"
local function SkinCork()
	AS:SkinBackdropFrame(Corkboard, true)
	Corkboard:HookScript("OnUpdate", function(self) self:StripTextures() end)
end
AS:RegisterSkin(name, SkinCork)