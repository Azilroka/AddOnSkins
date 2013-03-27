local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "ShieldBarsSkin"
function AS:SkinShieldBars()
	hooksecurefunc(ShieldBars, "DisplayShields", function() for i = 1, 20 do if _G["ShieldBarsStatusBar"..i.."Frame"] then AS:SkinFrame(_G["ShieldBarsStatusBar"..i.."Frame"], 'Default', true) end end end)
end
AS:RegisterSkin(name, AS.SkinShieldBars)