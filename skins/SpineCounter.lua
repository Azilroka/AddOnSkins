if not IsAddOnLoaded("SpineCounter") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "SpineCounterSkin"
local function SkinSpineCounter(self)
	AS:SkinFrame(SCOutput)
end
AS:RegisterSkin(name,SkinSpineCounter)