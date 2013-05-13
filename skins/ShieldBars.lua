local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "ShieldBarsSkin"
function AS:SkinShieldBars()
	local function SkinBars()
		local i = 1
		while _G["ShieldBarsStatusBar"..i.."Frame"] do
			AS:SkinFrame(_G["ShieldBarsStatusBar"..i.."Frame"], 'Default', true)
			i = i + 1
		end
	end
	hooksecurefunc(ShieldBars, "DisplayShields", SkinBars)
end

AS:RegisterSkin(name, AS.SkinShieldBars)