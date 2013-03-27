local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "SpineCounterSkin"
function AS:SkinSpineCounter()
	AS:SkinFrame(SCOutput)
end
AS:RegisterSkin(name,AS.SkinSpineCounter)